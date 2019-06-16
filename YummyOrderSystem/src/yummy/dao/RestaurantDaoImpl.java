package yummy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import org.springframework.stereotype.Repository;

import yummy.model.Goods;
import yummy.model.Restaurant;
@Repository
public class RestaurantDaoImpl implements RestaurantDao{
	private static RestaurantDaoImpl restaurantDao = new RestaurantDaoImpl();
	private static DaoHelper daoHelper = DaoHelperImpl.getBaseDaoInstance();
	
	private RestaurantDaoImpl() {
		
	}
	
	public static RestaurantDaoImpl getInstance() {
		return restaurantDao;
	}

	@Override
	public String getNewRid() {
		// TODO Auto-generated method stub
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		String maxRid = "";
		String resultString = "";
		
		try 
		{
			stmt = con.prepareStatement("select max(rid) as maxRid from Restaurant");
			
			result = stmt.executeQuery();
			
			if(result.next()) {
				maxRid = String.valueOf(result.getInt("maxRid"));
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
		}
		
		Calendar cale = null;  
        cale = Calendar.getInstance();  
       
        SimpleDateFormat f = new SimpleDateFormat("yyMM");
        resultString = f.format(cale.getTime());//获取年月1903
        
        if(maxRid.equals("")) {
        	resultString += "001";//1903001
        }else {
        	//在当前月后三位编号加1
        	if(resultString.equals(maxRid.substring(0,4))) {
        		resultString = String.valueOf(Integer.parseInt(maxRid) + 1);
        	}
        	//新的一月编号“001”
        	else {
        		resultString += "001";
        	}
        }
        
		return resultString;
	}

	@Override
	public boolean registerRestaurant(Restaurant newR) {
		// TODO Auto-generated method stub
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		boolean resultFlag = true;
		
		try 
		{
			//Restaurant主表插入
			stmt = con.prepareStatement("INSERT INTO `restaurant` (`rid`, `rname`, `password`, `raddress`, `rtype`, `balance`) VALUES (? , ? , ? , ? , ? , ? )");
			stmt.setInt(1, newR.getRid());
			stmt.setString(2, newR.getRname());
			stmt.setString(3, newR.getPassword());
			stmt.setString(4, newR.getRaddress());
			stmt.setInt(5, newR.getRtype());
			stmt.setDouble(6, newR.getBalance());
			
			int updateResult = stmt.executeUpdate();
			if(updateResult == 0)
				resultFlag = false;
			
			
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
	public Restaurant getRestaurant(String rid, String password) {
		// TODO Auto-generated method stub
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		Restaurant restaurant = new Restaurant();
		restaurant.setRgoods(new ArrayList<Goods>());
		
		try 
		{
			stmt = con.prepareStatement("select * from restaurant  where rid = ? and password = ? ");
			stmt.setInt(1, Integer.parseInt(rid));
			stmt.setString(2, password);
			result = stmt.executeQuery();
			
			//基础查询，查询餐厅基本信息
			
			if(result.next()) {
				restaurant.setRid(result.getInt("rid"));
				restaurant.setRname(result.getString("rname"));
				restaurant.setRaddress(result.getString("raddress"));
				restaurant.setPassword(result.getString("password"));
				restaurant.setRtype(result.getInt("rtype"));
				restaurant.setBalance(result.getDouble("balance"));
			}
			
			//该餐厅货物查询
			stmt = con.prepareStatement("select * from rfood where rid = ?");
			stmt.setInt(1, Integer.parseInt(rid));
			result = stmt.executeQuery();
			
			while(result.next()) {
				Goods goods = new Goods();
				goods.setRid(result.getInt("rid"));
				goods.setFoodName(result.getString("foodName"));
				goods.setPrice(result.getDouble("price"));
				goods.setQuantity(result.getInt("quantity"));
				goods.setAmount(0);
				goods.setNumber(0);
				ArrayList<Goods> tempGoods = restaurant.getRgoods();
				tempGoods.add(goods);
				restaurant.setRgoods(tempGoods);
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
		}
		
		return restaurant;
	}

	@Override
	public boolean modifyInfo(Restaurant r) {
		// TODO Auto-generated method stub
		//INSERT INTO `rapplication` (`rid`, `raddress`, `rtype`, `isApprove`) VALUES ('1902002', '南京路1号', '2', '0')
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
				
		boolean resultFlag = true;
				
		try 
		{
			//rapplication表插入
			
			//sql语句放在外面
			stmt = con.prepareStatement("INSERT INTO `rapplication` (`rid`, `raddress`, `rtype`, `isApprove`) VALUES (? , ? , ? , ? )");
			stmt.setInt(1, r.getRid());
			stmt.setString(2, r.getRaddress());
			stmt.setInt(3, r.getRtype());
			stmt.setInt(4, 0);
			
			int updateResult = stmt.executeUpdate();
			if(updateResult == 0)
				resultFlag = false;
					
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

}
