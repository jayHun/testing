<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.team10.memberEntity.*"%>
<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>BlockQR - own your secret QR</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Plugin CSS -->
<link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet"
	type="text/css">

<!-- Custom styles for this template -->
<link href="css/freelancer.min.css" rel="stylesheet">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="<c:url value="/js/index.js"/>"></script>
</head>

<body id="page-top">

	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">BlockChain
				& QR code Security</a>
			<button
				class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded"
				type="button" data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fa fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">


					<c:choose>
					 <c:when test="${ empty memberInfo }">

					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="#login">Login</a></li>

					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="#register">Register</a></li>
				
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test ="${ memberInfo.memberType == 'NUR' }">
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
								href="#portfolio">Usage</a></li>
							</c:when>
							<c:when test ="${ memberInfo.memberType == 'QUR' }">
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
								href="#invoice">Invoice</a></li>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
							
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
								>Hello, ${memberInfo.memberName}!</a></li>
								
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
								href="#changeInfo">Info</a></li>
								
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
								href="/t10/com/LogoutMember">LOGOUT</a></li>
					</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>




	<!-- Header -->
	<header class="masthead bg-primary text-white text-center">
		<div class="container">
			<img class="img-fluid mb-5 d-block mx-auto" src="img/blockchain.png"
				alt="" width="600" height="300">
			<h1 class="text-uppercase mb-0">블록체인으로 개인정보 보호하기</h1>
			<hr class="star-light">
			<h2 class="font-weight-light mb-0">주민등록증 - 택배 송장 - 민원 문서</h2>
	
		</div>
	
	</header>
	

	<c:choose>
	<c:when test="${ empty memberInfo }">
	<!-- Login Section -->

	<section class="bg-primary text-white mb-0" id="login">

		<div class="container">
							<img class="col-mb-2 mx-auto" src="img/login.png" alt="" width="150" height="150" style="margin-left: auto; margin-right: auto; display: block;">
		<br/>
			<h2 class="text-center text-uppercase text-white">Login</h2>

			<form id="loginForm" class="form-signin"
				action="<c:url value="/com/LoginMember"/>" method="post">

				<div class="container">

 					
					<br />
					<h2 class="text-center text-uppercase text-secondary mb-0">개인정보 보호를 시작하세요 </h2>
					<br />
					<h3 class="text-center text-uppercase text-secondary mb-0">
					오직 회원만 QR 코드를 생성할 수 있습니다</h3>
					<br />

					<hr class="star-light mb-5">

				</div>

				<div class="form-label-group">
					<div class="col-md-6 mb-3 mx-auto">
						<input type="email" id="inputEmail" name="inputEmail"
							class="form-control" placeholder="Email address" required>
						<label for="inputEmail">사용자 이메일</label>
					</div>
				</div>

				<div class="form-label-group">
					<div class="col-md-6 mb-3 mx-auto">
						<input type="password" id="inputPassword" name="inputPassword"
							class="form-control" placeholder="Password" required> <label
							for="inputPassword">비밀번호</label>
					</div>
				</div>
				<div class="form-label-group">
					<div class="col-md-6 mb-3 mx-auto">
						<button class="btn btn-info btn-lg btn-block" id="btnlogin"
							name="btnlogin" type="submit">Sign in</button>

					</div>

				</div>
			</form>
	</section>
	
	<!-- Register Section -->

	<section class="portfolio" id="register">
	
		<div class="container">
		<h2 class="text-center text-uppercase text-secondary mb-0">회.원.가.입</h2>
        <hr class="star-dark mb-5">
          <div class="col-lg-8 mx-auto">
            <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
            <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
            <form name="sentMessage" id="registerForm" novalidate="novalidate" action="/t10/com/MemberRegister">
              
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>Email Address</label>
                  <input class="form-control" id="inputEmailregister" name="inputEmailregister" type="email" placeholder="Email Address" required="required" 
                  data-validation-required-message="Please enter your email address.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>Password</label>
                  <input class="form-control" id="inputPasswordregister" name="inputPasswordregister" type="text" placeholder="Password" required="required" 
                  data-validation-required-message="Please enter your password.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              
              
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>Name</label>
                  <input class="form-control" id="inputName" name="inputName" type="text" placeholder="Name" required="required" 
                  data-validation-required-message="Please enter your name.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              
              
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>Phone Number</label>
                  <input class="form-control" id="inputNumber" name="inputNumber" type="tel" placeholder="Phone Number" required="required" data-validation-required-message="Please enter your phone number.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              
              
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>Type</label>
                 		<select class="form-group floating-label-form-group controls mb-0 pb-2" id="userType" name="userType"
							required>
							<option value="NONE" class="form-group floating-label-form-group controls mb-0 pb-2">회원 타입 선택</option>
							<option value="NUR" class="form-group floating-label-form-group controls mb-0 pb-2">개인회원</option>
							<option value="QUR" class="form-group floating-label-form-group controls mb-0 pb-2">기업회원</option>
						</select>
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <br>
              <div id="success"></div>
              <div class="form-group">
                <button type="submit" class="btn btn-primary btn-xl" id="sendMessageButton">Send</button>
              </div>
            </form>
          </div>
        </div>
		</section>
	</c:when>
	<c:otherwise>

	<!-- Header -->
	
	<c:choose>
	<c:when test="${ memberInfo.memberType == 'NUR' }">
	<!-- Portfolio Grid Section -->
	<section class="portfolio" id="portfolio">
		<div class="container">
			<h2 class="text-center text-uppercase text-secondary mb-0">정보 보호
				유형</h2>
			<hr class="star-dark mb-5">
			<div class="row">

				<div class="col-md-6 col-lg-4">
					<a class="portfolio-item d-block mx-auto" href="#portfolio-modal-1">
						<div
							class="portfolio-item-caption d-flex position-absolute h-100 w-100">
							<div
								class="portfolio-item-caption-content my-auto w-100 text-center text-white">
								<i class="fa fa-search-plus fa-3x"></i>
							</div>
						</div> <img class="img-fluid" src="img/portfolio/cabin.png" alt="">
					</a>
				</div>

				<div class="col-md-6 col-lg-4">
					<a class="portfolio-item d-block mx-auto" href="#portfolio-modal-2">
						<div
							class="portfolio-item-caption d-flex position-absolute h-100 w-100">
							<div
								class="portfolio-item-caption-content my-auto w-100 text-center text-white">
								<i class="fa fa-search-plus fa-3x"></i>
							</div>
						</div> <img class="img-fluid" src="img/portfolio/cake.png" alt="">
					</a>
				</div>

				<div class="col-md-6 col-lg-4">
					<a class="portfolio-item d-block mx-auto" href="#portfolio-modal-3">
						<div
							class="portfolio-item-caption d-flex position-absolute h-100 w-100">
							<div
								class="portfolio-item-caption-content my-auto w-100 text-center text-white">
								<i class="fa fa-search-plus fa-3x"></i>
							</div>
						</div> <img class="img-fluid" src="img/portfolio/circus.png" alt="">
					</a>
				</div>


			</div>
		</div>

	</section>

	
	</c:when>
	<c:when test="${ memberInfo.memberType == 'QUR' }">

	<!-- Invoice Section -->
	<section class="bg-primary text-white mb-0" id="invoice">
	
	<div class="container">
			<div class="py-5 text-center">
				<!-- <img class="d-block mx-auto mb-4" src="/t10/assets/img/brand_logo.png" alt="" width="350" height="275">
					 -->
				<h1>블록체인 X QR코드 택배 송장 제작</h1>
				<hr class="star-light mb-5">
			</div>

			<div class="row">
				<div class="col-md-8 order-md-1">
					<h4 class="mb-3">보내는 분</h4>

					<form action="/t10/register/registerAccount"
						class="needs-validation" novalidate>
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="senderName">이름</label> <input type="text"
									class="form-control" id="senderName" name="senderName"
									placeholder="보내는분 성함" value="" required>
								<div class="invalid-feedback">보내는분 성함을 입력하세요.</div>
							</div>
						</div>

						<div class="mb-3">
							<label for="senderAddr">주소</label>
							<div class="input-group">
								<input type="text" class="form-control" id="senderAddr"
									name="senderAddr" placeholder="보내는분 주소" required>
								<div class="invalid-feedback" style="width: 100%;">보내는분
									주소를 입력하세요.</div>
							</div>
						</div>

						<div class="mb-3">
							<label for="senderPhone">연락처</label>
							<div class="input-group">
								<input type="text" class="form-control" id="senderPhone"
									name="senderPhone" placeholder="보내는분 연락처" required>
								<div class="invalid-feedback" style="width: 100%;">보내는분
									연락처를 입력하세요.</div>
							</div>
						</div>

						<hr class="mb-4">

						<h4 class="mb-3">받는 분</h4>
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="receiverName">이름</label> <input type="text"
									class="form-control" id="receiverName" name="receiverName"
									placeholder="받는분 성함" value="" required>
								<div class="invalid-feedback">받는분 성함을 입력하세요.</div>
							</div>
						</div>

						<div class="mb-3">
							<label for="receiverAddr">주소</label>
							<div class="input-group">
								<input type="text" class="form-control" id="receiverAddr"
									name="receiverAddr" placeholder="받는분 주소" required>
								<div class="invalid-feedback" style="width: 100%;">받는분 주소를
									입력하세요.</div>
							</div>
						</div>

						<div class="mb-3">
							<label for="receiverPhone">연락처</label>
							<div class="input-group">
								<input type="text" class="form-control" id="receiverPhone"
									name="receiverPhone" placeholder="받는분 연락처" required>
								<div class="invalid-feedback" style="width: 100%;">받는분
									연락처를 입력하세요.</div>
							</div>
						</div>

						<hr class="mb-4">
						<h4 class="mb-3">물품 정보</h4>
						<div class="mb-3">
							<label for="type">물품 타입</label>
							<div class="input-group">
								<select class="custom-select d-block w-100" id="type"
									name="type" required>
									<option value="NONE">선택</option>
									<option value="의류">의류</option>
									<option value="가전">가전</option>
									<option value="음식">음식</option>
									<option value="기타">기타</option>
								</select>
								<div class="invalid-feedback">물품 타입을 선택하세요.</div>
							</div>
						</div>

						<div class="mb-3">
							<label for="price">물품 가격</label>
							<div class="input-group">
								<input type="text" class="form-control" id="price" name="price"
									placeholder="가격" required>
								<div class="invalid-feedback" style="width: 100%;">물품 가격을
									입력하세요.</div>
							</div>
						</div>

						<hr class="mb-4">

						<button class="btn btn-danger" type="submit">QR 송장 발급</button>
					</form>
				</div>
			</div>
		</div>

		<!-- Bootstrap core JavaScript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>
		<script>
		window.jQuery
				|| document
						.write(
								'<script src="/t10/assets/js/jquery-slim.min.js"><\/script>')
	</script>
		<script src="/t10/assets/js/popper.min.js"></script>
		<script src="/t10/assets/js/bootstrap.min.js"></script>
		<script src="/t10/assets/js/holder.min.js"></script>
		<script>
		// Example starter JavaScript for disabling form submissions if there are invalid fields
						(
								function() {
									'use strict';

									window
											.addEventListener(
													'load',
													function() {
														// Fetch all the forms we want to apply custom Bootstrap validation styles to
														var forms = document
																.getElementsByClassName('needs-validation');

														// Loop over them and prevent submission
														var validation = Array.prototype.filter
																.call(
																		forms,
																		function(
																				form) {
																			form
																					.addEventListener(
																							'submit',
																							function(
																									event) {
																								if (form
																										.checkValidity() === false) {
																									event
																											.preventDefault();
																									event
																											.stopPropagation();
																								}
																								form.classList
																										.add('was-validated');
																							},
																							false);
																		});
													}, false);
								})();
	</script>


	</section>
	</c:when>
	<c:otherwise></c:otherwise>
	</c:choose>


