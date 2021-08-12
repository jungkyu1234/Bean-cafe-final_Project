package com.sboot.beancafe;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.sboot.beancafe.dao.MemberDAO;
import com.sboot.beancafe.dao.OrderDAO;
import com.sboot.beancafe.dao.ProductDAO;
import com.sboot.beancafe.service.FileUploadService;
import com.sboot.beancafe.service.UploadService;
import com.sboot.beancafe.vo.MemberVO;
import com.sboot.beancafe.vo.ProductVO;

@Controller
public class BeanController {
	
	@Autowired
	ProductDAO dao;
	
	@Autowired
	private RestTemplate restTemplate;
	
	
	@RequestMapping("/main") 
	public String go1() { 
		return "main"; 
		}
	
	//장바구니 추가하기
		@PostMapping("/inputcart")
		public String inputcart(HttpServletRequest request) {
			HttpSession session=request.getSession();
			MemberVO member=(MemberVO) session.getAttribute("member");
			String p_name=request.getParameter("p_name");
			String p_imguri=request.getParameter("p_imguri");
			int amount=Integer.parseInt(request.getParameter("p_amount"));
			int p_price=Integer.parseInt(request.getParameter("p_price"));
			System.out.println(p_name+amount+p_imguri+p_price);
			p_price=amount*p_price;
			String id=member.getUser_id();
			int order_num=2;
			
			dao.insertCart(p_imguri, p_name, p_price, id, order_num);
			
			return "redirect:cart2";
		}
		
		//장바구니 목록 가져오기
		@GetMapping("/cart2")
		public String cart2(Model model,HttpServletRequest request) {
			HttpSession session=request.getSession();
			MemberVO member=(MemberVO) session.getAttribute("member");
			String id=member.getUser_id();
			System.out.println("ddddddddddddddddddddddddddddddddddddddddddd"+id);
			model.addAttribute("cart",dao.getCart(id));
			
			return "cart2";
		}


		//상품출력
		@RequestMapping("/") 
		public String go() { 
			return "redirect:getallproduct"; 
			}
		
		@RequestMapping("/getallproduct") 
		public String getallproduct(Model model) {
			model.addAttribute("allproduct", dao.getAllproduct()); 
			return "getallproduct"; 
			} 
		
		@RequestMapping("/getcoffee") 
		public String getcoffee(Model model) {
			model.addAttribute("coffee", dao.getCoffee()); 
			return "getcoffee"; 
			} 
		
		@RequestMapping("/getgoods") 
		public String getgoods(Model model) {
			model.addAttribute("goods", dao.getGoods()); 
			return "getgoods"; 
			}
		
		@RequestMapping("/getmailing") 
		public String getmailing(Model model) {
			model.addAttribute("mailing", dao.getMailing()); 
			return "getmailing"; 
			}
		@RequestMapping("/getorderlist") 
		public String getmailing1(Model model) {
			model.addAttribute("getorderlist", dao.getMailing()); 
			return "getorderlist"; 
			}
		//상품상세페이지
	    @RequestMapping("/productinfo")
		public String productinfo(HttpServletRequest req, Model model) {
			ProductVO pvo = dao.getProductinfo(req.getParameter("p_name"));
	        model.addAttribute("p_name", pvo.getP_name());
	        model.addAttribute("p_no", pvo.getP_no());
	        model.addAttribute("p_amount", pvo.getP_amount());
	        model.addAttribute("p_price", pvo.getP_price());
	        model.addAttribute("p_imguri", pvo.getP_imguri());
	        model.addAttribute("description", pvo.getP_dis());
	        return "product";
	    }
		
		//admin.상품관리-수정-삭제
		@RequestMapping("/admin")
		public String admin() {
			return "admin";
		}
		
		@RequestMapping("/adminProduct")
		public String updateForm(Model model) {
			model.addAttribute("allproduct", dao.getAllproduct()); 
			return "adminProduct";
		}
			
		@RequestMapping("/getinfo")
		public String updateForm(HttpServletRequest req, Model model) {
			ProductVO pvo = dao.getInfo(req.getParameter("name"));
			model.addAttribute("p_name", pvo.getP_name());
			model.addAttribute("p_no", pvo.getP_no());
			model.addAttribute("p_amount", pvo.getP_amount());
			model.addAttribute("p_price", pvo.getP_price());
			model.addAttribute("p_imguri", pvo.getP_imguri());
			model.addAttribute("description", pvo.getP_dis());
			return "updateForm";
		}

		@RequestMapping("/updateProduct")
		public String updateProduct(HttpServletRequest req) {
			dao.updateProduct(Integer.parseInt(req.getParameter("p_no")), 
					req.getParameter("p_name"),
					Integer.parseInt(req.getParameter("p_price")), 
					Integer.parseInt(req.getParameter("p_amount")),
					req.getParameter("p_imguri"),
					req.getParameter("description"));
			return "redirect:adminProduct";
		}
		
		@RequestMapping("/deleteProduct")
		public String deleteProduct(HttpServletRequest req) {
			dao.deleteProduct(req.getParameter("name"));
			return "redirect:adminProduct";
		}
		
		//admin.파일업로더
		@RequestMapping("/insertForm")
		public String insertform() {
			return "insertForm";
		}
		
		@Autowired
		FileUploadService fileUploadService;
		
		@Autowired
		UploadService uploadService;
		
		@PostMapping("/insertProduct")
		public String insertProduct(@RequestParam("file") MultipartFile file, HttpServletRequest req)
											throws IllegalStateException, IOException {
			uploadService.excute(Integer.parseInt(req.getParameter("p_no")),
						req.getParameter("p_name"), Integer.parseInt(req.getParameter("p_price")),
						Integer.parseInt(req.getParameter("p_amount")), 
						req.getParameter("description"), file);
			return "redirect:getallproduct";
		}
		
		//admin.전체회원목록
		@Autowired
		MemberDAO mdao;
		
		@RequestMapping("/amemberList")
		public String amemberlist(Model model) {
			model.addAttribute("mlist", mdao.getMembers()); 
			return "amemberList"; 
		 }
		
		
		//admin.주문목록
		@Autowired
		OrderDAO odao;
		
		@RequestMapping("/aordermlist") 
		public String aordermemlist(Model model) {
			model.addAttribute("ordermlist", odao.getOrdermem());
			return "ordermList";
		}
		@RequestMapping("/getorderform") 
		public String aordermemlist1(Model model) {
			model.addAttribute("ordermlist", odao.getOrdermem());
			return "getorderform";
		}
		
		@RequestMapping("/aorderplist") 
		public String getadminInfo(@RequestParam("order_num") int order_num, Model model) {
			model.addAttribute("orderplist", odao.getOrderpro(order_num));
			model.addAttribute("order_num", order_num);
			return "orderpList";
			}

		//admin.주문현황변경
		@RequestMapping("/getmsg")
	    public String getmsg(@RequestParam("order_num") int order_num, Model model) {
	        model.addAttribute("ordermsg", odao.getmsg(order_num));
	        model.addAttribute("order_num", order_num);
	        return "updatemsgform";
	    }
		
		@RequestMapping("/updatemsg")
		public String updatemsg(@RequestParam("order_num") int order_num,
								@RequestParam("or_msg") String or_msg, Model model) {
			model.addAttribute("or_msg", odao.updatemsg(order_num, or_msg));
			return "redirect:aordermlist";
		}

		 
		
	}
