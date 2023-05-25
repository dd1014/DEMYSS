<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="unitworkDate" value="${dataMap.unitworkDate}" />

<%@ include file="../common/head.jsp"%>


<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
		integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
		crossorigin="anonymous" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<style>
/* p-main-body 고정 수정X, border만 씌워서 작업!! */
.p-main-body {
	margin-top: 5px;
	width: 100%;
	height: calc(930px - 65px - 63px);
	padding: 2px;
}

/* progress bar */

.complete-con, .inProgress-con, .onHold-con, .expected-con{
border:1px solid #e7e7e7;
}

.complete-con, .onHold-con{
	margin:0 5px 0 5px;
}
.conainer {
  width: 310px; 
  margin:20px;
  height:120px;
  padding-left:40px;
}

.circle_percent {
  font-size:200px; 
  width:.6em; height:.6em; 
  position: relative; 
  background: #eee; 
  border-radius:50%; 
  overflow:hidden; 
  display:inline-block; 

}

.circle_inner {
  position: absolute; 
  left: 0; 
  top: 0; 
  width: .6em; 
  height: .6em; 
  clip:rect(0 .6em .6em .3em);
}



.round_per {
  position: absolute; 
  left: 0; 
  top: 0; 
  width: .6em; 
  height: .6em; 
  background:red;
  clip:rect(0 .6em .6em .3em); 
  transform:rotate(180deg); 
  transition:1.05s;
}

.chart-yellow .round_per, .chart-yellow .percent_more:after {
  background:yellow;
}
.chart-red .round_per, .chart-red .percent_more:after {
  background:reds;
}
.chart-blue .round_per, .chart-blue .percent_more:after {
  background:blue;
}
.chart-green .round_per, .chart-green .percent_more:after {
  background:green;
}


.percent_more .circle_inner {
  clip:rect(0 .3em .6em 0em);
}

.percent_more:after {
  position: absolute; 
  left: .3em; 
  top:0em; 
  background:red;
  right: 0; 
  bottom: 0; 
  content:'';
}

.circle_inbox {
  position: absolute; 
  top: 10px; 
  left: 10px; 
  right: 10px; 
  bottom: 10px; 
  background: #fff; 
  z-index:3; 
  border-radius: 50%;
}

.percent_text {
  position: absolute; 
  font-size: 36px;
  left: 50%; 
  top: 50%; 
  transform: translate(-50%,-50%); 
  z-index: 3;
}

.desc{
 padding-left:30px;
}
.progress-title{
	font-size:2rem;
	padding-bottom:8px;
}

.progress-count, .progress-percent{
	font-size:19px;
}
</style>

