<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">

	/*
		REST : URI + HTTP Method
		
				URI				Method
		목록	member			GET
		보기	member/{no}		GET
		삽입	member			POST
		수정	member			PUT
		삭제	member/{no}		DELETE
	*/

	// 페이지 로드 이벤트
	$(document).ready(function(){
		memberList();
		memberView();
		memberInsert();
		memberUpdate();
		memberDelete();
		init();
	});
	
	/***** 1. 회원 목록 *****/
	function memberList() {
		// URI : member, Method : GET
		$.ajax({
			url: 'member',
			type: 'get',
			dataType: 'json',
			success: function(responseList) {
				
			},
			error: function(){
				alert('실패');
			}
		});
	}
	
	/***** 2. 회원 정보 *****/
	function memberView() {
		
	}
	
	/***** 3. 회원 삽입 *****/
	function memberInsert() {
		
	}
	
	/***** 4. 회원 수정 *****/
	function memberUpdate() {
		
	}
	
	/***** 5. 회원 삭제 *****/
	function memberDelete() {
		
	}
	
	/***** 6. 초기화 *****/
	function init() {
		$('#btnInit').click(function(){
			$('input:text[name="id"]').val('');
			$('input:text[name="name"]').val('');
			$('input:radio[name="gender"]').prop('checked', false);
			$('select[name="address"]').val('');
			memberList();
		});
	}
	
</script>
<title>Insert title here</title>
<style type="text/css">
	.wrap {
		display: flex;
	}
	.left {
		width: 500px;
	}
	.right {
		width: 1000px;
	}
	table {
		border-collapse: collapse;
	}
	td, th {
		border-top: 1px solid black;
		border-bottom: 1px solid black;
		padding: 5px 10px;
		text-align: center;
	}
	th {
		background: silver;
	}
</style>
</head>
<body>
	
	<div class="wrap">
		
		<div class="left">
			<!-- 등록/수정/보기 페이지 -->
			<h3>회원 등록/수정/보기</h3>
			아이디<br/>
			<input type="text" name="id" /><br/><br/>
			이름<br/>
			<input type="text" name="name" /><br/><br/>
			성별<br/>
			<input type="radio" name="gender" value="남" />남
			<input type="radio" name="gender" value="여" />여<br/><br/>
			주소<br/>
			<select name="address">
				<option value="">지역 선택</option>
				<option value="서울">서울</option>
				<option value="인천">인천</option>
				<option value="부산">부산</option>
				<option value="제주">제주</option>
				<option value="강원">강원</option>
			</select><br/><br/>
			<input type="button" value="등록" id="btnInsert" />
			<input type="button" value="수정" id="btnUpdate" />
			<input type="button" value="초기화" id="btnInit" />
		</div>
		
		<div class="right">
			<!-- 목록/삭제 페이지 -->
			<h3>회원 목록</h3>
			<table>
				<thead>
					<tr>
						<th>회원번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>성별</th>
						<th>주소</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody id="memberList"></tbody>
			</table>
		</div>
		
	</div>
	
</body>
</html>