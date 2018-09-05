<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>���� ������</title>

    <!-- Bootstrap core CSS -->
    <link href="/t10/assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/t10/assets/css/signin.css" rel="stylesheet">
  </head>

  <body class="text-center">
    <form action="/t10/auth/authPassword" class="form-signin" method="post">
    <input type="text" id="addr" name="addr" value="${ addr }"/>
     <input type="text" id="infoType" name="infoType" value="${ infoType }"/>
      <img class="mb-4" src="../../assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
      <h3 class="h3 mb-3 font-weight-normal">����Ű�� �Է��ϼ���</h3>
      <label for="password" class="sr-only"></label>
      <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
      <button class="btn btn-lg btn-primary btn-block" type="submit">�����ϱ�</button>
      <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
    </form>
  </body>
</html>
