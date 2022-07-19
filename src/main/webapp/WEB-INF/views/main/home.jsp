<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
	integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	referrerpolicy="no-referrer"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<link rel="shortcut icon" type="image/x-icon"
	href="${appRoot }/resources/img/triple.png">
<title>트리플</title>

<%@ include file="/WEB-INF/subModules/font.jsp"%>

<style>
.ba_bg {
	width: 100%;
	height: 100px;
}

.board_bg {
	width: 100%;
	height: 100px;
	background: no-repeat url("${appRoot }/resources/img/main_board.jpg");
	background-position: center;
}

.card_s {
	max-width: 100%;
}

#imgsize {
	max-width: 100%;
	height: 250px;
	padding: 5px;
}

#imgtop {
	max-width: 100%;
	height: 250px;
	padding: 5px;
}

.imgview {
	width: 100%;
	height: 250px;
}

.at {
	font-size: 2.3rem;
	background: linear-gradient(to right, #B8E9FF, #18A8F1);
	color: transparent;
	-webkit-background-clip: text;
}

.st {
	font-size: 2.3rem;
	background: linear-gradient(to right, #B8E9FF, #18A8F1);
	color: transparent;
	-webkit-background-clip: text;
}

.title-content {
	font-size: 3.0rem;
	background: linear-gradient(to right, #B8E9FF, #18A8F1);
	color: transparent;
	-webkit-background-clip: text;
}

.intro-content {
	font-size: 1.5rem;
}

.step-img {
	text-align: center;
}
</style>

</head>

<body>

	<div class="container">
		<my:navBar current="home" />

		<div class=".ba_bg">
			<a href="${appRoot }/member/signup">
				<img src="${appRoot }/resources/img/main-banner.png"
					class="d-block w-100" id="carousel-size">
			</a>
		</div>

		<hr />

		<h1 class="text-center">About Me ?</h1>

		<section class="text-center about-section-1">
			<div class="p-2">
				<h3 class="title-content">나만의 여행 경험을 모두와 공유하다.</h3>
			</div>

			<div class="intro-content">
				<img src="${appRoot }/resources/img/writer.jpg" class="w-50" />
				<br />
				trip for의 발음이 triple(트리플)과 비슷하여 탄생하였습니다 !
				<br />
				트리플은 여러분의 여행 경험을 공유하는 플랫폼입니다.
				<br>
				여러분의 새롭고 다양한 경험을 모두에게 알려주세요.
				<br>
				트리플은 여러분들과 함께 최고의 여행을 준비하겠습니다.
				<br>
			</div>
		</section>

		<hr />

		<div class="col border">
			<div class="text-center">
				<a class="navbar-brand st" href="${appRoot }/board/list">자유게시판</a>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th style="width: 5%">#</th>
						<th style="width: 25%">제목</th>
						<th style="width: 25%">작성자</th>
						<th style="width: 25%">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${boardList }" var="board">
						<tr>
							<td>${board.id }</td>
							<td>
								<c:url value="/board/get" var="getUrl">
									<c:param name="id" value="${board.id }" />
								</c:url>

								<a href="${getUrl }"> ${board.title }</a>
							</td>
							<td>${board.writerNickName }</td>
							<td>${board.prettyInserted }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>


		<br>


		<hr />


		<div class="text-center">
			<h4>트리플로 오는 길 ~</h4>
			<div class="google-map">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.352718627358!2d127.02827121611186!3d37.49959833571472!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca15796fe3091%3A0xaa658b05561b79ab!2z7ISc7Jq47Yq567OE7IucIOqwleuCqOq1rCDsl63sgrzrj5kg7YWM7Zek656A66GcN-q4uCA3!5e0!3m2!1sko!2skr!4v1629262397606!5m2!1sko!2skr"
					width="100%" height="450" style="border: 0;"></iframe>

			</div>
		</div>

		<footer>
			<nb:footer></nb:footer>
		</footer>
	</div>

</body>
</html>