<!-- Info Section -->
	<section class="portfolio" id="changeInfo">
	
		<div class="container">
		<h2 class="text-center text-uppercase text-secondary mb-0">회원정보 수정</h2>
        <hr class="star-dark mb-5">
          <div class="col-lg-8 mx-auto">
            <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
            <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
          
            <form id="updateForm" name="updateForm"	action="<c:url value="/com/MemberUpdate"/>" method="post">
              
              <input type="hidden" value="" id="flag" name="flag"/>
              
              <div class="control-group">
                
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                 
                  <label>Email Address</label>
                  <input class="form-control" id="inputEmailChange" name="inputEmailChange" type="email" placeholder="Email Address" required="required" 
                  data-validation-required-message="Please enter your email address." readonly="readonly" value="${memberInfo.memberEmail}">
                  <p class="help-block text-danger" ></p>
                </div>
              </div>
              
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>Password</label>
                  <input class="form-control" id="inputPasswordChange" name="inputPasswordChange" type="password" placeholder="Password" required="required" 
                  data-validation-required-message="Please enter your password." value="${memberInfo.memberPw}">
                  <p class="help-block text-danger"  ></p>
                </div>
              </div>
              
              
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>Name</label>
                  <input class="form-control" id="inputNameChange" name="inputNameChange" type="text" placeholder="Name" required="required" 
                  data-validation-required-message="Please enter your name." value="${memberInfo.memberName}">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              
              
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>Phone Number</label>
                  <input class="form-control" id="inputNumberChange" name="inputNumberChange" type="tel" placeholder="Phone Number" required="required" 
                  data-validation-required-message="Please enter your phone number." value="${memberInfo.memberPhone}">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              
              
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>Type</label>
                 		<select class="form-group floating-label-form-group controls mb-0 pb-2" id="userTypeChange" name="userTypeChange"
							required>
							<option value="NONE" class="form-group floating-label-form-group controls mb-0 pb-2">
							회원 타입 선택</option>
							<option value="NUR" class="form-group floating-label-form-group controls mb-0 pb-2"
							<c:if test="${ memberInfo.memberType=='NUR'}"> selected="selected" </c:if>>
							개인회원</option>
							<option value="QUR" class="form-group floating-label-form-group controls mb-0 pb-2"
							<c:if test="${ memberInfo.memberType=='QUR'}"> selected="selected" </c:if>>
							기업회원</option>
						</select>
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <br>
              <div id="success"></div>
              <div class="form-group">
                <button class="btn btn-primary" type="submit" id="btnUpdate" name="btnUpdate">
						변경 후 저장</button>
							
				<button class="btn btn-danger" type="submit" id="btnDelete"	name="btnDelete">
						회원 삭제</button>
              </div>
            </form>
          </div>
        </div>
		</section>
		
	
	</c:otherwise>
	</c:choose>

	<!-- Footer -->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Location</h4>
					<p class="lead mb-0">
						[07795] 서울시 강서구 마곡중앙8로 71 <br>LG사이언스파크 E13
					</p>
				</div>
				<div class="col-md-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Around the Web</h4>
					<ul class="list-inline mb-0">
						<li class="list-inline-item"><a
							class="btn btn-outline-light btn-social text-center rounded-circle"
							href="#"> <i class="fa fa-fw fa-facebook"></i>
						</a></li>
						<li class="list-inline-item"><a
							class="btn btn-outline-light btn-social text-center rounded-circle"
							href="#"> <i class="fa fa-fw fa-google-plus"></i>
						</a></li>
						<li class="list-inline-item"><a
							class="btn btn-outline-light btn-social text-center rounded-circle"
							href="#"> <i class="fa fa-fw fa-twitter"></i>
						</a></li>
						<li class="list-inline-item"><a
							class="btn btn-outline-light btn-social text-center rounded-circle"
							href="#"> <i class="fa fa-fw fa-linkedin"></i>
						</a></li>
						<li class="list-inline-item"><a
							class="btn btn-outline-light btn-social text-center rounded-circle"
							href="#"> <i class="fa fa-fw fa-dribbble"></i>
						</a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<h4 class="text-uppercase mb-4">About BlockQR</h4>
					<p class="lead mb-0">
						BlockQR is the high-technical method created by Team10 to keep
						your confidential information</a>.
					</p>
				</div>
			</div>
		</div>
	</footer>

	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Your Website 2018</small>
		</div>
	</div>

	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	<div class="scroll-to-top d-lg-none position-fixed ">
		<a class="js-scroll-trigger d-block text-center text-white rounded"
			href="#page-top"> <i class="fa fa-chevron-up"></i>
		</a>
	</div>

	<!-- Portfolio Modals -->

	<!-- Portfolio Modal 1 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-1">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">개인 데이터</h2>
						<hr class="star-dark mb-5">

						<c:set var = "medcnt" value="0" />	

						<c:forEach items="${qrcodeList }" var="qrcode">
							<c:if test="${qrcode.qrcodeType == 'MED' }">
								<a href="/t10/auth/authPage?infoType=MED&addr=${memberInfo.memberWallet }">
									<img class="img-fluid mb-5" src="/t10/qrcode/${qrcode.imgFileName }" alt="">
								</a>
								<h3 class="text-center text-uppercase text-secondary mb-0">${qrcode.memberEmail }님의 신분정보</h3>
								<c:set var="medcnt" value="${medcnt + 1}" />
							</c:if>
						</c:forEach>
						<br/>
						
						<c:if test="${medcnt < 1}">
							<img class="img-fluid mb-5" src="img/portfolio/cabin.png" alt="">
								<h3 class="text-center text-uppercase text-secondary mb-0">당신의
									개인 정보를 지금 보호하세요.</h3>
							<p class="mb-5"></p>			
							<a class="btn btn-primary btn-lg rounded-pill "
								href="/t10/com/QrMake?infoType=MED&memberEmail=${memberInfo.memberEmail}">
								<i class=""></i> Create QR
							</a>
						</c:if>
					
						<a
							class="btn btn-danger btn-lg rounded-pill portfolio-modal-dismiss"
							href="#"> <i class="fa fa-close"></i> Close Project
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Portfolio Modal 2 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-2">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">공공 데이터</h2>
						<hr class="star-dark mb-5">

						<c:set var = "pricnt" value="0" />	

						<c:forEach items="${qrcodeList }" var="qrcode">
							<c:if test="${qrcode.qrcodeType == 'PRI' }">
								<a href="/t10/auth/authPage?infoType=PRI&addr=${memberInfo.memberWallet }">
									<img class="img-fluid mb-5" src="/t10/qrcode/${qrcode.imgFileName }" alt="">
								</a>
								<h3 class="text-center text-uppercase text-secondary mb-0">${qrcode.memberEmail }님의 주민등록초본정보</h3>
								<c:set var="pricnt" value="${pricnt + 1}" />
							</c:if>
						</c:forEach>
						<br/>
						
						<c:if test="${pricnt < 1 }">
							<img class="img-fluid mb-5" src="img/portfolio/cake.png" alt="">
								<h3 class="text-center text-uppercase text-secondary mb-0">당신의
									공공 정보를 지금 보호하세요.</h3>
						
							<p class="mb-5"></p>
							<a class="btn btn-primary btn-lg rounded-pill"
								href="/t10/com/QrMake?infoType=PRI&memberEmail=${memberInfo.memberEmail}">
								<i class=""></i> Create QR
							</a>
						</c:if>
						
						<a
							class="btn btn-danger btn-lg rounded-pill portfolio-modal-dismiss"
							href="#"> <i class="fa fa-close"></i> Close Project
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Portfolio Modal 3 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-3">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">택배 데이터</h2>
						<hr class="star-dark mb-5">

						<c:set var = "delcnt" value="0" />
							
						<c:forEach items="${qrcodeList }" var="qrcode">
							<c:if test="${qrcode.qrcodeType == 'DEL' }">
								<a href="/t10/auth/authPage?infoType=DEL&addr=${memberInfo.memberWallet }">
									<img class="img-fluid mb-5" src="/t10/qrcode/${qrcode.imgFileName }" alt="">
								</a>
									<h3 class="text-center text-uppercase text-secondary mb-0">${qrcode.memberEmail }님의 송장정보</h3>
									<c:set var="delcnt" value="${delcnt + 1}" /> 
							</c:if>
						</c:forEach>
						<br/>
						
						<c:if test="${delcnt < 1 }">
							<img class="img-fluid mb-5" src="img/portfolio/circus.png" alt="">
								<h3 class="text-center text-uppercase text-secondary mb-0">당신의
									택배 송장 정보를 지금 보호하세요.</h3>
							<p class="mb-5"></p>
							<a class="btn btn-primary btn-lg rounded-pill"
								href="/t10/com/QrMake?infoType=DEL&memberEmail=${memberInfo.memberEmail}">
								<i class=""></i> Create QR
							</a>
						</c:if>
						
						<a
							class="btn btn-danger btn-lg rounded-pill portfolio-modal-dismiss"
							href="#"> <i class="fa fa-close"></i> Close Project
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/freelancer.min.js"></script>

</body>

</html>
