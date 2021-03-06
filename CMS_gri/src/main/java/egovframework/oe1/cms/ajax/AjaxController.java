package egovframework.oe1.cms.ajax;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.oe1.cms.com.service.EgovOe1FileMngUtil;
import egovframework.oe1.cms.com.service.EgovOe1FileVO;
import egovframework.oe1.cms.com.service.impl.EgovOe1CmmUseDAO;
import egovframework.oe1.cms.com.service.impl.EgovOe1FileManageDAO;
import egovframework.oe1.cms.srm.service.EgovOe1OperImprovReqVO;
import egovframework.oe1.cms.srm.service.EgovOe1OperProcessVO;
import egovframework.oe1.cms.srm.service.impl.EgovOe1OperImprovReqDAO;
import egovframework.oe1.cms.sys.service.impl.EgovOe1AuthorGroupDAO;
import egovframework.oe1.cms.sys.service.impl.EgovOe1BBSManageDAO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


@Controller
public class AjaxController {
	
    // EgovOe1BBSManageDAO
    @Resource(name = "BBSManageDAO")
    private EgovOe1BBSManageDAO bbsMngDao;
    
    // EgovOe1OperImprovReqDAO
	@Resource(name="operImprovReqDAO")
	private EgovOe1OperImprovReqDAO operImprovReqDAO;
	
	// EgovOe1OperImprovReqDAO
	// 요청구분코드/긴급처리여부/업무구분 을 갖고 오기 위해.
	@Resource(name="cmmUseDAO")
	private EgovOe1CmmUseDAO cmmUseDAO;
	
	// EgovOe1AuthorGroupDAO
	@Resource(name="egovOe1AuthorGroupDAO")
	private EgovOe1AuthorGroupDAO egovOe1AuthorGroupDAO;
	
	// EgovOe1FileManageDAO
	@Resource(name="FileManageDAO")
	private EgovOe1FileManageDAO FileManageDAO;
	
	/**
	 * IdGeneration
	 */
	@Resource(name="egovOperImprovReqIdGnrService")
	private EgovIdGnrService operImprovReqIdGnrService;
	
    /** EgovFileMngUtil */
    @Resource(name="EgovFileMngUtil")
    private EgovOe1FileMngUtil fileUtil;	

	List<MultipartFile> fileArray = new ArrayList< MultipartFile>();

	/* 선택된 운영개선요청 글과 조치이력을 레이어팝업(모달)로 가져오기. */
	 @RequestMapping(value="/cms/ajax/findOperImprovReqest.do", method=RequestMethod.GET)
	 public @ResponseBody Map<String, Object>findOperImprovReqest(@ModelAttribute("operImprovReqVO") EgovOe1OperImprovReqVO operImprovReqVO)throws Exception  {

		Map<String, Object> map = new HashMap<String, Object>();
		 
		System.out.println("AjaxController - findOperImprovReqest - START!!!");
		System.out.println("findOperImprovReqest::: 받아온 파라메터 : "+operImprovReqVO);

		
		//검색조건
//		model.addAttribute("searchVO", vo);
	
		EgovOe1OperImprovReqVO reqVO = operImprovReqDAO.selectOperImprovReq(operImprovReqVO);
		map.put("reqVO", reqVO);
		System.out.println(reqVO);
		
	
      //조치이력
        EgovOe1OperProcessVO processVO = new EgovOe1OperProcessVO();
        List processList = operImprovReqDAO.selectOperProcessList(operImprovReqVO.getOperImprvmRequstId());
        map.put("processList", processList);
        System.out.println("processList : "+processList);
        
       System.out.println(map);

       System.out.println("AjaxController - findOperImprovReqest - END!!!");
	
       return map;
	}
	 
/*	 @RequestMapping(value="/cms/srm/gnrl/updateOperImprovReq.do")
		public String updateOperImprovReq(
				final MultipartHttpServletRequest multiRequest,
				@ModelAttribute("vo") EgovOe1OperImprovReqVO vo, 
				SessionStatus status)throws Exception  {
	    	//세션확인
	    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
			if(!isAuthenticated){
			     return "forward:/cms/com/EgovOe1LoginUsr.do";  //임시로그온페이지 이동
			}	
			
		    String _atchFileId = vo.getRequstAtchFileId();// 해당 업무기능에 따라서 수정되는 기능의 파일 ID를 불러온다.
		    
		    final Map<String, MultipartFile> files = multiRequest.getFileMap();
		    if(!files.isEmpty()){
	            if("".equals(_atchFileId) || _atchFileId == null){
	                List<EgovOe1FileVO> _result = fileUtil.parseFileInf(files, "", 0, _atchFileId, "");        
	                _atchFileId = fileMngService.insertFileInfs(_result); // 기존에 첨부파일 ID가 없다.
	                vo.setRequstAtchFileId(_atchFileId); // 관련 비즈니스 규칙에 따라서 생성된 첨부파일 ID 정보를 세팅한다.
	            }else{
	            	EgovOe1FileVO fvo = new EgovOe1FileVO();
	                fvo.setAtchFileId(_atchFileId); // 최종 파일 순번을 획득하기 위하여 VO에 현재 첨부파일 ID를 세팅한다.
	                int _cnt = fileMngService.getMaxFileSN(fvo); // 해당 첨부파일 ID에 속하는 최종 파일 순번을 획득한다.
	                List<EgovOe1FileVO> _result = fileUtil.parseFileInf(files, "", _cnt, _atchFileId, "");     
	                fileMngService.updateFileInfs(_result);
	            }
		    }  		
			
			operImprovReqService.updateOperImprovReq(vo);
			return "forward:/cms/srm/gnrl/selectOperImprovReqList.do";
		}*/
	 
