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
package egovframework.oe1.cms.com.web;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

/**
 * 페이지 네비게이션 renderer 유틸 클래스
 * @author 운영환경1팀 이중호
 * @since 2010.07.20
 * @version 1.0
 * @see <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2010.07.20  이중호          최초 생성
 * 
 * Copyright (C) 2009 by MOPAS  All right reserved.
 * </pre>
 */
public class EgovImgPaginationRenderer extends AbstractPaginationRenderer {

    /**
     * PaginationRenderer
     * @see 개발프레임웍크 실행환경 개발팀
     */
    public EgovImgPaginationRenderer() {

        firstPageLabel =
            "<a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"><img src=\"/oe1/images/egovframework/oe1/cms/com/icon_page_prevend.gif\" alt=\"처음\"   border=\"0\"/></a>&#160;";
        previousPageLabel =
            "<a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"><img src=\"/oe1/images/egovframework/oe1/cms/com/icon_page_prev.gif\"    alt=\"이전\"   border=\"0\"/></a>&#160;";
        currentPageLabel = "<strong>{0}</strong>&#160;";
        otherPageLabel =
            "<a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">{2}</a>&#160;";
        nextPageLabel =
            "<a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"><img src=\"/oe1/images/egovframework/oe1/cms/com/icon_page_next.gif\"    alt=\"다음\"   border=\"0\"/></a>&#160;";
        lastPageLabel =
            "<a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"><img src=\"/oe1/images/egovframework/oe1/cms/com/icon_page_nextend.gif\" alt=\"마지막\" border=\"0\"/></a>&#160;";

        /*
         * 옛날꺼 //String strWebDir =
         * "/egovframework.guideprogram.basic/images/egovframework/cmmn/"
         * ; // localhost String strWebDir =
         * "/###ARTIFACT_ID###/images/egovframework/cmmn/"
         * ; firstPageLabel =
         * "<a href=\"#\" onclick=\"{0}({1}); return false;\">"
         * + "<image src='" + strWebDir +
         * "btn_page_pre10.gif' border=0/></a>&#160;";
         * previousPageLabel =
         * "<a href=\"#\" onclick=\"{0}({1}); return false;\">"
         * + "<image src='" + strWebDir +
         * "btn_page_pre1.gif' border=0/></a>&#160;";
         * currentPageLabel =
         * "<strong>{0}</strong>&#160;"; otherPageLabel
         * =
         * "<a href=\"#\" onclick=\"{0}({1}); return false;\">{2}</a>&#160;"
         * ; nextPageLabel =
         * "<a href=\"#\" onclick=\"{0}({1}); return false;\">"
         * + "<image src='" + strWebDir +
         * "btn_page_next10.gif' border=0/></a>&#160;";
         * lastPageLabel =
         * "<a href=\"#\" onclick=\"{0}({1}); return false;\">"
         * + "<image src='" + strWebDir +
         * "btn_page_next1.gif' border=0/></a>&#160;";
         */
    }
}
