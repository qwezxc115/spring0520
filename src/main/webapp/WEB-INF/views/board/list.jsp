<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
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

<%@ include file="/WEB-INF/subModules/font.jsp"%>

<title>Insert title here</title>

<style>
.form-control {
	font-size: 1.5rem;
}
</style>
</head>
<body>

	<my:navBar current="list" />

	<!-- 검색창 -->
	<div class="d-flex justify-content-center">
		<div class="d-flex">
			<form action="${listUrl }" class="d-flex">
				<div class="input-group">
					<select name="type" id="" class="form-select"
						style="flex: 0 0 100px;">
						<option value="all"
							${param.type != 'title' && param.type != 'body' ? 'selected' : '' }>전체</option>
						<option value="title" ${param.type == 'title' ? 'selected' : '' }>제목</option>
						<option value="body" ${param.type == 'body' ? 'selected' : ''}>본문</option>
					</select>
					<input type="search" class="form-control" name="keyword" />
					<button class="btn btn-outline-secondary my-2 my-sm-0"
						type="submit">검색</button>
				</div>
			</form>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col">
				<h1>글 목록</h1>
				<c:if test="${not empty message }">
					<div class="alert alert-primary">${message }</div>
				</c:if>

				<table class="table">
					<thead>
						<tr>
							<th>
								<i class="fa-solid fa-hashtag"></i>
							</th>
							<th>제목</th>
							<th>작성자</th>
							<th>
								<i class="fa-solid fa-calendar"></i>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${boardList }" var="board">
							<tr>
								<td>${board.id }</td>
								<td>

									<c:url value="/board/get" var="getUrl">
										<c:param name="id" value="${board.id }"></c:param>
									</c:url>

									<a href="${getUrl }">
										<c:out value="${board.title }" />
									</a>

									<c:if test="${board.hasFile }">
										<span class="badge rounded-pill bg-light text-dark">
											<i class="fa-solid fa-file"></i>
										</span>
									</c:if>

									<c:if test="${board.numOfReply > 0 }">
										<span class="badge rounded-pill bg-light text-dark">
											<i class="fa-solid fa-comment-dots"></i>
											${board.numOfReply }
										</span>
									</c:if>

								</td>
								<td>${board.writerNickName }</td>
								<td>${board.prettyInserted }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>










