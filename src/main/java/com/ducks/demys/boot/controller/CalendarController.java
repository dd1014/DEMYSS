package com.ducks.demys.boot.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ducks.demys.boot.service.CalendarService;
import com.ducks.demys.boot.service.MemberService;
import com.ducks.demys.boot.service.ProjectsService;
import com.ducks.demys.boot.vo.Calendar;
import com.ducks.demys.boot.vo.Member;
import com.ducks.demys.boot.vo.Projects;

@Controller
public class CalendarController {
	public CalendarService calendarService;
	public ProjectsService projectsService;
	public MemberService memberService;

	public CalendarController(CalendarService calendarService, ProjectsService projectsService,MemberService memberService) {
		this.calendarService = calendarService;
		this.projectsService = projectsService;
		this.memberService = memberService;
	}

	@RequestMapping("/calendar/calendar")
	public String showCalendar(Model model) {
		return "calendar/calendar";
	}

	/*
	 * @RequestMapping("/calendar/getCalendar") public @ResponseBody
	 * List<Map<String, Object>> getCalendar() { List<Map<String, Object>> list =
	 * calendarService.getCalendarList();
	 * 
	 * JSONObject jsonObj = new JSONObject(); JSONArray jsonArr = new JSONArray();
	 * HashMap<String, Object> hash = new HashMap<String, Object>();
	 * 
	 * for(int i=0; i < list.size(); i++) { hash.put("title",
	 * list.get(i).get("title")); hash.put("start", list.get(i).get("startDate"));
	 * hash.put("end", list.get(i).get("endDate"));
	 * 
	 * jsonObj = new JSONObject(hash); jsonArr.add(jsonObj); } return jsonArr; }
	 */
	
	//달력리스트조회
	@RequestMapping("/calendar/getCalendar")
	@ResponseBody
	public List<Calendar> getCalendar() {
		List<Calendar> calendar = calendarService.getCalendarList(2);
		
		return calendar;
	}
	
	
	
	//달력등록
	@RequestMapping("/calendar/registCalendar")
	@ResponseBody
	public void registCalendar(@RequestBody Calendar sc) {
	    Calendar regsc=sc;

	    // title, start, end 값을 활용하여 로직 수행
	    calendarService.registCalendar(regsc); // scheduleService의 registCalendar 메서드 호출
	    
	    
	    
	}
	
	//달력삭제
	@RequestMapping("/calendar/removeCalendar")
	@ResponseBody
	public void removeCalendar(@RequestParam("sc_NUM") int SC_NUM) {
		System.out.println(SC_NUM);
	    
	    calendarService.removeCalendar(SC_NUM); 
	    
	    
	    
	}
	//일정추가 모달에서 프로젝트명 리스트조회
	@RequestMapping("/calendar/getModal_PJList")
	@ResponseBody
	public List<Projects> getModal_PJList(Model model, @RequestParam("member_NUM")int MEMBER_NUM ) {
		Member member = memberService.getMemberByMEMBER_NUM(MEMBER_NUM);
		System.out.println("member: "+MEMBER_NUM);
		List<Projects> projectList = projectsService.getPJCalList(MEMBER_NUM);
		model.addAttribute("projectList",projectList);
		System.out.println(projectList);
	    return projectList;
	}
	
	@RequestMapping("/calendar/doModifyCalendar")
	@ResponseBody
	public void doModifyCalendar(Model model, @RequestBody Calendar sc) {
		int calendar_num = sc.getSC_NUM();
		calendarService.getCalendarList(calendar_num);
		System.out.println("캘린더 번호 :" + calendar_num );
		
		
		Calendar regsc=sc;
		calendarService.modifyCalendar(regsc);
		System.out.println("수정완:"+regsc);
	}
	
}