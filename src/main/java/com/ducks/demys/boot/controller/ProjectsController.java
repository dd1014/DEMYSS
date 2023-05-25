package com.ducks.demys.boot.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ducks.demys.boot.command.SearchCriteria;
import com.ducks.demys.boot.service.ContactsService;
import com.ducks.demys.boot.service.IssueReplyService;
import com.ducks.demys.boot.service.IssueService;
import com.ducks.demys.boot.service.MeetingBookService;
import com.ducks.demys.boot.service.MemberService;
import com.ducks.demys.boot.service.PjctService;
import com.ducks.demys.boot.service.PjhrService;
import com.ducks.demys.boot.service.ProductService;
import com.ducks.demys.boot.service.ProjectsService;
import com.ducks.demys.boot.service.RequireService;
import com.ducks.demys.boot.vo.Contacts;
import com.ducks.demys.boot.vo.Issue;
import com.ducks.demys.boot.vo.IssueReply;
import com.ducks.demys.boot.vo.MeetingBook;
import com.ducks.demys.boot.vo.Member;
import com.ducks.demys.boot.vo.Pjct;
import com.ducks.demys.boot.vo.Pjhr;
import com.ducks.demys.boot.vo.Product;
import com.ducks.demys.boot.vo.ProductForSearch;
import com.ducks.demys.boot.vo.Projects;
import com.ducks.demys.boot.vo.Require;

@Controller
public class ProjectsController {
	private MeetingBookService meetingBookService;
	private ProductService productService;
	private RequireService requireService;
	private IssueService issueService;
	private IssueReplyService issueReplyService;
	private ProjectsService projectsService;
	private MemberService memberService;
	private ContactsService contactsService;
	private PjctService pjctService;
	private PjhrService pjhrService;
	
	public ProjectsController(ProjectsService projectsService, MemberService memberService, ContactsService contactsService
			, PjctService pjctService, PjhrService pjhrService,MeetingBookService meetingBookService, ProductService productService, RequireService requireService, 
			IssueService issueService, IssueReplyService issueReplyService) {
		this.projectsService = projectsService;
		this.memberService = memberService;
		this.contactsService = contactsService;
		this.pjctService = pjctService;
		this.pjhrService = pjhrService;
		this.meetingBookService = meetingBookService;
		this.productService = productService;
		this.requireService = requireService;
		this.issueService = issueService;
	}
	
	// Action
	@RequestMapping("project/main")
	public String pjctList(Model model,  @ModelAttribute SearchCriteria cri) {
		if (cri.getPage() < 1) cri.setPage(1);
		if (cri.getPerPageNum() < 1) cri.setPerPageNum(5);
	
	    Map<String, Object> dataMap = projectsService.getPJList(cri); 
	    model.addAttribute("dataMap", dataMap);
		return "project/main";
	}
	
	@RequestMapping("project/detail")
	public String pjctDetail(Model model, int PJ_NUM ) {
		Projects projects = projectsService.getPJByPJ_NUM(PJ_NUM);

		List<Pjct> pjctList = pjctService.getContactsPjctList(PJ_NUM);
		int pjctListCount = pjctService.getContactsPjctListCount(PJ_NUM);		
		model.addAttribute("projects", projects);		
		model.addAttribute("pjctList", pjctList);	
		model.addAttribute("pjctListCount", pjctListCount);	
			
		return "project/detail";
	}
	@RequestMapping("project/PjModifyDo")
	@ResponseBody
	public int PjModifyDo(@RequestBody Projects project) {
		projectsService.modifyPJ(project);

		return project.getPJ_NUM();
	}
	
//	거래처
	@RequestMapping("project/contacts_Regist")
	@ResponseBody
	public void pjctContactsRegistdo(@RequestBody Pjct pjct) {
	    pjctService.registPjct(pjct);
	}
	
	@RequestMapping("project/pjct_Remove")
	@ResponseBody
	public void pjctRemovedo(int PJCT_NUM) {
		pjctService.removePjct(PJCT_NUM);
	}
	
