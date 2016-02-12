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
package egovframework.oe1.cms.sys.service;

import java.util.Map;


/**
 * 게시판 속성정보를 관리하는 서비스 인터페이스 클래스
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
public interface  EgovOe1BBSMasterService {
	 /**
     * 등록된 게시판 속성정보를 삭제한다.
     * 
     * @param EgovOe1BoardMaster
     */
    public void deleteMaster(EgovOe1BoardMaster boardMaster) throws Exception;

    /**
     * 신규 게시판 속성정보를 생성한다.
     * 
     * @param EgovOe1BoardMaster
     */
    public String insertMaster(EgovOe1BoardMaster boardMaster) throws Exception;

    /**
     * 게시판 속성정보 한 건을 상세조회한다.
     * 
     * @param EgovOe1BoardMasterVO
     */
    public EgovOe1BoardMasterVO selectMaster(EgovOe1BoardMaster searchVO) throws Exception;

    /**
     * 게시판 속성 정보의 목록을 조회 한다.
     * 
     * @param EgovOe1BoardMasterVO
     */
    public Map<String, Object> selectMasterList(EgovOe1BoardMasterVO searchVO) throws Exception;

    /**
     * 게시판 속성정보를 수정한다.
     * 
     * @param EgovOe1BoardMaster
     */
    public void updateMaster(EgovOe1BoardMaster boardMaster) throws Exception;
}
