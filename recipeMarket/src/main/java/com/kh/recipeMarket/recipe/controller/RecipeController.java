package com.kh.recipeMarket.recipe.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.recipeMarket.common.Enum;
import com.kh.recipeMarket.common.Like;
import com.kh.recipeMarket.common.Photo;
import com.kh.recipeMarket.common.service.CommonService;
import com.kh.recipeMarket.common.vo.*;
import com.kh.recipeMarket.manager.model.service.ManagerService;
import com.kh.recipeMarket.manager.model.vo.Product;
import com.kh.recipeMarket.member.model.vo.Member;
import com.kh.recipeMarket.recipe.model.service.RecipeService;
import com.kh.recipeMarket.recipe.model.vo.*;

import ch.qos.logback.core.net.SyslogOutputStream;

@Controller
public class RecipeController {

	@Autowired
	RecipeService rService;
	
	@Autowired
	CommonService cService;
	
	@Autowired
	ManagerService mas;
	
	@RequestMapping("insertForm.rc")
	public String recipeInsertForm(HttpSession session) {
		return "recipeInsert";
	}
	
	@RequestMapping("insert.rc")
	public ModelAndView recipeInsert(
			@RequestParam("stepContent") ArrayList<String> steps,
			@RequestParam("ingredient") ArrayList<String> ingredients,
			@RequestParam("amount") ArrayList<String> amounts,
			@RequestParam("tag") ArrayList<String> tags,
			@ModelAttribute Recipe r,
			@RequestParam("recipeImg") MultipartFile[] recipeImages,
			HttpSession session,
			ModelAndView mv,
			HttpServletRequest request
			)
	{
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		r.setMemberNo(memberNo);
		
		System.out.println(steps);
		System.out.println(ingredients);
		System.out.println(amounts);
		System.out.println(tags);
		System.out.println(r);
		
		ArrayList<Photo> images = upload(recipeImages, request);
		for(Photo p : images) {
			System.out.println(p);
		}
		
		
		int postNo = rService.insertRecipe(r, steps, ingredients, amounts, tags, images);
		session.setAttribute("postNo", postNo);
		
		mv.setViewName("redirect:detail.rc?postNo=" + postNo);
		return mv;
	}
	
	public ArrayList<Photo> upload(MultipartFile files[], HttpServletRequest request){
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\upload";
		File folder = new File(savePath);
		if(!folder.exists()) {folder.mkdirs();}
		
		ArrayList<Photo> photos = new ArrayList<Photo>();
		int fileLevel = 0;
		
		Random rand = new Random();
		
		for(MultipartFile file:files){
	        if(!file.isEmpty()){
	    		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	    		long rdv = rand.nextLong();
	    		String originFileName = file.getOriginalFilename();
	    		String renameFileName
	    		= sdf.format(new Date(System.currentTimeMillis())) + "." 
	    		+ originFileName.substring(originFileName.lastIndexOf(".") + 1) + rdv;
	    		
	    		
	    		String renamePath = folder + "\\" + renameFileName;
	    		
	    		try {
	    			file.transferTo(new File(renamePath));
	    		} catch (Exception e) {
	    			System.out.println("파일 전송 에러 : " + e.getMessage());
	    			e.printStackTrace();
	    		}
	            Photo p = new Photo();
	            p.setBoardNo(1);
	            p.setChangeName(renameFileName);
	            p.setOriginName(originFileName);
	            p.setFileLevel(fileLevel);
	            photos.add(p);
	            System.out.println(p);
	            fileLevel ++;
	        }
	        else {
	        	Photo p = new Photo();
	            p.setBoardNo(1);
	            p.setChangeName("");
	            p.setOriginName("");
	            p.setFileLevel(fileLevel);
	            photos.add(p);
	            System.out.println(p);
	            fileLevel ++;
	        }
	    }
		return photos;
	}
	
	@RequestMapping("updateForm.rc")
	public ModelAndView recipeUpdateForm(@RequestParam("postNo") int postNo, ModelAndView mv){
		
		Recipe rb = rService.selectRecipe(postNo);
		mv.addObject("recipe", rb);
		mv.addObject("ingredientList", rb.getIngredientList());
		mv.addObject("tagList", rb.getTagList());
		mv.addObject("stepList", rb.getStepList());
		mv.addObject("imgList", rb.getImgList());
		
		ArrayList<Reply> rplist = cService.selectReplies(new Enum().boardNo("recipe"), postNo);
		mv.addObject("replyList", rplist);
		
		mv.setViewName("recipeUpdate");
		return mv;
	}
	
