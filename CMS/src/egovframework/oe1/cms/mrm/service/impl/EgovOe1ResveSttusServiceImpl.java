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
package egovframework.oe1.cms.mrm.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import egovframework.oe1.cms.mrm.service.EgovOe1ResveSttusVO;
import egovframework.oe1.cms.mrm.service.EgovOe1ResveSttusService;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 개요
 * - 회의실예약현황에 대한 ServiceImpl 클래스를 정의한다.
 * 
 * 상세내용
 * - 회의실예약현황에 대한 조회기능을 제공한다.
 * - 회의실예약현황에 조회기능은 목록조회로 구분된다.
 * @author 운영환경1팀 김민수
 * @since 2009.08.24
 * @version 1.0
 * @see
 *
 * <pre>
 *  == 개정이력(Modification Information) ==
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.08.24  김민수          최초 생성
 *
 * </pre>
 */
@Service("egovOe1ResveSttusService")
public class  EgovOe1ResveSttusServiceImpl extends AbstractServiceImpl implements
EgovOe1ResveSttusService {

	/** EgovOe1ResveSttusDAO */
    @Resource(name="egovOe1ResveSttusDAO")
    private EgovOe1ResveSttusDAO egovOe1ResveSttusDAO;
    
	/**
	 * 회의실예약현황 목록
	 * @param EgovOe1ResveMtgVO - 회의실예약 정보가 담김 VO
	 * @return List
	 * @exception Exception
	 */	    
	public List selectResveSttusList(EgovOe1ResveSttusVO egovOe1ResveSttusVO)  throws Exception {
		return egovOe1ResveSttusDAO.selectResveSttusList(egovOe1ResveSttusVO);
	}
}