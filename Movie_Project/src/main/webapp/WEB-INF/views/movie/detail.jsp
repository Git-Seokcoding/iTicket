<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화정보</title>
<%-- 외부 CSS 파일 연결하기 --%>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/movie.css" rel="stylesheet">
<style type="text/css">
.trailer {
	width: 600px;
	text-align: center;
}
</style>
</head>
<body>
	<div id="wrapper">
		<header>
			<jsp:include page="../inc/top.jsp"></jsp:include>
		</header>
						
		<jsp:include page="../inc/menu_nav.jsp"></jsp:include>
		
		<section id="content">
			<h1 id="h01">영화정보</h1>
			
			<hr>
			<section class="detail_container">
				<!-- 포스터, 제목 영역 -->
				<div class="detail_info">
					<div class="detail_poster">
						<img alt="" src=${movie_poster } width="200" height="280">
					</div>	
					<div class="info_title">
						<span class="detail_title">${movie_title }</span>
						<ul>
							<li><span>기본 정보 : </span> ${movie_nation } | ${movie_runtime}분 | ${movie_genre }</li>
							<li><span>개&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;봉 : 	</span> ${movie_release_date } </li>
							<li><span>감&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;독 : </span> ${movie_director }</li>
							<li><span>등&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급 : </span> ${movie_rating }</li>
						</ul>
					</div>
					<div class="detail_reserve_clear">
						<a href="movie_select">
							<input type="button" value="예매하기"></a>
					</div>
				</div>
				<hr>
				<ul class="click_link">
					<li><a href="#movie_story"><input type="button" value="줄거리"></a></li>	
					<li><a href="#movie_trailer"><input type="button" value="트레일러"></a></li>	
					<li><a href="#movie_cut"><input type="button" value="스틸컷"></a></li>	
					<li><a href="#review"><input type="button" value="리뷰"></a></li>	
				</ul>
			    <div class="movie_story" id="movie_story">
			    ${movie_plot }
			    </div>
			    <div class="movie_trailer" id="movie_trailer">
			    	<hr>
			    	<h2>트레일러</h2>
<%-- 				    <embed src="${movie_trailer }" title="YouTube video player"> --%>
<!-- 						<iframe width="560" height="315" src="https://www.kmdb.or.kr/trailer/play/MK060265_P02.mp4"></iframe> -->
<!-- 						<iframe width="560" height="315" src="https://www.kmdb.or.kr/trailer/play/MK060265_P02.mp4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe> -->
<!-- 				    <video id="movie_trailer" src='https://www.kmdb.or.kr/trailer/play/MK060265_P02.mp4' width='880' height="560" controls autoplay muted="muted" controlsList="nodownload"></video> -->
<!-- 				    <embed src=""> -->
				    <video class="trailer" src="${movie_trailer }"  controls autoplay muted></video>
			    </div>
			    <div class="movie_cut" id="movie_cut">
			    	<hr>
			    	<h2>스틸컷</h2>
<!-- 			    	<img alt="" src="https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000087/87596/87596220582_727.jpg" width="600px" height="350px"> -->
						<c:if test="${not empty movie_still1 }"><img src="${movie_still1 }"></c:if>
						<c:if test="${not empty movie_still2 }"><img src="${movie_still2 }"></c:if>
						<c:if test="${not empty movie_still3 }"><img src="${movie_still3 }"></c:if>
			    </div>
			    <div class="review" id="review">
			    	<hr>
			    	<h2>리뷰</h2>
			    	<input type="text" placeholder="리뷰 입력" size="50">
			    	<input type="button" value="등록">
			    	<br>
			    	<table>
			    		<tr>
			    			<td rowspan="6" width="200">
			    				평점이 들어간다면<br>
			    				넣을 자리
			    			</td>
			    			<th>아이디</h>
			    			<td>내용(한두줄 정도로 글자수 제한?)</td>
			    		</tr>
			    		<c:forEach begin="1" end="5">
						   	<tr>
				    			<th>xxxx</th>
				    			<td>재밌어요~~~~~~~~~~~~~~</td>
				    		</tr>
			    		</c:forEach>
			    	</table>
			    </div>
			</section>
		</section>	
		<footer>
			<jsp:include page="../inc/bottom.jsp"></jsp:include>	
		</footer>
	</div>
</body>
</html>