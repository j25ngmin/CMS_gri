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
package egovframework.oe1.cms.sim.service;

import java.util.List;

/**
 * 변경작업검토 비즈니스 인터페이스
 * 
 * @author 운영환경1팀 김아름
 * @since 2010.08.06
 * @version 1.0
 * @see
 *
 * <pre>
 *  == 개정이력(Modification Information) ==
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2010.08.06  김아름          최초 생성
 *
 * </pre>
 */ 
public interface EgovOe1ChangeWorkExmntService {
	  /**
	   * 변경 승인 요청 건 목록 
	   * @param EgovOe1ChangeWorkPlanVO
	   * @return List
	   * @exception Exception
	     */
	List<EgovOe1ChangeWorkPlanVO> selectChangeConfmReqList(	EgovOe1ChangeWorkPlanVO searchVO);
	  /**
	   * 변경 승인 요청 건 목록 개수 가져오기
	   * @param EgovOe1ChangeWorkPlanVO
	   * @return int
	   * @exception Exception
	     */
	int selectChangeConfmReqListTotCnt(EgovOe1ChangeWorkPlanVO searchVO);
	  /**
	   * 검토
	   * @param EgovOe1ChangeWorkPlanVO
	   * @return void
	   * @exception Exception
	     */
	void confmChange(EgovOe1ChangeWorkPlanVO changeWorkPlanVO);
	  /**
	   * 검토정보 등록/수정
	   * @param EgovOe1ChangeWorkPlanVO
	   * @return void
	   * @exception Exception
	     */
	void registChangeExmntInfo(EgovOe1ChangeWorkPlanVO changeWorkPlanVO);
	/**
	   * 검토이력정보
	   * @param EgovOe1ChangeWorkPlanVO
	   * @return List
	   * @exception Exception
	     */
	List<EgovOe1ChangeWorkPlanVO> changeWorkExmntInfo(EgovOe1ChangeWorkPlanVO changeWorkPlanVO);
	
}
