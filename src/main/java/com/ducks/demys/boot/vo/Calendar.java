package com.ducks.demys.boot.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
public class Calendar {
	
	private int SC_NUM;
	private String SC_NAME;
	private String SC_CONTENT;
	private int SC_IMP;
	private String SC_TYPE;
	private Date SC_STARTDATE;
	private String START;
	private Date SC_ENDDATE;
	private String END;
	private Date SC_REGDATE;
	private Date SC_UPDATEDATE;
	private String SC_PLACE;
	private int SC_STATUS;
	private int PJ_NUM;
	private int MEMBER_NUM;
	private int TASKS_NUM;	
	private String title;
	
	private String PJ_NAME;



}