	 /* 운영개선요청 수정한 내용을 저장하기. */
	 @RequestMapping(value="/cms/ajax/updateOperImprovReqest.do", method=RequestMethod.POST)
	 public  @ResponseBody void updateOperImprovReqest(@ModelAttribute("operImprovReqVO") EgovOe1OperImprovReqVO operImprovReqVO, EgovOe1OperProcessVO operProcessVO, SessionStatus status)throws Exception  {
		
		 System.out.println("AjaxController - updateSelectOperImprovReqest - START!!!");
	
		 //처리상태(요청코드)값에 따라서 접수일/처리완료일이 변경된다.
		operImprovReqVO.setRceptDt(operImprovReqVO.getRceptDt());
			 
//		우선 보류.
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		
//		if(!isAuthenticated){
//		     return "forward:/cms/com/EgovOe1LoginUsr.do";  //임시로그온페이지 이동
//		}	
		//검색조건
//		model.addAttribute("searchVO", vo);
		
		operImprovReqDAO.updateOperImprovReq(operImprovReqVO);
		
		System.out.println("AjaxController - updateSelectOperImprovReqest  - END!!!");
	}
	 
	/*   @RequestMapping(value="/cms/srm/gnrl/deleteOperImprovReq.do")
		public String deleteOperImprovReq(@ModelAttribute("vo") EgovOe1OperImprovReqVO vo, ModelMap model)throws Exception  {
	    	//세션확인
	    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
			if(!isAuthenticated){
			     return "forward:/cms/com/EgovOe1LoginUsr.do";  //임시로그온페이지 이동
			}
	    	
	    	//파일삭제
	    	if(!vo.getAtchFileId().equals("")){
	        	EgovOe1FileVO fvo = new EgovOe1FileVO();
	            fvo.setAtchFileId(vo.getAtchFileId()); 
	        	fileMngService.deleteAllFileInf(fvo);
	    	}
	    	operImprovReqService.deleteOperImprovReq(vo);
			return "forward:/cms/srm/gnrl/selectOperImprovReqList.do";
	    	
		}*/
	 
	 
	 /* 운영개선요청글 삭제하기. */
	 @RequestMapping(value="/cms/ajax/removeOperImprovReqest.do", method=RequestMethod.POST)
	 public @ResponseBody void removeOperImprovReqest(@ModelAttribute("operImprovReqVO") EgovOe1OperImprovReqVO operImprovReqVO, SessionStatus status)throws Exception  {
		
		 System.out.println("AjaxController - removeOperImprovReqest - START!!!");
		 
    	//세션확인
/*    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated){
		     return "forward:/cms/com/EgovOe1LoginUsr.do";  //임시로그온페이지 이동
		}*/
		
	 	//파일삭제
/*    	if(!vo.getAtchFileId().equals("")){
        	EgovOe1FileVO fvo = new EgovOe1FileVO();
            fvo.setAtchFileId(vo.getAtchFileId()); 
        	fileMngService.deleteAllFileInf(fvo);
    	}*/
    	operImprovReqDAO.deleteOperImprovReq(operImprovReqVO);
    	
		System.out.println("AjaxController - removeOperImprovReqest  - END!!!");
	}
	    
