package com.kh.recipeMarket.member.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	@RequestMapping(value="login.me", method= {RequestMethod.POST,  RequestMethod.GET})
	public String memberLogin(Member m, Model model) {			
		Member loginUser = ms.memberLogin(m);
		if(loginUser != null) {
			int memberNo = loginUser.getMemberNo();
			String mPhoto = ms.getPhoto(memberNo);
			if(mPhoto != null) {
				loginUser.setpName(mPhoto);
			}
		}
		if(bcrypt.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);
		} else {
			throw new MemberException("로그인에 실패하였습니다.");
		}
		return "../home";	
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
					return "../home";					
				} else {
					throw new MemberException("회원가입에 실패하였습니다.");					
				}
				
			} else {
				return "../home";
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
		return "../home";
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
	public String mDelete(@RequestParam("no") int no) {
		
		int result = ms.mDelete(no);
		
		if(result > 0) {
			return "redirect:home";
		}else {
			throw new MemberException("탈퇴에 실패하였습니다.");
		}

	}
	
}
