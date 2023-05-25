package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.CalendarRepository;
import com.ducks.demys.boot.vo.Calendar;


@Service
public class CalendarService {
	public CalendarRepository calendarRepository;

	public CalendarService(CalendarRepository calendarRepository) {
		this.calendarRepository = calendarRepository;
	}

	public List<Calendar> getCalendarList(int MEMBER_NUM) {
		return calendarRepository.getCalendarList(2);
    }
	
	 public void registCalendar(Calendar sc) {
		 sc.setSC_NUM(calendarRepository.selectCalendarSequenceNextValue());

		 System.out.println("번호 : "+sc.getSC_NUM());
		 System.out.println("제목 : "+sc.getSC_NAME());
		 System.out.println("내용 : "+sc.getSC_CONTENT());
		 System.out.println("중요도 : "+sc.getSC_IMP());
		 System.out.println("장소 : "+sc.getSC_PLACE());
		 System.out.println("구분 : "+sc.getSC_STATUS());
		 System.out.println("일정구분 : "+sc.getSC_TYPE());
		    System.out.println("시작 : "+sc.getSTART());
		    System.out.println("끝 : "+sc.getEND());
	        calendarRepository.registGo(sc);
	    }

	public void removeCalendar(int SC_NUM) {
		calendarRepository.removeCalendar(SC_NUM);
	}
	
	public List<Calendar> getModal_PJList(int MEMBER_NUM) {
		return calendarRepository.getModal_PJList(2);
    }
	
}