	@RequestMapping("update.rc")
	public ModelAndView recipeUpdate(
			@RequestParam("postNo") int postNo,
			@RequestParam("stepContent") ArrayList<String> steps,
			@RequestParam("ingredient") ArrayList<String> ingredients,
			@RequestParam("amount") ArrayList<String> amounts,
			@RequestParam("tag") ArrayList<String> tags,
			@ModelAttribute Recipe r,
			@RequestParam(value = "recipeImg", required = false) MultipartFile[] recipeImages,
			@RequestParam(value = "recipeImgPrev", required = false) ArrayList<Integer> imgChanges,
			HttpSession session,
			ModelAndView mv,
			HttpServletRequest request
			)
	{
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		r.setMemberNo(memberNo);
		r.setPostNo(postNo);
		
		System.out.println(steps);
		System.out.println(ingredients);
		System.out.println(amounts);
		System.out.println(tags);
		System.out.println(r);
		
		ArrayList<Photo> images = upload(recipeImages, request);
		for(Photo p : images) {
			System.out.println(p);
		}
		
		ArrayList<Photo> prevImages = rService.selectPhotos(postNo);
		
		for(int i=0; i<prevImages.size() && i<imgChanges.size(); i++){
			if(imgChanges.get(i).intValue() == 1 
					&& prevImages.get(i).getOriginName() != null) {
				String originName = prevImages.get(i).getOriginName();
				String changeName = prevImages.get(i).getChangeName();
				images.get(i).setOriginName(originName);
				images.get(i).setChangeName(changeName);
			}
		}
		rService.updateRecipe(r, steps, ingredients, amounts, tags, images);
		
		mv.setViewName("redirect:detail.rc?postNo=" + postNo);
		return mv;
	}
	
	@RequestMapping("detail.rc")
	public ModelAndView recipeDetail(@RequestParam("postNo") int postNo, ModelAndView mv){
		Recipe rb = rService.selectRecipe(postNo);
		mv.addObject("recipe", rb);
		mv.addObject("ingredientList", rb.getIngredientList());
		mv.addObject("tagList", rb.getTagList());
		mv.addObject("stepList", rb.getStepList());
		mv.addObject("imgList", rb.getImgList());
		mv.addObject("author", rb.getAuthor());
		System.out.println(rb);
		rService.addRecipeHit(postNo);
		ArrayList<Reply> rplist = cService.selectReplies(new Enum().boardNo("recipe"), postNo);
		mv.addObject("replyList", rplist);
		mv.setViewName("recipeView");
		return mv;
	}
	
	@RequestMapping("delete.rc")
	public String recipeDelete(@RequestParam("postNo") int postNo){
		
		rService.deleteRecipe(postNo);
		return "recipeSearch";
	}
	
	@RequestMapping("insertReply.rc")
	public String replyInsert(
			@RequestParam("postNo") int postNo,
			@ModelAttribute Reply rp, HttpSession session){
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		int boardNo = new Enum().boardNo("recipe");
		rp.setMemberNo(memberNo);
		rp.setBoardNo(boardNo);
		rp.setTargetNo(postNo);
		System.out.println(rp);
		cService.insertReply(rp);
		return "redirect:detail.rc?postNo=" + postNo;
	}

	@RequestMapping("list.rc")
	public ModelAndView recipeList(HttpSession session, ModelAndView mv){
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		ArrayList<RecipePreview> rlist = rService.selectRecipeList(memberNo);
		
		mv.addObject("rlist", rlist);
		
		mv.setViewName("recipeList");
		return mv;
	}
	
	@RequestMapping("savedList.rc")
	public ModelAndView recipeSavedList(HttpSession session, ModelAndView mv){
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		ArrayList<RecipePreview> rlist = rService.selectSavedRecipeList(memberNo);
		
		mv.addObject("rlist", rlist);
		
		mv.setViewName("recipeList");
		return mv;
	}
	