	@RequestMapping("project/regist_PJTYPE")
	public String sendpjtype(Model model, int PJ_TYPE) {
		model.addAttribute("PJ_TYPE",PJ_TYPE);
		//System.out.println(PJ_TYPE);
		return "project/regist_detail";
	}
	
	@RequestMapping("project/regist")
	public void pjctRegist() {}
	
	@RequestMapping("project/regist_detail")
	public void pjctRegistDetail() {}
	
	@RequestMapping("project/pjRegistdo")
	@ResponseBody
	public void pjctRegistdo(@RequestBody Projects projects) {
		int memberId = 1;
		Map<String, Object> map = new HashMap<>();
		map.put("MEMBER_NUM", memberId);
		
		projectsService.registPJ(projects);
	}
	
	@RequestMapping("project/Search_Modal")
	@ResponseBody
	public Map<String, Object> pjctSearch() {
		Map<String, Object> data=new HashMap<String, Object>();
		
		List<Member> memberList = memberService.getMemberList();
		List<Contacts> contactsList = contactsService.getContactsListPjRegist();
		
		data.put("memberList",memberList);
		data.put("contactsList",contactsList);
		return data;
	}
	 @RequestMapping("project/regist_searchMEMBER")
	 @ResponseBody
	 public Map<String, Object> sendsearchMember(Model model, 
			 @RequestParam String searchType, @RequestParam String keyword ) {
		 
		 Map<String, Object> data = new HashMap<String, Object>();
		 List<Member> memberList = memberService.getMemberListSearch(searchType, keyword);
		 data.put("memberList", memberList);
		 
		 return data; 
	 }
	 
	 @RequestMapping("project/regist_searchCONTACTS")
	 @ResponseBody
	 public Map<String, Object> sendsearchContacts(Model model, 
			 @RequestParam String searchType, @RequestParam String keyword ) {
		 
		 Map<String, Object> data = new HashMap<String, Object>();
		 List<Contacts> contactsList = contactsService.getContactsListPjRegistSearch(searchType, keyword);
			
		 data.put("contactsList", contactsList);
		 
		 return data; 
	 }
	 
//	참여인력
	@RequestMapping("project/PjNumhrList")
	public String sendPjNumhrList(Model model, int PJ_NUM) {
		Projects projects = projectsService.getPJByPJ_NUM(PJ_NUM);
		List<Pjhr> pjhrList = pjhrService.getPjhrListByPJ_NUM(PJ_NUM);
		int pjhrListCount = pjhrService.getPjhrListByPJ_NUMCount(PJ_NUM);
		
		model.addAttribute("projects",projects);
		model.addAttribute("pjhrList",pjhrList);
		model.addAttribute("pjhrListCount",pjhrListCount);
		model.addAttribute("PJ_NUM",PJ_NUM);
		return "project/hr_list";
	}
	
	@RequestMapping("project/hr_list")
	public void showPjctHrList() {}
	
	@RequestMapping("project/hr_detail")
	public void showPjctHrDetail(Model model, int PJHR_NUM) {
		Pjhr pjhr = pjhrService.getPjhrByPJHR_NUM(PJHR_NUM);
		model.addAttribute("pjhr",pjhr);
	}

	@RequestMapping("project/hr_listadd")
	@ResponseBody
	public void PjctHrDetailAdd(Model model, int PJ_NUM) {
		Projects projects = projectsService.getPJByPJ_NUM(PJ_NUM);
		List<Pjhr> pjhrList = pjhrService.getPjhrListByPJ_NUM(PJ_NUM);
		int pjhrListCount = pjhrService.getPjhrListByPJ_NUMCount(PJ_NUM);
		
		model.addAttribute("projects",projects);
		model.addAttribute("pjhrList",pjhrList);
		model.addAttribute("pjhrListCount",pjhrListCount);
		model.addAttribute("PJ_NUM",PJ_NUM);
	}
	
