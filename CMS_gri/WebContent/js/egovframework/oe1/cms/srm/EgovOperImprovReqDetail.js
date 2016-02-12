/**
  * @JavaScript Name : EgovOperImprovReqDetail.js
  * @Description : 운영개선요청 List 에서 원하는 게시글 선택시 나타나는 레이어팝업(모달)창에 대한 JS파일.
  * 
 */

$(document).ready(function() {
	
	$("#modiBtn").click(function(event){
		alert("modiBtn 클릭 시 실행되는 제이쿼리 함수.");
		fn_modify();
	});
	
/*	$("#closeBtn").click(function(event){
		alert("closeBtn 클릭 시 실행되는 제이쿼리 함수.");
		fn_close(true);
	});*/
	
	$("#regBtn").click(function(event){
		alert("regBtn 클릭 시 실행되는 제이쿼리 함수.");
		fn_modify(true);
		$(".no_regist").attr('style', 'display: none');
		
		$("#detailFrstRegisterNm").html($("#s_mberNm").val());
		$("#detailFrstRegisterPnttm").html($("#today").val());
		$('input[name=frstRegisterNm]').attr('value',$("#s_mberNm").val());
		$('input[name=frstRegisterId]').attr('value',$("#s_mberId").val());
		
		//fn_save();
		
	});
	
	$('#detail_improv_request').on('hidden.bs.modal', function () {
		 location.reload();
		});
});

/* 선택된 운영개선요청 글과 조치이력을 레이어팝업(모달)로 가져오기. */
function fn_find_oper_improv_req(operImprvmRequstId) {
	
	var param  = '/CMS_gri/cms/ajax/findOperImprovReqest.do'
	
	console.log(param);
	
	$.ajax ({
		url : param,
		type:'get',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",	
		data:{
			operImprvmRequstId:operImprvmRequstId, 
		},
		success : function(data) {
			
			console.log(data);
		
			$("#detailFrstRegisterNm").html(data.reqVO.frstRegisterNm);
			$("#detailFrstRegisterPnttm").html(data.reqVO.frstRegisterPnttm);
			$('input[id=deTailFrstRegisterid]').attr('value',data.reqVO.frstRegisterId);
			$('input[name=operImprvmRequstId]').attr('value',data.reqVO.operImprvmRequstId);
			$('input[id=detailOperImprvmRequstSj]').attr('value',data.reqVO.operImprvmRequstSj); 
			$('input[id=detailOperJobSecodeNm]').attr('value',data.reqVO.operJobSeCodeNm); 
			$('input[id=detailComptRequstDe]').attr('value',data.reqVO.comptRequstDe); 
			$('input[id=detailOperImprvmRequstCn]').attr('value',data.reqVO.operImprvmRequstCn);
			$('input[id=detailRequstSttusCode]').attr('value',data.reqVO.requstSttusCode);
			
			// 값이 박히기만 할 뿐만아니라 변경도 되야한다.
			$("#detailRceptDt").html(data.reqVO.rceptDt);
			$("#detailProcessComptDe").html(data.reqVO.processComptDe);
			$('input[name=rceptDt]').attr('value',data.reqVO.rceptDt);
			$('input[name=processComptDe]').attr('value',data.reqVO.processComptDe);

			//조치이력 List
			var processList= data.processList;
			var $processList= $('#processList');
			//조치이력 초기화
			$processList.empty();
			//조치이력 List 돌기
			   $.each(processList, function(index, data){
				   $processList.append("<tr><td>"+data.operProcessDate+"<br>"+
						   data.operProcessCn+"</td></tr>");
			   });	

			 var detailOperJobSeCode = document.getElementById("detailOperJobSeCode"); // 셀렉트를 가져옵니다.
			 var detailRequstTyCode = document.getElementById("detailRequstTyCode");
			 var detailEmrgncyProcessAt = document.getElementById("detailEmrgncyProcessAt"); // 셀렉트를 가져옵니다.
			 var detailChargerId = document.getElementById("detailChargerId"); // 셀렉트를 가져옵니다.
			 var detailRequstSttusCode = document.getElementById("detailRequstSttusCode"); // 셀렉트를 가져옵니다.

			//업무구분
					for( var i =0; i<detailOperJobSeCode.length ; i++ ) {
						if(detailOperJobSeCode.options[i].value == data.reqVO.operJobSeCode) {
							detailOperJobSeCode.options[i].selected = 'selected';
							break;
							}
					}
			
			/* 왜 JQuery 는 안될까라는 의문때문에 지우지 않음...
					$.each(detailOperJobSeCode.length, function(index, i){
						console.log("#1-2. forEach로 돌려본 업무구분option : "+$('#detailOperJobSecode').option[i]);
					if($('#detailOperJobSecode').options[i].value == data.reqVO.operJobSeCode) {
						$('#detailOperJobSecode').options[i].selected = 'selected';
						}
					});*/
			   	
				for( var i =0; i<detailRequstTyCode.length ; i++ ) {
					if(detailRequstTyCode.options[i].value == data.reqVO.requstTyCode) {
						detailRequstTyCode.options[i].selected = 'selected';
						break;
						}
				}
	
				for( var i =0; i<detailEmrgncyProcessAt.length ; i++ ) {
					if(detailEmrgncyProcessAt.options[i].value == data.reqVO.emrgncyProcessAt) {
						detailEmrgncyProcessAt.options[i].selected = 'selected';
						break;
						}
				}

				for( var i =0; i<detailChargerId.length ; i++ ) {
					if(detailChargerId.options[i].value == data.reqVO.chargerId) {
						detailChargerId.options[i].selected = 'selected';
						break;
						}
				}

				for( var i =0; i<detailRequstSttusCode.length ; i++ ) {
					if(detailRequstSttusCode.options[i].value == data.reqVO.requstSttusCode) {
						detailRequstSttusCode.options[i].selected = 'selected';
						break;
						}
				}
				
				fn_buttonShow_by_authorCode_and_sessionId();
		},
		
		error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }


	}); /* Ajax function */

}; /* fn_egov_inqire_notice  */


