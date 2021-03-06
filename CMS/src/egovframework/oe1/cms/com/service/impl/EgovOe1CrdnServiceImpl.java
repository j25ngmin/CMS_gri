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

import egovframework.oe1.cms.com.service.EgovOe1CrdnService;
import egovframework.oe1.cms.com.service.EgovOe1CrdnVO;
import egovframework.oe1.cms.com.service.EgovOe1PartcpntVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 개발프레임워크와 관련된 유관기관 관리를 위한 ServiceImpl 클래스
 * @author 운영환경1팀 조수정
 * @since 2010.07.20
 * @version 1.0
 * @see <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2010.07.20  조수정          최초 생성
 * 
 * Copyright (C) 2009 by MOPAS  All right reserved.
 * </pre>
 */
@Service("crdnService")
public class EgovOe1CrdnServiceImpl implements EgovOe1CrdnService {

    /**
     * EgovCrdnDAO
     */
    @Resource(name = "crdnDAO")
    private EgovCrdnDAO crdnDAO;

    /** ID Generation */
    @Resource(name = "egovCrdnIdGnrService")
    private EgovIdGnrService crdnIdGnrService;

    /**
     * 입력한 유관기관명 중복여부를 체크하여 사용가능여부를 확인
     * @param crdnsNm
     */
    public int checkCrdnsNm(String crdnsNm) {
    	return crdnDAO.checkCrdnsNm(crdnsNm);
    }
    
    /**
     * 유관기관을 삭제한다.
     * @param crdnVO
     * @return void
     * @exception Exception
     * @param crdnVO
     */
    public void deleteCrdn(EgovOe1CrdnVO crdnVO) throws Exception {
        crdnDAO.deleteCrdn(crdnVO);
    }

    /**
     * 유관기관을 등록한다.
     * @param crdnVO
     * @return String - 등록된 유관기관 id
     * @exception Exception
     * @param CrdnVO
     */
    public String insertCrdn(EgovOe1CrdnVO crdnVO) throws Exception {
        /** ID Generation Service */
        String id = crdnIdGnrService.getNextStringId();

        crdnVO.setCrdnsId(id);

        crdnDAO.insertCrdn(crdnVO);

        return id;
    }

    /**
     * 유관기관을 검색한다.
     * @param crdnVO
     * @return EgovCrdnVO - 검색된 유관기관 정보
     * @exception Exception
     * @param crdnVO
     */
    public EgovOe1CrdnVO selectCrdn(EgovOe1CrdnVO crdnVO) throws Exception {
        EgovOe1CrdnVO resultVO = crdnDAO.selectCrdn(crdnVO);

        return resultVO;
    }

    /**
     * 유관기관 목록을 검색한다.
     * @param searchVO
     * @return List - 검색된 유관기관 목록
     * @exception Exception
     * @param searchVO
     */
    public List selectCrdnList(EgovOe1CrdnVO searchVO) throws Exception {

        return crdnDAO.selectCrdnList(searchVO);
    }

    /**
     * 유관기관 총 갯수를 검색한다.
     * @param searchVO
     * @return int - 검색된 유관기관 총 갯수
     * @exception Exception
     * @param searchVO
     */
    public int selectCrdnListTotCnt(EgovOe1CrdnVO searchVO) throws Exception {
        return crdnDAO.selectCrdnListTotCnt(searchVO);
    }

    /**
     * 유관기관을 수정한다.
     * @param crdnVO
     * @return void
     * @exception Exception
     * @param crdnVO
     */
    public void updateCrdn(EgovOe1CrdnVO crdnVO) throws Exception {
        crdnDAO.updateCrdn(crdnVO);
    }

}
