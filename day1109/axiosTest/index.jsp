<%@ page contentType="text/html; charset=utf-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="utf-8">
			<title>RESTful 웹서비스 클라이언트(JSON)</title>
			<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">

			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
			<script type="text/javascript">

			</script>
			<script type="text/javascript">
				let root = "http://localhost/rest/";

				function selectAll() { // 모든 고객 정보 받아오기
					fetch(`\${root}customers`)
						.then(response => response.json())
						.then(data => {
							selectAllResult(data); // data: 서버로부터 온 데이터
						});
					selectOneResult("");
				}

				function selectAllResult(data) { // json 데이터를 화면에 뿌림
					let list = ``;
					data.forEach(function (item) {
						list += `<tr onclick=selectOne(\${item.num})>
									<td>\${item.num}</td>
									<td>\${item.name}</td>
									<td>\${item.address}</td>
								</tr>`;
					});
					document.getElementById("tb").innerHTML = list;
				}

				function selectOne(num) {
					fetch(`\${root}/customers/\${num}`)
						.then(response => response.json())
						.then(data => selectOneResult(data));
				}

				function selectOneResult(data) { // data는 json 한개
					var num = document.getElementById("num");
					var name = document.getElementById("name");
					var address = document.getElementById("address");
					if (data != "") {
						num.value = data.num;
						name.value = data.name;
						address.value = data.address;
					} else {
						num.value = data;
						name.value = data;
						address.value = data;
					}
				}

				function init() {
					selectOneResult("");
				}

				function customerInsert() {
					// 1. 입력칸의 값 알아오기
					var num = document.getElementById("num");
					var name = document.getElementById("name");
					var address = document.getElementById("address");

					// 2. 조건체크 후 서버에 추가 요청
					if (num.value != "" && name.value != "" && address.value != "") {
						let config = {
							method: "POST",
							headers: {
								"Content-Type": "application/json"
							},
							body: JSON.stringify({
								num: num.value,
								name: name.value,
								address: address.value
							})
						}
						fetch(`\${root}/customers`, config)
							.then(response => { selectAll(); selectOneResult(""); }) // 화면 refresh, 입력칸 빈칸 만들기
					} else {
						alert("추가할 값을 입력해 주세요!!")
					}
				}

				function customerDelete() {
					let num = document.getElementById("num");
					if (num.value != "") {
						let config = {
							method: "DELETE",
						}
						fetch(`\${root}/customers/\${num.value}`, config)
							.then(response => { selectAll(); selectOneResult(""); })
					} else {
						alert("삭제할 사용자를 선택해주세요!!")
					}
				}

				function customerUpdate() {
					let num = document.getElementById("num");
					var address = document.getElementById("address");
					if (num.value != "" && address.value != "") {
						let config = {
							method: "PUT",
							headers: {
								"Content-Type": "application/json"
							},
							body: JSON.stringify({
								num: num.value,
								address: address.value
							})
						}
						fetch(`\${root}/customers`, config)
							.then(response => { selectAll(); selectOneResult(""); }) // 화면 refresh, 입력칸 빈칸 만들기
					} else {
						alert("추가할 값을 입력해 주세요!!")
					}
				}

				function customerSearch() {
					var address = document.getElementById("address").value;
					if (address != "") {
						fetch(`\${root}/customers/address/\${address}`)
							.then(response => response.json())
							.then(data => selectAllResult(data));
					} else {
						alert("검색어를 입력해주세요!!");
					}
				}

			</script>
		</head>

		<body onload="selectAll()">
			<div class="container">
				<form id="form1" class="form-horizontal">
					<h2>Customer Management</h2>
					<div class="form-group">
						<label>번호:</label> <input type="text" class="form-control" id="num">
					</div>
					<div class="form-group">
						<label>이름:</label> <input type="text" class="form-control" id="name">
					</div>

					<div class="form-group">
						<label>주소:</label> <input type="text" class="form-control" id="address">
					</div>

					<div class="btn-group">
						<input type="button" class="btn btn-primary" value="등록" id="btnInsert" onclick="customerInsert()" /> <input
							type="button" class="btn btn-primary" value="수정" id="btnUpdate" onclick="customerUpdate()" /> <input
							type="button" class="btn btn-primary" value="삭제" id="btnDelete" onclick="customerDelete()" /><input
							type="button" class="btn btn-primary" value="검색" id="btnSearch" onclick="customerSearch()" /><input
							type="button" class="btn btn-primary" value="전체" id="btnAll" onclick="selectAll()" /> <input type="button"
							class="btn btn-primary" value="초기화" id="btnInit" onclick="init()" />
					</div>
				</form>
			</div>
			<hr />
			<div class="container">
				<h2>사용자 목록</h2>
				<table class="table text-center">
					<thead>
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">이름</th>
							<th class="text-center">주소</th>
						</tr>
					</thead>
					<tbody id="tb"></tbody>
				</table>
			</div>
		</body>

		</html>