package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Contacts;

@Mapper
public interface ContactsRepository {

	public List<Contacts> getContactsList();
	
	public Contacts getContactsByCT_NUM(int CT_NUM);
	
	public void registContacts(Contacts contacts);
	
	public void modifyContacts(Contacts contacts);
	
	public void removeContacts(int CT_NUM);
}