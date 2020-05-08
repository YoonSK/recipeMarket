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
import com.kh.recipeMarket.member.model.vo.Member;
import com.kh.recipeMarket.product.model.vo.Product;
import com.kh.recipeMarket.recipe.model.service.RecipeService;
import com.kh.recipeMarket.recipe.model.vo.*;

@Controller
public class RecipeController {

	@Autowired
	RecipeService rService;
	
	@Autowired
	CommonService cService;
	
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
	
	@RequestMapping("searchOuterRecipes.rc")
	public String outerSearch(HttpServletRequest request) throws IOException{
		Random random = new Random();
	for(int q = 0; q < 100 ; q++) {
		int rdv = random.nextInt(1000);
		int pNo = 6899265 + rdv;
		Document doc = Jsoup.connect("https://www.10000recipe.com/recipe/"+pNo).get();
		System.out.println("https://www.10000recipe.com/recipe/"+pNo);

		Recipe r = new Recipe();
		random.nextInt(20);
		r.setMemberNo(41);
		r.setTitle(doc.title());
		
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
		if(rseed.equals("")) {sseed = "10";}
		r.setReqTime(Integer.parseInt(rseed));
		
		
		String dseed = doc.select(".view2_summary_info3").text();
		int difficulty = 1;
		switch(dseed) {
		case "": difficulty = 1; break;
		case "아무나": difficulty = 1; break;
		case "초급": difficulty = 1; break;
		case "중급": difficulty = 2; break;
		case "고급": difficulty = 3; break;
		case "신의경지": difficulty =3; break;
		}
		r.setDifficulty(difficulty);
		System.out.println(r);
		
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
					else {
						if(!ingList.contains(temp)) {
						ingList.add(temp);
						amtList.add("적당량");
						}
					}	
				}
			}
		}
		else {
			Elements eln= doc.select("#divConfirmedMaterialArea > ul > a");
			for(Element e : eln) {
				String tmp = e.attr("onclick");
				System.out.println(tmp);
				String t = tmp.replace("ga('send', 'event', '레시피본문', '재료정보버튼클릭', '", "").replace("');", "");
				System.out.println(t);
				if(t != "" && !ingList.contains(t)) {
					ingList.add(t);
				}
			}
		
			Elements elz= doc.select("#divConfirmedMaterialArea > ul > a > li > span");
			for(Element e : elz) {
				String t = e.text();
				if(t != "" && ingList.contains(t)) {
					amtList.add(t);
				}
				else{amtList.add("적당량");}
			}
			
		}
			
		ArrayList<String> tagList = new ArrayList<String>();
		Elements tags = doc.select(".view_tag > a");
		for(Element temp : tags) {
			tagList.add(temp.text().replace("#", "").replace(" ", ""));
		}
		
		ArrayList<String> stepList = new ArrayList<String>();
		for(int i = 1; i < 5; i++) {
			String seeker = "#stepdescr" + (i);
			stepList.add((doc.select(seeker).text()));
		}
        
		ArrayList<Photo> images = new ArrayList<Photo>();
		for(int i=0; i <= stepList.size(); i++) {
			Photo p = new Photo();
			p.setBoardNo(1);
			p.setTargetNo(0);
			p.setFileLevel(i);
			p.setOriginName("sample.jpg");
			p.setChangeName("sample.jpg");
			images.add(p);
		}
        
		rService.insertRecipe(r, stepList, ingList, amtList, tagList, images);
	}
		String referer = request.getHeader("Referer");
	    return "redirect:"+ referer;
	}
	
}

