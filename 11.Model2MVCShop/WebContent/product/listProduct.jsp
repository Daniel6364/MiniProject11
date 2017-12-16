<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="EUC-KR">

<title>listProduct.jsp</title>

<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
<!-- <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
        pre {
        	background-color: aqua;
        }
    </style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

//�˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
function fncGetList(currentPage) {
	
	$("#currentPage").val(currentPage);
	$("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${ menu }").submit();
	
}

function fncLowPrice(currentPage) {
   	
	$("#currentPage").val(currentPage)
   	$("#lowPriceSearch").val("lowPrice")
 	$("#highPriceSearch").val(null)
	$("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${ menu }").submit();
}
 
function fncHighPrice(currentPage) {
	
	$("#currentPage").val(currentPage)
   	$("#lowPriceSearch").val(null)
   	$("#highPriceSearch").val("highPrice")
	$("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${ menu }").submit();
}

$(function(){
	$( "button.btn.btn-default:contains('�˻�')").bind("click", function(){
		fncGetList('${ search.currentPage }');
	});
});

$(function(){
	$("button:contains('�������ݼ�')").bind("click", function(){
		fncLowPrice('${ search.currentPage }');
	});
});
				
$(function(){
	$("a[role='button' ]").bind("click", function(){
		fncHighPrice('${ search.currentPage }');
	});
});

$(function(){
	
//	$( ".ct_list_pop td:nth-child(5)" ).bind("mouseenter" , function() {
	$( "td:nth-child(6) > i" ).bind("click" , function() {

		var proTranCode = $( $('input[name="proTranCode"]')[$( "td:nth-child(6) > i" ).index(this)] ).val();
		var prodNo = $( $('td:nth-child(6) input[name="prodNo"]')[$( "td:nth-child(6)  > i" ).index(this)] ).val();
		
			if (proTranCode == '' || proTranCode == null) {
			var prodName = $(this).next().val().trim();
			
				$.ajax (
						{
							url : "/product/json/getProduct/" + prodNo ,
							method : "GET",
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {
								var displayValue = "<h5><pre>"
													+"�� ǰ �� ȣ  : " + JSONData.prodNo + "<br/>"
													+"��  ǰ  �� : " + JSONData.prodName + "<br/>"
													+"��ǰ �̹��� : " + JSONData.fileName + "<br/>"
													+"��ǰ������ : " + JSONData.prodDetail + "<br/>"
													+"�� �� �� �� : " + JSONData.manuDate + "<br/>"
													+"��  �� : " + JSONData.price + " �� <br/>"
													+"�� �� �� �� : " + JSONData.regDate + "<br/>"
													+ "</pre></h5>";

								$("h4").remove();
								$("h5").remove();					
								$( "#"+prodName+"" ).html(displayValue);
							}
					
				}); // end of $.ajax
				
			
			} 
			else if (proTranCode != null) {
				var prodName = $(this).next().val().trim();
				
				$.ajax (
						{
							url : "/product/json/getProduct/" + prodNo ,
							method : "GET",
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {
								var displayValue = '<h4><font color="red">' + "�ش��ǰ�� ���� �����Ͻ� �� �����ϴ�. [������]" 
													+ "</font></h4><br/>"
													+ "<h5><pre>"
													+"�� ǰ �� ȣ : " + JSONData.prodNo + "<br/>"
													+"��  ǰ  �� : " + JSONData.prodName + "<br/>"
													+"��ǰ �̹��� : " + JSONData.fileName + "<br/>"
													+"��ǰ������ : " + JSONData.prodDetail + "<br/>"
													+"�� �� �� �� : " + JSONData.manuDate + "<br/>"
													+"��  �� : " + JSONData.price + " �� <br/>"
													+"�� �� �� �� : " + JSONData.regDate + "<br/>"
													+ "</pre></h5>";
													
								$("h4").remove();
								$("h5").remove();
								$( "#"+prodName+"" ).html(displayValue);
							}
				}); // end of $.ajax
			}
		
	});
		
});

