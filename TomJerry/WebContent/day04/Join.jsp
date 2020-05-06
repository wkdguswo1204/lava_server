<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test</title>
<link rel="stylesheet" href="./w3.css" />
<link rel="stylesheet" href="join.css" />
<script type="text/javascript" src="./jquery-3.5.0.min.js"></script>

<style>

</style>
<script type="text/javascript">
$(document).ready(function(){
		/*
			비동기 통신
				==> 웹서비스에서 원칙은
					클라이언트가 요청을 하면
					서버는 클라이언트가 요청한 문서를 응답(전송)해준다.
					그리고 그 직후
					서버는 클라이언트와의 연결을 끊는다.
					따라서 이런 통신방식을
					단절형 통신이라 이야기한다.
					
					그리고
					서버가 전달된 문서는
					원칙은 클라이언트가 전송받은 문서와 동일해야 된다.
					
					반대로
					서버가 전달해준 문서와
					클라이언트가 받은 문서를 일부분만 교체한 경우
					비동기라고 이야기한다.
					
					결론적으로
					비동길처리란
					서버가 보내준 문서의 일부분만 서버와 통신을 해서 새로 받아서 교체해서
					일부분만 교체하는 처리를 비동기 처리라 한다.
					영어로 Ajax라 부른다.
					
					그런데
					이 비동기 처리는 jQuery에서 함수로 정의가 되어 있고
				
						형식]
								$.ajax({
									url: '주소',			==> 요청주소
									type: 'get | post',		==> 데이터 요청방식
									dataType: 'text | html | xml | json',
									data: {
										넘겨줄 데이터 나열...
										변수이름: 데이터,
										변수이름: 데이터,
										.......
									},
									success: function(){	==> 통신에 성공할 경우 실행할 함수
										성공시 처리내용..
									},
									error: function(){	=	==> 통신에 실패할 경우 실행할 함수
										실패시 처리내용
									}
								});
				
		*/
		$('#name').click(function(){
			
		
			// 1. 입력태그에 입력된 아이디를 가져오고
			 var sid = $('#id').val();
			if(sid){
				$.ajax({
					url: 'http://localhost/idCheck.ck',
					type: 'GET',
					dataType: 'json',
					data: {
						'id': sid
					},
					success: function(data){
						var result = data.result;
						if(result == 'ok'){
							// 아이디를 사용가능한 경우
							$('#idmsg').text('### 사용가능한 아이디입니다. ###');
							$('#idmsg').css('color', 'blue');
							$('#idmsg').css('display', '');
						} else {
							// 아이디가 사용불가능한 경우
							$('#idmsg').css('color', 'red');
							$('#idmsg').text('### 사용할 수 없는 아이디입니다. ###');
							$('#idmsg').css('display', '');
							$('#id').val('');
							$('#id').focus();
						}
					},
					error: function(){
						alert('### 통신 실패 ###');
					}
				});
			} else {
				$('#id').focus();
				return;
			}
		});
	});
