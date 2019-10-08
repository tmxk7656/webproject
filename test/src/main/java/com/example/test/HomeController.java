package com.example.test;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.xml.ws.http.HTTPException;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.example.test.domain.CustomerVO;
import com.example.test.domain.PostVO;
import com.example.test.service.PostService;
import com.example.test.service.loginService;

import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;


@Controller
@AllArgsConstructor//이거 안하면 좃됨
public class HomeController {

	PostService post;
	loginService login;
	
	 private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	
	 @RequestMapping(value="/", method=RequestMethod.GET)
	 public String login(Locale locale , Model model) {
		 
		 return "login";
	 }
	 @RequestMapping(value="/memberlist", method=RequestMethod.GET)
	 public String memberlist(Locale locale , Model model) {
		 
		 ArrayList<CustomerVO> vo = post.getMemberlist();
		 System.out.println(vo);
	
		 model.addAttribute("member", vo);
		 
		 return "memberlist";
	 }
	 @RequestMapping(value="/memberlistck", method=RequestMethod.GET)
	 public String memberlistck(Locale locale , Model model) {
		 
		 ArrayList<CustomerVO> vo = post.getMemberlist();
		 System.out.println(vo);
	
		 model.addAttribute("member", vo);
		 
		 return "specific";
	 }
	
	
	
	 @RequestMapping(value = "/loginck" , method=RequestMethod.POST)
	 @ResponseBody
	 public String loginck(Locale locale , Model model , CustomerVO cus , HttpSession session) {
		 
		 String id = cus.getId();
		 System.out.println(id);
		 String pass = cus.getPass();
		 System.out.println(pass);
		 CustomerVO cus1 = new CustomerVO();
		 cus1 = login.getCustomer(id);
		 System.out.println(cus1);
		 if(cus1 ==null) {
			 return "idfail";
		 }else if (pass.equals(cus1.getPass())){
			 session.setAttribute("sessionid" , cus1);
			 return "success"; 
		 }else{
			 return "pwfail";
		 }
		 
		
		 
	 }
	 @RequestMapping(value="/logout" , method= RequestMethod.GET)
		 public String logout(Model model , HttpSession session) {
		 
		session.removeAttribute("sessionid");
			 
		 return "redirect:/";
	 }
	 
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		
		
		ArrayList<PostVO> vo = post.getList();
		
		System.out.println(vo);
		
		
		
		
		return "main";
	}

	/*
	 * @RequestMapping(value ="/login" , method=RequestMethod.GET) public String
	 * login(Locale locale , Model model ) {
	 * 
	 * 
	 * 
	 * return "login"; }
	 */
	@RequestMapping(value = "/getlist", method = RequestMethod.POST, produces = {"application/json; charset=UTF-8"})
	   @ResponseBody//ajax다시 돌려보낼떄 쓰이는거
	   public String getList(Locale locale, Model model) {
	 

		/* ArrayList<TempPost> dd = service.getList(); */
	      //JSON.Formobject
		ArrayList<PostVO> vo = post.getList();
		System.out.println(vo);
		
		
		
	   
		String ok = JSONArray.fromObject(vo).toString();
	
	      
	      return ok;
	      
	   }
	
	@RequestMapping(value = "/addpost" , method= RequestMethod.GET)
	public String addpost(Locale locale , Model model) {
		
		return "addpost";
	}
	@RequestMapping(value="/addpostck", method= RequestMethod.GET)
	public String addpostck(Model model , PostVO vo ,HttpSession session) {
		
		
		CustomerVO cu =(CustomerVO)session.getAttribute("sessionid");
		vo.setId(cu.getId());
		post.addPost(vo);
		System.out.println(vo);
		
		return "redirect:/main";
		
	}
	
	@RequestMapping(value="/specific", method=RequestMethod.GET )
	public String specific(Locale locale , Model model, @Param("post_code") String post_code) {
		
		
		
//		String vo = vo1.getPost_code();
//		System.out.println(vo);
////		PostVO tt = post.getSpecific(vo);
//		
		post.updateClick(post_code);
		model.addAttribute("code", post_code);
		
		
		
////		System.out.println(tt);
//		
////		String ok = JSONArray.fromObject(tt).toString();
		
		return "specific";
	}
	@RequestMapping(value = "/specificck", method = RequestMethod.POST, produces = {"application/json; charset=UTF-8"})
	   @ResponseBody//ajax다시 돌려보낼떄 쓰이는거
	   public String specificck(Locale locale, Model model,@Param("post_code") String post_code) {
	 
		System.out.println(post_code);

		/* ArrayList<TempPost> dd = service.getList(); */
	      //JSON.Formobject
		//System.out.println(post_code);
		PostVO vo = post.getSpecific(post_code);
//	   
//		
		String ok = JSONArray.fromObject(vo).toString();
//	
	      
	      return ok;
	      
	   }
	@RequestMapping(value="/updatepost", method=RequestMethod.POST)
	@ResponseBody
	public int updatepost(@RequestBody Map<String,Object> vo ) {
		
		System.out.println(vo);
		 int a =post.updatePost(vo);
		
		
		return a;
	}
	@RequestMapping(value="/mastergood", method=RequestMethod.POST)
	@ResponseBody
	public String mastergood(Locale locale , Model model , @Param("post_code") String post_code ,HttpSession session) {
		CustomerVO vo =(CustomerVO)session.getAttribute("sessionid");
		if(vo.getMaster().equals("1")) {
		
		 post.masterPick(post_code);
		}else {
		 post.justPick(post_code);
		}
		
		
		return "";
	}
	@RequestMapping(value="/deletepost",method=RequestMethod.GET)
	@ResponseBody
	public String deletepost(Locale locale , Model model , PostVO vo) {
		
		
		post.deletePost(vo);
		
		return "";
	}
	
	
	
}
