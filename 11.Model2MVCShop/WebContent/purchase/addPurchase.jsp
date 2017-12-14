<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<meta charset="EUC-KR">
<title>addPurchase.jsp</title>

<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

var tranNo = ${ purchase.tranNo };
console.log("tranNo Ȯ�� : " + tranNo)
$("form").attr("method", "POST").attr("action", "/purchase/updatePurchase?tranNo=${ purchase.tranNo }")

</script>
</head>

<body>

<!-- <form name="updatePurchase" action="/purchase/updatePurchase?tranNo=${ purchase.tranNo }" method="post"> -->
<form name="updatePurchase">

�� ������ ���� ���Ű� �Ǿ����ϴ�.

<table border=1>
	<tr>
		<td>��ǰ��ȣ</td>
		<td>${ purchase.purchaseProd.prodNo }</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ھ��̵�</td>
		<td>${ purchase.buyer.userId}</td>
		<td></td>
	</tr>
	<tr>
		<td>���Ź��</td>
		<td>
			${ purchase.paymentOption == '1  ' ? "���ݱ���" : "�ſ뱸��" }
		</td>
		<td></td>
	</tr>
	<tr>
		<td>�������̸�</td>
		<td>${ purchase.receiverName }</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ڿ���ó</td>
		<td>${ purchase.receiverPhone }</td>
		<td></td>
	</tr>
	<tr>
		<td>�������ּ�</td>
		<td>${ purchase.dlvyAddr }</td>
		<td></td>
	</tr>
		<tr>
		<td>���ſ�û����</td>
		<td>${ purchase.dlvyRequest }</td>
		<td></td>
	</tr>
	<tr>
		<td>����������</td>
		<td>${ purchase.dlvyDate }</td>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>