	@RequestMapping("project/hr_modify")
	public void showPjctHrModify(Model model, int PJHR_NUM,int PJ_NUM) {
		Pjhr pjhr = pjhrService.getPjhrByPJHR_NUM(PJHR_NUM);
		model.addAttribute("pjhr",pjhr);
	}
	
	@RequestMapping("project/hr_modifydo")
	@ResponseBody
	public int PjctHrModifyDo(@RequestBody Pjhr pjhr) {
		int PJHR_NUM = pjhr.getPJHR_NUM();
	    pjhrService.getPjhrByPJHR_NUM(PJHR_NUM);
		pjhrService.modifyPjhr(pjhr);
		System.err.println("PJHR_NUM: "+PJHR_NUM);
		return pjhr.getPJ_NUM();
	}
	
	@RequestMapping("project/pjhr_Remove")
	@ResponseBody
	public void pjhrRemovedo(int PJHR_NUM) {
		pjhrService.removePjhr(PJHR_NUM);
	}
	
	@RequestMapping("project/pjhrRegist")
	@ResponseBody
	public void pjhrRegistdo(@RequestBody Pjhr pjhr) {
		pjhrService.registPjhr(pjhr);
	}
	
	//주헌
	
	 @RequestMapping("project/product") 
	 public void showproduct() {
		 
	 }
	 
	 @RequestMapping("project/product_TL") 
	 public void showproductTM() {
		 
	 }
	 
	 @RequestMapping("project/productList") 
	 @ResponseBody
	 public List<Product> showproductList(@RequestBody ProductForSearch pd) {
		 System.out.println(pd);
		 List<Product> productList=new ArrayList<Product>();
		 int PJ_NUM = pd.getPJ_NUM();
		 int PRODUCT_STEP = (int) pd.getPRODUCT_STEP();
		 String searchType=pd.getSearchType();
		 String keyword=pd.getKeyword();
		 
		 productList = productService.getProductListByOnlyPJ_NUM(PJ_NUM);
		 
		     //1을 PJ_NUM으로 바꿔
			 productList = productService.getSearchProductList(PJ_NUM, PRODUCT_STEP, searchType, keyword); //1을 PJ_NUM으로, 위에 모델옆에 int PJ_NUM
		 return productList;
	 }
	 
	 @RequestMapping("project/PDstatusChange")
	 @ResponseBody
	 public void statusChange(@RequestParam String product_num, String product_status) {
		 
		 Product product = new Product();
		 
		 int num = Integer.parseInt(product_num);
		 int status = Integer.parseInt(product_status);

		 product.setPRODUCT_NUM(num);
		 product.setPRODUCT_STATUS(status);
		 
		 productService.changeStatusProduct(product);
	 }
	 
	 @RequestMapping("project/product_regist")
	 @ResponseBody
	 public void showproduct_regist(String PRODUCT_TITLE, int PRODUCT_STEP, String PRODUCT_CONTENT, int PRODUCT_STATUS, int MEMBER_NUM, int PJ_NUM) {
		Product product = new Product();	
		
		product.setPRODUCT_TITLE(PRODUCT_TITLE);
		product.setPRODUCT_STEP(PRODUCT_STEP);
		product.setPRODUCT_CONTENT(PRODUCT_CONTENT);
		product.setPRODUCT_STATUS(PRODUCT_STATUS);
		product.setMEMBER_NUM(MEMBER_NUM);
		product.setPJ_NUM(1);

		productService.registProduct(product);
	 }
		 
	 @RequestMapping("project/product_detail") 
	 public void showproduct_detail(Model model, int PRODUCT_NUM) {
		 Product product = productService.getProductByProduct_NUM(PRODUCT_NUM);
		 model.addAttribute("product", product);
	 }
	 
	 @RequestMapping("project/product_modify") 
	 public void showproduct_modify(int PRODUCT_NUM, Model model) {
		 Product product = productService.getProductByProduct_NUM(PRODUCT_NUM);
		 model.addAttribute("product", product);
	 }
	 
