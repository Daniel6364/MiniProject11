package com.model2.mvc.service.purchase.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.user.impl.UserServiceImpl;


/*
 *	FileName :  UserServiceTest.java
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml", 
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml", 
										"classpath:config/context-transaction.xml" })
public class PurchaseServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Test
	public void testAddPurchase() throws Exception {
		
		Purchase purchase = new Purchase();

		purchase.setPurchaseProd(productService.getProduct(10000));
		purchase.setBuyer(userService.getUser("user01"));
		purchase.setPaymentOption("1");
		purchase.setReceiverName("testReceiverName1");
		purchase.setReceiverPhone("010-2222-3333");
		purchase.setDlvyAddr("testAddr1");
		purchase.setDlvyRequest("testRequest1");
		purchase.setDlvyDate("2015-04-05");
		
		purchaseService.addPurchase(purchase);

//		purchase = purchaseService.getPurchase(tranNo);

		//==> console Ȯ��
		System.out.println(purchase);
		
		//==> API Ȯ��
//		Assert.assertEquals(11111, purchase.getPurchaseProd().getProdNo());
//		Assert.assertEquals("TestUser1", purchase.getBuyer().getUserId());
		Assert.assertEquals("1", purchase.getPaymentOption());
		Assert.assertEquals("testReceiverName1", purchase.getReceiverName());
		Assert.assertEquals("010-2222-3333", purchase.getReceiverPhone());
		Assert.assertEquals("testAddr1", purchase.getDlvyAddr());
		Assert.assertEquals("testRequest1", purchase.getDlvyRequest());
		Assert.assertEquals("2015-04-05", purchase.getDlvyDate());
	}
	
	//@Test
	public void testGetPurchase() throws Exception {
		
		Purchase purchase = new Purchase();
		//==> �ʿ��ϴٸ�...
//		user.setUserId("testUserId");
//		user.setUserName("testUserName");
//		user.setPassword("testPasswd");
//		user.setSsn("1111112222222");
//		user.setPhone("111-2222-3333");
//		user.setAddr("��⵵");
//		user.setEmail("test@test.com");
		
		// ����
		purchase = purchaseService.getPurchase(10005);

		//==> console Ȯ��
		System.out.println(purchase);
		
		//==> API Ȯ��
		Assert.assertEquals(10004, purchase.getPurchaseProd().getProdNo());
		Assert.assertEquals("user10", purchase.getBuyer().getUserId());
		Assert.assertEquals("2  ", purchase.getPaymentOption());
		Assert.assertEquals("����", purchase.getReceiverName());
		Assert.assertEquals("01054876548", purchase.getReceiverPhone());
		Assert.assertEquals("������", purchase.getDlvyAddr());
		Assert.assertEquals("�ҳ�ô�", purchase.getDlvyRequest());

		Assert.assertNotNull(purchaseService.getPurchase(10005));
	}
	
	//@Test
		public void testGetPurchase2() throws Exception {
			
			Purchase purchase = new Purchase();
			//==> �ʿ��ϴٸ�...
//			user.setUserId("testUserId");
//			user.setUserName("testUserName");
//			user.setPassword("testPasswd");
//			user.setSsn("1111112222222");
//			user.setPhone("111-2222-3333");
//			user.setAddr("��⵵");
//			user.setEmail("test@test.com");
			
			// �迬��
			purchase = purchaseService.getPurchase2(10002);

			//==> console Ȯ��
			System.out.println(purchase);
			
			//==> API Ȯ��
			Assert.assertEquals(10003, purchase.getTranNo());

			Assert.assertNotNull(purchaseService.getPurchase2(10002));
		}
	
	
	//@Test
	 public void testUpdatePurchase() throws Exception{
		 
		Purchase purchase = purchaseService.getPurchase(10005);
		Assert.assertNotNull(purchase);
		
		Assert.assertEquals("user10", purchase.getBuyer().getUserId());
		Assert.assertEquals("2  ", purchase.getPaymentOption());
		Assert.assertEquals("����", purchase.getReceiverName());
		Assert.assertEquals("01054876548", purchase.getReceiverPhone());
		Assert.assertEquals("������", purchase.getDlvyAddr());
		Assert.assertEquals("�ҳ�ô�", purchase.getDlvyRequest());
		Assert.assertEquals("2  ", purchase.getTranCode());

		purchase.setPaymentOption("1  ");
		purchase.setReceiverName("Ƽ�Ĵ�");
		purchase.setReceiverPhone("01066666666");
		purchase.setDlvyAddr("����õ");
		purchase.setDlvyRequest("Ƽ�ĴϿ��� ��ħ��");
		purchase.setDlvyDate("2017-11-18");
		
		purchaseService.updatePurchase(purchase);
		
		purchase = purchaseService.getPurchase(10005);
		Assert.assertNotNull(purchase);
		
		//==> console Ȯ��
		System.out.println(purchase);
			
		//==> API Ȯ��
		Assert.assertEquals("user10", purchase.getBuyer().getUserId());
		Assert.assertEquals("1  ", purchase.getPaymentOption());
		Assert.assertEquals("Ƽ�Ĵ�", purchase.getReceiverName());
		Assert.assertEquals("01066666666", purchase.getReceiverPhone());
		Assert.assertEquals("����õ", purchase.getDlvyAddr());
		Assert.assertEquals("Ƽ�ĴϿ��� ��ħ��", purchase.getDlvyRequest());

	 }
	 
	// @Test
	public void testGetPurchaseListAll() throws Exception {

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		Purchase purchase = new Purchase();

		purchase.setBuyer(userService.getUser("user10"));
		String buyerId = purchase.getBuyer().getUserId();

		Map<String, Object> map = purchaseService.getPurchaseList(search, buyerId);

		List<Object> list = (List<Object>) map.get("list");
		Assert.assertEquals(3, list.size());

		// ==> console Ȯ��
		System.out.println(list);

		Integer totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);

		System.out.println("=======================================");

		search.setCurrentPage(1);
		search.setPageSize(3);
		map = purchaseService.getPurchaseList(search, buyerId);

		list = (List<Object>) map.get("list");
		Assert.assertEquals(3, list.size());

		// ==> console Ȯ��
		// System.out.println(list);

		totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);
	}
	 
}