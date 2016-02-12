<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd"  var="now"/>

<%
 /**
  * @JSP Name : EgovOperImprovReqList.jsp
  * @Description : 운영개선요청 List 화면
  * @Modification Information
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
<!-- style -->
<link href="<c:url value='/css/egovframework/oe1/cms/com/common.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/oe1/cms/com/themes/ui-lightness/jquery.ui.all.css'/>" rel="stylesheet" type="text/css">
<!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
   
<!-- script -->
<script type="text/javascript" src="<c:url value='/js/calendear.js'/>"></script>
<script type="text/javascript" language="javascript" src="<c:url value='/js/egovframework/oe1/cms/com/EgovMainMenu.js' />" ></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/jquery-1.4.2.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/jquery.ui.core.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/jquery.ui.widget.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/jquery.ui.accordion.js'/>"></script>

<style>

.modiInput {
	border: 0px;
}

</style>

<script>


</script>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>


<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<!-- 선택된 운영개선게시글 조회/수정/삭제/저장 하기.-->
<script src="${pageContext.request.contextPath}/js/egovframework/oe1/cms/srm/EgovOperImprovReqDetail.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">
<!--
/* 조회 화면 function */
function fn_egov_select(id, requstSttusCode) {
	document.listForm.selectedId.value = id;
	if(requstSttusCode == '01' || requstSttusCode == '02') {
	   	document.listForm.action = "<c:url value='/cms/srm/gnrl/selectOperImprovReq.do'/>";
	}else{
	   	document.listForm.action = "<c:url value='/cms/srm/gnrl/selectOperImprovReqEnd.do'/>";
	}
   	document.listForm.submit();

   	/* 상세팝업 띄우기
	var retVal;
	var url = "<c:url value='/cms/srm/selectOperImprovReqPop.do'/>?selectedId="+id;
	var varParam = new Object();
	varParam.selectedId = id;		
	var openParam = "dialogWidth:820px;dialogHeight:520px;scroll:no;status:no;center:yes;resizable:yes;";

	retVal = window.showModalDialog(url, varParam, openParam);

	return retVal;
	*/
	
}

/* 글 등록 화면 function */
function fn_egov_addView() {
	document.listForm.action = "<c:url value='/cms/srm/gnrl/addOperImprovReqView.do'/>";
   	document.listForm.submit();	
}

/* 글 목록 화면 function */
function fn_egov_selectList() {
	document.listForm.pageIndex.value = 1;
	document.listForm.action = "<c:url value='/cms/srm/gnrl/selectOperImprovReqList.do'/>";
   	document.listForm.submit();
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/cms/srm/gnrl/selectOperImprovReqList.do'/>";
   	document.listForm.submit();
}

/* 목록팝업 테스트
function fn_egov_OperImprovReqIds(tempValue){
	//tempValue 결과리턴 형태
    // Y : 'id','id'
    // N : id |id
	var url = "<c:url value='/cms/srm/selectOperImprovReqListPop.do'/>?tempValue="+tempValue;	
	var openParam = "width=800px,height=500px,toolbar=no,location=no,status=no,scrollbar=yes,resizable=no,left=200,top=200";
	window.open(url, "OperImprovReqIds", openParam);
	
}

function fn_egov_OperImprovReqIds_Callback(operImprvmRequstIds){
	document.listForm.operImprvmRequstIds.value=operImprvmRequstIds;
	alert(operImprvmRequstIds);
}*/
-->
</script>

</head>
<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

  	<a href="#top_menu" class="hide_a"></a>  
<!-- 전체 레이어 시작 -->
<div id="wrap">
    <!-- header 시작 -->
    <div id="header"><jsp:include page="/WEB-INF/jsp/egovframework/oe1/cms/com/EgovTop.jsp" /></div>
    <div id="topnavi"><c:import url="/cms/com/EgovOe1BarMenu.do" charEncoding="utf-8"/></div>  
    <!-- //header 끝 -->    

    <!-- 메인 시작 -->
    <div id="container">
        <!-- 좌메뉴 시작 -->
        <%-- <div id="leftmenu"><c:import url="/cms/com/EgovOe1LeftMenu.do" charEncoding="utf-8"/></div> --%>
        <!-- 좌메뉴 끝 -->


