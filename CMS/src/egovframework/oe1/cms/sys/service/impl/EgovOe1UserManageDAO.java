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
package egovframework.oe1.cms.sys.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.oe1.cms.com.service.EgovOe1ComDefaultVO;
import egovframework.oe1.cms.sys.service.EgovOe1UserManageVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

/**
 * 사용자관리에 대한 DAO 클래스를 정의한다.
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
@Repository("egovOe1UserManageDAO")
public class EgovOe1UserManageDAO extends EgovAbstractDAO {

    /**
     * 입력한 사용자아이디의 중복여부를 체크하여 사용가능여부를 확인
     * @param userManageVO
     */
    public int checkIdDplct(String checkId) {
        return (Integer) getSqlMapClientTemplate().queryForObject(
            "userManageDAO.checkIdDplct_S", checkId);
    }

    /**
     * 사용자의 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
     * @param UserManage
     */
    public String insertUser(EgovOe1UserManageVO userManageVO) {
        return (String) insert("userManageDAO.insertUser_S", userManageVO);
    }

    /**
     * 화면에 조회된 사용자의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를
     * 데이터베이스에 반영
     * @param userManage
     */
    public void updateUser(EgovOe1UserManageVO userManageVO) {
        update("userManageDAO.updateUser_S", userManageVO);
    }

    /**
     * 사용자정보 수정시 히스토리 정보를 추가
     * @param userManageVO
     */
    public String insertUserHistory(EgovOe1UserManageVO userManageVO) {
        return (String) insert("userManageDAO.insertUserHistory_S",
            userManageVO);
    }

    /**
     * 업무사용자 암호수정
     * @param userManageVO
     *        *
     */
    public void updatePassword(EgovOe1UserManageVO passVO) {
        update("userManageDAO.updatePassword_S", passVO);
    }

    /**
     * 화면에 조회된 사용자의 정보를 데이터베이스에서 삭제
     * @param delId
     */
    public void deleteUser(String delId) {
        delete("userManageDAO.deleteUser_S", delId);
    }

    /**
     * 사용자가 기 등록한 아이디를 기억하지 못할 때 찾을 수 있도록 함
     * @param userManageVO
     */
    public String selectId(EgovOe1UserManageVO userManageVO) {
        return "";
    }

    /**
     * 업무사용자가 비밀번호를 기억하지 못할 때 비밀번호를 찾을 수 있도록 함
     * @param uniqId
     */
    public EgovOe1UserManageVO selectPassword(EgovOe1UserManageVO userManageVO) {
        return (EgovOe1UserManageVO) selectByPk(
            "userManageDAO.selectPassword_S", userManageVO);
    }

    /**
     * 기 등록된 사용자 중 검색조건에 맞는 사용자들의 정보를 데이터베이스에서 읽어와 화면에
     * 출력
     * @param userManageVO
     */
    public EgovOe1UserManageVO selectUser(String uniqId) {
        return (EgovOe1UserManageVO) selectByPk("userManageDAO.selectUser_S",
            uniqId);
    }

    /**
     * 사용자 정보 수정을 위한 상세조회 화면 
     * @param userManageVO
     */
    public EgovOe1UserManageVO selectUserForUpdate(String uniqId) {
        return (EgovOe1UserManageVO) selectByPk("userManageDAO.selectUser_U",
            uniqId);
    }

    /**
     * 기 등록된 특정 사용자의 정보를 데이터베이스에서 읽어와 화면에 출력
     * @param UserManageVO
     */
    public List selectUserList(EgovOe1ComDefaultVO userSearchVO) {
        return list("userManageDAO.selectUserList_S", userSearchVO);
    }

    /**
     * 사용자총 갯수를 조회한다.
     * @param userManageVO
     *        - 조회할 정보가 담긴User
     * @return 사용자 총 갯수
     * @exception
     */
    public int selectUserListTotCnt(EgovOe1ComDefaultVO userSearchVO) {
        return (Integer) getSqlMapClientTemplate().queryForObject(
            "userManageDAO.selectUserListTotCnt_S", userSearchVO);
    }

    /**
     * 사용자 엑셀 목록
     * @param : EgovOe1ComDefaultVO
     * @return : List
     * @param EgovOe1ComDefaultVO
     */
    public List selectUserListExcelDown(EgovOe1ComDefaultVO userSearchVO)
            throws Exception {
        return list("userManageDAO.selectUserListExcelDown", userSearchVO);
    }
    
    /**
     * 사용자 연락처정보 조회
     * @param : mberId
     * @return : EgovOe1UserManageVO
     * @param mberId
     */
    public EgovOe1UserManageVO selectUserContact(String mberId) {
        return (EgovOe1UserManageVO) selectByPk("userManageDAO.selectUserContact", mberId);
    }
}
