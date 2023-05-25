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
	background-color:white;
	padding:5px;
}

</style>

<link rel="stylesheet" href="/resource/css/project/list.css" />
<link rel="stylesheet" href="/resource/css/project/phead.css" />
<!-- 예산수립목록.css -->
<link rel="stylesheet" href="/resource/css/budget/list.css" />

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
   			<!-- 예산수립 타이틀 -->
   			<div class="budget_title">
   			<span>예산수립</span>
   			</div>
   			 
   			 <!-- 신규예산서 등록버튼있는 바?부분 -->
   			<div class="budget_head">
   				<button class="budget_head_b">
   				 <i class="fas fa-regular fa-circle-plus"></i>&nbsp;&nbsp;신규 예산서
   				</button>
   			</div>
   			
   			<!-- 리스트가 들어가는 바디부분 or 예산없을떄 아이콘떠야함-->
   			<div>
   			<div class="budget_body" style="display:block;">
   				<!-- 바디 안 리스트(카드 전체부분) -->
   				<div class="card">
   				<!-- 카드 하늘색부분(헤드) -->
   				<div class="card_head">
   					<!-- 상태 or 팀장/팀원에따라서 상태가 나와야함 그럼 if문을 써야할까?  -->	
   					<!-- 팀장한테 보일 부분 -->
   					<div class="card_head_a" >
	   					<div class="head_status text-blue-500"><i class="fas fa-solid fa-circle-pause"></i>&nbsp;진행중</div>
	   					<div class="hidden  head_status text-green-500"><i class="fa-solid fa-circle-check"></i>&nbsp;승인</div>
	   					<div class="hidden  head_status text-red-500"><i class="fa-solid fa-circle-stop"></i>&nbsp;반려</div>
	   				</div>	
	   				
	   				<!-- 팀원한테 보일 부분 -->
	   				<div class="card_head_aa"></div>
   					
   					<div class="card_head_b">
   						<div class="head_title" style="color:#153A66">예산제목이들어가겟쥐</div><%-- ${예산 제목이 들어가겠쥬 } --%>
   					</div>
   					<div class="card_head_c">
	   					<div class="head_reg">2023.05.11&nbsp;12:24&nbsp;등록</div><%-- ${등록시간이 들어가겠쥬 } --%>
	   				</div>
   				</div>
   				
   				<!-- 리스트 하얀부분(바디) -->
   				<div class="card_body">
   					<div class="card_body_a">
						  <table class="table">
						    <tbody class="table_tbody">
						      <!-- row 1 -->
						      <tr style="color:#115db7;">
						        <th>예상 매출액</th>
						        <td>120,000,000 원</td><%-- ${돈이 들어가겟지요 } --%>
						      </tr>
						      <!-- row 2 -->
						      <tr>
						        <th>예상 지출액</th>
						        <td>30,000,000 원 </td>
						      </tr>
						      <!-- row 3 -->
						      <tr>
						        <th>매출이익</th>
						        <td>90,000,000 원</td>
						      </tr>
						      <!-- row 4 -->
						      <tr>
						        <th>이익률</th>
						        <td>75 %</td>
						      </tr>
						    </tbody>
						 </table>				
   					</div>
   				</div>
   				</div>
   			</div>
   			<!-- 예산목록없을떄 아이콘뜨기 -->
   			<div style="display:none;">
   				<div class="budget_body">
	   				<div class="budget_body_icon">
	   					<i class="fas fa-light fa-file-circle-xmark"></i>
	   				</div>
   				</div>
   			</div>
   			
   			</div>
   			
   			
 	
   		<!-- p-main-body끝나는 태그 -->
		</div>   
	<!-- project/phead.jsp (t-body) 화면 끝나는 태그 -->
	</div>
<!-- project/list.jsp 화면끝나는 태그 -->
</div>


	


<%@ include file="../common/foot.jsp" %>