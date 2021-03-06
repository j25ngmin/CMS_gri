/*
 * Copyright 2010 MOPAS(Ministry of Public Administration and Security).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.oe1.cms.com.service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.oe1.cms.com.service.EgovOe1PartcpntService;
import egovframework.oe1.cms.com.service.EgovOe1PartcpntVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 개발프레임워크 사업단 담당자 목록 관리를 위한 ServiceImpl
 * @author 운영환경1팀 조수정
 * @since 2010.07.20
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2010.07.20  조수정          최초 생성
 *
 * Copyright (C) 2009 by MOPAS  All right reserved.
 * </pre>
 */
@Service("partcpntService")
public class EgovOe1PartcpntServiceImpl implements EgovOe1PartcpntService {

	 /** ID Generation */
    @Resource(name="egovPartcpntIdGnrService")    
    private EgovIdGnrService partcpntIdGnrService;
    
	/**
	 * EgovPartcpntDAO
	 */
    @Resource(name="partcpntDAO")
	private EgovPartcpntDAO partcpntDAO;



	/**
	 * 관계자를 삭제한다.
	 * @param partcpntVO
	 * @return void
	 * @exception Exception
	 * 
	 * @param partcpntVO
	 */
	public void deletePartcpnt(EgovOe1PartcpntVO partcpntVO)throws Exception {
		partcpntDAO.deletePartcpnt(partcpntVO);
	}

	/**
	 * 관계자를 등록한다.
	 * @param partcpntVO
	 * @return String - 등록 결과
	 * @exception Exception
	 * 
	 * @param partcpntVO
	 */
	public String insertPartcpnt(EgovOe1PartcpntVO partcpntVO)throws Exception {

		/** ID Generation Service */
    	String id = partcpntIdGnrService.getNextStringId();
    	
    	partcpntVO.setPartcpntId(id);
    	    	
    	partcpntDAO.insertPartcpnt(partcpntVO);    	
    	
        return id;
	}

	/**
	 * 관계자를 검색한다.
	 * @param partcpntVO
	 * @return EgovPartcpntVO - 검색된 관계자 정보
	 * @exception Exception
	 * 
	 * @param partcpntVO
	 */
	public EgovOe1PartcpntVO selectPartcpnt(EgovOe1PartcpntVO partcpntVO)throws Exception {
		
		EgovOe1PartcpntVO resultVO = partcpntDAO.selectPartcpnt(partcpntVO);
		        
		return resultVO;
	}

	/**
	 * 관계자 목록을 검색한다.
	 * @param searchVO
	 * @return List- 검색된 관계자 목록
	 * @exception Exception
	 * 
	 * @param searchVO
	 */
	public List selectPartcpntList(EgovOe1PartcpntVO searchVO)throws Exception {
		
		 return partcpntDAO.selectPartcpntList(searchVO);
	}

	/**
	 * 관계자 총 명 수를 검색한다.
	 * @param searchVO
	 * @return int - 검색된 관계자 총 명 수
	 * @exception Exception
	 * 
	 * @param searchVO
	 */
	public int selectPartcpntListTotCnt(EgovOe1PartcpntVO searchVO){
		return partcpntDAO.selectPartcpntListTotCnt(searchVO);
	}

	/**
	 * 관계자를 수정한다.
	 * @param partcpntVO
	 * @return void
	 * @exception Exception
	 * 
	 * @param partcpntVO
	 */
	public void updatePartcpnt(EgovOe1PartcpntVO partcpntVO)throws Exception {
		partcpntDAO.updatePartcpnt(partcpntVO);
	}

}