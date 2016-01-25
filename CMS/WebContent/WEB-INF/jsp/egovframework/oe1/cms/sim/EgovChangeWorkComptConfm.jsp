<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<%
  /**
  * @JSP Name    : EgovChangeWorkComptConfm.jsp
  * @Description : 변경완료검토
  * @Modification Information
  * 
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2010.08.17  김아름          최초 생성
  *
  * author 운영환경 1팀 
  * Copyright (C) 2010 by MOPAS  All right reserved.
  *  
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-language" content="ko">
<title>변경완료검토</title>
<link href="<c:url value='/css/egovframework/oe1/cms/com/common.css'/>"	rel="stylesheet" type="text/css" >
<link	href="<c:url value='/css/egovframework/oe1/cms/com/themes/ui-lightness/jquery.ui.all.css'/>"	rel="stylesheet" type="text/css" >
<script type="text/javascript" language="javascript" src="<c:url value='/js/egovframework/oe1/cms/com/EgovMainMenu.js' />" ></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/EgovMultiFile.js'/>"></script>
<script type="text/javascript"	src="<c:url value='/js/egovframework/oe1/cms/com/jquery-1.4.2.js'/>"></script>
<script type="text/javascript"	src="<c:url value='/js/egovframework/oe1/cms/com/jquery.ui.core.js'/>"></script>
<script type="text/javascript"	src="<c:url value='/js/egovframework/oe1/cms/com/jquery.ui.widget.js'/>"></script>
<script type="text/javascript"	src="<c:url value='/js/egovframework/oe1/cms/com/jquery.ui.accordion.js'/>"></script>
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
<script type="text/javascript" src="<c:url value="/com/validator.do"/>"></script>
<validator:javascript formName="changeWorkComptConfm" staticJavascript="false" xhtml="true" cdata="true"/>
<script type="text/javaScript">
<!--


/* 목록 function */
function fn_egov_back(){
	document.changeWorkPlanVO.pageIndex.value=1;
	document.changeWorkPlanVO.action = "<c:url value='/cms/sim/admin/selectChangeConfmReqList.do'/>";
	document.changeWorkPlanVO.submit();
}

/* 완료검토요청 function */
function fn_confm(){
	if(validateChangeWorkComptConfm(document.changeWorkPlanVO)){ 
		if(confirm("완료검토를 하시겠습니까?")){
			document.changeWorkPlanVO.action = "<c:url value='/cms/sim/admin/confmChangeWork.do'/>";
		   	document.changeWorkPlanVO.submit();	
		}
	}
}

/* 검토이력조회 function */
function fn_egov_select_change_exmnt(changeRequstProcessId){
    window.open('<c:url value='/'/>cms/sim/gnrl/changeWorkComptExmntInfo.do?'
            + 'changeRequstProcessId=' 
            + changeRequstProcessId
            ,'검토이력'
            ,'left=100,top=100,width=800,height=500,menubar=no,toolbar=no,location=no,status=no,resizable=no,scrollbars=1');
}

/* 변경요청서상세 function */
function fn_egov_select_change_request(changeRequestID) {
    window.open('<c:url value='/'/>cms/sim/gnrl/changeRequestDetailPopup.do?'
                + 'changeRequestID=' 
                + changeRequestID
                ,'변경관리'
                ,'left=100,top=100,width=800,height=500,menubar=no,toolbar=no,location=no,status=no,resizable=no,scrollbars=1');
}
//-->
</script>
</head>
<body >
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>	

<div id="wrap">
<!-- 전체 레이어 시작 -->
<!-- header 시작 -->
<div id="header"><jsp:include page="/WEB-INF/jsp/egovframework/oe1/cms/com/EgovTop.jsp" /></div>
<div id="topnavi">
    <c:import url="/cms/com/EgovOe1BarMenu.do" charEncoding="utf-8"/>
</div>  
<!-- //header 끝 -->    

<!-- 메인 시작 -->
<div id="container">
<!-- 좌메뉴 시작 -->
<div id="leftmenu">
    <c:import url="/cms/com/EgovOe1LeftMenu.do" charEncoding="utf-8"/>
