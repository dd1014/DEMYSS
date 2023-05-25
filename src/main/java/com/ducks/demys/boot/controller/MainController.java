package com.ducks.demys.boot.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ducks.demys.boot.service.IssueService;
import com.ducks.demys.boot.service.MemberService;
import com.ducks.demys.boot.service.ProjectsService;
import com.ducks.demys.boot.vo.Issue;
import com.ducks.demys.boot.vo.Projects;
import com.ducks.demys.boot.vo.ProjectsForPrint;

@Controller
public class MainController {
	
	MemberService memberService;
	ProjectsService projectsService;
	IssueService issueService;
	
	public MainController(MemberService memberService, ProjectsService projectsService, IssueService issueService) {
		this.memberService=memberService;
		this.projectsService=projectsService;
		this.issueService=issueService;
	}
	
	@RequestMapping("/main")
	public void showMain(Model model){
		int ing = projectsService.getPJListSTATUSCount(1);
		int delay = projectsService.getPJListSTATUSCount(2);
		int success = projectsService.getPJListSTATUSCount(3);
		int fail = projectsService.getPJListSTATUSCount(4);
		int total=projectsService.getPJListCount();
		
		List<Projects> pjList=projectsService.getPJListOrderByPJ_ENDDATE();
		
		List<Issue> issueList=issueService.getIssueListForDashboard();
		
		model.addAttribute("ing", ing);
		model.addAttribute("delay", delay);
		model.addAttribute("success", success);
		model.addAttribute("fail", fail);
		model.addAttribute("total", total);
		model.addAttribute("pjList", pjList);
		model.addAttribute("issueList", issueList);
		
	}
	
	@RequestMapping("/projecting")
	@ResponseBody
	public List<ProjectsForPrint> showProjectingList(@RequestBody ProjectsForPrint pj){
		int MEMBER_NUM=pj.getMEMBER_NUM();
		int PJ_IMP=pj.getPJ_IMP();
		String SORT=pj.getSORT();
		List<ProjectsForPrint> projects = projectsService.getPJListForDashboard(MEMBER_NUM, PJ_IMP, SORT);
		return projects;
	}
	@RequestMapping("/issueing")
	@ResponseBody
	public List<ProjectsForPrint> showissueingList(@RequestBody ProjectsForPrint pj){
		int MEMBER_NUM=pj.getMEMBER_NUM();
		int PJ_IMP=pj.getPJ_IMP();
		String SORT=pj.getSORT();
		List<ProjectsForPrint> projects = projectsService.getPJListForDashboard(MEMBER_NUM, PJ_IMP, SORT);
		return projects;
	}
	
	@RequestMapping("/mainIssue2")
	public void showissue(){
	}
	@RequestMapping("/login")
	public void showlogin(){
	}
}