</script>
</head>
<body>
	<div class="w3-col l3 m3">
		<p></p>
	</div>
	<div class=" w3-col l6 m8 s12">
		<form class="w3-margin-top w3-col" method="post" action="" name="frm" id="frm">
			<div class="w3-col w3-padding color">
				<h3 class="w3-center">Increpas Join</h3>
			</div>
			<div class="w3-col w3-padding-24 w3-margin-top">
				<div class="w3-row w3-margin-bottom">
					<label class="w3-col m3 w3-right-align" for="mid">회원 이름 : </label>
					<div class="w3-col m9">
						<input class="w3-col m10" type="text" id="mid" name="mid">
					</div>
				</div>
				<div class="w3-row w3-margin-bottom">
					<label class="w3-col m3 w3-right-align" for="id">회원 아이디 : </label>
					<div class="w3-col m8">
						<input class=" ids m7" type="text" id="id" name="id">
						<input class=" m5 color ckd" type="button" value="중복확인" id="name" name="name">
						<p class="w3-col w3-center" id="idmsg" style="display:none;"></p>
					</div>
				</div>
				<div class="w3-row w3-margin-bottom">
					<label class="w3-col m3 w3-right-align" for="pw">비밀번호 : </label>
					<div class="w3-col m9">
						<input class="w3-col m10" type="password" id="pw" name="pw">
					</div>
				</div>
				<div class="w3-row w3-margin-bottom">
					<label class="w3-col m3 w3-right-align" for="pw">비밀번호 재입력 :
					</label>
					<div class="w3-col m9">
						<input class="w3-col m10" type="password" id="pw" name="pw">
					</div>
				</div>
				<div class="w3-border-0">
					<div class="w3-row w3-margin-bottom">
						<label class="w3-col m3 w3-right-align" for="file">프로필 사진 :
						</label>
						<div class="w3-col m9">
							<input type="file" id="file" name="file"
								class="w3-col m10 w3-border">
						</div>
					</div>
					<div class="w3-row w3-margin-bottom">
						<div class="w3-col w3-hide w3-center" id="imgfr">
							<img class="imgc" src="../../img/noimage.jpg" id="img1"
								name="img1">
						</div>
					</div>
				</div>
				<div class="w3-row w3-margin-bottom">
					<label class="w3-col m3 w3-right-align" for="mail">회원 이메일: </label>
					<div class="w3-col m9">
						<input class="w3-col m10" type="text" id="mail" name="mail">
					</div>
				</div>
				<div class="w3-row w3-margin-bottom">
					<label class="w3-col m3 w3-right-align" for="birth">생년월일: </label>
					<div class="w3-col m9">
						<select id="birth">
					<option value="#">연도</option>
					<option value="1950">1950</option>
					<option value="1951">1951</option>
					<option value="1952">1952</option>
					<option value="1953">1953</option>
					<option value="1954">1954</option>
					<option value="1955">1955</option>
					<option value="1956">1956</option>
					<option value="1957">1957</option>
					<option value="1958">1958</option>
					<option value="1959">1959</option>
					<option value="1960">1960</option>
					<option value="1961">1961</option>
					<option value="1962">1962</option>
					<option value="1963">1963</option>
					<option value="1964">1964</option>
					<option value="1965">1965</option>
					<option value="1966">1966</option>
					<option value="1967">1967</option>
					<option value="1968">1968</option>
					<option value="1969">1969</option>
					<option value="1970">1970</option>
					<option value="1971">1971</option>
					<option value="1972">1972</option>
					<option value="1973">1973</option>
					<option value="1974">1974</option>
					<option value="1975">1975</option>
					<option value="1976">1976</option>
					<option value="1977">1977</option>
					<option value="1978">1978</option>
					<option value="1979">1979</option>
					<option value="1980">1980</option>
					<option value="1981">1981</option>
					<option value="1982">1982</option>
					<option value="1983">1983</option>
					<option value="1984">1984</option>
					<option value="1985">1985</option>
					<option value="1986">1986</option>
					<option value="1987">1987</option>
					<option value="1988">1988</option>
					<option value="1989">1989</option>
					<option value="1990">1990</option>
					<option value="1991">1991</option>
					<option value="1992">1992</option>
					<option value="1993">1993</option>
					<option value="1994">1994</option>
					<option value="1995">1995</option>
					<option value="1996">1996</option>
					<option value="1997">1997</option>
					<option value="1998">1998</option>
					<option value="1999">1999</option>
					<option value="2000">2000</option>
					<option value="2001">2001</option>
					<option value="2002">2002</option>
					<option value="2003">2003</option>
					<option value="2004">2004</option>
					<option value="2005">2005</option>
					<option value="2006">2006</option>
					<option value="2007">2007</option>
					<option value="2008">2008</option>
					<option value="2009">2009</option>
					<option value="2010">2010</option>
					<option value="2011">2011</option>
					<option value="2012">2012</option>
					<option value="2013">2013</option>
					<option value="2014">2014</option>
					<option value="2015">2015</option>
					<option value="2016">2016</option>
					<option value="2017">2017</option>
					<option value="2018">2018</option>
					<option value="2019">2019</option>
					<option value="2020">2020</option>
			</select> <span style="font-size: 18px;"> 년</span> <select id="생년월일">
					<option value="#">월</option>
					<option value="1">1월</option>
					<option value="2">2월</option>
					<option value="3">3월</option>
					<option value="4">4월</option>
					<option value="5">5월</option>
					<option value="6">6월</option>
					<option value="7">7월</option>
					<option value="8">8월</option>
					<option value="9">9월</option>
					<option value="10">10월</option>
					<option value="11">11월</option>
					<option value="12">12월</option>
			</select> <span style="font-size: 18px;"> 월 </span> <select id="생년월일">
					<option value="#">일</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
			</select> <span style="font-size: 18px;"> 일 </span>
					</div>
				</div>
				<div class="w3-row w3-margin-bottom">
					<label class="w3-col m3 w3-right-align" for="number">전화번호 : </label>
					<div class="w3-col m9">
						<input class="w3-col m10" type="text" id="number" name="number">
					</div>
				</div>
				<div class="w3-row w3-margin-bottom">
					<label class="w3-col m3 w3-right-align" for="label">성별 : </label> <input
						type="radio" value="Mail" id="M" name="gen"><label for="m">
						남자</label> <input type="radio" value="FeMail" id="F" name="gen"><label
						for="f"> 여자</label>
				</div>
					<label class="w3-col m3 w3-right-align" for="avatar">아바타 선택 : </label>
				<div class="w3-row">
					<div class="w3-center w3-margin-bottom">
						<img class="avatars m2" src="./img/img_avatar1.png">
						<input type="radio" name="1">
						<img class="avatars m2 " src="./img/img_avatar2.png">
						<input type="radio" name="1">
						<img class="avatars m2 " src="./img/img_avatar3.png">
						<input type="radio" name="1">
					</div>
					<div class="w3-center w3-margin-bottom">
						<img class="avatars m2 " src="./img/img_avatar4.png">
						<input type="radio" name="1">
						<img class="avatars m2 " src="./img/img_avatar5.png">
						<input type="radio" name="1">
						<img class="avatars m2 " src="./img/img_avatar6.png">
						<input type="radio" name="1">
					</div>
				</div>
			</div>
			<div class="w3-center">
			<button class="bts w3-button color w3-margin-top w3-center" type="submit">회원 가입</button>
			<button class="bts w3-button w3-orange w3-margin-top w3-center" type="submit">홈으로</button>
			</div>
		</form>
	</div>

</body>
</html>