</div>
<!-- 좌메뉴 끝 -->

<div id="content"><!-- BODY 내용 START -->

<form:form commandName="changeWorkPlanVO" name="changeWorkPlanVO" action="/oe1/cms/sim/admin/selectChangeConfmReqList.do" enctype="multipart/form-data"  method="post">
<form:hidden path="changeRequstProcessId"/>
<input type="hidden" name="posblAtchFileNumber" value="10" />
<input name="s_mberId"  type="hidden" value="${s_mberId }"/>
<input type="hidden" name="returnUrl" value="<c:url value='/cms/sim/branchChangeWorkPlan.do'/>" />
<c:if test="${changeWorkPlan.atchFileId == '' }"><input type="hidden" name="fileListCnt" value="0" /></c:if>
<input name="changeRequstId"  type="hidden"/>
<input name="code" value="" type="hidden"/>
<input name="id" value="" type="hidden"/>
<input name="requstSysBasisId"  type="hidden" value="${changeWorkPlan.requstSysBasisId}"/> 
<input name="changeRequstSysCode"  type="hidden" value="${changeWorkPlan.changeRequstSysCode}"/>

<div id="content_pop">
<div id="h2_topnav"><h1><strong> 변경작업 완료검토</strong></h1></div>
	
<div id="datail_table2">
<table summary="변경작업 완료검토를 승인합니다.">
<caption>변경작업 완료검토</caption>
	<tr>
		<th style="width:15%" scope="row">변경요청명</th>
		<td  colspan="3" ><a href="#LINK" onclick="fn_egov_select_change_request('${changeWorkPlan.changeRequstId}'); return false;" class="board_text_link" target="_blank"  title="새창"> [변경요청서상세] </a>
          &nbsp;<c:out value="${changeWorkPlan.changeRequstNm}"/> </td>
	</tr>
	<tr>
	    <th  scope="row">처리상태</th>
	    <td ><c:out value="${changeWorkPlan.changeProcessSttusCode}"/></td>
	    <th  scope="row">변경구분</th>
	    <td ><c:out value="${changeWorkPlan.changeSeCode}"/></td>
	</tr>
	<tr>
	    <th   scope="row">담당자 권한위임</th>
	    <td colspan="3">
			<input type="checkbox" name="planT" <c:if test="${changeWorkPlan.planExmntMndtAt eq 'Y' }">checked</c:if> disabled/> 계획검토
	      	<input type="checkbox" name="comptT" <c:if test="${changeWorkPlan.comptExmntMndtAt eq 'Y' }">checked</c:if> disabled/> 변경완료검토
	    </td>
	</tr>
	<tr>
	    <th  scope="row" >계획작업기간 </th>
	    <td> <c:out value="${changeWorkPlan.planBeginDe}"/> ~ <c:out value="${changeWorkPlan.planEndDe}"/></td>
	    <th  scope="row" >변경담당자 </th>
	    <td> <c:out value="${changeWorkPlan.changeOpertorNm}"/></td>
	</tr>
	<tr>
	    <th  scope="row" >작업계획  </th>
	    <td  colspan="3">	${fn:replace(changeWorkPlan.opertPlanCn , crlf , '<br/>')}   </td>
	</tr>
	<tr>
		<th   scope="row">실제작업기간  </th>
    	<td colspan="3" ><c:out value="${changeWorkPlan.realOpertBeginDe}"/> ~ <c:out value="${changeWorkPlan.realOpertEndDe}"/> </td>
	</tr>
    <tr>
	    <th  scope="row" >작업내용   </th>
	    <td  colspan="3">  ${fn:replace(fn:escapeXml(changeWorkPlan.changeOpertCn),crlf,"<br/>")}    </td>
	</tr>
	<tr>
	    <th   scope="row">미해결내용   </th>
	    <td  colspan="3">  ${fn:replace(fn:escapeXml(changeWorkPlan.unsolvCn),crlf,"<br/>")}    </td>
	</tr>
	<tr>
    	<th   scope="row">작업완료   </th>
    	<td>
	  		<c:forEach items="${opertComptAt_result}" var="codeInfo" varStatus="status">
			<c:if test="${changeWorkPlan.opertComptAt eq codeInfo.code}"><c:out value="${codeInfo.codeNm}"/></c:if>
			</c:forEach>
		</td>
        <th  scope="row" >완료검토요청일   </th>
   		<td><c:out value="${changeWorkPlan3.planExmntReqDt} "/>  </td>
	</tr>  
	<tr> 
		<th  scope="row">산출물파일목록</th>
		<td colspan="3">
	  		<c:if test="${not empty changeWorkPlan.atchFileId}">
			<c:import url="/cms/cmm/selectFileInfs.do" charEncoding="utf-8">
			<c:param name="param_atchFileId" value="${changeWorkPlan.atchFileId}" />
			</c:import>
			</c:if>	
		</td>
	</tr> 
	 <tr>
    	<th  scope="row"><label for="comptExmntResultCode"><span class="th_add">완료검토결과</span></label></th>
    	<td colspan="3">
    		<select name="comptExmntResultCode" id="comptExmntResultCode" style="width:130px" title="완료검토결과" tabindex="1">
    		<option value="">--선택하세요--</option>
			<c:forEach items="${planExmntResultCode_result}" var="codeInfo" varStatus="status">
			<option value="${codeInfo.code}" ><c:out value="${codeInfo.codeNm}"/></option>
			</c:forEach>
			</select>
			<c:if test="${changeWorkPlan3.comptExmntResultCode eq null}"> 
			<a href="#LINK" onclick="fn_egov_select_change_exmnt('${changeWorkPlan.changeRequstProcessId}'); return false;" class="board_text_link" target="_blank"  title="새창"> [검토이력조회] </a>
			</c:if>	
		</td>
	</tr>
	<tr>
		<th   scope="row"><label for="comptExmntCn"><span class="th_add">완료검토내용</span></label></th>
		<td colspan="3" ><form:textarea path="comptExmntCn"  id="comptExmntCn" rows="5" cssStyle="width:600px;" cols="10" cssClass="textarea" title="완료검토내용" tabindex="2"/></td>
	</tr>