	@RequestMapping("followedList.rc")
	public ModelAndView recipeFollowedList(HttpSession session, ModelAndView mv){
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		ArrayList<RecipePreview> rlist = rService.selectFollowedRecipeList(memberNo);
		
		mv.addObject("rlist", rlist);
		
		mv.setViewName("recipeList");
		return mv;
	}
	
	@RequestMapping("search.rc")
	public ModelAndView recipeSearch(
			@RequestParam(value = "tag", required=false) ArrayList<String> tags,
			@RequestParam(value = "ingredient", required=false) ArrayList<String> ingredients,
			@ModelAttribute SearchCon sc, 
			ModelAndView mv){
		System.out.println(sc);
		sc.setIngredientList(ingredients);
		sc.setTagList(tags);
		ArrayList<RecipePreview> rlist = rService.searchRecipeList(sc);
		ArrayList<Ingredient> frqIngs = rService.selectFreqIngredients(4);
		ArrayList<Tag> frqTags = rService.selectFreqTags(4);
		mv.addObject("searchCon", sc);
		mv.addObject("rlist", rlist);
		mv.addObject("frqIngs", frqIngs);
		mv.addObject("frqTags", frqTags);
		mv.setViewName("recipeSearch");
		return mv;
	}
	
	@RequestMapping("follow.rc")
	public String recipeFollow(@RequestParam("targetNo") int targetNo, HttpSession session, HttpServletRequest request) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		Like lk = new Like();
		lk.setBoardNo(0);
		lk.setTargetNo(targetNo);
		lk.setMemberNo(memberNo);
		

		System.out.println(lk);

