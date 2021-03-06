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
package egovframework.oe1.cms.arc.service.impl;
import java.util.List;

import org.springframework.stereotype.Repository;
import egovframework.oe1.cms.arc.service.EgovOe1ServiceInfoVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

/**
 * 서비스정보 DAO 클래스
 * 
 * @author  운영환경1팀 김아름
 * @since 2010.07.12
 * @version 1.0
 * @see
 * 
 * <pre>
 *  == 개정이력(Modification Information) ==
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2010.07.12  김아름          최초 생성
 *
 * </pre>
 */

@Repository("egovOe1ServiceInfoDAO")
public class EgovOe1ServiceInfoDAO extends EgovAbstractDAO {


	  /**
	   * 서비스정보 삭제
	   * @param EgovOe1ServiceInfoVO
	   * @return void
	   * @exception Exception
	     */
	public void deleteServiceInfo(EgovOe1ServiceInfoVO vo){
		   delete("egovOe1ServiceInfoDAO.deleteServiceInfo", vo);
	}

	  /**
	   * 서비스정보 등록
	   * @param EgovOe1ServiceInfoVO
	   * @return void
	   * @exception Exception
	     */
	public void insertServiceInfo(EgovOe1ServiceInfoVO vo){
		
		insert("egovOe1ServiceInfoDAO.insertServiceInfo", vo);
	}

	  /**
	   * 서비스정보 상세조회
	   * @param EgovOe1ServiceInfoVO
	   * @return EgovOe1ServiceInfoVO
	   * @exception Exception
	     */
	public EgovOe1ServiceInfoVO selectServiceInfo(EgovOe1ServiceInfoVO vo){
		return (EgovOe1ServiceInfoVO) selectByPk("egovOe1ServiceInfoDAO.selectServiceInfo", vo);
	}

	  /**
	   * 서비스정보 목록
	   * @param EgovOe1ServiceInfoVO
	   * @return List
	   * @exception Exception
	     */
	public List selectServiceInfoList(EgovOe1ServiceInfoVO vo){
		  return list("egovOe1ServiceInfoDAO.selectServiceInfoList", vo);
	}

	  /**
	   * 서비스정보 수정
	   * @param EgovOe1ServiceInfoVO
	   * @return void
	   * @exception Exception
	     */
	public void updateServiceInfo(EgovOe1ServiceInfoVO vo){
		 update("egovOe1ServiceInfoDAO.updateServiceInfo", vo);
	}
	
	  /**
	   * 서비스정보 목록 개수
	   * @param EgovOe1ServiceInfoVO
	   * @return int
	   * @exception Exception
	     */
	public Integer selectServiceInfoListTot(EgovOe1ServiceInfoVO vo) {
		return (Integer)getSqlMapClientTemplate().queryForObject("egovOe1ServiceInfoDAO.selectServiceInfoListTot", vo);
	}

}