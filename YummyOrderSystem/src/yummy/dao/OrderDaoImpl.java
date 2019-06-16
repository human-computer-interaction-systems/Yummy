package yummy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Repository;

import yummy.model.Client;
import yummy.model.Goods;
import yummy.model.Order;
@Repository
public class OrderDaoImpl implements OrderDao{
	private static OrderDaoImpl orderDao = new OrderDaoImpl();
	private static DaoHelper daoHelper = DaoHelperImpl.getBaseDaoInstance();
	
	private OrderDaoImpl() {
		
	}
	
	public static OrderDaoImpl getInstance() {
		return orderDao;
	}

	@Override
	public boolean newOrder(Order order) {
		// TODO Auto-generated method stub
		//INSERT INTO `order` (`cid`, `rid`, `totalAmount`, `caddress`, `orderTime`, `isDelivery`, `isDisorder`) VALUES ('1', '1903001', '12', '�½ֿ�', '20190301190000', '0', '0')
		//INSERT INTO `ordergoods` (`oid`, `rid`, `foodName`, `number`, `amount`) VALUES ('1', '1903001', '��Ȫˮ', '6', '12')
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		boolean resultFlag = true;
		
		
		
		try 
		{
			//order�������
			stmt = con.prepareStatement("INSERT INTO `order` (`cid`, `rid`, `totalAmount`, `caddress`, `orderTime`, `isDelivery`, `isDisorder`) VALUES (? , ? , ? , ? , ? , ? , ? )");
			stmt.setInt(1, order.getCid());
			stmt.setInt(2, order.getRid());
			stmt.setDouble(3, order.getTotalAmount());
			stmt.setString(4, order.getCaddress());
			
			Calendar cale = null;  
	        cale = Calendar.getInstance();  
	       
	        SimpleDateFormat f = new SimpleDateFormat("yyMMddHHmmss");
	        String orderTime = f.format(cale.getTime());//��ȡ����ʱ��
			stmt.setString(5, orderTime);
			
			stmt.setInt(6, 0);//����δ�ʹ�
			stmt.setInt(7, 0);//����δȡ��
			
			int updateResult = stmt.executeUpdate();
			if(updateResult == 0)
				resultFlag = false;
			
			//��ȡ������oid
			stmt = con.prepareStatement("select * from `order` where cid = ? and rid = ? and orderTime = ?");
			stmt.setInt(1, order.getCid());
			stmt.setInt(2, order.getRid());
			stmt.setString(3, orderTime);
			result = stmt.executeQuery();
			
			int oid = 0;
			
			if(result.next()) {
				oid = result.getInt("oid");
			}
			
			System.out.println("oid: "+oid);
			
			//ordergoods�����
			int numOfGoods = order.getGoods().size();//������Ʒ����
			
			//sql����������
			stmt = con.prepareStatement("INSERT INTO `ordergoods` (`oid`, `rid`, `foodName`, `number`, `amount`) VALUES (? ,? ,? ,? ,? )");
				
			for(int i = 0; i < numOfGoods; i++) {
				Goods aGoods = order.getGoods().get(i);
				stmt.setInt(1, oid);
				stmt.setInt(2, aGoods.getRid());
				stmt.setString(3, aGoods.getFoodName());
				stmt.setInt(4, aGoods.getNumber());
				stmt.setDouble(5, aGoods.getAmount());
				stmt.addBatch();
			}
			
			stmt.executeBatch();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			daoHelper.closeConnection(con);
			daoHelper.closePreparedStatement(stmt);
			daoHelper.closeResult(result);
		}
		return resultFlag;
	}

