<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../common/head.jsp" %>

<style>
/* p-main-body 고정 수정X, border만 씌워서 작업!! */
.p-main-body{
	margin-top:5px;
	width:100%;
	height: calc(930px - 65px - 63px); 
	/* background-color:#F2F2F2; */
	padding:5px;
}
</style>

<link rel="stylesheet" href="/resource/css/project/list.css" />
<link rel="stylesheet" href="/resource/css/project/phead.css" />
<!-- 요구사항리스트.css -->
<link rel="stylesheet" href="/resource/css/requre/list.css" />

<div class="project-part">

	<div class="p-sidbar">
		<div class="p-bt">
			<div class="p-regist">
				<button class="p-rg-bt">
					<i class="fa-regular fa-square-plus"></i>
					프로젝트등록
				</button>
				<div class="p-inend">
					<button class="p-inpro">진행중 </button>
					<button class="p-end">완료 </button>
				</div>
				<div class="p-check">
					<div style="padding-top:3px;">
					  <label class="cursor-pointer label">
					    <input type="checkbox" checked="checked" class="checkbox checkbox-info" />
					    <span class="label-text">&nbsp;전체 프로젝트</span>
					  </label>
					</div>
					<div class="w-42">
						<select class="select w-full max-w-xs">
						  	<option disabled selected>프로젝트명</option>
						  	<option>프로젝트명</option>
						  	<option>업체명</option>
						</select>
					</div>
				</div>
			</div>
			<div class="p-searchbar">
				<input type="text" placeholder="검색어를 입력하세요." class="input input-bordered" style="width:85%;"/>
				<i class="fa-solid fa-magnifying-glass" style="font-size:30px;width:15%;display:flex;align-items: center;justify-content: space-around;"></i>
			</div>
			
		</div>
		<div class="p-list">
 			<c:forEach begin="0" end="4" step="1" >
			    <div class="p-list-box">
					<div style="border-bottom:1px solid #797979;">
						<div class="ellipsis p-list-title">
							<span style="color:red;font-size:20px;"><i class="fa-sharp fa-solid fa-flag"></i></span>
							<span >프로젝트제목들어가야함계속길게적는중</span>
						</div>
						<div class="p-list-date">
							<span>2023.05.02 ~ </span>
							<span> 2023.07.02</span>
						</div>
					</div>
					<div class="p-list-box-bottom">
						<span style="font-size:15px;">(주)오싸거</span>
						<span class="p-list-issu">이슈 3</span>
					</div>
				</div>
			</c:forEach>
		
			<div class="p-list-pagination">
			
			</div>
			
		</div>
	
	</div>
	 <div class="p-body">
		<div class="p-body-header">
	 	 	<div class="p-main-title">
		     	<div>
		     		<i class="fa-solid fa-flag ml-6" style="color:red;"></i> 
		      		<span class="p-main-title-sty">정보통신 연구개발사업($프로젝트명)</span>
		     	</div>
	   			<div class="p-main-reg-date">등록일 : 2023.05.09</div>
		 	 </div>
		 	 
	      	<div class="p-body-header-1">
			      <div style="display: flex;">
			         <div class="header-1-menu"><a href="#">프로젝트</a></div> |
			         <div class="header-1-menu"><a href="#">단위업무</a></div> |
			         <div class="header-1-menu"><a href="#">이슈관리</a></div> |
			         <div class="header-1-menu"><a href="#">예산수립</a></div> |
			         <div class="header-1-menu"><a href="#">회의록</a></div> |
			         <div class="header-1-menu"><a href="#">산출물관리 &nbsp;</a></div>
			      </div>
	      	</div>
	   </div> 
	   <!-- project작업공간 -->
		<div class="p-main-body">
		
   			<div class="p-body-cont">
   				<div class="header-2-menu0">
	   				<div class="p-body-header-2">
		   				<div style="display:flex;margin-top:5px;height:25px;">
					         |<div class="header-2-menu"><a href="#">프로젝트 정보</a></div> |
					         <div class="header-2-menu"><a href="#">참여인력</a></div> |
					         <div class="header-2-menu"><a href="#">요구사항 관리</a></div> |
					      </div>
		   			</div>
	   			</div>
	   			
	   			<!-- 요구사항 관리 -->
	   			<div>
   					<div class="rq-title">
   						<div>
	   						<span style="font-weight:bold;">총 거래처</span>
	   						<span style="font-weight:bold;color:blue;">3</span>
   						</div>
   						<div>
   							<button id="" class="rq-regi-bt">등록</button>
   						</div>
   					</div>
   					<div class="rq-list">
   						<table>
   							<thead>
   							<tr>
								<th>No.</th>
								<th>중요도</th>
								<th>제목</th>
								<th>첨부파일</th>
								<th>대표 주소</th>
								<th>거래처 담당자</th>
								<th></th>
							</tr>
 							</thead>
 							<tbody style="height: 230px;overflow-y:auto;overflow-x:hidden;">
   							<c:forEach begin="0" end="12" step="1">
							<tr>
								<td>1</td>
								<td>A거래처</td>
								<td>042-342-4432</td>
								<td>042-342-4431</td>
								<td>대전 동구 여긴어디 대전로 102-1번지 어디든가고싶다대전 동구 여긴어디</td>
								<td>김뭥미</td>
								<td>
									<button>
									<i class="fa-solid fa-circle-xmark" style="color:red;font-size:23px;padding-right:5px;"></i>
									</button>
								</td>
							</tr>
   							</c:forEach>
   							</tbody>
   						</table>
   					</div>
	   					
	   			</div>
	   			<!-- 요구사항 끝나는 태그 -->
	   			
	   			
	   			</div>
   			</div>
   
		</div>   
   		<!-- p-main-body끝나는 태그 -->
	</div>
	<!-- project/phead.jsp (t-body) 화면 끝나는 태그 -->
</div>
<!-- project/list.jsp 화면끝나는 태그 -->



<%@ include file="../common/foot.jsp" %>