	 @ResponseBody
	 @PostMapping("project/doproduct_modify") 
	 public void showdoproduct_modify(String PRODUCT_TITLE, int PRODUCT_STEP, String PRODUCT_CONTENT, int PRODUCT_NUM, int PJ_NUM, int MEMBER_NUM) {
		
		Product product = productService.getProductByProduct_NUM(PRODUCT_NUM);
				
		product.setPRODUCT_TITLE(PRODUCT_TITLE);
		product.setPRODUCT_CONTENT(PRODUCT_CONTENT);
		product.setPRODUCT_STEP(PRODUCT_STEP);
		product.setMEMBER_NUM(MEMBER_NUM);
		product.setPJ_NUM(PJ_NUM);
		
		productService.modifyProduct(product);
	 }
	 
	 @RequestMapping("project/require") 
	 public String showrequire(Model model, @RequestParam(defaultValue = "REQUIRE_TITLE, REQUIRE_DETAIL") String searchKeywordTypeCode,
				@RequestParam(defaultValue = "") String searchKeyword) {
		List<Require> requireList = requireService.getSearchRequire(searchKeywordTypeCode, searchKeyword);
		 
//		List<Require> requireList = requireService.getRequireListByPJ_NUM(1); //1을 PJ_NUM으로, 위에 모델옆에 int PJ_NUM
		model.addAttribute("requireList", requireList);
				
		return "project/require";
	 }
	
	  
	@RequestMapping("project/require_regist")
	@ResponseBody
	 public void showrequire_regist(String REQUIRE_TITLE, int REQUIRE_LEVEL, String REQUIRE_DETAIL, int CT_NUM, int MEMBER_NUM, int PJ_NUM) {
		
		Require require = new Require();
		
		require.setREQUIRE_TITLE(REQUIRE_TITLE);
		require.setREQUIRE_LEVEL(REQUIRE_LEVEL);
		require.setREQUIRE_DETAIL(REQUIRE_DETAIL);
		require.setCT_NUM(CT_NUM);
		require.setMEMBER_NUM(MEMBER_NUM);
		require.setPJ_NUM(1);

		requireService.registRequire(require);
	
	 }
	 
	 
	 @RequestMapping("project/require_detail") 
	 public void showrequire_detail(Model model, int REQUIRE_NUM) {
		 Require require = requireService.getRequireByREQUIRE_NUM(REQUIRE_NUM);
		 model.addAttribute("require", require);
	 }
	 
	 
	 @RequestMapping("project/require_modify") 
	 public void showrequire_modify(int REQUIRE_NUM, Model model) {
		 Require require = requireService.getRequireByREQUIRE_NUM(REQUIRE_NUM);
		 model.addAttribute("require",require);
	 }
	 
	 
	 @ResponseBody
	 @PostMapping("project/dorequire_modify") 
	 public void showrequire_modify(String REQUIRE_TITLE, int REQUIRE_LEVEL, String REQUIRE_DETAIL, int REQUIRE_NUM) {
		
		Require require = requireService.getRequireByREQUIRE_NUM(REQUIRE_NUM);
				
		require.setREQUIRE_TITLE(REQUIRE_TITLE);
		require.setREQUIRE_LEVEL(REQUIRE_LEVEL);
		require.setREQUIRE_DETAIL(REQUIRE_DETAIL);
		

		requireService.modifyRequire(require);
	 }
	
	 @RequestMapping("project/require_delete")
	  public String showrequire_delete(int REQUIRE_NUM) {
		 
		 requireService.removeRequire(REQUIRE_NUM);
			
		 return "project/remove_success";
	 }
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	@RequestMapping("project/meetingbook")
	public String showmeetingbook(Model model, @RequestParam(defaultValue = "") Object PJ_NUM, @RequestParam(defaultValue = "MB_TITLE, MEMBER_NAME") String searchKeywordTypeCode, @RequestParam(defaultValue = "") String searchKeyword) {
		List<MeetingBook> meetingBookList = meetingBookService.getSearchMeetingbook(1, searchKeywordTypeCode, searchKeyword);
		
		model.addAttribute("meetingBookList", meetingBookList);
		
		return "project/meetingbook";
	}
	
