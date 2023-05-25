package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Issue {
	
	private int ISSUE_NUM;
	private String ISSUE_TITLE;
	private String ISSUE_CONTENT;
	private int ISSUE_IMP;
	private int ISSUE_STATUS;
	private Date ISSUE_REGDATE;
	private Date ISSUE_UPDATEDATE;
	private Date ISSUE_DEADLINE;
	private Date ISSUE_ENDDATE;
	private int MEMBER_NUM;
	private int PJ_NUM;
	private String MEMBER_NAME;
	private String PJ_NAME;
	private String CT_NAME;
	private int ISSUEREPLY_COUNT;
	

}
