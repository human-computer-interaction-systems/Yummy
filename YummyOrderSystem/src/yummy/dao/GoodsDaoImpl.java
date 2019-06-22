package yummy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import yummy.model.Goods;
@Repository
public class GoodsDaoImpl implements GoodsDao{
	private static GoodsDaoImpl goodsDao = new GoodsDaoImpl();
	private static DaoHelper daoHelper = DaoHelperImpl.getBaseDaoInstance();
	
	private GoodsDaoImpl() {
		
	}
	
	public static GoodsDaoImpl getInstance() {
		return goodsDao;
	}
	
	@Override
	public boolean addGoods(ArrayList<Goods> goods) {
		// TODO Auto-generated method stub
		//INSERT INTO `order` (`cid`, `rid`, `totalAmount`, `caddress`, `orderTime`, `isDelivery`, `isDisorder`) VALUES ('1', '1903001', '12', '�½ֿ�', '20190301190000', '0', '0')
		//INSERT INTO `ordergoods` (`oid`, `rid`, `foodName`, `number`, `amount`) VALUES ('1', '1903001', '��Ȫˮ', '6', '12')
		Connection con = daoHelper.getConnection();
		PreparedStatement stmt = null;
		ResultSet result = null;				
		boolean resultFlag = true;
				
		try 
		{
			//caddress�����
			int numOfGoods = goods.size();//������Ʒ����
			
			//sql����������
			stmt = con.prepareStatement("INSERT INTO `rfood` (`rid`, `foodName`, `price`, `quantity`, `img`, `score`, `introduction`) VALUES (? ,? ,? ,? ,? ,? ,?)");


			for(int i = 0; i < numOfGoods; i++) {
				Goods aGoods = goods.get(i);
				stmt.setInt(1, aGoods.getRid());
				stmt.setString(2, aGoods.getFoodName());
				stmt.setDouble(3, aGoods.getPrice());
				stmt.setInt(4, aGoods.getQuantity());
				stmt.setString(5, aGoods.getUrl());
				stmt.setDouble(6, aGoods.getPrice());
				stmt.setString(7, aGoods.getIntroduction());
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
}
