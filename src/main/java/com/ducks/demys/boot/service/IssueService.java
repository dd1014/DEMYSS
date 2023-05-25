package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.IssueRepository;
import com.ducks.demys.boot.vo.Issue;

@Service
public class IssueService {
	
	private IssueRepository issueRepository;
	
	public IssueService(IssueRepository issueRepository) {
		this.issueRepository= issueRepository;
	}
	
//	public List<Issue> getIssueList(){
//		return issueRepository.getIssueList();
//	}
	
	public List<Issue> getIssueListForDashboard(){
		return issueRepository.getIssueListForDashboard();
	}
	
//	public List<Issue> getIssueListByMEMBER_NUM(int MEMBER_NUM){
//		return issueRepository.getIssueListByMEMBER_NUM(MEMBER_NUM);
//	}
	
	
	public Issue getIssueByISSUE_NUM(int ISSUE_NUM) {
		return issueRepository.getIssueByISSUE_NUM(ISSUE_NUM);
	}

	public void registIssue(Issue issue) {
		issue.setISSUE_NUM(issueRepository.selectIssueSequenceNextValue());
		issueRepository.registIssue(issue);
	}
	
	public void modifyIssue(Issue Issue) {
		issueRepository.modifyIssue(Issue);
	}
	
	public void removeIssue(int ISSUE_NUM) {
		issueRepository.removeIssue(ISSUE_NUM);
	}

	public List<Issue> getIssueListByPJ_NUM(int PJ_NUM){
		return issueRepository.getIssueListByPJ_NUM(PJ_NUM);
	}

}
