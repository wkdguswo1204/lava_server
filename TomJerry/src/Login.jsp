<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test</title>
<link rel="stylesheet" href="../css/w3.css" />
<script type="text/javascript" src="../js/jquery-3.5.0.min.js"></script>
<style>
.lbl1 {
	min-width: 80px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#lbtn').click(function() {
			// í ì¼
			// 1. ë°ì´í° ì½ê³ 
			var sid = $('#id').val();
			var spw = $('#pw').val();
			// 2. ì í¨ì± ê²ì¬íê³ 
			if (!sid) {
				$('#id').focus();
				return;
			}
			if (!spw) {
				$('#pw').focus();
				return;
			}
			
			$('#frm').attr('method', 'GET');
/*			$('#frm').attr('method', 'POST'); */
			$('#frm').attr('action', 'Test01.jsp');
			$('#frm').submit();
			
/*			
			// 3. ë¹ëê¸° íµì ì íê³ 
			$.ajax({
				url : 'http://localhost/loginProc.lp',
				type : 'get',
				dataType : 'json',
				data : {
					'id' : sid,
					'pw' : spw
				},
				success : function(obj) {
					var result = obj.SID;
					if (result) {
						alert('###########');
						$('#msg').html('[ ' + result + ' ] íìëì ë¡ê·¸ì¸ ìíìëë¤.');
						$('#loginWin').css('display', 'none');
						$('#msgWIn').css('display', '')
					} else {
						alert('** ìì´ëì ë¹ë°ë²í¸ë¥¼ íì¸íì¸ì! ***');
						$('#id').val('');
						$('#pw').val('');
						$('#id').focus();
					}
				},
				error : function() {
					alert('### íµì  ìë¬ ###');
				}
			});
			// 4. ê²°ê³¼ì ë°ë¼ì ë·°ë¥¼ ì²ë¦¬í´ì¤ë¤. 
*/
		});
	});
</script>
</head>
<body>
	<div class="w3-third" id="loginWin">
		<p></p>
	</div>
	<div class="w3-third" id="loginWin">
			<h2 class="w3-blue w3-center w3-round-large w3-border w3-card-4">Login</h2>
			<form class="w3-col w3-margin-top w3-padding w3-round-large w3-border w3-card-4" id="frm">
				<div class="w3-row w3-padding">
					<label class="w3-col m3 w3-padding w3-right-align lbl1" for="id">I D : </label>
					<input type="text" id="id" name="id" class="w3-col l9 m12 s12 w3-border w3-input">
				</div>
				<div class="w3-row w3-padding">
					<label class="w3-col m3 w3-padding w3-right-align lbl1" for="pw">P W : </label>
					<input type="password" id="pw" name="pw" class="w3-col l9 m12 s12 w3-border w3-input">
				</div>
			</form>
			<div class="w3-col w3-margin-top w3-round-large w3-border w3-card-4">
				<div class="w3-half w3-red w3-button" id="hbtn">Home</div>
				<div class="w3-half w3-blue w3-button" id="lbtn">Login</div>
			</div>
	</div>
	<div class="w3-third" id="msgWin" style="display: none;">
		<h2 class="w3-col w3-margin-top w3-card-4" style="padding-top: 80px; height: 250px;" id="msg"></h2>
	</div>
</body>
</html>