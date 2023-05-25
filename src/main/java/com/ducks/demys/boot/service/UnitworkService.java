package com.ducks.demys.boot.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.UnitworkRepository;
import com.ducks.demys.boot.vo.Unitwork;

@Service
public class UnitworkService {
	
	private UnitworkRepository unitworkRepository;
	
	public UnitworkService(UnitworkRepository unitworkRepository) {
		this.unitworkRepository= unitworkRepository;
	}
	
	public List<Unitwork> getUnitworkListByPJ_NUM(int PJ_NUM){
		List<Unitwork> unitworkData = unitworkRepository.getUnitworkListByPJ_NUM(1);
		
		return unitworkData;
	}
	
	public List<Unitwork> getUnitworkListByMEMBER_NUM(int MEMBER_NUM){
		return unitworkRepository.getUnitworkListByMEMBER_NUM(MEMBER_NUM);
	}

	
	public Unitwork getUnitworkByUW_NUM(int UW_NUM) {
		return unitworkRepository.getUnitworkByUW_NUM(UW_NUM);
	}
	
	public void registUnitwork(Unitwork unitwork) {
		unitwork.setUW_NUM(unitworkRepository.selectUnitworkSequenceNextValue());
		unitworkRepository.registUnitwork(unitwork);
	}
	
	public void modifyUnitwork(int UW_NUM, String UW_NAME, Date UW_STARTDATE, Date UW_ENDDATE, Double UW_PERCENT,
			int UW_STATUS) {
		unitworkRepository.modifyUnitwork(UW_NUM, UW_NAME, UW_STARTDATE, UW_ENDDATE, UW_PERCENT, UW_STATUS);
		
	}

	public void removeUnitwork(int UW_NUM) {
		unitworkRepository.removeUnitwork(UW_NUM);
	}
}
