<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="EUC-KR">
<title>listPurchase.jsp</title>

	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

//�˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
function fncGetList(currentPage) {
	$("#currentPage").val(currentPage)
	$('form').attr("method", "POST").attr("action", "/purchase/listPurchase").submit();
}


$( function(){
	$('td:nth-child(1)').bind("click", function(){
		var tranNo = $( $('td:nth-child(1) input[name="tranNo"]')[$('td:nth-child(1)').index(this)] ).val(); 
		self.location = "/purchase/getPurchase?tranNo=" + tranNo
	});
});


$( function(){
	$('td:nth-child(2)').bind("click", function(){
		var buyerUserId = $( $('td:nth-child(2) input[name="buyerUserId"]')[$('td:nth-child(2)').index(this)] ).val(); 
		self.location = "/user/getUser?userId=" + buyerUserId
	});
});


$( function(){
	$('td:nth-child(6)').bind("click", function(){
		var tranNo = $( $('input[name="tranNo"]')[$('td:nth-child(6)').index(this)] ).val(); 
	
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

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>���Ÿ����ȸ</h3>
	    </div>

	<!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage} ������
		    	</p>
		    </div>

			<div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
    	</div>
    	
    	<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left">����ȸ��ID</th>
            <th align="left">�����Ǻ� �̸�</th>
            <th align="left">�����Ǻ� ��ȭ��ȣ</th>
            <th align="left">�����Ȳ</th>
            <th align="left">��������</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">
			  	<input type="hidden" name="tranNo" value="${ purchase.tranNo }">${ i }
		  	  </td>
			  
			  <td align="left">
				<input type="hidden" name="buyerUserId" value="${ purchase.buyer.userId }">${ purchase.buyer.userId }
	          </td>
			  
			  <td align="left">${ purchase.receiverName }</td>
			  
			  <td align="left">${ purchase.receiverPhone }</td>
			  
			  <td align="left">����
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
			  
			  <td align="left">
			  	<c:if test="${ purchase.tranCode == '1' }">
					<input type="hidden" name="tranNo" value="${ purchase.tranNo }">���ǵ���
				</c:if>
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
		<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
					
</body>
 
</html>