<link rel="stylesheet" href="/resource/css/project/list.css" />
<link rel="stylesheet" href="/resource/css/project/phead.css" />

    
<div class="project-part">

		<div class="p-sidbar">
				<div class="p-bt">
						<div class="p-regist">
								<button class="p-rg-bt">
										<i class="fa-regular fa-square-plus"></i>
										프로젝트등록
								</button>
								<div class="p-inend">
										<button class="p-inpro">진행중</button>
										<button class="p-end">완료</button>
								</div>
								<div class="p-check">
										<div style="padding-top: 3px;">
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
								<input type="text" placeholder="검색어를 입력하세요." class="input input-bordered" style="width: 85%;" />
								<i class="fa-solid fa-magnifying-glass"
										style="font-size: 30px; width: 15%; display: flex; align-items: center; justify-content: space-around;"></i>
						</div>

				</div>
				<div class="p-list">
						<c:forEach begin="0" end="4" step="1">
								<div class="p-list-box">
										<div style="border-bottom: 1px solid #797979;">
												<div class="ellipsis p-list-title">
														<span style="color: red; font-size: 20px;">
																<i class="fa-sharp fa-solid fa-flag"></i>
														</span>
														<span>프로젝트제목들어가야함계속길게적는중</span>
												</div>
												<div class="p-list-date">
														<span>2023.05.02 ~ </span>
														<span> 2023.07.02</span>
												</div>
										</div>
										<div class="p-list-box-bottom">
												<span style="font-size: 15px;">(주)오싸거</span>
												<span class="p-list-issu">이슈 3</span>
										</div>
								</div>
						</c:forEach>

						<div class="p-list-pagination"></div>

				</div>

		</div>

		<div class="p-body">
				<div class="p-body-header">
						<div class="p-main-title">
								<div>
										<i class="fa-solid fa-flag ml-6" style="color: red;"></i>
										<span class="p-main-title-sty">정보통신 연구개발사업($프로젝트명)</span>
								</div>
								<div class="p-main-reg-date">등록일 : 2023.05.09</div>
						</div>

						<div class="p-body-header-1">
								<div style="display: flex;">
										<div class="header-1-menu">
												<a href="#">프로젝트</a>
										</div>
										|
										<div class="header-1-menu">
												<a href="#">단위업무</a>
										</div>
										|
										<div class="header-1-menu">
												<a href="#">이슈관리</a>
										</div>
										|
										<div class="header-1-menu">
												<a href="#">예산수립</a>
										</div>
										|
										<div class="header-1-menu">
												<a href="#">회의록</a>
										</div>
										|
										<div class="header-1-menu">
												<a href="#">산출물관리 &nbsp;</a>
										</div>
								</div>
						</div>
				</div>
				<!-- project작업공간 -->
				<div class="p-main-body">
				
				<!-- 총 프로젝트 진행률 시작-->
						<div class="project-con w-full flex row" style="height: 160px;">
								<div class="project-card col-sm" style="background-color: #e6f2fc; width: 20%; height: inherit;">
										<span class="flex" style="padding: 40px 30px; flex-direction: column;">
												<span style="font-size: 24px; color: #4d4d4d;">
														<b>프로젝트 진행률</b>
												</span>
												<span style="font-size: 32px; color: #046fc7;">
														<b>26%</b>
												</span>
										</span>
								</div>
				<!-- 총 프로젝트 진행률 끝-->						


					<!-- 프로젝트 프로그래스바 부분 시작-->
						<!-- 완료 -->
						<div class="complete-con">						
						 <div class="conainer flex chart-green">
						  <div class="circle_percent" data-percent="${UW_PERCENT}" >
						    	<div class="circle_inner">
						        	<div class="round_per round1"></div>
						        </div>
						    </div>  
						   <div>						   
						    <p class="desc progress-title"><b>완료</b></p>
						    <p class="desc progress-count">건수</p>
						    <p class="desc progress-percent">진행률</p>
						   </div>
						</div>
						
						</div>
						<!-- 진행중 -->
						<div class="inProgress-con">						
						 <div class="conainer flex chart-blue"> 
						  <div class="circle_percent" data-percent="${UW_PERCENT}" >
						    	<div class="circle_inner">
						        	<div class="round_per round2"></div>
						        </div>
						    </div>
						     <div>						   
						    <p class="desc progress-title"><b>진행중</b></p>
						    <p class="desc progress-count">건수</p>
						    <p class="desc progress-percent">진행률</p>
						   </div>  
						</div>
						</div>						  
						  
						<!-- 지연 -->
						<div class="onHold-con">						
						 <div class="conainer flex chart-red">
						  <div class="circle_percent" data-percent="${UW_PERCENT}" >
						    	<div class="circle_inner">
						        	<div class="round_per round3"></div>
						        </div>
						    </div> 
						     <div>						   
						    <p class="desc progress-title"><b>지연</b></p>
						    <p class="desc progress-count">건수</p>
						    <p class="desc progress-percent">진행률</p>
						   </div> 
						</div>
						</div>
						
						<!-- 예정 -->
						<div class="expected-con">						
						 <div class="conainer flex chart-yellow">
						  <div class="circle_percent" data-percent="${UW_PERCENT}">
						    	<div class="circle_inner">
						        	<div class="round_per round4"></div>
						        </div>
						    </div> 
						     <div>						   
						    <p class="desc progress-title"><b>예정</b></p>
						    <p class="desc progress-count">건수</p>
						    <p class="desc progress-percent">진행률</p>
						   </div> 
						</div>
						</div>
					<!-- 프로젝트 프로그래스바 부분 끝-->
					
				
				
						<!-- p-main-body끝나는 태그 -->
				</div>
				<!-- project/phead.jsp (t-body) 화면 끝나는 태그 -->
					<!-- 간트차트 부분 시작 -->
					<%@ include file="../project/gantt.jsp"%>
					<!-- 간트차트 부분 끝 -->
		</div>
		<!-- project/list.jsp 화면끝나는 태그 -->
</div>
</div>
<%@ include file="../common/foot.jsp"%>