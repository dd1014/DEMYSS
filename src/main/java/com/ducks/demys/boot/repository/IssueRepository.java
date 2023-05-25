package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Issue;
import com.ducks.demys.boot.vo.IssueReply;

@Mapper
public interface IssueRepository {

	//public List<Issue> getIssueList();
	
	public List<IssueReply> getIssueReplyListByISSUE_NUM(int ISSUE_NUM);
	
	public IssueReply getIssueByISSUERE_NUM(int ISSUERE_NUM);

	public List<Issue> getIssueListForDashboard();

//	public List<Issue> getIssueListByPJ_NUM(int PJ_NUM);
//	
//	public List<Issue> getIssueListByMEMBER_NUM(int MEMBER_NUM);
//	
	public Issue getIssueByISSUE_NUM(int ISSUE_NUM);
	
	public int selectIssueSequenceNextValue();
	
	public void registIssue(Issue issue);
	
	public void modifyIssue(Issue issue);
	
	public void removeIssue(int ISSUE_NUM);
	
	public int getIssuePjListCount(int PJ_NUM);

	public List<Issue> getIssueListByPJ_NUM(int PJ_NUM);

	
}