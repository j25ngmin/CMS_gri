<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<%
  /**
   * @JSP Name : EgovOperImprovReqDetail.jsp
   * @Description : 운영개선요청 상세 화면
   * @Modification Information
   * 
   *   수정일         수정자                   수정내용
   *  -------    --------    ---------------------------
   *  2010.07.20  박수림         최초 생성
   *
   * author 운영환경 1팀
   * since 2010.07.20
   * Copyright (C) 2010 by MOPAS  All right reserved.
   *  
   */  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-language" content="ko">
<title>운영개선요청</title>

<link href="<c:url value='/css/egovframework/oe1/cms/com/common.css'/>" rel="stylesheet" type="text/css" >
<link href="<c:url value='/css/egovframework/oe1/cms/com/themes/ui-lightness/jquery.ui.all.css'/>" rel="stylesheet" type="text/css" >

<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/EgovMainMenu.js' />" language="javascript" ></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/jquery-1.4.2.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/jquery.ui.core.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/jquery.ui.widget.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/jquery.ui.accordion.js'/>"></script>

<script type="text/javascript">
$(function() {
	$("#accordion").accordion({
		collapsible: true
	});	
$("#accordion").css({'background':'#f1f1f1','font-family':'굴림','border':'1px solid #d5d5d5','height':'390px'});	
$(".table_style tr").mouseover(function() {$(this).addClass("over");}).mouseout(function() {$(this).removeClass("over");});

$("div.linkdiv a").click(function(){ 	
	var topurl=$(this).attr("href");
	$('#content').load(topurl);
	});	
			
	$(".image_rollover").mouseover(function(){
	     var temp = $(this).attr("src");
	     var length = temp.length;
	     var file_name = temp.substring(0, length-6);
	     var status = temp.substring(length-6).substring(0,2); //ff
	     var file_type = temp.substring(length-6).substring(3);
	     if (status == "ff") $(this).attr("src", file_name + "n." + file_type);
	}).mouseout(function(){
	     var temp = $(this).attr("src");
	     var length = temp.length;
	     var file_name = temp.substring(0, length-6);
	     var status = temp.substring(length-6).substring(0,2); //on
	     var file_type = temp.substring(length-6).substring(3);
	     if (status == "on") $(this).attr("src", file_name + "off." + file_type);
	});			
});	
</script>

<!--For Commons Validator Client Side-->
<script type="text/javascript" src="<c:url value='/com/validator.do'/>"></script>

<script type="text/javaScript" language="javascript" defer="defer">
<!--
/* 목록 화면 function */
function fn_egov_selectList() {
   	document.detailForm.action = "<c:url value='/cms/srm/gnrl/selectOperImprovReqList.do'/>";
   	document.detailForm.submit();		
}

/* 수정 function */
function fn_egov_updt() {	
	document.detailForm.action = "<c:url value='/cms/srm/gnrl/updateOperImprovReqView.do' />";
	document.detailForm.submit();
    }

/* 삭제 function */
function fn_egov_delete(riskCnt){
	if(riskCnt > 0){
		alert("위험 관련 요청으로 등록되어있어 삭제할 수 없습니다.");
		return false;
	}
    if(confirm('<spring:message code="common.delete.msg" />')){
	   	document.detailForm.action = "<c:url value='/cms/srm/gnrl/deleteOperImprovReq.do'/>";
	   	document.detailForm.submit();	
    }
}

function fn_make_date_format(val){
	if (val.length == 8) {
		var year = val.substring(0,4);
		var month = val.substring(4,6);
		var day = val.substring(6,8);
	}

	var date = year+"-"+month+"-"+day;
	alert(date)
	return date;
}
-->
</script>
</head>
<body>
	<!-- Layer Popup -->
	<div class="modal fade bs-example-modal-lg" id="detail_improv_request" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog  modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">
        <span id="detailTitle"></span></h4>
      </div>
      <div class="modal-body">
       <span id="detailContent"></span>
       <!-- table -->
       <table class="table table-bordered">
      <tbody>
        <tr>
          <th scope="row" class="col-md-3">요청자</th>
          <td class="col-md-3" id="detailFrstRegisterNm"></td>
		  <th scope="row" class="col-md-3">요청일</th>
          <td class="col-md-3" id="detailFrstRegisterPnttm"></td>
        </tr>
       <tr>
          <th scope="row">업무구분</th>
          <td id="detailOperJobSecodeNm"></td>
		  <th scope="row">완료요청일</th>
          <td id="detailComptRequstDe"></td>
        </tr>
        <tr>
          <th scope="row">요청내용</th>
          <td colspan="3" id="detailOperImprvmRequstCn"></td>
        </tr>
         <tr>
          <th scope="row">첨부파일목록</th>
          <td colspan="3" id="detailRqustAtchFiled"></td>
        </tr>
      </tbody>
    </table>
      </div>
		<!-- /table -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <c:if test="${ ! empty (sessionScope.s_mberId) && (sessionScope.s_mberId) != null  }">
        	<c:if test="${ (sessionScope.s_mberId).equals(data.frstRegisterId)}" >
        	<button type="button" class="btn btn-primary">수정</button>
        	 <button type="button" class="btn btn-danger">삭제</button>
        	</c:if>
        	<c:if test="${ (sessionScope.s_authorCode) == 'ROLE_ADMIN' || (sessionScope.s_authorCode) =='ROLE_OPER_CHARGER' }" >
     	   <button type="button" class="btn btn-primary">조치</button>
     	   </c:if>
        </c:if>

<input type="hidden" name="aa" />
       
      </div>
    </div>
  </div>
</div>
	<!-- Layer Popup -->



<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!-- 
  	<div class="subbtn_align">  		
	  	<ul>
	  		<c:if test="${vo.requstSttusCode == '01'&& vo.frstRegisterId == s_mberId}">
			<li class="submit_btn01_left"></li>
			<li><span class="submit_btn01"><input type="submit" name="submit_btn" value="수정" class="submit_btn_input" onclick="fn_egov_updt(); return false;"/></span></li>
			<li class="submit_btn01_right"></li>
  			<li class="btn02_leftbg"></li>
		    <li class="btn02_middlebg"><a href="#LINK" onclick="fn_egov_delete('<c:out value="${vo.tempValue}"/>'); return false;" class="btn_link">삭제</a></li>
			<li class="btn02_rightbg"></li>
			</c:if>
  			<li class="btn02_leftbg"></li>
		    <li class="btn02_middlebg"><a href="<c:url value='/cms/srm/gnrl/selectOperImprovReqList.do'/>" onclick="fn_egov_selectList(); return false;" class="btn_link">목록</a></li>
			<li class="btn02_rightbg"></li>
  		</ul>
  	</div>  
-->

</body>
</html>