<div id="content"><!-- BODY 내용 START -->
<div id="content_pop">
<form:form commandName="vo" id="listForm" name="listForm" method="post" action="oe1/cms/srm/gnrl/selectOperImprovReqList.do" onsubmit="return false;" >
<input type="hidden" name="selectedId" />

	<!-- 타이틀 -->
	<div id="h2_topnav"><h1><strong> 운영개선요청 목록</strong></h1></div>
	<!-- // 타이틀 -->
	<div class="search_area_submit">
		<ul>
			<li><img src="<c:url value='/images/egovframework/oe1/cms/com/img_search01.gif'/>" alt="search" class="searchimg" /></li>
			<li>&nbsp;&nbsp;
					<form:select path="srequstSttusCode" cssClass="use" cssStyle="width:100px;" title="상태" tabindex="1">
					<form:option value="" label="--처리상태--"   />
		           	<c:forEach var="codeinfo" items="${srequstSttusCode}" varStatus="status">
					<form:option value="${codeinfo.code}" label="${codeinfo.codeNm}"   />
				  	</c:forEach>  
		          	</form:select>			
			</li>
			<li>
					<form:select path="soperJobSeCode" cssClass="use" cssStyle="width:100px;" title="업무"  tabindex="2">
					<form:option value="" label="--업무구분--"   />
		           	<c:forEach var="codeinfo" items="${soperJobSeCode}" varStatus="status">
					<form:option value="${codeinfo.code}" label="${codeinfo.codeNm}"   />
				  	</c:forEach>  
		          	</form:select>			
			</li>
			<li>
				<form:select path="searchCondition" cssClass="use" cssStyle="width:100px;" title="검색조건"  tabindex="3">
					<form:option value="0" label="개선요청명" />
					<form:option value="1" label="내용" />
					<form:option value="2" label="요청자" />
				</form:select>
			</li>
			<li>
			<form:input path="searchKeyword" cssClass="input01" cssStyle="width:200px;" maxlength="30" title="검색어"  tabindex="4"/>
			</li>
			<li>				
			    <div class="submit_gray_btn_top">		
				<ul>
					<li class="submit_gray_btn_left"></li>
					<li><span class="submit_gray_btn_middle"><input type="submit" value="검색" onclick="fn_egov_selectList(); return false;" class="submit_btn_input" /></span></li>
					<li class="submit_gray_btn_right"></li>
				</ul>
				</div>	
			</li>
		</ul>	
	</div>
	
	<!-- List -->
	<div id="result_table">
		<table summary="개선요청명,처리상태,업무구분,요청자,요청일,접수일,담당자,처리완료일,만족도입력 목록입니다" class="table_style">
		<caption>운영개선요청 목록   검색 결과</caption>
			<colgroup>
				<col width="30">				
				<col width="200">			
				<col width="100">
				<col width="60">
				<col width="60">			
				<col width="75">
				<col width="75">			
				<col width="75">			
				<col width="50">
			</colgroup>	
			<thead>	  
			<tr>
				<th scope="col" align="center">순번<c:out value="${now}" /></th>
				<th scope="col" align="center">개선요청명</th>
				<th scope="col" align="center">처리상태</th>
				<th scope="col" align="center">업무구분</th>
				<th scope="col" align="center">요청자</th>
				<th scope="col" align="center">요청일</th>
				<th scope="col" align="center">접수일</th>
				<th scope="col" align="center">처리완료일</th>
				<th scope="col" align="center">만족도<br/>입력</th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${empty resultList}">
    			<tr>    
   		  			<td colspan="9">
	    			검색 결과가 없습니다.
  	  				</td>
    			</tr>
    		</c:if>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td align="center"><c:out value="${paginationInfo.totalRecordCount - (vo.pageIndex - 1) * vo.pageSize - status.count + 1}"/></td>
				<td align="left">
	<!-- 		<a href="<c:url value='/cms/srm/gnrl/selectOperImprovReq.do'/>?selectedId=<c:out value="${result.operImprvmRequstId}"/>" onclick="fn_egov_select('<c:out value="${result.operImprvmRequstId}"/>','<c:out value="${result.requstSttusCode}"/>'); return false;" class="board_text_link"><c:out value="${result.operImprvmRequstSj}"/></a> -->
					<a data-toggle="modal" data-target="#detail_improv_request"  onclick="fn_find_oper_improv_req('<c:out value="${result.operImprvmRequstId}"/>')"><c:out value="${result.operImprvmRequstSj}"/></a>
					<c:if test="${result.frstRegisterPnttm == now}">
						<span class="label label-danger">new</span>
					</c:if>
				</td>
				<%-- 
				<select class="modiSelect" name="operJobSeCode" id="detailOperJobSeCode" title="업무구분" tabindex="2">
	          	<option value='' >--선택하세요--</option>
	           	<c:forEach var="codeinfo" items="${operJobSeCode}" varStatus="status">
	            <option value='${codeinfo.code}'>${codeinfo.codeNm}</option>
			  	</c:forEach>  
	          	</select> --%>
				<!-- 처리상태 -->
				<td align="center">
				<select class="modiSelect" name="requstSttusCode" id="ListRequstSttusCode" title="처리상태" tabindex="2" 
				  <c:choose>
				  	<c:when test="${ (sessionScope.s_authorCode) == 'ROLE_ADMIN' || (sessionScope.s_authorCode) =='ROLE_OPER_CHARGER'}">
					  	onChange="fn_update_requstSttusCode('<c:out value="${result.operImprvmRequstId}"/>', this.value)"
				  	</c:when>
				  	<c:otherwise>
								  	disabled
				  	</c:otherwise>
				  </c:choose>>
 					<c:forEach var="codeinfo" items="${requstSttusCode}" varStatus="status">
		         		   <option value="${codeinfo.code}"  <c:if test="${result.requstSttusCode == codeinfo.code}">selected="selected"</c:if>>${codeinfo.codeNm}</option>
 			  			</c:forEach>  
	          	</select>
				</td>
				<!--/처리상태 -->
				<td align="center"><c:out value="${result.operJobSeCodeNm}"/>&nbsp;</td>
				<td align="center"><c:out value="${result.frstRegisterNm}"/>&nbsp;</td>
				<td align="center"><c:out value="${result.frstRegisterPnttm}"/>&nbsp;</td>
				<td align="center">
					<c:choose>
						<c:when test="${not empty result.rceptDt}">
							<c:out value="${result.rceptDt}"/>&nbsp;
							<input type="hidden" name="rceptDt" id="list_rceptDt"  value="${result.rceptDt}"/>
						</c:when>
						<c:otherwise>
							<c:out value="-"/>&nbsp;
						</c:otherwise>
					</c:choose>
				</td>
				<td align="center">
					<c:choose>
						<c:when test="${not empty result.processComptDe}">
							<c:out value="${result.processComptDe}"/>&nbsp;
							<input type="hidden" name="processComptDe" id="processComptDe"  value="${result.processComptDe}"/>
						</c:when>
						<c:otherwise>
							<c:out value="-"/>&nbsp;
						</c:otherwise>
					</c:choose>
				</td>
				<td align="center">
					<c:choose>
						<c:when test="${result.requstSttusCode == '05' || result.requstSttusCode == '06'}">
							<c:choose>
							<c:when test="${not empty result.stsfdg && result.stsfdg != ''}">
								<c:out value="Y"/>&nbsp;
							</c:when>
							<c:otherwise>
								<c:out value="N"/>&nbsp;
							</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<c:out value="-"/>&nbsp;
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	
	<!-- Layer Popup -->
	<div class="modal fade bs-example-modal-lg" id="detail_improv_request" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog  modal-lg" role="document">
    <div class="modal-content" >
      <div class="modal-header">
        <div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">
        <input  type="text"  class="modiInput update" id="detailOperImprvmRequstSj" name="operImprvmRequstSj" value="" readonly />
        </h4>
        </div>
        <div  id="detailOperImprvmRequstSj_check" ></div>
      </div>
       
      <div class="modal-body">
       <span id="detailContent"></span>
       <!-- table -->
       <table class="table table-bordered">
      <tbody>
        <tr>
          <th scope="row" class="col-md-3">요청자</th>
          <td class="col-md-3" id="detailFrstRegisterNm" ></td>
		  <th scope="row" class="col-md-3">요청일자</th>
          <td class="col-md-3" id="detailFrstRegisterPnttm"></td>
        </tr>
       <tr>
          <th scope="row">업무구분</th>
          <td>
          	<div>
         	<select class="modiSelect update" name="operJobSeCode" id="detailOperJobSeCode" title="업무구분" tabindex="2">
	          	<option value='' >--선택하세요--</option>
	           	<c:forEach var="codeinfo" items="${operJobSeCode}" varStatus="status">
	            <option value='${codeinfo.code}'>${codeinfo.codeNm}</option>
			  	</c:forEach>  
	          	</select></div>
	          	<div id="detailOperJobSeCode_check"></div>
	          	
          </td>
		  <th scope="row">완료요청일</th>
          <td><div><input type="text"  class="modiInput update" id="detailComptRequstDe" name="comptRequstDe" value="" ></div>
          			<div id="detailComptRequstDe_check"></div>
          </td>
        </tr>
        <tr>
          <th scope="row">요청내용</th>
          <td colspan="3" height='100'>
      		 <div><input type="text"  class="modiInput update" id="detailOperImprvmRequstCn" name="operImprvmRequstCn" style="width:100%;height:100%;"   readonly></div>
        	<div id="detailOperImprvmRequstCn_check"></div>
        </td>
        </tr>
         <tr>
          <th scope="row">첨부파일목록</th>
         <td colspan="3"><input type="text"  class="modiInput update" id="detailRqustAtchFiled" name="rqustAtchFiled" value="" readonly></td>
        </tr>
         <tr class="no_regist">
	          <th scope="row">요청구분</th>
	         <td>
		     <select class="modiSelect update process" name="requstTyCode" id="detailRequstTyCode"  title="요청구분" tabindex="1">
	          	<option value='' >--선택하세요--</option>
	           	<c:forEach var="codeinfo" items="${requstTyCode}" varStatus="status">
	            <option value='${codeinfo.code}' <c:if test="${vo.requstTyCode == codeinfo.code}">selected="selected"</c:if>>${codeinfo.codeNm}</option>
			  	</c:forEach>  
	          	</select>			
		     </td>
	           <th scope="row">긴급</th>
	           <td>
			      <select class="modiSelect update process" name="emrgncyProcessAt" id="detailEmrgncyProcessAt" title="긴급처리여부" tabindex="2">
		          	<option value='' >--선택하세요--</option>
		           	<c:forEach var="codeinfo" items="${emrgncyProcessAt}" varStatus="status">
		            <option value='${codeinfo.code}' <c:if test="${vo.emrgncyProcessAt == codeinfo.code}">selected="selected"</c:if>>${codeinfo.codeNm}</option>
				  	</c:forEach>  
		          </select>		
	         </td>
        </tr>
         <tr class="no_regist">
	          <th scope="row">담당자</th>
	        <td>
			<select class="modiSelect update process"  name="chargerId" id="detailChargerId" title="담당자" tabindex="3">
	          	<option value='' >--선택하세요--</option>
	           	<c:forEach var="authorUser" items="${authorUser}" varStatus="status">
	            <option value='${authorUser.mberId}' <c:if test="${vo.chargerId == authorUser.mberId}">selected="selected"</c:if>>${authorUser.mberNm} [${authorUser.mberId}]</option>
			  	</c:forEach>  
	          	</select>
	          	<!--  
				<input type="hidden" name="url" value="/oe1/cms/com/EgovOe1AuthorUserPopup.do" />
    			<input type="hidden" name="authorCode" value="ROLE_OPER_CHARGER " />
			    <form:hidden path="chargerId"/>
			    <input type="hidden" name="uniqId" value="" />
			    <form:input path="chargerNm" id="chargerNm" cssStyle="width:150px;" cssClass="inputsmall01_readOnly"  readonly="true" title="담당자명"/>	
			    <c:if test="${vo.requstSttusCode == '01'|| vo.requstSttusCode == '02' }">
			    	<a href="#LINK" onclick="fn_egov_AuthorUser(document.dstbUpdateOIRForm,document.dstbUpdateOIRForm.authorCode); return false;"  class="board_text_link" title="새참">[담당자찾기]</a>
			    </c:if>
			    -->
			</td>
	           <th scope="row">접수일</th>
	       <%--   <td><form:hidden path="rceptDt"/><c:out value="${vo.rceptDt}"/></td> --%>
	       <td id="detailRceptDt">
	       </td>
        </tr>
        <tr class="no_regist">
	          <th scope="row" >처리완료일</th>
	        <td colspan="3" id="detailProcessComptDe">
			</td>
        </tr>
        <tr class="no_regist">
        	<th id="processRow"  scope="row">조치이력</th>
        	<td colspan="3" style="padding:0px;">
        	<div style="width:100%; height:200px; overflow:auto">
        		<table class="table table-bordered" id="processList" style="margin-bottom:0px;">
        		</table>
        	</div>
        	</td>
        </tr>
          <c:if test="${  ! empty sessionScope.s_authorCode && sessionScope.s_authorCode != NULL }" > 
         	 	 <c:if test="${ (sessionScope.s_authorCode) == 'ROLE_ADMIN' || (sessionScope.s_authorCode) =='ROLE_OPER_CHARGER'}" >
          <tr class="no_regist">
          <th scope="row">조치하기</th>
          <td colspan="3">
          	<select class="modiSelect update process" name="requstSttusCode" id="detailRequstSttusCode" title="처리상태" tabindex="2" />', this.value)">
 		  		<c:forEach var="codeinfo" items="${requstSttusCode}" varStatus="status">
		        	<option value="${codeinfo.code}"  <c:if test="${result.requstSttusCode == codeinfo.code}">selected="selected"</c:if>>${codeinfo.codeNm}</option>
		      	</c:forEach>  
	        </select>
			<input type="text"  class="modiInput process" id="detailProcessCn" name="processCn" value=""  readonly> 
  	 		<button type="button" class="btn btn-primary" id="procBtn();"onclick="fn_add_oper_process()">조치</button>
          </td>
        </tr>
         </c:if>
          	 </c:if>
        <!-- 
        <tr>
         <th scope="row">조치결과</th>
            <td colspan="3"><input type="text"  class="modiInput" id="detailReturn" name="detailReturn" value="" readonly></td>
        </tr>
         -->
      </tbody>
    </table>
    <!-- /table -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default " data-dismiss="modal" id="closeBtn">닫기</button>
        <c:if test="${ ! empty (sessionScope.s_mberId) && (sessionScope.s_mberId) != null  }">
			 <button type="button" class="btn btn-primary" id="modiBtn" style="display:none;">수정</button>
			 <!--  글을 등록하기 위한 저장 버튼. -->
			  <button type="button" class="btn btn-primary" id="addSaveBtn" style="display:none;" onclick="fn_add_oper_improv_req();" >a저장</button>
			  <!--  글을 수정하고 저장할 때의 버튼. -->
			 <button type="button" class="btn btn-primary" id="updateSaveBtn" style="display:none;" onclick="fn_update_oper_improv_req();" >u저장</button>
        	 <button type="button" class="btn btn-danger" id="deleteBtn" style="display:none" onclick="fn_remove_oper_improv_req();">삭제</button>
        	 </c:if>
      </div>
    </div>
  </div>
