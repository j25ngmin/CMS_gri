<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
  /**
  * @JSP Name : EgovAccessDenied.jsp
  * @Description : 접근권한 없음
  * @Modification Information
  * 
  *   수정일              수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2010.07.02  이중호                  최초 생성
  *
  * author 운영환경 1팀
  * since  2010.07.02
  * Copyright (C) 2010 by MOPAS  All right reserved.
  *  
  */
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-language" content="ko">
<title>접근권한 없음</title>
</head>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top"><br />
    <br />
    <br />
    <table width="600" border="0" cellpadding="0" cellspacing="0" background="<c:url value='/images/egovframework/oe1/cms/er_images/blue_bg.jpg'/>">
      <tr>
        <td align="center"><table width="100%" border="0" cellspacing="9" cellpadding="0">
          <tr>
            <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><img src="<c:url value='/images/egovframework/oe1/cms/er_images/er_logo.jpg'/>" width="379" height="57" alt="에러화면표시 이미지" /></td>
              </tr>
              <tr>
                <td><br />
                  <br /></td>
              </tr>

              <tr>
                <td align="center"><table width="520" border="0" cellspacing="2" cellpadding="2">
                  <tr>
                    <td width="74" rowspan="2" align="center"><img src="<c:url value='/images/egovframework/oe1/cms/er_images/danger.jpg'/>" width="74" height="74" alt="이미지"/></td>
                    <td width="399" align="left" class="board_title">접근권한 없음</td>
                  </tr>
                  <tr>
                    <td align="left" valign="top" class="board_content">접근정보(권한정보)가 올바르지 않습니다.</td>
                  </tr>
                </table>
        <table width="500" border="0" cellspacing="2" cellpadding="2">
                                  </table></td>
              </tr>
              <tr>
                <td><br />
                  <br /></td>
              </tr>
              <tr>
                <td align="center"><a href="#LINK" onclick="history.back();"><img src="<c:url value='/images/egovframework/oe1/cms/er_images/goback_page.jpg' />" alt="이전화면으로" border="0" /></a></td>
              </tr>
            </table>
              <br /></td>
          </tr>
        </table></td>
      </tr>
    </table>
    <span class="copy">Copyright (c) eGovFramePortal. All rights reserved. </span></td>
  </tr>
</table>
</body>
</html>