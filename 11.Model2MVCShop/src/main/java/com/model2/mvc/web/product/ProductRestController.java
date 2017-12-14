package com.model2.mvc.web.product;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.ProductService;


//==> ��ǰ���� Controller
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method ���� ����
		
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	//@RequestMapping( value="json/addProduct", method=RequestMethod.POST)
	public Product addProduct( @RequestBody Product product ) throws Exception {

		System.out.println("/product/json/addProduct : POST");
		
		//Business Logic
		System.out.println("::" + product);
		
		productService.addProduct(product);
		
		return product;
	}

	// FileUpload 1.
	//@RequestMapping( value="addProduct", method=RequestMethod.POST )
	public String addProduct( @ModelAttribute("product") Product product, 
			HttpServletRequest request, HttpServletResponse response, 
			Model model) throws Exception {

		System.out.println("/product/addProduct : POST");

		//FileUpload
		if(FileUpload.isMultipartContent(request)) {
			System.out.println("[1] IF loop");
			String temDir = "C:\\Users\\bitcamp\\git\\MiniProject07\\07.Model2MVCShop(URI,pattern)\\WebContent\\images\\uploadFiles";
			
			DiskFileUpload fileUpload = new DiskFileUpload();
			fileUpload.setRepositoryPath(temDir);
			fileUpload.setSizeMax(1024 * 1024 * 10);
			fileUpload.setSizeThreshold(1024*100);
			
			if (request.getContentLength() < fileUpload.getSizeMax()) {
				System.out.println("[2] IF loop");
				StringTokenizer token = null;
				
				List fileItemList = fileUpload.parseRequest(request);
				int Size = fileItemList.size();
				for (int i = 0; i < Size; i++) {
					FileItem fileItem = (FileItem) fileItemList.get(i);
					
					if (fileItem.isFormField()) {
						System.out.println("[3] IF loop");
						if (fileItem.getFieldName().equals("manuDate")) {
							System.out.println("[4] IF loop");
							token = new StringTokenizer(fileItem.getString("euc-kr"), "-");
							String manuDate = token.nextToken() + token.nextToken() + token.nextToken();
							product.setManuDate(manuDate);
						}
						else if (fileItem.getFieldName().equals("prodName"))
							product.setProdName(fileItem.getString("euc-kr"));
						else if (fileItem.getFieldName().equals("prodDetail"))
							product.setProdDetail(fileItem.getString("euc-kr"));
						else if (fileItem.getFieldName().equals("price"))
							product.setPrice(Integer.parseInt(fileItem.getString("euc-kr")));
					} else {
						if (fileItem.getSize() > 0) {
							System.out.println("[5] IF loop");
							int idx = fileItem.getName().lastIndexOf("\\");
							if (idx == -1) {
								System.out.println("[6] IF loop");
								idx = fileItem.getName().lastIndexOf("/");
							}
							String fileName = fileItem.getName().substring(idx + 1);
							product.setFileName(fileName);
							try {
								File uploadedFile = new File(temDir, fileName);
								fileItem.write(uploadedFile);
							} catch (IOException e) {
								System.out.println(e);
							}
						} else {
							product.setFileName("../../images/empty.GIF");
						}
					}
				} 
				
				productService.addProduct(product);
				request.setAttribute("product", product);
				
			} else {
				int overSize = (request.getContentLength() / 1000000);
				System.out.println("<script>alert('������ ũ��� 1MB���� �Դϴ�. "
						+ "�ø��� ���� �뷮�� " + overSize + "MB �Դϴ�.');" );
				System.out.println("history.back();</script>");
			}
		} else {
			System.out.println("���ڵ� Ÿ���� multipart/form-data�� �ƴմϴ�.");
		}
		
		return "forward:/product/getProduct.jsp";
	}
	
	// FileUpload 2.
	@RequestMapping( value="json/addProduct", method=RequestMethod.POST )
	public Product addProduct( @RequestBody Product product, 
			MultipartHttpServletRequest mRequest,
			MultipartFile multipartFile ) throws Exception {

		System.out.println("/product/json/addProduct : POST");

		// SpringFramework FileUpload
		String temDir = "C:\\Users\\bitcamp\\git\\MiniProject10\\10.Model2MVCShop(Ajax)\\WebContent\\images\\uploadFiles";
			
		multipartFile = mRequest.getFile("fileNames");

		if (!multipartFile.isEmpty()) {
			System.out.println("[multipartFile check in if loop]");
			System.out.println(multipartFile.toString());
			
		File file = new File(temDir, multipartFile.getOriginalFilename());
		
		multipartFile.transferTo(file);
		product.setFileName(multipartFile.getOriginalFilename());
			
		}
		
		productService.addProduct(product);
		
		return product;
	}	
	
	@RequestMapping( value="json/getProduct/{prodNo}", method=RequestMethod.GET)
	public Product getProduct( @PathVariable String prodNo ) throws Exception {
		
		System.out.println("/product/json/getProduct : GET");
		
			return	productService.getProduct(Integer.parseInt(prodNo));
	}
	
	//@RequestMapping( value="json/updateProduct", method=RequestMethod.GET)
	public String updateProduct( @RequestParam("prodNo") String prodNo , 
			Model model ) throws Exception{

		System.out.println("/product/updateProduct : GET");
		//Business Logic
		Product product = productService.getProduct(Integer.parseInt(prodNo));
		// Model �� View ����
		model.addAttribute("product", product);
		
		return "forward:/product/updateProductView.jsp";
	}

	@RequestMapping( value="json/updateProduct", method=RequestMethod.POST)
	public Product updateProduct( @RequestBody Product product,
			MultipartHttpServletRequest mRequest,
			MultipartFile multipartFile ) throws Exception{

		System.out.println("/product/json/updateProduct : POST");
		//Business Logic
		
		// SpringFramework FileUpload
		String temDir = "C:\\Users\\bitcamp\\git\\MiniProject10\\10.Model2MVCShop(Ajax)\\WebContent\\images\\uploadFiles";

		multipartFile = mRequest.getFile("fileNames");

		if (!multipartFile.isEmpty()) {
			System.out.println("[multipartFile check in if loop]");
			System.out.println(multipartFile.toString());

			File file = new File(temDir, multipartFile.getOriginalFilename());

			multipartFile.transferTo(file);
			product.setFileName(multipartFile.getOriginalFilename());

		}
		
		productService.updateProduct(product);
		
		return product;
	}
	
	@RequestMapping( value="json/getProductList" )
	public Map listProduct( @RequestBody Search search ) throws Exception{
		
		System.out.println("/product/json/getProductList : GET / POST");
				
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		/* Price Searching
		if (lowPriceCondition.equals("lowPrice")) {
			search.setSearchPrice(lowPriceCondition);
		} else if (highPriceCondition.equals("highPrice")) {
			search.setSearchPrice(highPriceCondition);
		}
		//*/
		
		// Business logic ����
		Map<String , Object> map = productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), 
				((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);

		// Model �� View ����
		map.put("resultPage", resultPage);
		map.put("search", search);

		return map;
		
	}
	
	
	
	
	
	
}