		cService.insertLike(lk);
		String referer = request.getHeader("Referer");
	    return "redirect:"+ referer;
	}
	
	@RequestMapping("save.rc")
	public String recipeSave(@RequestParam("postNo") int postNo, HttpSession session, HttpServletRequest request) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		Like lk = new Like();
		lk.setBoardNo(1);
		lk.setTargetNo(postNo);
		lk.setMemberNo(memberNo);
		
		System.out.println(lk);

		cService.insertLike(lk);
		String referer = request.getHeader("Referer");
	    return "redirect:"+ referer;
	}
	
	@RequestMapping("chefRank.rc")
	public ModelAndView chef(@RequestParam(value = "sorter", required=false) String sorter, ModelAndView mv) {
		ArrayList<Author> clist = rService.selectChefRank(sorter, 20);
		
		for(Author a :clist) {
			System.out.println(a);
		}
		
		SearchCon sc = new SearchCon();
		sc.setSorter(sorter);
		mv.addObject("searchCon", sc);
		
		mv.addObject("chefList", clist);
		mv.setViewName("chefRank");
		return mv;
	}
	
	@RequestMapping("chefLikeList.rc")
	public ModelAndView chefLikeList(HttpSession session, ModelAndView mv) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		ArrayList<Author> clist = rService.selectChefLikeList(memberNo);
		
		mv.addObject("chefList", clist);
		mv.setViewName("chefList");
		return mv;
	}
	
	@RequestMapping("searchProduct.rc")
	public ModelAndView productSearch(
			@RequestParam(value = "ingredient", required=false) ArrayList<String> ingredients,
			@ModelAttribute SearchCon sc, 
			ModelAndView mv){
		
		sc.setIngredientList(ingredients);
		System.out.println(sc);
		
		ArrayList<Product> pdlist = rService.searchProcuctList(sc);
		
		mv.addObject("searchCon", sc);
		mv.addObject("productList", pdlist);
		
		mv.setViewName("productSearch");
		return mv;
	}

	@RequestMapping("importRecipe.rc")
	public String importRecipe(@RequestParam("pNo") int pNo, HttpSession session, HttpServletRequest request) throws IOException{
		Random random = new Random();
		int postNo = 0;
	try {
			Document doc = Jsoup.connect("https://www.10000recipe.com/recipe/"+pNo).get();
			System.out.println("https://www.10000recipe.com/recipe/"+pNo);
		if(doc != null) {
			Recipe r = new Recipe();
			random.nextInt(20);
			Member loginUser = (Member)session.getAttribute("loginUser");
			int memberNo = loginUser.getMemberNo();
			r.setMemberNo(memberNo);
			String tempTitle = (doc.title().length() < 38) ? doc.title() : doc.title().substring(0, 38);
			r.setTitle(tempTitle);
			int cseed = random.nextInt(8);
			String category = "";
			switch(cseed) {
			case 0: category ="sub"; break;
			case 1: category ="main"; break;
			case 2: category ="soup"; break;
			case 3: category ="meal"; break;
			case 4: category ="dessert"; break;
			case 5: category ="salad"; break;
			case 6: category ="drink"; break;
			case 7: category ="sauce"; break;
			case 8: category ="etc"; break;
			}
			r.setCategory(category);
			String sseed = doc.select(".view2_summary_info1").text().replace("인분", "").replace(" 이상", "");
			if(sseed.equals("")) {sseed = "1";}
			r.setServing(Integer.parseInt(sseed));
			
			String rseed = doc.select(".view2_summary_info2").text().replace("분 이내", "").replace("2시간 이상", "120");
			if(rseed.equals("")) {rseed = "10";}
			r.setReqTime(Integer.parseInt(rseed));
			
			String dseed = doc.select(".view2_summary_info3").text();
			int difficulty = 0;
			switch(dseed) {
			case "": difficulty = 0; break;
			case "아무나": difficulty = 0; break;
			case "초급": difficulty = 0; break;
			case "중급": difficulty = 1; break;
			case "고급": difficulty = 2; break;
			case "신의경지": difficulty =2; break;
			}
			r.setDifficulty(difficulty);
			
			ArrayList<String> ingList = new ArrayList<String>();
			ArrayList<String> amtList = new ArrayList<String>();
			
			if (doc.select(".cont_ingre > dl > dd").text().split(", ").equals("")) {
				Elements els = doc.select(".cont_ingre > dl > dd");
				for (Element tempEl: els) {
					String[] ings = tempEl.text().split(", ");
					for(String temp: ings) {
						if (temp.contains(" ")) {
							String[] split = temp.split(" ");
							if(!ingList.contains(split[0])) {
								ingList.add(split[0]);
								amtList.add(split[1]);
							}
						}else if(!ingList.contains(temp)) {
							ingList.add(temp);
							amtList.add("적당량");
						}
					}
				}
			}
			else {
				Elements eln= doc.select("#divConfirmedMaterialArea > ul > a");
				for(Element e : eln) {
					String tmp = e.attr("onclick");
					String t = tmp.replace("ga('send', 'event', '레시피본문', '재료정보버튼클릭', '", "").replace("');", "");
					if(!t.equals("") && !ingList.contains(t)) {
						ingList.add(t);
					}
				}
				Elements elz= doc.select("#divConfirmedMaterialArea > ul > a > li > span");
				for(Element e : elz) {
					String t = e.text();
					if(t.equals("") || ingList.contains(t)) {
						amtList.add("적당량");
					}
					else{amtList.add(t);}
				}
			}
			ArrayList<String> tagList = new ArrayList<String>();
			Elements tags = doc.select(".view_tag > a");
			for(Element temp : tags) {
				if(temp.text() != "") {
					String[] t = temp.text().split(" #");
					for(String tmp : t) {
						String h = tmp.replace(" ", "").replace("#", "");
						if(h != "" && h.length() < 20 && !tagList.contains(h)) {
							tagList.add(h);
						}
					}
				}
			}
	
			if(tagList.size() == 0) {tagList.add("강추");}
			
			ArrayList<String> stepList = new ArrayList<String>();
			for(int i = 1; i < 10; i++) {
				String seeker = "#stepdescr" + (i);
				String stp = doc.select(seeker).text();
				if(stp.length() != 0) {
					if(stp.length() < 300) {
						stepList.add(stp);
					}
					else{
						String[] xstp = stp.split(".");
						stepList.add(xstp[0]);
					}
				}
			}
	
			ArrayList<String> plist = new ArrayList<String>();
			String mainUrl = doc.select("#main_thumbs").attr("src");
					plist.add(mainUrl);
			
			for(int i = 1; i <= stepList.size(); i++) {
				Elements telm = doc.select("#stepimg" + i + "> img");
				if(telm.size() != 0) {
					Element elm = doc.select("#stepimg" + i + "> img").get(0);
					String st = elm.attr("src");
						plist.add(st);
				}
				else {plist.add("skip");}
			}
			
			String path = request.getSession().getServletContext().getRealPath("/").replace("target\\m2e-wtp\\web-resources\\", "")
					+ "src\\main\\webapp\\resources\\upload\\";
			
			for(int i=0; i <= stepList.size(); i++) {
				File outputFile = new File(path + pNo  + "img" + i + ".png");
				URL url = null;
				BufferedImage bi = null;
	
				if(!plist.get(i).equals("skip")) {
				url = new URL(plist.get(i));
			    bi = ImageIO.read(url);
			    ImageIO.write(bi, "png", outputFile);
				}
			}
			
			ArrayList<Photo> images = new ArrayList<Photo>();
			for(int i=0; i <= stepList.size(); i++) {
				Photo p = new Photo();
				p.setBoardNo(1);
				p.setFileLevel(i);
				p.setOriginName(pNo + "img" + i + ".png");
				
				if(plist.get(i).equals("skip")) {
					p.setChangeName("skip");
				}
				else {p.setChangeName(pNo + "img" + i + ".png");}
				images.add(p);
			}
	        System.out.println(r);
	        System.out.println(stepList);
	        System.out.println(ingList);
	        System.out.println(amtList);
	        System.out.println(tagList);
			
			postNo = rService.insertRecipe(r, stepList, ingList, amtList, tagList, images);
			}
		}catch (Exception e){
			
		}
	    return "redirect:detail.rc?postNo=" + postNo;
	}
	
	@RequestMapping("searchOuterRecipes.rc")
	public String outerSearch(HttpSession session, HttpServletRequest request) throws IOException{
		Random random = new Random();
	for(int q = 0; q < 20 ; q++) {
	try {
			int rdv = random.nextInt(1000);
			int pNo = 6899265 + rdv;
			Document doc = Jsoup.connect("https://www.10000recipe.com/recipe/"+pNo).get();
			System.out.println("https://www.10000recipe.com/recipe/"+pNo);
		if(doc != null) {
	
			Recipe r = new Recipe();
			random.nextInt(20);
			
			Member loginUser = (Member)session.getAttribute("loginUser");
			int memberNo = loginUser.getMemberNo();
			
			r.setMemberNo(memberNo);
			String tempTitle = (doc.title().length() < 38) ? doc.title() : doc.title().substring(0, 38);
			
			r.setTitle(tempTitle);
			
			int cseed = random.nextInt(8);
			String category = "";
			switch(cseed) {
			case 0: category ="sub"; break;
			case 1: category ="main"; break;
			case 2: category ="soup"; break;
			case 3: category ="meal"; break;
			case 4: category ="dessert"; break;
			case 5: category ="salad"; break;
			case 6: category ="drink"; break;
			case 7: category ="sauce"; break;
			case 8: category ="etc"; break;
			}
			r.setCategory(category);
			
			String sseed = doc.select(".view2_summary_info1").text().replace("인분", "").replace(" 이상", "");
			if(sseed.equals("")) {sseed = "1";}
			r.setServing(Integer.parseInt(sseed));
			
			String rseed = doc.select(".view2_summary_info2").text().replace("분 이내", "").replace("2시간 이상", "120");
			if(rseed.equals("")) {rseed = "10";}
			r.setReqTime(Integer.parseInt(rseed));
			
			
			String dseed = doc.select(".view2_summary_info3").text();
			int difficulty = 0;
			switch(dseed) {
			case "": difficulty = 0; break;
			case "아무나": difficulty = 0; break;
			case "초급": difficulty = 0; break;
			case "중급": difficulty = 1; break;
			case "고급": difficulty = 2; break;
			case "신의경지": difficulty =2; break;
			}
			r.setDifficulty(difficulty);
			
			ArrayList<String> ingList = new ArrayList<String>();
			/*
			for(int i = 0; i <5; i++) {
				ingList.add("ting"+ i);
			}
			*/
			ArrayList<String> amtList = new ArrayList<String>();
			/*
			for(int i = 0; i <5; i++) {
				amtList.add("tamt"+ i);
			}
			*/
			
			if (doc.select(".cont_ingre > dl > dd").text().split(", ").equals("")) {
				Elements els = doc.select(".cont_ingre > dl > dd");
				for (Element tempEl: els) {
					String[] ings = tempEl.text().split(", ");
					for(String temp: ings) {
						if (temp.contains(" ")) {
							String[] split = temp.split(" ");
							if(!ingList.contains(split[0])) {
								ingList.add(split[0]);
								amtList.add(split[1]);
							}
						}
						else if(!ingList.contains(temp)) {
							ingList.add(temp);
							amtList.add("적당량");
						}
						
					}
				}
			}
			else {
				Elements eln= doc.select("#divConfirmedMaterialArea > ul > a");
				for(Element e : eln) {
					String tmp = e.attr("onclick");
					String t = tmp.replace("ga('send', 'event', '레시피본문', '재료정보버튼클릭', '", "").replace("');", "");
					if(!t.equals("") && !ingList.contains(t)) {
						ingList.add(t);
					}
					
				}
			
				Elements elz= doc.select("#divConfirmedMaterialArea > ul > a > li > span");
				for(Element e : elz) {
					String t = e.text();
					if(t.equals("") || ingList.contains(t)) {
						amtList.add("적당량");
					}
					else{amtList.add(t);}
				}
			}
			ArrayList<String> tagList = new ArrayList<String>();
			Elements tags = doc.select(".view_tag > a");
			for(Element temp : tags) {
				if(temp.text() != "") {
					String[] t = temp.text().split(" #");
					for(String tmp : t) {
						String h = tmp.replace(" ", "").replace("#", "");
						if(h != "" && h.length() < 20 && !tagList.contains(h)) {
							tagList.add(h);
						}
					}
				}
			}
	
			if(tagList.size() == 0) {tagList.add("강추");}
			
			ArrayList<String> stepList = new ArrayList<String>();
			for(int i = 1; i < 10; i++) {
				String seeker = "#stepdescr" + (i);
				String stp = doc.select(seeker).text();
				if(stp.length() != 0) {
					if(stp.length() < 300) {
						stepList.add(stp);
					}
					else{
						String[] xstp = stp.split(".");
						stepList.add(xstp[0]);
					}
				}
			}
	
			ArrayList<String> plist = new ArrayList<String>();
			String mainUrl = doc.select("#main_thumbs").attr("src");
					plist.add(mainUrl);
			
			for(int i = 1; i <= stepList.size(); i++) {
				Elements telm = doc.select("#stepimg" + i + "> img");
				if(telm.size() != 0) {
					Element elm = doc.select("#stepimg" + i + "> img").get(0);
					String st = elm.attr("src");
						plist.add(st);
				}
				else {plist.add("skip");}
			}
			
			String path = request.getSession().getServletContext().getRealPath("/").replace("target\\m2e-wtp\\web-resources\\", "")
					+ "src\\main\\webapp\\resources\\upload\\";
			
			for(int i=0; i <= stepList.size(); i++) {
				File outputFile = new File(path + pNo  + "img" + i + ".png");
				URL url = null;
				BufferedImage bi = null;
	
				if(!plist.get(i).equals("skip")) {
				url = new URL(plist.get(i));
			    bi = ImageIO.read(url);
			    ImageIO.write(bi, "png", outputFile);
				}
			}
			
			ArrayList<Photo> images = new ArrayList<Photo>();
			for(int i=0; i <= stepList.size(); i++) {
				Photo p = new Photo();
				p.setBoardNo(1);
				p.setFileLevel(i);
				p.setOriginName(pNo + "img" + i + ".png");
				
				if(plist.get(i).equals("skip")) {
					p.setChangeName("skip");
				}
				else {p.setChangeName(pNo + "img" + i + ".png");}
				images.add(p);
			}
	        System.out.println(r);
	        System.out.println(stepList);
	        System.out.println(ingList);
	        System.out.println(amtList);
	        System.out.println(tagList);
			
			rService.insertRecipe(r, stepList, ingList, amtList, tagList, images);
			}
		}catch (Exception e){
			
		}
	}
	    return "recipeSearch";
	}
	
	@RequestMapping("searchOuterProducts.rc")
	public String outerProductSearch(HttpSession session, HttpServletRequest request) throws IOException{
/*
	int pNo = 907;
	for(int n =0; n<5; n++) {
		switch(n) {
		case 0: pNo=907; break;
		case 1: pNo=908; break;
		case 2: pNo=909; break;
		case 3: pNo=910; break;
		case 4: pNo=914; break;
		default : break;
		}
*/
		int pNo = 907;
		Document doc = Jsoup.connect("https://www.kurly.com/shop/goods/goods_list.php?category=" + pNo).get();
		if(doc.text().equals("")) {
			System.out.println("접속 불가");
			
		}
		
		Elements pImgs = doc.select(".inner_listgoods > ul > li > div > div > a > img");
		Elements pNames = doc.select(".inner_listgoods > ul > li > div > a > .name");
		Elements pCosts = doc.select(".inner_listgoods > ul > li > div > a > .cost > span");
		
		String path = request.getSession().getServletContext().getRealPath("/").replace("target\\m2e-wtp\\web-resources\\", "")
		+ "src\\main\\webapp\\resources\\upload\\";
		
		for(int i=0; i< pNames.size() ; i++) {
			
			Product pd = new Product();
			String name = pNames.get(i).text();
			pd.setName(name);
			
			int price = Integer.parseInt(pCosts.get(i).text().replace(",", "").replace("원", ""));
			pd.setPrice(price);
			pd.setStock(100);
	
			String category = "";
			switch(pNo) {
			case 907: category = "채소류"; break;
			case 908: category = "과일류"; break;
			case 909: category = "어류"; break;
			case 910: category = "육류"; break;
			case 914: category = "음료"; break;
			default : category = "기타"; break;
			}
			pd.setCategory(category);
			
			System.out.println(pd);
			
			String pPath = pImgs.get(i).attr("src");
			File outputFile = new File(path + "product" + pNo  + "img" + i + ".png");
			URL url = null;
			BufferedImage bi = null;
			url = new URL(pPath);
		    bi = ImageIO.read(url);
		    ImageIO.write(bi, "png", outputFile);
			
			Photo p = new Photo();
			p.setBoardNo(3);
			p.setFileLevel(0);
			p.setOriginName("product" + pNo + "img" + ".png");
			p.setChangeName("product" + pNo + "img" + ".png");
			
			System.out.println(p);
			
			mas.insertProduct(pd);
			mas.uploadImage(p);

			}
		
	//}
		return "recipeSearch";
	}
	@RequestMapping("createReplies.rc")
	public String createReplies(HttpSession session, HttpServletRequest request) {
		Random random = new Random();
		
	for(int i = 0; i < 50; i++) {
		int postNo = random.nextInt(50) +1;
		Recipe recipe = rService.selectRecipe(postNo);
		
		Reply r = new Reply();
		r.setBoardNo(1);
		r.setTargetNo(postNo);
		
		int memberNo = random.nextInt(10)+1;
		r.setMemberNo(memberNo);

		int rating = random.nextInt(9) + 1;
		r.setRating(rating);
		
		String content = "맛있어요";
		int seed = random.nextInt(3);
		switch(seed) {
		case 0: content = "최악이다"; break;
		case 1: content = "장난치나"; break;
		case 2: content = "별로에요"; break;
		case 3: content = "이거 하지 마세요"; break;
		case 4: content = "무난한 한끼"; break;
		case 5: content = "괜찮네요"; break;
		case 6: content = "오늘은 이거다"; break;
		case 7: content = "맛있어요"; break;
		case 8: content = "최고에요"; break;
		case 9: content = "식객민웈ㅋㅋ"; break;
		case 10: content = "작성자 그는 요리의 신인가"; break;
		}
		
		r.setContent(content);
		
		cService.insertReply(r);
		
		if(rating > 5) {
			Like l = new Like();
			l.setBoardNo(1);
			l.setTargetNo(postNo);
			l.setMemberNo(memberNo);
			cService.insertLike(l);
		}
		if(rating > 7) {
			int authorNo = recipe.getMemberNo();
			
			Like l = new Like();
			l.setBoardNo(0);
			l.setTargetNo(authorNo);
			l.setMemberNo(memberNo);
			cService.insertLike(l);
			
		}

	}
		return "recipeSearch";
	}
	
}