	 /* 운영개선요청글에 조치결과 답글 달기. */
	 @RequestMapping(value="/cms/ajax/addOperProcess.do", method=RequestMethod.POST)
	 public @ResponseBody void  addOperProcess(@ModelAttribute("operImprovReqVO") EgovOe1OperImprovReqVO operImprovReqVO, EgovOe1OperProcessVO operProcessVO, SessionStatus status)throws Exception  {
		
		 System.out.println("AjaxController - addOperProcess - START!!!");
		
		System.out.println("받아온 파라메터 값 BEFORE : "+operImprovReqVO);
		 
//		우선 보류.
		/*Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if(!isAuthenticated){
		     return "forward:/cms/com/EgovOe1LoginUsr.do";  //임시로그온페이지 이동
		}	*/
		
		//검색조건
//		model.addAttribute("searchVO", vo);
		
		//지금 등록한 조치결과 및 5가지 데이터를 요청DB에 저장한다.
		operImprovReqDAO.addOperImprovReqProcess(operImprovReqVO);
	
		//조치내용이 있다면,
		if(operImprovReqVO.getProcessCn() != "") {
			
			//저장된 요청DB에 있는 조치결과 값을 ProcessVO에 setting한다. 
			operProcessVO.setOperProcessCn(operImprovReqVO.getProcessCn());
			operProcessVO.setOperImprvmRequstId(operImprovReqVO.getOperImprvmRequstId());
			operImprovReqDAO.addOperProcess(operProcessVO);
		}
		
		System.out.println("AjaxController - addOperProcess  - END!!!");
	}
	 
/*		
		@RequestMapping(value="/cms/srm/gnrl/insertOperImprovReq.do")
		public String insertOperImprovReq(
				final MultipartHttpServletRequest multiRequest,
				@ModelAttribute("vo") EgovOe1OperImprovReqVO vo, 
				SessionStatus status)throws Exception{
	    	//세션확인
	    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
			if(!isAuthenticated){
			     return "forward:/cms/com/EgovOe1LoginUsr.do";  //임시로그온페이지 이동
			}
			
			*//** 파일 처리 *//*
			 List<EgovOe1FileVO> _result = null;
			 String _atchFileId = "";
			 final Map<String, MultipartFile> files = multiRequest.getFileMap();
			 if(!files.isEmpty()){
				 _result = fileUtil.parseFileInf(files, "", 0, "", "");  
				 _atchFileId = fileMngService.insertFileInfs(_result);  //파일이 생성되고나면 생성된 첨부파일 ID를 리턴한다.
			 }
			 vo.setRequstAtchFileId(_atchFileId);  
			 
			operImprovReqService.insertOperImprovReq(vo);
			status.setComplete();
			return "forward:/cms/srm/gnrl/selectOperImprovReqList.do";
		}   */
	 
	 /* 한번에 다중으로 여러번 파일을 업로드 할 때, 그 파일들을 하나의 List로 쌓기위함. */
	 @RequestMapping(value="/cms/ajax/fileStorage.do")
	    public @ResponseBody void fileStorage(final MultipartHttpServletRequest multiRequest) {
	       
		 System.out.println(" 파일 쌓는 곳. 스타트");
	       final Map<String, MultipartFile> files = multiRequest.getFileMap();
	       System.out.println(files);
	       Iterator<Entry<String, MultipartFile>> itr =  files.entrySet().iterator();

	       while (itr.hasNext()) {
	           Entry<String, MultipartFile> entry = itr.next();
	           fileArray.add(entry.getValue());
	       }
	       
			 System.out.println(" 파일 쌓는 곳. 엔드");

	 }
	 
