package com.ducks.demys.boot.controller;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ducks.demys.boot.service.UnitworkService;
import com.ducks.demys.boot.vo.Unitwork;

@Controller
public class UnitworkController {

	private UnitworkService unitworkService;

	public UnitworkController(UnitworkService unitworkService) {
		this.unitworkService = unitworkService;

	}

	  @RequestMapping("/project/unitwork") 
	  public String showList(Model model) {
	  
		  List<Unitwork> unitWorkList = unitworkService.getUnitworkListByPJ_NUM(1);
		  model.addAttribute("unitWorkList", unitWorkList);
	  
		  return "/project/unitwork"; 
	 }
	  
	 
	@RequestMapping("/project/unitwork/load")
	@ResponseBody
	public List<Unitwork> loadUnitworkData() {
		List<Unitwork> unitworkData = unitworkService.getUnitworkListByPJ_NUM(1);
		return unitworkData;
	}
	
	@RequestMapping("/project/unitwork/update")
	@ResponseBody
	public String updateUnitwork(@RequestParam("uw_NUM") int UW_NUM,
								@RequestParam("uw_NAME") String UW_NAME,
	                             @RequestParam("uw_STARTDATE") Date UW_STARTDATE,
	                             @RequestParam("uw_ENDDATE") Date UW_ENDDATE,
	                             @RequestParam("uw_PERCENT") Double UW_PERCENT,
	                             @RequestParam("uw_STATUS") int UW_STATUS
	                             ) {
		System.out.println(UW_NAME);
	    unitworkService.modifyUnitwork(UW_NUM, UW_NAME, UW_STARTDATE, UW_ENDDATE, UW_PERCENT, UW_STATUS);
	    return "/project/unitwork/update";
	}	

	  @RequestMapping("/project/unitwork/create")

		@ResponseBody
		public void createUnitwork(@RequestBody Unitwork unitwork) {

			Unitwork regUw = unitwork;

			unitworkService.registUnitwork(regUw);
				System.out.println(regUw);
	 }
	 

}