/* 운영개선요청 수정한 내용을 저장하기. */
function fn_update_oper_improv_req() {
	
	
	var operImprvmRequstId = 	$("input[name=operImprvmRequstId]").val();	
	var operImprovReqVO = $(".update").serialize();
	
	var url  = '/CMS_gri/cms/ajax/updateOperImprovReqest.do'
		
	console.log(operImprovReqVO);
	console.log(url);

	alert("어레이 아님 fn_update_oper_improv_req SERIALIZE : "+operImprovReqVO);
	
	$.ajax ({
		url : url ,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		type:'POST',
		data:	operImprovReqVO,
		success : function(responseData) {
			alert(responseData);
		
			if(responseData) {
				alert("modiInputData 수정한 내용 저장 성공^^. "+responseData);
				fn_find_oper_improv_req(operImprvmRequstId)

			}else {
				alert("modiInputData 수정한 내용 저장 실패 ㅠㅠ. " +responseData);
			}
		},
		  error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		
	}); /* Ajax function */
} /* fn_update_oper_improv_req  */

/* 운영개선요청글 삭제하기. */
function fn_remove_oper_improv_req() {
	
	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		
		var url  = '/CMS_gri/cms/ajax/removeOperImprovReqest.do'
			
			var operImprovReqVO = $("input[name=operImprvmRequstId]").serializeArray();

			console.log(url);

			alert("fn_remove_oper_improv_req SERIALIZEARRAY: "+operImprovReqVO);
			
			$.ajax ({
				url : url ,
				contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
				type:'POST',
				data:	operImprovReqVO,
				success : function(responseData) {
				
					if(responseData) {
						alert(responseData);
						
						location.reload();

					}else {
						alert(responseData);
					}
				
				},
				  error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				       }
				
			}); /* Ajax function */
	}else{   //취소
	    return;
	}
	
	
} /* fn_remove_oper_improv_req */

/* 운영개선요청글에 조치결과 답글 달기. */
function fn_add_oper_process() {
	
	var operImprvmRequstId = 	$("input[name=operImprvmRequstId]").val();
	
	var operImprovReqVO = $(".process").serialize();

	var url  = '/CMS_gri/cms/ajax/addOperProcess.do'
		
	alert(operImprovReqVO);
	console.log(url);
	
	$.ajax ({
		url : url ,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		type:'POST',
		data:	
			operImprovReqVO,
		success : function(responseData) {
			alert("조치결과 들어갓다~~");
			fn_find_oper_improv_req(operImprvmRequstId);
			//조치버튼을 눌렀을 때, 조치사항 남기는 input창은(전 기록) 비어져있어야 한다.  
			//$("#detailProcessCn").attr("value", ' ');
		},
		  error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		
	}); /* Ajax function */
} /* fn_add_oper_process */

/* 운영개선요청게시판에 게시글 등록하기. */
function fn_add_oper_improv_req() {

	var operImprovReqVO = $("#listForm").serialize();
	
	var url  = '/CMS_gri/cms/ajax/addOperImprovReq.do'

	console.log(url);

	alert("어레이 아님 !!! fn_add_oper_improv_req SERIALIZE: "+operImprovReqVO);
	
	$.ajax ({
		url : url ,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		type:'POST',
		data:operImprovReqVO,
		success : function(data) {
			alert("운영개선요청 게시글 들어갓다~~");
		},
		  error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		
	}); /* Ajax function */
} /* fn_add_oper_improv_req */

