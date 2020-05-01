package com.kh.recipeMarket.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.member.model.exception.MemberException;
import com.kh.recipeMarket.member.model.service.MemberService;
import com.kh.recipeMarket.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms;

	@Autowired
	private BCryptPasswordEncoder bcrypt;	
	
	@RequestMapping("goLogin.me")
	public String goLogin(){
	
		return "/memberLogin";		
	}

	// 로그인
	@RequestMapping(value="login.me", method= {RequestMethod.POST,  RequestMethod.GET})
	public String memberLogin(Member m, Model model) {			
		Member loginUser = ms.memberLogin(m);
		if(loginUser != null) {
			int memberNo = loginUser.getMemberNo();
			String mPhoto = ms.getPhoto(memberNo);
			if(mPhoto != null) {
				loginUser.setpName(mPhoto);
			}
		}else {
	    	  model.addAttribute("msg", "아이디가 존재하지 않습니다.");
	    	  model.addAttribute("url", "memberLogin.jsp");
	    	  return "loginError";			
		}
		if(bcrypt.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);
		} else {
	    	  model.addAttribute("msg", "비밀번호가 다릅니다.");
	    	  model.addAttribute("url", "memberLogin.jsp");
	    	  return "loginError";			
		}
		return "redirect:/";	
	}	
	
	@RequestMapping("goTerm.me")
	public String goTerm() {
		return "/registerTerm";
	}	
	
	@RequestMapping("goJoin.me")
	public String goJoin() {
		return "/memberJoin";
	}	
	
	//회원 가입
	@RequestMapping("join.me")
	public String join(@ModelAttribute Member m, @ModelAttribute Photo p, @RequestParam("year") int year, @RequestParam("month") int month, @RequestParam("day") int day,
												@RequestParam("mImage") MultipartFile mImage, HttpServletRequest request) {
		// Date 화
		Date birth = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
		m.setBirth(birth);		
		// 복호화
		String encPwd = bcrypt.encode(m.getPwd());	
		m.setPwd(encPwd);
		 
		int result = ms.joinMember(m);
		if(result > 0) {
			// 사진 첨부
			if(mImage != null && !mImage.isEmpty()) {
				String pName = saveImage(mImage, request);
			
				if(pName != null) {
					p.setOriginName(mImage.getOriginalFilename());
					p.setChangeName(pName);
				}
				int result2 = ms.uploadImage(p);
				if(result2 > 0) {
					return "redirect:/";						
				} else {
					throw new MemberException("회원가입에 실패하였습니다.");					
				}
				
			} else {
				return "redirect:/";		
			}
		} else {
				throw new MemberException("회원가입에 실패하였습니다.");
		}

	} 
	
	// 이미지 업로드
	public String saveImage(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\upload";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName
		= sdf.format(new Date(System.currentTimeMillis())) + "." 
		+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		} 
		
		return renameFileName;
	}
	
	
	// 로그아웃
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";		
	}	
	
	// 아이디 중복 검사
	@RequestMapping("dupid.me")
	public void idDuplicateCheck(HttpServletResponse response, @RequestParam("id") String id) throws IOException {		
		boolean isUsable = ms.checkIdDup(id) == 0 ? true : false;
		response.getWriter().print(isUsable);			
	}
	
	// 닉네임 중복 검사
	@RequestMapping("dupnick.me")
	public void nickDuplicateCheck(HttpServletResponse response, @RequestParam("nickName") String nickName) throws IOException {		
		boolean isUsable = ms.checkNickDup(nickName) == 0 ? true : false;
		response.getWriter().print(isUsable);			
	}		
	
	// 회원 탈퇴
	@RequestMapping("mdelete.me")
	public String mDelete(@RequestParam("no") int no, SessionStatus status) {
		
		int result = ms.mDelete(no);
		
		if(result > 0) {
			status.setComplete();					
			return "redirect:/";		
		}else {
			throw new MemberException("탈퇴에 실패하였습니다.");
		}

	}
	
	// 아이디 찾기 페이지 이동
	@RequestMapping("findIdView.me")
	public String findIdView() {
		return "findId";
	}
	
	//아이디 찾기
	@RequestMapping(value="findId.me",method=RequestMethod.POST)
	public ModelAndView findId(Member m, Model model,@RequestParam("name") String name, @RequestParam("email") String email,  ModelAndView mv) {
		m.setName(name);
		m.setEmail(email);
		System.out.println("email : "+ email + " name : " + name);
		String id = ms.findId(m);
		if(id != null) {
			mv.addObject("id", id);
			mv.setViewName("idView");
		} else {
			throw new MemberException("아이디 찾기에 실패하였습니다.");
		}
		return mv;
	}
	
	// 비밀번호 찾기 페이지 이동
	@RequestMapping("findPwdView.me")
	public String findPwdView() {
		return "findPwd";
	}
	
	// 이메일 전송
	@RequestMapping("sendEmail.me")
	public String findPwd(HttpSession hSession, @RequestParam("id") String id, @RequestParam("email") String email, HttpServletResponse response, Member m) throws IOException{
		System.out.println(id);
		System.out.println(email);
		m.setId(id);
		m.setEmail(email);
		Member check = ms.CheckPwd(m); // 아이디와 이메일이 존재하는지
		System.out.println(check);
		
		PrintWriter out = response.getWriter();
		
		if(check != null) {

			String host = "smtp.naver.com"; // 사용하는 메일
			final String sender = "recipe_market@naver.com"; // 보내는 사람 ID (Ex: @naver.com 까지..)
			final String password = "fptlvlakzpt1"; // 보내는 사람 Password

			int port = 465;
		    Properties props = new Properties();
		    props.put("mail.smtp.host", host);
		    props.put("mail.smtp.port", port);
		    props.put("mail.smtp.auth", "true");
		    props.put("mail.smtp.ssl.enable", "true");
		    props.put("mail.smtp.ssl.trust", host);
		      
	        System.out.println("임시비밀번호로 변경");
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
			     		return new PasswordAuthentication(sender,password);
	         	}
			});
			      try {
			    	  
			    	  
			         // 이메일 내용 구성
			    	  MimeMessage message = new MimeMessage(session);
			          message.setFrom(new InternetAddress(sender));
			          message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			          
			          //제목
			          message.setSubject("[Recipe_Market]비밀번호 찾기 결과 이메일입니다.");
			          //내용
		
			          // 처음 문자는 영어로
			          char pwSet1[] = new char[] {
			                       'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
			                       'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'
			          };
			          
			          char pwSet2[] = new char[] {
			                '1','2','3','4','5','6','7','8','9','0',
			                     'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
			                     'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'
			          };
			          
			          int firstRan = (int)(Math.random()*(pwSet1.length));
			          char firstPw = pwSet1[firstRan];
			          String ranPw = "";
			          for(int i = 0; i < 10; i++) {
			             int ranIndex = (int)(Math.random()*(pwSet2.length));
			             ranPw += pwSet2[ranIndex];
			          }
			          
			          String lastPw = firstPw + ranPw + "!";
			          m.setPwd(lastPw);
					  String encPwd = bcrypt.encode(m.getPwd());   //복호화
				      m.setPwd(encPwd);
					int result = ms.updatePwd(m);
			          
					
					
			          
					  if(result > 0) {
				            System.out.println("임시비밀번호로 변경");
//				            mv.addObject("message", "success");
//				            hSession.setAttribute("message", "success");
				            out.append("success");
				            out.flush();
				         } else {
				            System.out.println("임시비밀번호로 변경실패");
				         }
				         message.setText("임시비밀번호는 " + lastPw + "입니다.\n 임시비밀번호로 로그인하고 비밀번호를 변경해주세요.");
				          
			          //이메일 보내기
			          Transport.send(message);
			          System.out.println("성공적으로 메일을 보냈습니다.");
			       } catch (AddressException e) {
			          e.printStackTrace();
			       } catch (MessagingException e) {
			          e.printStackTrace();
			       }  
	      } else {
	             System.out.println("임시비밀번호로 변경실패");
//	             mv.addObject("message", "fail");
//	             hSession.setAttribute("message", "fail");
	             out.append("fail");
	             out.flush();
	      }
		
		out.close();
		return "memberLogin";
	
		
	}
}