$(function(){
	
	$( "tbody td:nth-child(3)" ).bind("dblclick" , function() {
		
		var proTranCode = $( $('input[name="proTranCode"]')[$( "tbody td:nth-child(3)" ).index(this)] ).val();
		var prodNo = $( $('input[name="prodNo"]')[$( "tbody td:nth-child(3)" ).index(this)] ).val();
		
		if ( "${user.userId}" != 'admin' && "${user.userId}" != 'manager' ) { 
			if (proTranCode == '' || proTranCode == null) {
				self.location ="/product/getProduct?prodNo=" + prodNo + "&menu=${ menu }";
			} else {
				alert("�ش��ǰ�� ���� �����Ͻ� �� �����ϴ�.")
			}
		} else {
			self.location ="/product/getProduct?prodNo=" + prodNo + "&menu=${ menu }";
		}
	
	});
});


$(function(){
	$( "tbody td:nth-child(5):contains('����ϱ�')" ).bind("click" , function() {
		
		var prodNo = $( $('input[name="prodNo"]')[$( "tbody td:nth-child(5)" ).index(this)] ).val();
			
	$.ajax({
						url : "/purchase/json/updateTranCodeByProd/" + prodNo + "/1",
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
	       <h3>${ menu == 'manage' ? "�ǸŻ�ǰ����" : "�ǸŻ�ǰ���" }</h3>
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
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				  <!-- �������Ŀ� ���� ���� ������ �κ� -->
				  <input type="hidden" class="lowPrice" id="lowPriceSearch" name="lowPriceCondition" value=""/>
				  <input type="hidden" class="highPrice" id="highPriceSearch" name="highPriceCondition" value=""/>
				  
				</form>
	    	</div>
	    	
    	<div class="col-md-6 text-left">
    		<p>
	  			<button type="button" class="btn btn-info btn-xs" >
	  				<span class="glyphicon glyphicon-sort-by-attributes" aria-hidden="true"></span> �������ݼ�
	  			</button> 
   		  		<a class="btn btn-info btn-xs" href="#" role="button">
   		  			<span class="glyphicon glyphicon-sort-by-attributes-alt" aria-hidden="true"></span>
   		  				�������ݼ�
   		  		</a>
			</p>
		</div>

    	</div>
    	
    	<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left">��ǰ�̹���</th>
            <th align="left">��ǰ��</th>
            <th align="left">����</th>
            <th align="left">${ menu == 'manage' ? "�����Ȳ" : "�Ǹ���Ȳ" }</th>
            <th align="left">��������</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  
			  <td align="left">
			  	<c:if test = "${ empty product.fileName }">
					<img src="http://placehold.it/50X50" />
				</c:if>
				<c:if test = "${ product.fileName != null }">
					<img src="/images/uploadFiles/${ product.fileName }" height="50px"/>
				</c:if>
			  </td>
			  
		  	  <td align="left" title="Click : ��ǰ���� Ȯ��">
					${ product.prodName }
		  	  </td>
		  	  
			  <td align="left">${ product.price }</td>
			  
			  <td align="left">
			  	<c:if test = "${ menu == 'search' }">
					<c:if test = "${ product.proTranCode == null }">�Ǹ���</c:if> 
					<c:if test = "${ product.proTranCode != null }">��� ����</c:if>
				</c:if>
				<c:if test = "${ menu == 'manage' }">
					<c:if test = "${ product.proTranCode == null }">�Ǹ���</c:if>
					<c:if test = "${ product.proTranCode == '0' }">���ſϷ� 
						<input type="hidden" name="prodNo" value="${ product.prodNo }">����ϱ�
					</c:if>
					<c:if test = "${ product.proTranCode == '1' }">�����</c:if>
					<c:if test = "${ product.proTranCode == '2' }">��ۿϷ�</c:if>
				</c:if>
			  </td>
			  
			  <td align="left"  >
			  	<i class="glyphicon glyphicon-ok" id="${ product.prodName }"></i>
				<input type="hidden" name="prodName" value="${ product.prodName }">		  
				<input type="hidden" name="prodNo" value="${ product.prodNo }">
				<input type="hidden" name="proTranCode" value="${ product.proTranCode }">
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
