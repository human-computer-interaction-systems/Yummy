package yummy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import yummy.model.Client;
import yummy.model.Goods;
import yummy.model.Manager;
import yummy.model.Restaurant;
@Repository
public class ManagerDaoImpl implements ManagerDao{
	private static ManagerDaoImpl managerDao = new ManagerDaoImpl();
	private static DaoHelper daoHelper = DaoHelperImpl.getBaseDaoInstance();

	private ManagerDaoImpl() {
		
	}
	
	public static ManagerDaoImpl getInstance() {
		return managerDao;
	}
	
	@Override
	public boolean approveR(Restaurant r) {
		// TODO Auto-generated method stub
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		boolean resultFlag = true;
		
		try 
		{
			//client÷˜±Ì≤Â»Î
			stmt = con.prepareStatement("UPDATE `restaurant` SET `raddress`= ? , `rtype`= ? WHERE (`rid`= ?)");
			stmt.setString(1, r.getRaddress());
			stmt.setInt(2, r.getRtype());
			stmt.setInt(3, r.getRid());
			
			int updateResult = stmt.executeUpdate();
			if(updateResult == 0)
				resultFlag = false;
			
			stmt = con.prepareStatement("UPDATE `rapplication` SET `isApprove`='1' WHERE (`rid`= ?)");
			stmt.setInt(1, r.getRid());
			updateResult = stmt.executeUpdate();
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
	public Manager getManager(String id, String password) {
		// TODO Auto-generated method stub
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		Manager manager = new Manager();
		
		try 
		{
			stmt = con.prepareStatement("select * from manager where managerId = ? and password = ? ");
			stmt.setInt(1, Integer.parseInt(id));
			stmt.setString(2, password);
			result = stmt.executeQuery();
			
			
			
			if(result.next()) {
				manager.setManagerId(result.getInt("managerId"));
				manager.setPassword(result.getString("password"));
				manager.setSysbanance(result.getDouble("sysBalance"));
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
		return manager;
	}

	@Override
	public ArrayList<Restaurant> getAllUnderApparoveR() {
		// TODO Auto-generated method stub
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		ArrayList<Restaurant> res = new ArrayList<Restaurant>();
		
		try 
		{
			stmt = con.prepareStatement("select * from rapplication where isApprove = 0");
			result = stmt.executeQuery();
			
			while(result.next()) {
				Restaurant r = new Restaurant();
				r.setRid(result.getInt("rid"));
				r.setRaddress(result.getString("raddress"));
				r.setRtype(result.getInt("rtype"));
				res.add(r);
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
		
		return res;
	}

	@Override
	public ArrayList<Client> getAllClients() {
		// TODO Auto-generated method stub
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		ResultSet result2 = null;
		
		ArrayList<Client> clients = new ArrayList<Client>();
		
		
		try 
		{
			stmt = con.prepareStatement("select * from client where level != 0");
			result = stmt.executeQuery();
			
			while(result.next()) {
				int cid = result.getInt("cid");
				Client client = new Client();
				client.setAddresses(new ArrayList<String>());
				
				client.setCid(result.getInt("cid"));
				client.setCname(result.getString("cname"));
				client.setPhone(result.getString("phone"));
				client.setPassword(result.getString("password"));
				client.setLevel(result.getInt("level"));
				client.setPaymentCode(result.getInt("paymentCode"));
				client.setBalance(result.getDouble("balance"));
				client.setEmail(result.getString("email"));
				
				stmt = con.prepareStatement("select * from caddress where cid = ? ");
				stmt.setInt(1, cid);
				result2 = stmt.executeQuery();
				while(result2.next()) {
					ArrayList<String> tempAddresses = client.getAddresses();
					tempAddresses.add(result2.getString("caddress"));
					client.setAddresses(tempAddresses);
				}
				
				clients.add(client);
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
		
		return clients;
	}

	@Override
	public ArrayList<Restaurant> getAllRestaurants() {
		// TODO Auto-generated method stub
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		ResultSet result2 = null;
		
		ArrayList<Restaurant> res = new ArrayList<Restaurant>();
		
		
		try 
		{
			stmt = con.prepareStatement("select * from restaurant");
			result = stmt.executeQuery();
			
			while(result.next()) {
				int rid = result.getInt("rid");
				Restaurant restaurant = new Restaurant();
				restaurant.setRgoods(new ArrayList<Goods>());

				restaurant.setRid(result.getInt("rid"));
				restaurant.setRname(result.getString("rname"));
				restaurant.setRaddress(result.getString("raddress"));
				restaurant.setPassword(result.getString("password"));
				restaurant.setRtype(result.getInt("rtype"));
				restaurant.setBalance(result.getDouble("balance"));
				restaurant.setRtypedetail(result.getInt("rtypedetail"));
				restaurant.setUrl(result.getString("img"));
				restaurant.setScore(result.getDouble("score"));
				
				stmt = con.prepareStatement("select * from rfood where rid = ?");
				stmt.setInt(1, rid);
				result2 = stmt.executeQuery();
				
				while(result2.next()) {
					Goods goods = new Goods();
					goods.setRid(result2.getInt("rid"));
					goods.setFoodName(result2.getString("foodName"));
					goods.setPrice(result2.getDouble("price"));
					goods.setQuantity(result2.getInt("quantity"));
					goods.setUrl(result2.getString("img"));
					goods.setScore(result2.getDouble("score"));
					goods.setIntroduction(result2.getString("introduction"));
					goods.setAmount(0);
					goods.setNumber(0);
					ArrayList<Goods> tempGoods = restaurant.getRgoods();
					tempGoods.add(goods);
					restaurant.setRgoods(tempGoods);
				}
				
				res.add(restaurant);
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
		
		return res;
	}

}
