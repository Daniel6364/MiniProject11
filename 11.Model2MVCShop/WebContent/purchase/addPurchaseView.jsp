<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">

<title>addPurchaseView.jsp</title>

	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
   <!-- Calendar Event -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   

<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

function fncAddPurchase() {
	$("form").attr("method", "POST").attr("action", "/purchase/addPurchase").submit();
}

$( function(){
	$('button').bind("click", function(){
		fncAddPurchase();
	});
});

$( function(){
	$('div a[href="#"]').bind("click", function(){
		//history.go(-1);
		self.location = "/product/getProduct?prodNo=${ product.prodNo }&menu=search"
	});
});

//=================== "����������" Event ���� ===================
$(function() {
	$("#dlvyDate").datepicker({
		dateFormat: "yymmdd",
		minDate: 1,
		changeMonth: true,
		changeYear: true 
	});
});


</script>
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header">
			<h3 class="text-info">���Ż�ǰ ����ȸ</h3>
		<!-- <h5 class="text-muted text-left">
				�Ǹ��Ͻ� ��ǰ�� <strong class="text-danger">���Ŀ� �°� </strong>����� �ּ���.
			</h5>  -->
		</div>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${ product.prodNo }</div>
		</div>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�� ǰ ��</strong></div>
			<div class="col-xs-8 col-md-4">${ product.prodName }</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4">${ product.prodDetail }</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${ product.manuDate }</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${ product.price }</div>
		</div>

		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�������</strong></div>
			<div class="col-xs-8 col-md-4">${ product.regDate }</div>
		</div><hr/>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
			
			<input type="hidden" name="prodNo" value="${ product.prodNo }" />
			
			<div class="form-group">
				<label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">������ ���̵�</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="buyerId" name="buyerId" value="${ user.userId }" readonly>
				</div>
			</div>

			<div class="form-group">
				<label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
				<div class="col-sm-4">
					<select class="form-control" name="paymentOption">
						<option value="1">���ݱ���</option>
						<option value="2">�ſ뱸��</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�����Ǻ� �̸�</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverName" name="receiverName" value="${ user.userName }" placeholder="�ʼ��Է�">
				</div>
			</div>

			<div class="form-group">
				<label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">�����Ǻ� ����ó</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${ user.phone }" placeholder="�ʼ��Է�">
				</div>
			</div>

			<div class="form-group">
				<label for="dlvyAddr" class="col-sm-offset-1 col-sm-3 control-label">�����Ǻ� �ּ�</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="dlvyAddr" name="dlvyAddr" value="${ user.addr }" placeholder="�ʼ��Է�">
				</div>
			</div>
			
			<div class="form-group">
				<label for="dlvyRequest" class="col-sm-offset-1 col-sm-3 control-label">���Ž� ��û����</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="dlvyRequest" name="dlvyRequest" >
				</div>
			</div>
			
			<div class="form-group">
				<label for="dlvyDate" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="dlvyDate" name="dlvyDate" placeholder="�� ���Խ� �Ա� Ȯ�� �� �ٷ� ����մϴ�.">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">��&nbsp;��</button>
					<a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
				</div>
			</div>

		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>