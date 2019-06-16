package yummy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import org.springframework.stereotype.Repository;

import yummy.model.Discount;


@Repository
public class DiscountDaoImpl implements DiscountDao{
	private static DiscountDaoImpl discountDao = new DiscountDaoImpl();
	private static DaoHelper daoHelper = DaoHelperImpl.getBaseDaoInstance();
	
	private DiscountDaoImpl() {
		
	}
	
	public static DiscountDaoImpl getInstance() {
		return discountDao;
	}
	@Override
	public boolean addDiscount(Discount d) {
		// TODO Auto-generated method stub
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;				
		boolean resultFlag = true;
				
		try 
		{
			stmt = con.prepareStatement("INSERT INTO `rdiscount` (`rid`, `amount`, `discount`) VALUES (? ,? ,? )");
			stmt.setInt(1, d.getRid());	
			stmt.setDouble(2, d.getAmount());
			stmt.setDouble(3, d.getDiscount());
			
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
	public ArrayList<Discount> getRestaurantDis(int rid) {
		// TODO Auto-generated method stub
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		ArrayList<Discount> dis = new ArrayList<Discount>();
		
		try 
		{
			stmt = con.prepareStatement("select * from `rdiscount` where rid = ?");
			stmt.setInt(1, rid);
			result = stmt.executeQuery();
			
			while(result.next()) {
				Discount discount = new Discount();
				discount.setRid(result.getInt("rid"));
				discount.setAmount(result.getDouble("amount"));
				discount.setDiscount(result.getDouble("discount"));
				dis.add(discount);
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
		
		//≈≈–Ú∑Ω±„«∞∂À≈–∂œ
		Collections.sort(dis);
		return dis;
	}

}