</table>
</div>
</div>

<!-- 버튼-->
<div class="subbtn_align">  	
<ul >
	<li class="btn02_leftbg"></li>
	<li class="btn02_middlebg"><a href="#LINK" class="btn_link" onclick="fn_confm(); return false;" tabindex="3">완료검토</a></li>
	<li class="btn02_rightbg"></li>
	
	<li class="submit_btn01_left"></li>
    <li><span class="submit_btn01"><input type="submit" name="submit_btn" value="목록" class="submit_btn_input"   onclick="fn_egov_back(); return false;" tabindex="4"/></span></li>
	<li class="submit_btn01_right"></li>
</ul>
</div>

<!-- 검색조건유지 데이터 -->
<input name="changeProcessSttusCode" type="hidden" value="${searchVO.changeProcessSttusCode}" /> 
<input name="emrgncyProcessAt" type="hidden" value="${searchVO.emrgncyProcessAt}" /> 
<input name="searchCondition" type="hidden" value="<c:out value='${searchVO.searchCondition}'/>"/>
<input name="searchKeyword" type="hidden" value="<c:out value='${searchVO.searchKeyword}'/>"/>
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input name="pageSize" type="hidden" value="<c:out value='${searchVO.pageSize}'/>"/>
<input name="fromDate"  type="hidden" value="<c:out value='${searchVO.fromDate}'/>"/>
<input name="toDate" type="hidden" value="<c:out value='${searchVO.toDate}'/>"/> 
</form:form>
</div>

<!-- BODY 내용 END --></div>
<!-- 카피라이트 시작 -->
<div id="footer"><jsp:include 	page="/WEB-INF/jsp/egovframework/oe1/cms/com/EgovBottom.jsp" /></div>
<!-- //카피라이트 끝 -->
<!-- 메인 끝 -->
<!-- //전체 DIV끝 --></div>
</body>
</html>