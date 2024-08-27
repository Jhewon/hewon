<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kakao Login</title>
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.min.js" 
    integrity="sha384-TiCUE00h649CAMonG018J2ujOgDKW/kVWlChEuu4jK2vxfAAD0eZxzCKakxg55G4" 
    crossorigin="anonymous">
    Kakao.init('f7dbf1587b80b0f8dc39fe28367f4edf');
    Kakao.isInitialized();
    </script>

</head>
<body>
<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=350fe24782cde4619780c401ff70416b&redirect_uri=localhost%2Fmain%2Fmain.do">
    Kakao 로그인
</a>
</body>
</html>