/*  운영개선요청을 리스트에서 '처리상태' 콤보박스 값을 변경하기. */
function fn_update_requstSttusCode(operImprvmRequstId, requstSttusCode) {

	//var url  = '/CMS_gri/cms/ajax/updateRequstSttusCode.do'
	//Request URL:http://localhost:9999/CMS_gri/cms/com/EgovOe1Menu.do?s_url=/cms/srm/gnrl/selectOperImprovReqList.do&s_MenuId=MENU-000000000000249
	//var url  = 'CMS_gri/cms/ajax/updateRequstSttusCode.do'
	//Request URL:http://localhost:9999/CMS_gri/cms/com/EgovOe1Menu.do?s_url=/cms/srm/gnrl/selectOperImprovReqList.do&s_MenuId=MENU-000000000000249
	//var url  = 'cms/ajax/updateRequstSttusCode.do'
	//Request URL:http://localhost:9999/CMS_gri/cms/com/EgovOe1Menu.do?s_url=/cms/srm/gnrl/selectOperImprovReqList.do&s_MenuId=MENU-000000000000249

	var url  = '/CMS_gri/cms/ajax/updateRequstSttusCode.do'

	console.log(url);

	$.ajax ({
		url : url ,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		type:'POST',
		data:{
			operImprvmRequstId:operImprvmRequstId, requstSttusCode:requstSttusCode
		},
		success : function(data) {
			alert("리스트에서 처리상태 값 변경됨. (성공)");
			location.reload();
		},
		  error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
	}); /* Ajax function */
} /* fn_add_oper_improv_req */


function fn_buttonShow_by_authorCode_and_sessionId() {
	var frstRegisterId = $("#deTailFrstRegisterid").attr("value");
	var s_mberId = $("#s_mberId").attr("value");
	var s_authorCode = $("#s_authorCode").attr("value");

	alert("[fn_buttonShow_by_authorCode 1] AJAX에서 값 넣어 가져온 요청자 : "+frstRegisterId);
	alert("[fn_buttonShow_by_authorCode 2] AJAX에서 값 넣어 JSP에서 가져온 요청자= JSP에서 가져온 세션값 : "+frstRegisterId+"="+s_mberId);
	
	if(s_authorCode == 'ROLE_OPER_ADMIN' && frstRegisterId == s_mberId ) {
		console.log("#1  "+s_authorCode);
		fn_view();
		}else if(s_authorCode == 'ROLE_OPER_ADMIN' && frstRegisterId != s_mberId ) {
			console.log("#2  "+s_authorCode);
			fn_initBtn(false);
		}else if( (s_authorCode != 'ROLE_OPER_ADMIN' && frstRegisterId == s_mberId) || (s_authorCode == 'ROLE_ADMIN')  ) {
			console.log("#3  "+s_authorCode);
			 fn_modify(); 
		}else if( s_authorCode == 'ROLE_OPER_CHARGER' && frstRegisterId != s_mberId ) {
			console.log("#4  "+s_authorCode);		
			fn_initBtn(true);
		}
}

/*function fn_close(reload) {
	$('.modiInput').attr('readonly',true);
	$('.modiInput').attr('style','border: 0px');
	if(reload) {
	location.reload();
	}
}*/

function fn_modify(add) {
	$('#deleteBtn').attr('style','display: inline-block');
	$('#modiBtn').attr('style','display: none'); 
	$('.modiInput').attr('readonly',false);
	$('.modiInput').attr('style','border: 1px');
	$('#detailOperImprvmRequstCn').attr('style', 'height: 100%').attr('style', 'width: 100%');
	if(add) {
		$("#addSaveBtn").attr('style','display:  lnline-block');
	}else {
		$('#updateSaveBtn').attr('style','display: inline-block');
	}
}

function fn_view() {
	console.log("??????????????.");
	$('.modiInput').attr('style','border: 0px');
	$('.modiInput').attr('readonly',true);
/*	$('.modiSelect').prop('onFocus','this.initialSelect = this.selectedIndex;');
	$('.modiSelect').prop('onChange', 'this.selectedIndex = this.initialSelect;');*/
	
/*	$('.modiSelect').attr('title1', function(){
		onFocus='this.initialSelect = this.selectedIndex;'
	});
	$('.modiSelect').attr('title2', function(){
		onChange='this.selectedIndex = this.initialSelect';
	});
	title1();
	title2();*/
	
	$('#deleteBtn').attr('style','display: lnline-block'); 
	$('#modiBtn').attr('style','display: lnline-block'); 
	$('#updateSaveBtn').attr('style','display: none');
}

/*function fn_save() {
	var operImprvmRequstId = 	$("input[name=operImprvmRequstId]").val();

	if(operImprvmRequstId == null || operImprvmRequstId.equals('') ){
		initBtn();
		$("#addSaveBtn").attr('style','display:  lnline-block');
	}
}*/

// 조회만 할수있는 상태에서 조치를 남길수있는가 없는가. -> 경기연구원담당자/유지보수담당자 구분
function fn_initBtn(author) {
	$('#deleteBtn').attr('style','display: none');
	$('#modiBtn').attr('style','display: none'); 
	$('#updateSaveBtn').attr('style','display: none'); 
	if(author) {
		$('#detailProcessCn').attr('readonly',false);
	}
}