	@ResponseBody
	@RequestMapping("project/meetingbook_regist") 
	public void showmeetingbook_regist(String MB_TITLE, String MB_CONTENT, int MEMBER_NUM, int PJ_NUM) {
		MeetingBook meetingBook = new MeetingBook();
		
		meetingBook.setMB_TITLE(MB_TITLE);
		meetingBook.setMB_CONTENT(MB_CONTENT);
		meetingBook.setMEMBER_NUM(MEMBER_NUM);
		meetingBook.setPJ_NUM(1);
		
		meetingBookService.registMeetingBook(meetingBook);
	}

	 @RequestMapping("project/meetingbook_detail") 
	 public void showmeetingbook_detail(Model model, int MB_NUM) {
		 MeetingBook meetingbook = meetingBookService.getMeetingBookByMB_NUM(MB_NUM);
		 model.addAttribute(meetingbook);
	 }
	 
	 @RequestMapping("project/meetingbook_modify") 
	 public void showmeetingbook_modify(int MB_NUM, Model model) {
		 MeetingBook meetingBook = meetingBookService.getMeetingBookByMB_NUM(MB_NUM);
		 model.addAttribute("meetingBook",meetingBook);
	 }
	 
	 
	 @ResponseBody
	 @PostMapping("project/domeetingbook_modify") 
	 public void showdomeetingBook_modify(String MB_TITLE, String MB_CONTENT, int MB_NUM) {
	
		MeetingBook meetingBook = meetingBookService.getMeetingBookByMB_NUM(MB_NUM);
				
		meetingBook.setMB_TITLE(MB_TITLE);
		meetingBook.setMB_CONTENT(MB_CONTENT);

		meetingBookService.modifyMeetingBook(meetingBook);
		

	 }
	 
	 @RequestMapping("project/issue") 
	 public String showissue(Model model) {
		 List<Issue> issueList = issueService.getIssueListByPJ_NUM(8);
		 model.addAttribute("issueList", issueList);
		 
		 return "project/issue";
		 
	 }
	 
	 
	  @ResponseBody
	  @RequestMapping("project/issue_memberDepList") 
	  public List<Member> showissue_memberDepList(@RequestParam String MEMBER_DEP) {
		  
		  List<Member> memberdeplist = memberService.getMemberByMEMBER_DEP(MEMBER_DEP);
		  
		  return memberdeplist;
		  
	  }
	  
	 @RequestMapping("project/issue_TL") 
	 public void showissue_TL() {
		 
	 }
	 
	  @RequestMapping("project/issue_detail_TL") 
	  public void showissue_detail_TL() {
	  
	  }
	  
	  @RequestMapping("project/issue_detail") 
	  public void showissue_detail(Model model, int ISSUE_NUM) {
		Issue issue  = issueService.getIssueByISSUE_NUM(ISSUE_NUM);
		List<IssueReply> replyList = issueReplyService.getIssueReplyListByISSUE_NUM(ISSUE_NUM);
		
		model.addAttribute("issue",issue);
		model.addAttribute("replyList", replyList);
	  }
	 
	   @ResponseBody
	   @RequestMapping("project/issue_regist") 
	   public void showissue_regist( String ISSUE_TITLE, String ISSUE_CONTENT, int ISSUE_IMP, int ISSUE_STATUS, Date ISSUE_REGDATE, Date ISSUE_DEADLINE, int MEMBER_NUM, int PJ_NUM) {
		
		Issue  issue = new Issue();
		
		issue.setISSUE_TITLE(ISSUE_TITLE);
		issue.setISSUE_CONTENT(ISSUE_CONTENT);
		issue.setISSUE_IMP(ISSUE_IMP);
		issue.setISSUE_STATUS(1);
		issue.setISSUE_REGDATE(ISSUE_REGDATE);
		issue.setISSUE_DEADLINE(ISSUE_DEADLINE);
		issue.setMEMBER_NUM(3);
		issue.setPJ_NUM(8);
			
		issueService.registIssue(issue);
			
		}

}