</div>
	<!-- Layer Popup -->
	
	<!-- function fn_buttonShow_by_authorCode_and_sessionId() 를 쓰기 위한 아이 -->
	<input type="hidden" class="modiInput" name="frstRegisterId"  id="deTailFrstRegisterid" value=""/>
	
	<!--  -->
	<input type="hidden" class="modiInput update process" name="operImprvmRequstId" value="${result.operImprvmRequstId}" />

	<!-- JSP에서 알 수 있는 세션 값들을 버튼/수정 UI를 분리하기 위해  fn_buttonShow_by_authorCode_and_sessionId 에서 쓴다.-->
	<input type="hidden" name="s_mberId" id="s_mberId" value="${sessionScope.s_mberId}"/>
	<input type="hidden" name="s_authorCode" id="s_authorCode" value="${sessionScope.s_authorCode}" />
	
	<!-- 글 등록할때 자동으로 요청자가 입력되기 위해 -->
	<input type="hidden" name="s_mberNm" id="s_mberNm" value="${sessionScope.s_mberNm}"/>
		
	<!--  글 등록할 때 요청자가 보이기만 하는데 실제로 값이 넘어가기 위해서 쓴다 -->
	<input type="hidden" name="frstRegisterNm"  value="" />
	
	<!-- 태그가 td라서 값이 박히기만 하는데 그 박힌 값을 컨트롤러에 보내기 위해 인풋 히든을 쓴다. -->
	<input type="hidden" class="modiInput update process"  name="rceptDt"" value="" />
	<input type="hidden" class="modiInput update process"  name="processComptDe" value="" />
	
	<!-- 자바스크립트에서 오늘 날짜를 사용하기위해. -->
	<input type="hidden"  id="today" value="${now}" />
	


	<!-- List -->
	<div id="pagenav_div">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_link_page" /> 
		<form:hidden path="pageIndex" />
	</div>	
  	<div class="subbtn_align">  		
  			<li class="btn02_le`ftbg"></li>
				 <li class="btn02_middlebg"><a data-toggle="modal" data-target="#detail_improv_request"  id="regBtn" class="btn_link"  >등록</a></li>		
			<li class="btn02_rightbg"></li>
  		</ul>
  	</div> 
  	</form>
</form:form>
</div>	
<!-- BODY 내용 END --></div>
<!-- 카피라이트 시작 -->
<div id="footer"><jsp:include page="/WEB-INF/jsp/egovframework/oe1/cms/com/EgovBottom.jsp" /></div>
<!-- //카피라이트 끝 --></div>
<!-- 메인 끝 --></div>
<!-- //전체 DIV끝 -->

</body>
</html>
