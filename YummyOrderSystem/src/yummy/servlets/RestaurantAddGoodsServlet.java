package yummy.servlets;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import yummy.model.Goods;
import yummy.model.Restaurant;
import yummy.service.RestaurantService;

import java.io.File;
import java.util.Date;
import java.util.List;
import yummy.model.Photo;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import org.apache.commons.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

import org.apache.commons.*;


/**
 * Servlet implementation class RestaurantAddGoodsServlet
 */
@WebServlet("/RestaurantAddGoodsServlet")
public class RestaurantAddGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static ApplicationContext appliationContext;
	private static RestaurantService restaurantService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestaurantAddGoodsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException {  
    	super.init();
    	appliationContext = new ClassPathXmlApplicationContext("applicationContext1.xml");
    	restaurantService = (RestaurantService)appliationContext.getBean("RestaurantService");
    }  

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		List<String> list=new ArrayList<String>();
		String filename= Photo.getPhotoNewName();
		System.out.println(filename);
		//List<FileItem> items=Photo.getRequsetFileItems(request);

		boolean flag=ServletFileUpload.isMultipartContent(request);
		DiskFileItemFactory factory=new DiskFileItemFactory();
		ServletContext servletContext = this.getServletConfig().getServletContext();
		File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		factory.setRepository(repository);

		ServletFileUpload upload=new ServletFileUpload(factory);
		List<FileItem> lstForms= null;
		try {
			lstForms = upload.parseRequest(request);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}

//		List<FileItem> items=Photo.getRequsetFileItems(request,servletContext)

		boolean isLoadToSQL=false;
		for(FileItem item:lstForms) {
			if (!item.isFormField()) {
				File savePath=new File("images");
				if(!savePath.exists()) {
					savePath.mkdirs();
				}
				System.out.println(item.getSize());
				File uploadFile=new File("C:\\Users\\home\\Yummy\\YummyOrderSystem\\WebContent\\images"+File.separator+filename);

				try{
					item.write(uploadFile);

					System.out.println("保存文件成功");

				}catch(Exception e){
					System.out.println("保存文件失败");
				}

			} else {
				System.out.println(item.getString("UTF-8"));
				list.add(item.getString("UTF-8"));
			}
		}

		String finalPhotoName= "images/"+filename;



		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String quantity = request.getParameter("quantity");



		HttpSession session = request.getSession(true);
        Restaurant res = (Restaurant) session.getAttribute("res");
        
        ArrayList<Goods> newGoods = new ArrayList<Goods>();
        Goods goods = new Goods();
        goods.setRid(res.getRid());
        goods.setFoodName(list.get(0));
        goods.setPrice(Double.parseDouble(list.get(1)));
        goods.setQuantity(Integer.parseInt(list.get(2)));
        goods.setNumber(0);
        goods.setAmount(0);
        goods.setIntroduction(list.get((3)));
        goods.setUrl(finalPhotoName);
        newGoods.add(goods);
        
        System.out.println(restaurantService.addGoods(newGoods));
        
        //���»Ự��
        Restaurant newRes = restaurantService.getRestaurant(Integer.toString(res.getRid()), res.getPassword());
        session.setAttribute("res", newRes);

		try {
			Thread.sleep(10000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		response.sendRedirect("RestaurantInfo.jsp");
	}

}
