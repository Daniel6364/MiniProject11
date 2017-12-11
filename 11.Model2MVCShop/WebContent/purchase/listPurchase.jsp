<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="EUC-KR">
<title>listPurchase.jsp</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

//�˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
function fncGetList(currentPage) {
	$("#currentPage").val(currentPage)
	$('form').attr("method", "POST").attr("action", "/purchase/listPurchase").submit();
}


$( function(){
	$('.ct_list_pop td:nth-child(1)').bind("click", function(){
		var tranNo = $( $('input[name="tranNo"]')[$('.ct_list_pop td:nth-child(1)').index(this)] ).val(); 
		self.location = "/purchase/getPurchase?tranNo=" + tranNo
	});
});


$( function(){
	$('.ct_list_pop td:nth-child(3)').bind("click", function(){
		var buyerUserId = $( $('input[name="buyerUserId"]')[$('.ct_list_pop td:nth-child(3)').index(this)] ).val(); 
		self.location = "/user/getUser?userId=" + buyerUserId
	});
});


$( function(){
	$('.ct_list_pop td:contains("���ǵ���")').bind("click", function(){
		var tranNo = $( $('input[name="tranNo"]')[$('.ct_list_pop td:nth-child(11)').index(this)] ).val(); 
	//	self.location = "/purchase/updateTranCode?tranNo=" + tranNo + "&tranCode=2"
	
	$.ajax({
						url : "/purchase/json/updateTranCode/" + tranNo + "/2",
						method : "GET",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {
							location.reload();
						}

					}); // end of $.ajax
				});
	});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td colspan="11" >
			��ü  ${ resultPage.totalCount } �Ǽ�, ���� ${ resultPage.currentPage } ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="80">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="120">����ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="120">�޴���</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�޴��� ��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${ list }">
		<c:set var="i" value="${ i + 1 }" />
	<tr class="ct_list_pop">
		<td align="center">
			<input type="hidden" name="tranNo" value="${ purchase.tranNo }">${ i }
		</td>
		<td></td>
		<td align="center">
			<input type="hidden" name="buyerUserId" value="${ purchase.buyer.userId }">${ purchase.buyer.userId }
		</td>
		<td></td>
		<td align="center">${ purchase.receiverName }</td>
		<td></td>
		<td align="center">${ purchase.receiverPhone }</td>
		<td></td>
		<td align="center"> ����
			<c:if test="${ purchase.tranCode == '0' }">
				���ſϷ�
			</c:if>
			<c:if test="${ purchase.tranCode == '1' }">
				�����
			</c:if>
			<c:if test="${ purchase.tranCode == '2' }">
				��ۿϷ�
			</c:if> ���� �Դϴ�.
		</td>
		<td></td>
		<td align="center">
			<c:if test="${ purchase.tranCode == '1' }">
				<input type="hidden" name="tranNo" value="${ purchase.tranNo }">���ǵ���
			</c:if>
		</td>
	</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
		
			<jsp:include page="../common/pageNavigator.jsp"/>
		
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>