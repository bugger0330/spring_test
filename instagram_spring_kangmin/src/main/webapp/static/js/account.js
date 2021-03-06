const profileUsername = document.querySelector(".profile-username");
const textInputs = document.querySelectorAll(".text-input");
const inctroduceText = document.querySelector(".text-textarea");

const submitBtn = document.querySelector(".submit-btn");

const profileImgFile = document.querySelector(".profile-img-file");
const profileImgRound = document.querySelector(".profile-img-round");
const updateImgBtn = document.querySelector(".update-img-button");

let usercode = 0;

let principal = getPrincipal();

load();

function load(){
	$.ajax({
		type:"get",
		url:"/app/profile/account/user",
		data: {
			usercode:principal.usercode
		},
		dataType:"text",
		success: function(data){
			let account = JSON.parse(data);
			pageLoad(account);
		},
		error: function(){
			alert("비동기 처리 오류");
		}
	});
	
	const profileImg = profileImgRound.querySelector("img");
	profileImg.src = getProfileImg();
}



function pageLoad(account){
	usercode = account.usercode;
	profileUsername.textContent = account.username;
	textInputs[0].value = account.name;
	textInputs[1].value = account.username;
	textInputs[2].value = account.website;
	inctroduceText.value = account.introduce;
	textInputs[3].value = account.email;
	textInputs[4].value = account.phone;
	textInputs[5].value = account.gender;
	
}

submitBtn.onclick = () => {
	account = createAccount();
	$.ajax({
		type : "put",
		url : "/app/profile/account/update",
		data : JSON.stringify(account),
		contentType : "application/json; charset=utf-8",
		dataType : "text",
		success : function(data){
			if(data == "true"){
				alert("회원정보 수정 완료");
				location.replace("/app/profile/account");
			}else{
				alert("이미 존재하는 사용자 이름 입니다");
			}
		},
		error : function(){
			alert("비동기 처리 오류");
		}
	});
}

function createAccount(){
	let account = {
		"usercode" : usercode,
		"name" : textInputs[0].value,
		"username" : textInputs[1].value,
		"website" : textInputs[2].value,
		"introduce" : inctroduceText.value,
		"email" : textInputs[3].value,
		"phone" : textInputs[4].value,
		"gender" : textInputs[5].value
	}
	return account;
}


profileImgRound.onclick = () => {
	imgChange();
}


updateImgBtn.onclick = () => {
	imgChange();
}

function imgChange(){
	profileImgFile.click();
	profileImgFile.onchange = () => {
		let reader = new FileReader();
		
		reader.onload = (e) => {
			let profileImgUrl = e.target.result;//바꾼 이미지 주소
			let originImgUrl = profileImgRound.querySelector("img").src; //바꾸기 전 이미지 주소
			profileImgRound.querySelector("img").src = profileImgUrl;

			if(confirm("프로필 이미지를 변경하시겠습니까?")){
				let formData = new FormData(document.querySelector(".profile-box-form1"));
				
				$.ajax({
					type : "post",
					url : "/app/profile/account/update/img",
					data : formData,
					incType : "multipart/form-data",
					processData : false,
					contentType : false,
					dataType : "text",
					success : function(data){
						alert("프로필 이미지가 변경되었습니다.");
						location.reload();
					},
					error : function(){
						alert("비동기 처리 오류");
					}
					
				});
			}else{
				profileImgRound.querySelector("img").src = profileImgUrl;
			}
			
			
		}
		
		reader.readAsDataURL(profileImgFile.files[0]);
	}
	
}

//ajax에서 멀티파트로 보낼떈 무조건 선언해야 하는것
	/*incType : "multipart/form-data",
	processData : false,
	contentType : false,*/