	@Override
	public boolean cancelOrder(Order order) {
		// TODO Auto-generated method stub
		//ʮ��������ȫ���˿ʮ���ӵ���Сʱ��80%������yummy����Сʱ�Ժ���ȡ���������ܷ�ȡ����ǰ���жϣ��˺���Ĭ�Ͽ���ȡ������
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		boolean resultFlag = true;
		
		//������������
		String orderTime = order.getOrderTime();
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date obefore = null;
		try {
			obefore = f.parse(orderTime);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Date now = new Date();
		
		long nd = 1000 * 24 * 60 * 60;
		long nh = 1000 * 60 * 60;
		long nm = 1000 * 60;
		System.out.println("now: "+f.format(now.getTime()));
		System.out.println("before: "+f.format(obefore.getTime()));
		long diff = now.getTime() - obefore.getTime();
		long min = diff % nd % nh / nm;
		
		System.out.println("�� "+min+" ����");
		
		double refundAmount = 0;
		double sysIncome = 0;
		
		if(min <= 20) {
			refundAmount = order.getTotalAmount();
			sysIncome = 0;
		}else if(min <= 30 && min > 20){
			refundAmount = order.getTotalAmount() * 0.8;
			sysIncome = order.getTotalAmount() * 0.2;
		}
		
		try 
		{
			//����order��
			stmt = con.prepareStatement("UPDATE `order` SET isDisorder = 1 , restaurantIncome = 0, refundAmount = ?, sysIncome = ?  WHERE oid = ? ");
			stmt.setDouble(1, refundAmount);
			stmt.setDouble(2, sysIncome);
			stmt.setInt(3, order.getOid());
			
			int updateResult = stmt.executeUpdate();
			if(updateResult == 0)
				resultFlag =  false;
			
			//�˿����Ա������client��
			//update client set balance = balance + 120 where cid = 2;
			stmt = con.prepareStatement("update client set balance = balance + ? where cid = ?");
			stmt.setDouble(1, refundAmount);
			stmt.setInt(2, order.getCid());
			
			updateResult = stmt.executeUpdate();
			if(updateResult == 0)
				resultFlag =  false;
			
			//ϵͳ��õ����룬����manager��
			//update manager set sysBalance = sysBalance + 100;
			stmt = con.prepareStatement("update manager set sysBalance = sysBalance + ?");
			stmt.setDouble(1, sysIncome);
			updateResult = stmt.executeUpdate();
			if(updateResult == 0)
				resultFlag =  false;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			daoHelper.closeConnection(con);
			daoHelper.closePreparedStatement(stmt);
			daoHelper.closeResult(result);
		}
		
		return resultFlag;
	}

	@Override
	public boolean affirmOrder(Order order) {
		// TODO Auto-generated method stub
		// �����ʹϵͳ֧������������ȡ1%�����
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		boolean resultFlag = true;
		
		double restaurantIncome = order.getTotalAmount()*0.99;
		double sysIncome = order.getTotalAmount()*0.01;
		
		try 
		{
			//����order��,�����ʹ�ʱ����
			
			stmt = con.prepareStatement("UPDATE `order` SET isDelivery = 1 , refundAmount = 0, restaurantIncome = ?, sysIncome = ?, deliveryTime = ?  WHERE oid = ? ");
			stmt.setDouble(1, restaurantIncome);
			stmt.setDouble(2, sysIncome);
			stmt.setInt(4, order.getOid());
			
			Calendar cale = null;  
	        cale = Calendar.getInstance();  
	       
	        SimpleDateFormat f = new SimpleDateFormat("yyMMddHHmmss");
	        String orderTime = f.format(cale.getTime());//��ȡ����ʱ��
			stmt.setString(3, orderTime);
			
			int updateResult = stmt.executeUpdate();
			if(updateResult == 0)
				resultFlag =  false;
			
			//���������������restaurant��
			//update client set balance = balance + 120 where cid = 2;
			stmt = con.prepareStatement("update restaurant set balance = balance + ? where rid = ?");
			stmt.setDouble(1, restaurantIncome);
			stmt.setInt(2, order.getRid());
			
			updateResult = stmt.executeUpdate();
			if(updateResult == 0)
				resultFlag =  false;
			
			//ϵͳ�õ����룬����manager��
			//update manager set sysBalance = sysBalance + 100;
			stmt = con.prepareStatement("update manager set sysBalance = sysBalance + ?");
			stmt.setDouble(1, sysIncome);
			updateResult = stmt.executeUpdate();
			if(updateResult == 0)
				resultFlag =  false;
			
			//������ɺ��޸Ŀ������
			//update rfood set quantity = quantity - 10 where rid = 1903001 and foodName = "��Ȫˮ";
			int numOfGoods = order.getGoods().size();//������Ʒ��������
			
			//sql����������
			stmt = con.prepareStatement("update rfood set quantity = quantity - ? where rid = ? and foodName = ?");
				
			for(int i = 0; i < numOfGoods; i++) {
				Goods aGoods = order.getGoods().get(i);
				stmt.setInt(1, aGoods.getNumber());
				stmt.setInt(2, aGoods.getRid());
				stmt.setString(3, aGoods.getFoodName());
				stmt.addBatch();
			}
			
			stmt.executeBatch();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			daoHelper.closeConnection(con);
			daoHelper.closePreparedStatement(stmt);
			daoHelper.closeResult(result);
		}
		
		return resultFlag;
	}

	@Override
	public ArrayList<Order> getClientOrders(int cid) {
		// TODO Auto-generated method stub
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		ResultSet result2 = null;
		
		ArrayList<Order> orders = new ArrayList<Order>();
		
		try 
		{
			stmt = con.prepareStatement("select * from `order` where cid = ?");
			stmt.setInt(1, cid);
			result = stmt.executeQuery();
			
			
			
			while(result.next()) {
				Order order = new Order();
				order.setGoods(new ArrayList<Goods>());
				int oid = 0;
				oid = result.getInt("oid");
				order.setOid(oid);
				order.setCid(result.getInt("cid"));
				order.setRid(result.getInt("rid"));
				order.setTotalAmount(result.getDouble("totalAmount"));
				order.setRefundAmount(result.getDouble("refundAmount"));
				order.setRestaurantIncome(result.getDouble("restaurantIncome"));
				order.setSysIncome(result.getDouble("sysIncome"));
				order.setCaddress(result.getString("caddress"));

				if(result.getTime("deliveryTime")!=null) {
					order.setDeliveryTime(result.getString("deliveryTime"));
				}else {
					order.setDeliveryTime("");
				}
				
				order.setOrderTime(result.getString("orderTime"));
				
				if(result.getInt("isDelivery") == 1) {
					order.setDelivery(true);
				}else {
					order.setDelivery(false);
				}
				if(result.getInt("isDisorder") == 1) {
					order.setDisorder(true);
				}else {
					order.setDisorder(false);
				}
				
				//�����Ʒ
				//select * from ordergoods o, rfood r where o.rid = r.rid and o.foodName = r.foodName and o.oid = 1;
				stmt = con.prepareStatement("select * from ordergoods o, rfood r where o.rid = r.rid and o.foodName = r.foodName and o.oid = ? ");
				stmt.setInt(1, oid);
				result2 = stmt.executeQuery();
				
				ArrayList<Goods> tempGoods = order.getGoods();
				while(result2.next()) {
					Goods goods = new Goods();
					goods.setRid(result2.getInt("rid"));
					goods.setFoodName(result2.getString("foodName"));
					goods.setNumber(result2.getInt("number"));
					goods.setPrice(result2.getDouble("price"));
					goods.setAmount(result2.getDouble("amount"));
					goods.setQuantity(result2.getInt("quantity"));
					tempGoods.add(goods);
				}
				order.setGoods(tempGoods);
				orders.add(order);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			daoHelper.closeConnection(con);
			daoHelper.closePreparedStatement(stmt);
			daoHelper.closeResult(result);
			daoHelper.closeResult(result2);
		}
		
		return orders;
	}

	@Override
	public ArrayList<Order> getRestaurantOrders(int rid) {
		// TODO Auto-generated method stub
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		ResultSet result2 = null;
		
		ArrayList<Order> orders = new ArrayList<Order>();
		
		try 
		{
			stmt = con.prepareStatement("select * from `order` where rid = ?");
			stmt.setInt(1, rid);
			result = stmt.executeQuery();
			
		
			
			while(result.next()) {
				Order order = new Order();
				order.setGoods(new ArrayList<Goods>());
				int oid = 0;
				oid = result.getInt("oid");
				order.setOid(oid);
				order.setCid(result.getInt("cid"));
				order.setRid(result.getInt("rid"));
				order.setTotalAmount(result.getDouble("totalAmount"));
				order.setRefundAmount(result.getDouble("refundAmount"));
				order.setRestaurantIncome(result.getDouble("restaurantIncome"));
				order.setSysIncome(result.getDouble("sysIncome"));
				order.setCaddress(result.getString("caddress"));

				if(result.getTime("deliveryTime")!=null) {
					order.setDeliveryTime(result.getString("deliveryTime"));
				}else {
					order.setDeliveryTime("");
				}
				
				order.setOrderTime(result.getString("orderTime"));
				
				if(result.getInt("isDelivery") == 1) {
					order.setDelivery(true);
				}else {
					order.setDelivery(false);
				}
				if(result.getInt("isDisorder") == 1) {
					order.setDisorder(true);
				}else {
					order.setDisorder(false);
				}
				
				//�����Ʒ
				//select * from ordergoods o, rfood r where o.rid = r.rid and o.foodName = r.foodName and o.oid = 1;
				stmt = con.prepareStatement("select * from ordergoods o, rfood r where o.rid = r.rid and o.foodName = r.foodName and o.oid = ? ");
				stmt.setInt(1, oid);
				result2 = stmt.executeQuery();
				
				ArrayList<Goods> tempGoods = order.getGoods();
				while(result2.next()) {
					Goods goods = new Goods();
					goods.setRid(result2.getInt("rid"));
					goods.setFoodName(result2.getString("foodName"));
					goods.setNumber(result2.getInt("number"));
					goods.setPrice(result2.getDouble("price"));
					goods.setAmount(result2.getDouble("amount"));
					goods.setQuantity(result2.getInt("quantity"));
					tempGoods.add(goods);
				}
				order.setGoods(tempGoods);
				orders.add(order);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			daoHelper.closeConnection(con);
			daoHelper.closePreparedStatement(stmt);
			daoHelper.closeResult(result);
			daoHelper.closeResult(result2);
		}
		
		return orders;
	}

	@Override
	public Order getOrder(int oid) {
		// TODO Auto-generated method stub
		
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		Order order = new Order();
		order.setGoods(new ArrayList<Goods>());
		
		try 
		{
			stmt = con.prepareStatement("select * from `order` where oid = ?");
			stmt.setInt(1, oid);
			result = stmt.executeQuery();
			
			if(result.next()) {
				order.setOid(oid);
				order.setCid(result.getInt("cid"));
				order.setRid(result.getInt("rid"));
				order.setTotalAmount(result.getDouble("totalAmount"));
				order.setRefundAmount(result.getDouble("refundAmount"));
				order.setRestaurantIncome(result.getDouble("restaurantIncome"));
				order.setSysIncome(result.getDouble("sysIncome"));
				order.setCaddress(result.getString("caddress"));
				
				if(result.getTime("deliveryTime")!=null) {
					order.setDeliveryTime(result.getString("deliveryTime"));
				}else {
					order.setDeliveryTime("");
				}
				
				order.setOrderTime(result.getString("orderTime"));
				
				if(result.getInt("isDelivery") == 1) {
					order.setDelivery(true);
				}else {
					order.setDelivery(false);
				}
				if(result.getInt("isDisorder") == 1) {
					order.setDisorder(true);
				}else {
					order.setDisorder(false);
				}
				
				
			}
			//�����Ʒ
			//select * from ordergoods o, rfood r where o.rid = r.rid and o.foodName = r.foodName and o.oid = 1;
			stmt = con.prepareStatement("select * from ordergoods o, rfood r where o.rid = r.rid and o.foodName = r.foodName and o.oid = ? ");
			stmt.setInt(1, oid);
			result = stmt.executeQuery();
			
			ArrayList<Goods> tempGoods = order.getGoods();
			while(result.next()) {
				Goods goods = new Goods();
				goods.setRid(result.getInt("rid"));
				goods.setFoodName(result.getString("foodName"));
				goods.setNumber(result.getInt("number"));
				goods.setPrice(result.getDouble("price"));
				goods.setAmount(result.getDouble("amount"));
				goods.setQuantity(result.getInt("quantity"));
				tempGoods.add(goods);
			}
			order.setGoods(tempGoods);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			daoHelper.closeConnection(con);
			daoHelper.closePreparedStatement(stmt);
			daoHelper.closeResult(result);
		}
		return order;
	}

}
