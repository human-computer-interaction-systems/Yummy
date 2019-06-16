package yummy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import yummy.model.Client;
@Repository
public class ClientDaoImpl implements ClientDao{
	private static ClientDaoImpl clientDao = new ClientDaoImpl();
	private static DaoHelper daoHelper = DaoHelperImpl.getBaseDaoInstance();
	
	private ClientDaoImpl() {
		
	}
	
	public static ClientDaoImpl getInstance() {
		return clientDao;
	}
	
	@Override
	public boolean registerClient(Client newclient) {
		// TODO Auto-generated method stub
		//INSERT INTO `client` (`cname`, `phone`, `password`, `level`, `paymentCode`, `balance`, `email`) VALUES ('赵勇', '13895270005', 'zhaoyong123', '1', '123456', '0', 'zhaoyong@163.com')
		//INSERT INTO `caddress` (`cid`, `caddress`) VALUES ('2', '新街口')
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		boolean resultFlag = true;
		
		try 
		{
			//client主表插入
			stmt = con.prepareStatement("INSERT INTO `client` (`cname`, `phone`, `password`, `level`, `paymentCode`, `balance`, `email`) VALUES (? , ? , ? , ? , ? , ? , ? )");
			stmt.setString(1, newclient.getCname());
			stmt.setString(2, newclient.getPhone());
			stmt.setString(3, newclient.getPassword());
			stmt.setInt(4, 1);
			stmt.setInt(5, newclient.getPaymentCode());
			stmt.setDouble(6, newclient.getBalance());
			stmt.setString(7, newclient.getEmail());
			
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
	public Client getClientByName(String cname, String password) {
		// TODO Auto-generated method stub
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		Client client = new Client();
		client.setAddresses(new ArrayList<String>());
		
		try 
		{
			stmt = con.prepareStatement("select * from client c,caddress a where c.cid = a.cid and c.cname = ? and c.password = ? ");
			stmt.setString(1, cname);
			stmt.setString(2, password);
			result = stmt.executeQuery();
			
			
			
			while(result.next()) {
				client.setCid(result.getInt("cid"));
				client.setCname(result.getString("cname"));
				client.setPhone(result.getString("phone"));
				client.setPassword(result.getString("password"));
				client.setLevel(result.getInt("level"));
				client.setPaymentCode(result.getInt("paymentCode"));
				client.setBalance(result.getDouble("balance"));
				client.setEmail(result.getString("email"));
				ArrayList<String> tempAddresses = client.getAddresses();
				tempAddresses.add(result.getString("caddress"));
				client.setAddresses(tempAddresses);
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
		return client;
	}

	@Override
	public Client getClientByEmail(String email) {
		// TODO Auto-generated method stub
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		Client client = new Client();
		client.setAddresses(new ArrayList<String>());
		
		try 
		{
			stmt = con.prepareStatement("select * from client c,caddress a where c.cid = a.cid and c.email = ? ");
			stmt.setString(1, email);
			result = stmt.executeQuery();
			
			while(result.next()) {
				client.setCid(result.getInt("cid"));
				client.setCname(result.getString("cname"));
				client.setPhone(result.getString("phone"));
				client.setPassword(result.getString("password"));
				client.setLevel(result.getInt("level"));
				client.setPaymentCode(result.getInt("paymentCode"));
				client.setBalance(result.getDouble("balance"));
				client.setEmail(result.getString("email"));
				ArrayList<String> tempAddresses = client.getAddresses();
				tempAddresses.add(result.getString("caddress"));
				client.setAddresses(tempAddresses);
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
		return client;
	}

	@Override
	public boolean modifyInfo(Client client) {
		// TODO Auto-generated method stub
		
		boolean resultFlag = true;
		
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		try 
		{
			stmt = con.prepareStatement("UPDATE client SET cname = ? , phone = ?  WHERE cid = ? ");
			stmt.setString(1, client.getCname());
			stmt.setString(2, client.getPhone());
			stmt.setInt(3, client.getCid());
			
			int updateResult = stmt.executeUpdate();
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
	public boolean writeOff(int cid) {
		// TODO Auto-generated method stub
		//UPDATE `client` SET `level`='0' WHERE (`cid`='1')
		
		boolean resultFlag = true;
		
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		try 
		{
			stmt = con.prepareStatement("UPDATE client SET level = 0 WHERE cid = ? ");
			stmt.setInt(1, cid);
			int updateResult = stmt.executeUpdate();
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
	public boolean recharge(int cid, int paymentCode, double amount) {
		// TODO Auto-generated method stub
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		boolean resultFlag = true;
		
		try 
		{
			stmt = con.prepareStatement("select * from client c where cid = ? and paymentCode = ?");
			stmt.setInt(1, cid);
			stmt.setInt(2, paymentCode);
			result = stmt.executeQuery();
			//stmt.close();
			
			if(result.next()) {
				double currentAmount = result.getDouble("balance");
				stmt = con.prepareStatement("UPDATE client SET balance = ? WHERE cid = ? ");
				stmt.setDouble(1, amount + currentAmount);
				stmt.setInt(2, cid);
				int updateResult = stmt.executeUpdate();
				if(updateResult == 0)
					resultFlag = false;
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
		return resultFlag;
		
	}

	@Override
	public boolean payment(int cid, int paymentCode, double amount) {
		// TODO Auto-generated method stub
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		boolean resultFlag = true;
		
		try 
		{
			stmt = con.prepareStatement("select * from client c where cid = ? and paymentCode = ?");
			stmt.setInt(1, cid);
			stmt.setInt(2, paymentCode);
			result = stmt.executeQuery();
			
			if(result.next()) {
				double currentAmount = result.getDouble("balance");
				if(currentAmount < amount) {
					resultFlag = false;
				}else {
					stmt = con.prepareStatement("UPDATE client SET balance = ? WHERE cid = ? ");
					stmt.setDouble(1, currentAmount - amount);
					stmt.setInt(2, cid);
					int updateResult = stmt.executeUpdate();
					if(updateResult == 0)
						resultFlag = false;
				}
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
		return resultFlag;
	}

	@Override
	public boolean checkPaymentCode(int cid, int paymentCode) {
		// TODO Auto-generated method stub
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		boolean resultFlag = true;
		
		try 
		{
			stmt = con.prepareStatement("select * from client where cid = ? and paymentCode = ?");
			stmt.setInt(1, cid);
			stmt.setInt(2, paymentCode);
			result = stmt.executeQuery();
			//stmt.close();
			
			if(result.next()) {
					resultFlag = true;
			}else {
				resultFlag = false;
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
		return resultFlag;
	}
	

	@Override
	public boolean addAddress(int cid, ArrayList<String> addresses) {
		// TODO Auto-generated method stub
		//INSERT INTO `caddress` (`cid`, `caddress`) VALUES ('2', '新街口')
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
				
		boolean resultFlag = true;
				
		try 
		{
			//caddress表插入
			int numOfAddr = addresses.size();//地址数量
			
			//sql语句放在外面
			stmt = con.prepareStatement("INSERT INTO `caddress` (`cid`, `caddress`) VALUES (? , ? )");
				
			for(int i = 0; i < numOfAddr; i++) {
				stmt.setInt(1, cid);
				stmt.setString(2, addresses.get(i));
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
	public boolean deleteAddress(int cid) {
		// TODO Auto-generated method stub
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
				
		boolean resultFlag = true;
		
		try 
		{
			stmt = con.prepareStatement("delete from caddress where cid = ? ");
			stmt.setInt(1, cid);
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
	public int getCid(String cname, String email) {
		// TODO Auto-generated method stub
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		int resultCid = 0;
		
		try 
		{
			stmt = con.prepareStatement("select * from client where cname = ? and email = ? ");
			stmt.setString(1, cname);
			stmt.setString(2, email);
			result = stmt.executeQuery();
			
			if(result.next()) {
				resultCid = result.getInt("cid");
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
		
		return resultCid;
	}

	@Override
	public boolean upgrade(int cid) {
		// TODO Auto-generated method stub
		boolean resultFlag = true;
		
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		try 
		{
			stmt = con.prepareStatement("UPDATE client SET level = 2  WHERE cid = ? ");
			stmt.setInt(1, cid);
			
			int updateResult = stmt.executeUpdate();
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

}
