<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ attribute name="current"%>


<script>
	$(document).ready(function() {
		//로그아웃 동작 
		$("#logoutlink1").click(function(e) {
			e.preventDefault();
			$("#logoutForm1").submit();
		});
	})
</script>


<c:url value="/board/list" var="listUrl"></c:url>
<c:url value="/board/insert" var="insertUrl"></c:url>
<c:url value="/member/signup" var="signupUrl"></c:url>
<c:url value="/member/list" var="memberListUrl"></c:url>
<c:url value="/member/login" var="loginUrl"></c:url>
<c:url value="/logout" var="logoutUrl"></c:url>
<c:url value="/member/initpw" var="initPasswordUrl"></c:url>

<%-- 회원정보링크 --%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
	<c:url value="/member/get" var="memberInfoUrl">
		<c:param name="id" value="${principal.username }" />
	</c:url>
</sec:authorize>


<nav class="grid navbar navbar-light">
	<div class="navbar-brand">
		<a href="${appRoot}/main/home">
			<img alt="triple-logo" width="150"
				src="${appRoot }/resources/img/triple-logo.png">
		</a>
	</div>

	<!-- 게시판 메뉴 -->
	<div class="g-col-3">
		<ul class="nav justify-content-center">
			<li class="nav-item">
				<a class="nav-link ${current == 'list' ? 'active' : '' }"
					href="${listUrl }">자유게시판</a>
			</li>

			<sec:authorize access="isAuthenticated()">
				<li class="nav-item">
					<a class="nav-link ${current == 'insert' ? 'active' : '' }"
						href="${insertUrl }">글쓰기</a>
				</li>
			</sec:authorize>
		</ul>
	</div>

	<div class="g-col-2">
		<ul class="nav justify-content-center">
			<sec:authorize access="not isAuthenticated()">
				<li class="nav-item">
					<a href="${signupUrl }"
						class="nav-link ${current == 'signup' ? 'active' : '' }">회원가입</a>
				</li>
			</sec:authorize>

			<sec:authorize access="not isAuthenticated()">
				<li class="nav-item">
					<a class="nav-link" href="${loginUrl }">로그인</a>
				</li>
			</sec:authorize>

			<!-- 로그아웃, 마이페이지  -->
			<sec:authorize access="isAuthenticated()">
				<li class="nav-item p-2">
					<sec:authentication property="principal.username" />
					<span style="color: #6d0d27;">님 반갑습니다!</span>
				</li>
				<li class="nav-item">
					<a class="nav-link" herf="#" id="logoutlink1">로그아웃</a>
				</li>
			</sec:authorize>

			<sec:authorize access="isAuthenticated()">
				<li class="nav-item">
					<a href="${memberInfoUrl }"
						class="nav-link ${current == 'memberInfo' ? 'active' : '' }">마이페이지</a>
				</li>
			</sec:authorize>


			<sec:authorize access="hasRole('ADMIN')">
				<li class="nav-item">
					<a href="${memberListUrl }"
						class="nav-link ${current == 'memberList' ? 'active' : '' }">회원목록</a>
				</li>
				<div class="nav-item">
					<a href="${initPasswordUrl }" class="nav-link">암호초기화</a>
				</div>
			</sec:authorize>
		</ul>
	</div>
</nav>

<!-- 로그아웃 -->
<form action="${logoutUrl }" id="logoutForm1" method="post"></form>

<!-- 검색창 -->
<div class="navbar row justify-content-center p-0">
	<div class="form-group col-md-6 text-center m-1">
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
				<button class="btn btn-outline-success">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
			</div>
		</form>
	</div>
</div>

</div>


