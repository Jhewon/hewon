<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kakao Login</title>
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
<script>
  Kakao.init('f7dbf1587b80b0f8dc39fe28367f4edf'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<a id="kakao-login-btn" href="javascript:loginWithKakao()">
  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
    alt="카카오 로그인 버튼" />
</a>
<p id="token-result"></p>

<script>
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'https://developers.kakao.com/tool/demo/oauth',
    });
  }

  function requestUserInfo() {
    Kakao.API.request({
      url: '/v2/user/me',
    })
      .then(function(res) {
        alert(JSON.stringify(res));
      })
      .catch(function(err) {
        alert(
          'failed to request user information: ' + JSON.stringify(err)
        );
      });
  }
  
  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      Kakao.Auth.getStatusInfo()
        .then(function(res) {
          if (res.status === 'connected') {
            document.getElementById('token-result').innerText
              = 'login success, token: ' + Kakao.Auth.getAccessToken();
          }
        })
        .catch(function(err) {
          Kakao.Auth.setAccessToken(null);
        });
    }
  }
  
  function loginWithKakao() {
	    Kakao.Auth.authorize({
	      redirectUri: 'https://developers.kakao.com/tool/demo/oauth',
	    });
	  }
</script>

</head>
<body>
<<<<<<< HEAD
 <a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=350fe24782cde4619780c401ff70416b
 &redirect_uri=http://localhost/kakao &response_type=code">
<p class="login_option">
<span class="pet_btn login_btn kakao_btn">카카오톡계정으로 로그인하기</span>
</p>
</a>
=======
<li><a href="javascript:loginWithKakao()"></a></li>
>>>>>>> branch 'master' of https://github.com/Jhewon/hewon.git
</body>
<<<<<<< HEAD
</html>
=======
</html>
>>>>>>> branch 'master' of https://github.com/Jhewon/hewon.git
