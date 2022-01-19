  'use strict'
  // 일반 회원가입 시작
  // 회원가입 중복확인용 변수들
  let emailSubmitCheck = false;
  let nickNameSubmitCheck = false;
  let phoneSubmitCheck = false;
  let pwSubmitCheck = false;
  let pwReSubmitCheck = false;
  // 이메일 중복확인
  let eventCheck = document.querySelector("#signupEmailCheckBtn");
  if (eventCheck != null) {
    document.querySelector("#signupEmailCheckBtn").addEventListener("click", () => {
      let emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      let signupEmailValue = document.querySelector("#signupEmail").value
      if (emailRegex.test(signupEmailValue)) {
        $.ajax({
          type: "post",
          url: "/member/emailCheck",
          data: { email: signupEmailValue }
        }).done(function (res) {
          if (res == "1") {
            document.querySelector(".emailConfirm").style.color = "red";
            document.querySelector(".emailConfirm").innerHTML = "사용중인 이메일입니다.";
            emailSubmitCheck = false;
          } else {
            document.querySelector(".emailConfirm").style.color = "cornflowerblue";
            document.querySelector(".emailConfirm").innerHTML = "사용 가능한 이메일입니다.";
            emailSubmitCheck = true;
          }
        })
      } else {
        document.querySelector(".emailConfirm").style.color = "red";
        document.querySelector(".emailConfirm").innerHTML = "이메일 양식을 확인해주세요.";
        emailSubmitCheck = false;
      }
    });
    // 닉네임 중복확인
    document.querySelector("#signupNickNameCheckBtn").addEventListener("click", () => {
      let nickNameRegex = /^([a-zA-Z0-9가-힣]){1,8}$/;
      let signupNickNameValue = document.querySelector("#signupNickName").value
      if (nickNameRegex.test(signupNickNameValue)) {
        $.ajax({
          url: "/member/nickNameCheck",
          data: { nickName: signupNickNameValue }
        }).done(function (res) {
          if (res == "1") {
            document.querySelector(".nickNameConfirm").style.color = "red";
            document.querySelector(".nickNameConfirm").innerHTML = "사용중인 닉네임입니다.";
            nickNameSubmitCheck = false;
          } else {
            document.querySelector(".nickNameConfirm").style.color = "cornflowerblue";
            document.querySelector(".nickNameConfirm").innerHTML = "사용 가능한 닉네임입니다.";
            nickNameSubmitCheck = true;
          }
        })
      } else {
        document.querySelector(".nickNameConfirm").style.color = "red";
        document.querySelector(".nickNameConfirm").innerHTML = "완성된 한글, 영문, 숫자를 포함한 8글자 이내";
        nickNameSubmitCheck = false;
      }
    });
    // 휴대폰 중복확인
    document.querySelector("#signupPhoneCheckBtn").addEventListener("click", () => {
      let phoneRegex = /^[0-9]{11}$/;
      let phone1 = document.querySelector("#signupPhone1").value
      let phone2 = document.querySelector("#signupPhone2").value
      let phone3 = document.querySelector("#signupPhone3").value
      let phone4 = phone1 + phone2 + phone3 + "";
      document.querySelector("#signupPhone").value = phone4;
      if (phoneRegex.test(phone4)) {
        $.ajax({
          url: "/member/phoneCheck",
          data: { phone: phone4 }
        }).done(function (res) {
          if (res == "1") {
            document.querySelector(".phoneConfirm").style.color = "red";
            document.querySelector(".phoneConfirm").innerHTML = "사용중인 번호입니다.";
            phoneSubmitCheck = false;
          } else {
            document.querySelector(".phoneConfirm").style.color = "cornflowerblue";
            document.querySelector(".phoneConfirm").innerHTML = "사용가능한 번호입니다.";
            phoneSubmitCheck = true;
          }
        })
      } else {
        document.querySelector(".phoneConfirm").style.color = "red";
        document.querySelector(".phoneConfirm").innerHTML = "유효한 번호를 입력해주세요.";
        phoneSubmitCheck = false;
      }
    });

    // 비밀번호 확인
    let signupPw = document.querySelector("#signupPw");
    let signupPwRe = document.querySelector("#signupPwRe");
    signupPw.addEventListener("input", () => {
      let pwRegex = /^[A-Za-z0-9\S]{8,16}$/;
      if (pwRegex.test(signupPw.value)) {
        document.querySelector(".pwConfirm").style.color = "cornflowerblue";
        document.querySelector(".pwConfirm").innerHTML = "사용 가능한 PW입니다.";
        pwSubmitCheck = true;
      } else {
        document.querySelector(".pwConfirm").style.color = "red";
        document.querySelector(".pwConfirm").innerHTML = "공백 없는 8~16자로 입력해주세요.";
        pwSubmitCheck = false;
      }
      if (signupPw.value == signupPwRe.value) {
        document.querySelector(".pwReConfirm").innerHTML = "";
        pwReSubmitCheck = true;
      } else {
        document.querySelector(".pwReConfirm").innerHTML = "";
        pwReSubmitCheck = false;
      }
    });
    signupPwRe.addEventListener("input", () => {
      if (signupPwRe.value == "") {
        document.querySelector(".pwReConfirm").innerHTML = "";
        pwReSubmitCheck = false;
      } else if (signupPw.value == signupPwRe.value && signupPwRe.value != "") {
        document.querySelector(".pwReConfirm").style.color = "cornflowerblue";
        document.querySelector(".pwReConfirm").innerHTML = "PW가 일치합니다.";
        pwReSubmitCheck = true;
      } else {
        document.querySelector(".pwReConfirm").style.color = "red";
        document.querySelector(".pwReConfirm").innerHTML = "PW가 일치하지 않습니다.";
        pwReSubmitCheck = false;
      }
    });

    // 회원가입 완료 버튼 onsubmit="return 메서드()" 쓰면 편한데 알수없는 에러나서 그냥 이방식으로 결정
    document.querySelector("#signupGoBtn").addEventListener("click", () => {
      let emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      let signupEmailValue = document.querySelector("#signupEmail").value
      if (emailRegex.test(signupEmailValue)) {
        $.ajax({
          type: "post",
          url: "/member/emailCheck",
          data: { email: signupEmailValue }
        }).done(function (res) {
          if (res == "1") {
            document.querySelector(".emailConfirm").style.color = "red";
            document.querySelector(".emailConfirm").innerHTML = "사용중인 이메일입니다.";
            emailSubmitCheck = false;
          } else {
            document.querySelector(".emailConfirm").style.color = "cornflowerblue";
            document.querySelector(".emailConfirm").innerHTML = "사용 가능한 이메일입니다.";
            emailSubmitCheck = true;
          }
        })
      } else {
        document.querySelector(".emailConfirm").style.color = "red";
        document.querySelector(".emailConfirm").innerHTML = "이메일 양식을 확인해주세요.";
        emailSubmitCheck = false;
      }

      let nickNameRegex = /^([a-zA-Z0-9가-힣]){1,8}$/;
      let signupNickNameValue = document.querySelector("#signupNickName").value
      if (nickNameRegex.test(signupNickNameValue)) {
        $.ajax({
          url: "/member/nickNameCheck",
          data: { nickName: signupNickNameValue }
        }).done(function (res) {
          if (res == "1") {
            document.querySelector(".nickNameConfirm").style.color = "red";
            document.querySelector(".nickNameConfirm").innerHTML = "사용중인 닉네임입니다.";
            nickNameSubmitCheck = false;
          } else {
            document.querySelector(".nickNameConfirm").style.color = "cornflowerblue";
            document.querySelector(".nickNameConfirm").innerHTML = "사용 가능한 닉네임입니다.";
            nickNameSubmitCheck = true;
          }
        })
      } else {
        document.querySelector(".nickNameConfirm").style.color = "red";
        document.querySelector(".nickNameConfirm").innerHTML = "완성된 한글, 영문, 숫자를 포함한 8글자 이내";
        nickNameSubmitCheck = false;
      }

      let phoneRegex = /^[0-9]{11}$/;
      let phone1 = document.querySelector("#signupPhone1").value
      let phone2 = document.querySelector("#signupPhone2").value
      let phone3 = document.querySelector("#signupPhone3").value
      let phone4 = phone1 + phone2 + phone3 + "";
      document.querySelector("#signupPhone").value = phone4;
      if (phoneRegex.test(phone4)) {
        $.ajax({
          url: "/member/phoneCheck",
          data: { phone: phone4 }
        }).done(function (res) {
          if (res == "1") {
            document.querySelector(".phoneConfirm").style.color = "red";
            document.querySelector(".phoneConfirm").innerHTML = "사용중인 번호입니다.";
            phoneSubmitCheck = false;
          } else {
            document.querySelector(".phoneConfirm").style.color = "cornflowerblue";
            document.querySelector(".phoneConfirm").innerHTML = "사용가능한 번호입니다.";
            phoneSubmitCheck = true;
          }
        })
      } else {
        document.querySelector(".phoneConfirm").style.color = "red";
        document.querySelector(".phoneConfirm").innerHTML = "유효한 번호를 입력해주세요.";
        phoneSubmitCheck = false;
      }

      if (!emailSubmitCheck) {
        alert("이메일을 확인해주세요.");
        return false;
      }

      if (!nickNameSubmitCheck) {
        alert("닉네임을 확인해주세요.");
        return false;
      }

      if (!phoneSubmitCheck) {
        alert("휴대폰번호를 확인해주세요.");
        return false;
      }

      if (!pwSubmitCheck) {
        alert("비밀번호를 확인해주세요.");
        return false;
      }
      // 성별 체크
      let genderCheck = false;
      for(let i = 0; i < 2; i++){
        if(document.querySelectorAll('.genderInput')[i].checked){
          genderCheck = true;
        }
      }
      console.log("체크된 성별값:" + genderCheck);
      if(!genderCheck){
        alert("성별을 체크해주세요.");
        return false;
      }

      if (!pwReSubmitCheck) {
        alert("입력된 비밀번호가 다릅니다.");
        return false;
      }
      if (confirm("해당 정보로 가입하시겠습니까?")) {
        document.querySelector("#signupForm").submit();
      }
      return false;
    });

    // 일반 회원가입 끝

    // 일반 로그인 시작
    document.querySelector("#normalLoginBtn").addEventListener("click", () => {
      let emailID = document.querySelector("#normalLoginID").value
      let pw = document.querySelector("#normalLoginPW").value
      console.log("아이디 : " + emailID);
      console.log("비번 : " + pw);
      $.ajax({
        type: "post",
        url: "/member/normalLogin",
        data: {
          "emailID": emailID,
          "pw": pw
        }
      }).done(function (res) {
        if (res == 0) {
          document.querySelector(".normalLoginConfirm").style.color = "red";
          document.querySelector(".normalLoginConfirm").innerHTML = "계정과 패스워드를 확인해주세요.";
        } else {
          location.reload();
        }
      })
    });

    // 카카오 로그인
    document.querySelector("#kakaoLogin").addEventListener("click", () => {
      $.ajax({
        url: '/member/getKakaoAuthUrl',
        type: 'get'
      }).done(function (res) {
        location.href = res;
      })
    });

    // 비밀번호 찾기
    let verificationCode = null;
    let findPwEmail = null;
    document.querySelector("#findPwBtn").addEventListener("click", () => {
      findPwEmail = document.querySelector("#findPwInput").value;
      $.ajax({
        url: '/member/findPw',
        type: 'post',
        data: { "emailID": findPwEmail }
      }).done(function (res) {
        if (res == 0) {
          document.querySelector(".findPwEmailCheckConfirm").style.color = "red";
          document.querySelector(".findPwEmailCheckConfirm").innerHTML = "카카오계정 회원이거나 등록되지 않은 Email입니다.";
        } else {
          alert("이메일로 인증번호가 발송되었습니다.");
          document.querySelector(".findPwEmailCheckConfirm").innerHTML = "";
          verificationCode = "";
          verificationCode = res;
          console.log(verificationCode);
        }
      })
    });

    // 비밀번호 인증코드 확인
    document.querySelector("#verificationBtn").addEventListener("click", () => {
      let verificationInput = document.querySelector("#verificationInput").value;
      if (verificationInput != verificationCode) {
        document.querySelector(".verificationCodeConfirm").style.color = "red";
        document.querySelector(".verificationCodeConfirm").innerHTML = "인증번호가 맞지않습니다.";
      } else {
        document.querySelector(".verificationCodeConfirm").innerHTML = "";
        document.querySelector(".verificationOk").style.display = "block";
      }
    });

    // 비밀번호 변경
    document.querySelector("#changePwBtn").addEventListener("click", () => {
      let pwRegex = /^[A-Za-z0-9\S]{8,16}$/;
      let changePw = document.querySelector("#changePwInput").value;
      if (!pwRegex.test(changePw)) {
        document.querySelector(".changePwConfirm").style.color = "red";
        document.querySelector(".changePwConfirm").innerHTML = "공백 없는 8~16자로 입력해주세요.";
        return false;
      }
      // 컨펌창 하나 띄워서 확인
      if (confirm("변경하시겠습니까?")) {
        alert("변경되었습니다.");
        document.querySelector("#changePwForm").submit();
      } else {
        return false;
      }
    });

  }