	 /* 운영개선요청게시판에 게시글 등록하기. */
	 @RequestMapping(value="/cms/ajax/addOperImprovReq.do", method=RequestMethod.POST)
	 public  @ResponseBody void addOperImprovReq(@ModelAttribute("operImprovReqVO") EgovOe1OperImprovReqVO operImprovReqVO, EgovOe1OperProcessVO operProcessVO, SessionStatus status)throws Exception  {
		
		 System.out.println("#. AjaxController - addOperImprovReq.do  - START!!!");
		
		System.out.println("받아온 파라메터(serializeArray)  값  : "+operImprovReqVO);
	/*	//세션확인
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated){
		     return "forward:/cms/com/EgovOe1LoginUsr.do";  //임시로그온페이지 이동
		}
		
		/* 파일처리*/
        List<EgovOe1FileVO> _result = null;
        String _atchFileId = "";
        Map<String, MultipartFile> map = new HashMap<String, MultipartFile>();

        System.out.println("filess : "+fileArray);
        System.out.println("filess size : "+fileArray.size());
        System.out.println("aa  : "+fileArray.get(1) );
        for(int i=0; i<fileArray.size(); i++) {
        	map.put("file_"+i,  fileArray.get(i));
           System.out.println("myMap1 : "+map.get(i));
        }
           System.out.println("myMap2 : "+map);
          _result = fileUtil.parseFileInf(map, "", 0, "", "");  
             
           System.out.println("assq");
           _atchFileId = FileManageDAO.insertFileInfs(_result);  //파일이 생성되고나면 생성된 첨부파일 ID를 리턴한다.
        
           operImprovReqVO.setRequstAtchFileId(_atchFileId);  
           System.out.println("result");
           status.setComplete();
           fileArray.clear();
		 
		/** ID Generation Service */
    	String id = operImprovReqIdGnrService.getNextStringId();
    	operImprovReqVO.setOperImprvmRequstId(id);
    	operImprovReqDAO.insertOperImprovReq(operImprovReqVO);    	
		status.setComplete();
		
		 System.out.println("#. AjaxController - addOperImprovReq.do  - END!!!");

		
	 }
	 
	 /*  운영개선요청을 리스트에서 '처리상태' 콤보박스 값을 변경하기. */
	 @RequestMapping(value="/cms/ajax/updateRequstSttusCode.do", method=RequestMethod.POST)
	 public  @ResponseBody void updateRequstSttusCode(@ModelAttribute("operImprovReqVO") EgovOe1OperImprovReqVO operImprovReqVO)throws Exception  {
		
		 System.out.println("#. AjaxController - updateRequstSttusCode.do  - START!!!");
		 System.out.println("받아온 값 : "+operImprovReqVO);
		
		 //처리상태(요청코드)값에 따라서 접수일/처리완료일이 변경된다.
		EgovOe1OperImprovReqVO reqVO = operImprovReqDAO.selectOperImprovReq(operImprovReqVO);
		System.out.println(reqVO.getRceptDt());
		operImprovReqVO.setRceptDt(reqVO.getRceptDt());
		operImprovReqDAO.updateRequstSttusCode(operImprovReqVO);
		 
		 System.out.println("#. AjaxController - updateRequstSttusCode.do  - END!!!");
	 }
	 
	 /*  조치이력에서 원하는 조치이력을 삭제하기. */
	 @RequestMapping(value="/cms/ajax/removeOperProcess.do", method=RequestMethod.POST)
	 public  @ResponseBody void removeOperProcess(@RequestParam("operProcessId") String operProcessId)throws Exception  {
		
		 System.out.println("#. AjaxController - removeOperProcess.do  - START!!!");
		 System.out.println("받아온 값 : "+operProcessId);
		
		operImprovReqDAO.deleteOperProcess(operProcessId);
		
		 System.out.println("#. AjaxController - removeOperProcess.do  - END!!!");
	 }
	 
}
