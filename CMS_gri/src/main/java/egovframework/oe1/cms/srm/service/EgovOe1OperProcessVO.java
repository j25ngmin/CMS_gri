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
package egovframework.oe1.cms.srm.service;

import java.util.Date;
import egovframework.oe1.cms.com.service.EgovOe1ComDefaultVO;

/**
 * 운영개선요청에서 다수의 처리결과의 정보를 담고 있는 VO 클래스
 * @author 정민
 * @since 2016.01.22
 * @version 1.0
 * @see <pre>
 * </pre>
 */
public class EgovOe1OperProcessVO extends EgovOe1ComDefaultVO {
    // private static final long serialVersionUID = 1L;

    private String operProcessId="";						// 조치결과 일련번호
    private String operImprvmRequstId="";			// 운영개선요청 게시글 Id
    private String operProcessCn="";					// 조치결과 내용
    private String operProcessDate="";			// 조치결과 작성한 날짜.
    
	public String getOperProcessId() {
		return operProcessId;
	}
	public String getOperImprvmRequstId() {
		return operImprvmRequstId;
	}
	public String getOperProcessCn() {
		return operProcessCn;
	}
	public String getOperProcessDate() {
		return operProcessDate;
	}
	public void setOperProcessId(String operProcessId) {
		this.operProcessId = operProcessId;
	}
	public void setOperImprvmRequstId(String operImprvmRequstId) {
		this.operImprvmRequstId = operImprvmRequstId;
	}
	public void setOperProcessCn(String operProcessCn) {
		this.operProcessCn = operProcessCn;
	}
	public void setOperProcessDate(String operProcessDate) {
		this.operProcessDate = operProcessDate;
	}
	@Override
	public String toString() {
		return "EgovOe1OperProcessVO [operProcessId=" + operProcessId
				+ ", operImprvmRequstId=" + operImprvmRequstId
				+ ", operProcessCn=" + operProcessCn + ", operProcessDate="
				+ operProcessDate + "]";
	}

    
    
}