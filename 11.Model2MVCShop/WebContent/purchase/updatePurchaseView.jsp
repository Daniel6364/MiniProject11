<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="EUC-KR">

<title>updatePurchaseView.jsp</title>

<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- ��ǰ�������� Calendar Event -->
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

function fncUpdatePurchase() {
	
	// Validation Check
	var name = $("input[name='receiverName']").val();
	var addr = $("input[name='dlvyAddr']").val();
	var phone = $("input[name='receiverPhone']").val();
	
	if(name == null || name.length < 1) {
		alert("������ �̸��� �ʼ� �Է� �����Դϴ�.");
	}
	if(addr == null || name.length < 1) {
		alert("������ �ּҴ� �ʼ� �Է� �����Դϴ�.");
	}
	if(phone == null || name.length < 1) {
		alert("������ ����ó�� �ʼ� �Է� �����Դϴ�.");
	}
	
	$("form").attr("method", "POST").attr("action", "/purchase/updatePurchase?tranNo=${ purchase.tranNo }").submit();
	
}

$(function(){
	$("button").bind("click", function(){
		fncUpdatePurchase();
	});
});

$(function(){
	$("a[href='#']").bind("click", function(){
		//history.go(-1);
		self.location = "/purchase/getPurchase?tranNo=${ purchase.tranNo }"
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
	
		<div class="page-header text-center">
	       <h3 class=" text-info">������������</h3>
	       <!-- 
	       	<h5 class="text-muted">��ǰ ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
	       -->
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="buyerId" name="buyerId" value="${ user.userId }" readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">������ ���̵�� �����Ұ�</strong>
		      </span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
		    <div class="col-sm-4">
		    	<select class="form-control" name="paymentOption">
					<option value="1" ${ purchase.paymentOption == '1' ? 'selected' : '' }>���ݱ���</option>
					<option value="2" ${ purchase.paymentOption == '2' ? 'selected' : '' }>�ſ뱸��</option>
				</select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�����Ǻ� �̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${ purchase.receiverName }" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">�����Ǻ� ����ó</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${ purchase.receiverPhone }">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dlvyAddr" class="col-sm-offset-1 col-sm-3 control-label">�����Ǻ� �ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dlvyAddr" name="dlvyAddr" value="${ purchase.dlvyAddr }">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dlvyRequest" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dlvyRequest" name="dlvyRequest" value="${ purchase.dlvyRequest }">
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
		      <button type="button" class="btn btn-primary"  >��&nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
</body>

</html>