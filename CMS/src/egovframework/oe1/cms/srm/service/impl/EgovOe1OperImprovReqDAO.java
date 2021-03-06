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
package egovframework.oe1.cms.srm.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import egovframework.oe1.cms.srm.service.EgovOe1OperImprovReqVO;
import egovframework.oe1.cms.srm.service.EgovOe1OperProcessVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;


/**
 * 운영개선요청 기능을 처리하는 DAO 클래스
 * @author 운영환경1팀 박수림
 * @since 2010.08.10
 * @version 1.0
 * @see
 *
 * <pre>
 *  == 개정이력(Modification Information) ==
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2010.08.10  박수림          최초 생성
 *
 * </pre>
 */ 



@Repository("operImprovReqDAO")
public class EgovOe1OperImprovReqDAO extends EgovAbstractDAO {

	public EgovOe1OperImprovReqDAO(){

	}
	
	/**
	 * 운영개선요청을 등록한다.
	 * @param EgovOe1OperImprovReqVO
	 * @return String
	 * @exception Exception
	 */
    public String insertOperImprovReq(EgovOe1OperImprovReqVO vo) throws Exception {
        
    	return (String)insert("operImprovReqDAO.insertOperImprovReq", vo);
    }

    /**
	 * 운영개선요청을 수정한다.
	 * @param EgovOe1OperImprovReqVO
	 * @return void
	 * @exception Exception
	 */
    public void updateOperImprovReq(EgovOe1OperImprovReqVO vo) throws Exception {
        update("operImprovReqDAO.updateOperImprovReq", vo);
    }
    

    /**
	 * 운영개선요청에 있는 조치결과 정보를 조치결과 DB에 저장한다.
	 * (insert와 log를 분리)
	 * @param EgovOe1OperProcessVO
	 * @return void
	 * @exception Exception
	 */
    public void addOperProcess(EgovOe1OperProcessVO vo) throws Exception {
        update("operImprovReqDAO.addOperProcess", vo);
    }

    /**
	 * 운영개선요청에 있는 조치결과를 등록한다.
	 * @param EgovOe1OperImprovReqVO
	 * @return void
	 * @exception Exception
	 */
    public void addOperImprovReqProcess(EgovOe1OperImprovReqVO vo) throws Exception {
        System.out.println("operImprovReqDAO.addOperImprovReqProcess update전 ");
    	update("operImprovReqDAO.addOperImprovReqProcess", vo);
        System.out.println("operImprovReqDAO.addOperImprovReqProcess update후 ");

        
    }
    
    /**
	 * 운영개선요청에 있는 조치이력을 가져온다.
	 * @param operImprvmRequstId
	 * @return List
	 * @exception Exception
	 */
    public List  selectOperProcessList(String operImprvmRequstId) throws Exception {
        return list("operImprovReqDAO.selectOperProcessList", operImprvmRequstId);
    }
    
    /**
	 * 운영개선요청을 리스트에서 '처리상태' 콤보박스 값을 변경한다.
	 * @paramEgovOe1OperImprovReqVO
	 * @return void
	 * @exception Exception
	 */
    public void updateRequstSttusCode(EgovOe1OperImprovReqVO vo) throws Exception {
        delete("operImprovReqDAO.updateRequstSttusCode", vo);
    }

    /**
	 * 운영개선요청을 삭제한다.
	 * @paramEgovOe1OperImprovReqVO
	 * @return void
	 * @exception Exception
	 */
    public void deleteOperImprovReq(EgovOe1OperImprovReqVO vo) throws Exception {
        delete("operImprovReqDAO.deleteOperImprovReq", vo);
    }

    /**
	 * 운영개선요청을 상세조회한다.
	 * @param EgovOe1OperImprovReqVO
	 * @return EgovOe1OperImprovReqVO
	 * @exception Exception
	 */
    public EgovOe1OperImprovReqVO selectOperImprovReq(EgovOe1OperImprovReqVO vo) throws Exception {
        return (EgovOe1OperImprovReqVO) selectByPk("operImprovReqDAO.selectOperImprovReq", vo);
    }

    /**
	 * 운영개선요청 목록을 조회한다.
	 * @param EgovOe1OperImprovReqVO
	 * @return List
	 * @exception Exception
	 */
    public List selectOperImprovReqList(EgovOe1OperImprovReqVO vo) throws Exception {
        return list("operImprovReqDAO.selectOperImprovReqList", vo);
    }

    /**
	 * 운영개선요청 총 갯수를 조회한다.
	 * @param EgovOe1OperImprovReqVO
	 * @return int
	 * @exception
	 */
    public int selectOperImprovReqListTotCnt(EgovOe1OperImprovReqVO vo) {
        return (Integer)getSqlMapClientTemplate().queryForObject("operImprovReqDAO.selectOperImprovReqListTotCnt", vo);
    }

    /**
	 * 변경이관된 개선요청의 상태정보를 수정한다.
	 * @param EgovOe1OperImprovReqVO
	 * @return void
	 * @exception Exception
	 */
    public void updateOperImprovReqTransChange(EgovOe1OperImprovReqVO vo) throws Exception {
        update("operImprovReqDAO.updateOperImprovReqTransChange", vo);
    }    
    
    /**
	 * 운영개선요청 처리만족도를 입력한다.
	 * @param EgovOe1OperImprovReqVO
	 * @return void
	 * @exception Exception
	 */
    public void updateOperImprovReqEnd(EgovOe1OperImprovReqVO vo) throws Exception {
        update("operImprovReqDAO.updateOperImprovReqEnd", vo);
    }

    /**
     * 반려사유를 입력한다.
     * @param EgovOe1OperImprovReqVO
     * @return void
     * @exception Exception
     */
    public void updateOperImprovReqReturn(EgovOe1OperImprovReqVO vo) throws Exception {
    update("operImprovReqDAO.updateOperImprovReqReturn", vo);
}    
}