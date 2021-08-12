package com.sboot.beancafe;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sboot.beancafe.captcha.ApiExamCaptchaImage;
import com.sboot.beancafe.captcha.ApiExamCaptchaNkey;
import com.sboot.beancafe.captcha.ApiExamCaptchaNkeyResult;
import com.sboot.beancafe.dao.joinDAO;
import com.sboot.beancafe.dao.loginDAO;
import com.sboot.beancafe.service.certificationService;
import com.sboot.beancafe.vo.MemberVO;




@Controller
public class loginController {
	@Autowired
	private joinDAO joindao;
	@Autowired
	private loginDAO logindao;
	//문자인증 서비스
	@Autowired
	private certificationService certificationService; 
	@Autowired
	private PasswordEncoder passwordEncoder;

	@GetMapping("/")
	public String mai() {
		return "/main";
	}
	@GetMapping("/login")
	public String login() {
		return "/login";
	}
	 public String deleteinfo(HttpServletRequest req) {
	        joindao.deleteinfo(req.getParameter("user_id"));
	        return "redirect:http://localhost:8889/getallproduct";
	    }


	@GetMapping("/join")
	public String join() {
		return "/join";
	}
	//회원가입 포스트매핑
	@PostMapping("/join")
	public String join2(MemberVO member,HttpServletRequest request) {
		String pw=request.getParameter("user_pw");
		member.setUser_pw(passwordEncoder.encode(pw));
		System.out.println(pw);

		joindao.joinMember(member);
		return "/main";
	}
	

	//아이디 중복확인 ajax
	@PostMapping("/idcheck")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String user_id){

		Map<Object, Object> map= new HashMap<Object, Object>();

		user_id=user_id.substring(8);

		int count=joindao.idcheck(user_id);


		map.put("cnt",count);
		return map;
	}
	//번호 인증 ajax
	@GetMapping("check/sendSMS")
	public @ResponseBody String sendSMS(String phoneNumber) {
		Random rand=new Random();
		String numStr="";
		for (int i = 0; i < 4; i++) {
			String ran=Integer.toString(rand.nextInt(10));
			numStr+=ran;
		}

		System.out.println("수신자번호:"+phoneNumber);
		System.out.println("인증번호 :" +numStr);
		certificationService.certififiedPhoneNumber(phoneNumber, numStr);

		return numStr;
	}

	
	//아이디찾기 페이지 가기
	@GetMapping("findID")
	public String findID() {
		return "findID";
	}
	//아이디찾기 ajax
	@GetMapping("findIDa")
	public @ResponseBody String findIDa(@RequestParam("user_name")String user_name, @RequestParam("phoneNumber") String phoneNumber) {
		String user_name2=user_name;
		String phoneNumber2=phoneNumber;
		String id=logindao.findID(user_name2, phoneNumber2);
		String msg;
		if(id==null) {
			msg="해당하는 아이디가 없습니다.";
		}else {
			msg=user_name+"님의 아이디는 \n"+id+"입니다";
		}
		return msg;
		
	}
	
	//비밀번호 재설정 페이지 가기
	@GetMapping("rePW")
	public String rePW() {
		return "rePW";
	}
	//비밀번호 재설정 ajax
	@GetMapping("rePWa")
	public @ResponseBody String rePWa(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String user_pw) {
		String user_id2=user_id;
		String user_pw2=user_pw;
		String re_pw=passwordEncoder.encode(user_pw2);
		
		logindao.rePW(user_id2, re_pw);
		
		String msg="비밀번호가 변경되었습니다";
		return msg;
		
	}
	

	

}
