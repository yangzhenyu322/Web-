package org.csu.myproject.persistence;

import org.csu.myproject.domain.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAOImpl implements UserDAO{
    private static final String FIND_USER_BY_USERNAME_AND_PASSWORD="SELECT*FROM account WHERE username=? AND password=?";
    private static final String GET_USER_LIST="SELECT*FROM account";
    private static final String GET_USER_INFO="SELECT*FROM account WHERE userid=?";
    private static final String ADD_USER="INSERT INTO account (userid,username,password,email,is_admin) VALUES (?,?,?,?,?)";
    private static final String GET_USER_BY_USERNAME="SELECT*FROM account WHERE username=?";


    private static final String GET_PROFILE_BY_ID="SELECT*FROM profile WHERE userid=?";
    private static final String EDIT_ACCOUNT_BY_ID="UPDATE account SET PASSWORD =?,firstname=?,lastname=?,email=?,phone=?,addr1=?,addr2=?,city=?,state=?, zip=?,country=? WHERE userid =? ";
    private static final String EDIT_PROFILE_ID="UPDATE PROFILE SET langpref = ?,favcategory=?,mylistopt=?,banneropt=? WHERE userid = ?";
    private static final String FIND_CARTS_BY_USERID="SELECT itemId,quantity,instock,total FROM cartrecord WHERE userId=?"; //查看购物纪录
    private static final String FIND_ORDERS_BY_USERID="SELECT o.`orderid`,o.`orderdate`,c.`itemId`,c.`quantity`,c.`total`,o.`totalprice` FROM orders o,customrecord c WHERE o.`orderid`=c.`orderId` AND o.`userid`=? ORDER BY o.`orderdate` ASC;"; //查看日志


    @Override
    public int editUser(Account account, Profile profile) {
        int result=0;
        try{
            //修改表account
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(EDIT_ACCOUNT_BY_ID);
            preparedStatement.setString(1,account.getPassword());
            preparedStatement.setString(2,account.getFirstName());
            preparedStatement.setString(3,account.getLastName());
            preparedStatement.setString(4,account.getEmail());
            preparedStatement.setString(5,account.getPhone());
            preparedStatement.setString(6,account.getAddr1());
            preparedStatement.setString(7,account.getAddr2());
            preparedStatement.setString(8,account.getCity());
            preparedStatement.setString(9,account.getState());
            preparedStatement.setString(10,account.getZip());
            preparedStatement.setString(11,account.getCountry());
            preparedStatement.setString(12,account.getUserId());
            result+=preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);

            //修改表profile
            Connection connection1=DBUtil.getConnection();
            PreparedStatement preparedStatement1=connection1.prepareStatement(EDIT_PROFILE_ID);
            preparedStatement1.setString(1,profile.getLangpref());
            preparedStatement1.setString(2,profile.getFavcategory());
            preparedStatement1.setInt(3,profile.isMylistopt()?1:0);
            preparedStatement1.setInt(4,profile.isBanneropt()?1:0);
            preparedStatement1.setString(5,profile.getId());

            result+=preparedStatement1.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement1);
            DBUtil.closeConnection(connection1);
        }catch (Exception e)
        {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public Profile findProfileById(String userId) {
        Profile profile=null;
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(GET_PROFILE_BY_ID);
            preparedStatement.setString(1,userId);
            ResultSet resultSet=preparedStatement.executeQuery();
            if(resultSet.next())
            {
                profile=new Profile();
                resultSetToProfile(resultSet,profile);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return profile;
    }

    //查看日志

    @Override
    public Log findLogsByUserId(String userId) {
        Log log=new Log();
        try{
            Connection connection=DBUtil.getConnection();
            //查询购物车纪录
            PreparedStatement preparedStatement=connection.prepareStatement(FIND_CARTS_BY_USERID);
            preparedStatement.setString(1,userId);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next())
            {
                CartLog cartLog=new CartLog();
                resultSetToCartLog(resultSet,cartLog);
                log.getCarts().add(cartLog);
            }

            //查询订单纪录
            preparedStatement=connection.prepareStatement(FIND_ORDERS_BY_USERID);
            preparedStatement.setString(1,userId);
            resultSet=preparedStatement.executeQuery();
            while (resultSet.next())
            {
                OrdersLog ordersLog=new OrdersLog();
                resultSetToOrdersLog(resultSet,ordersLog);
                log.getOrders().add(ordersLog);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return log;
    }


    private void resultSetToUser(ResultSet resultSet, Account account)throws Exception
    {
        account.setUserId(resultSet.getString(1));
        account.setUserName(resultSet.getString(2));
        account.setPassword(resultSet.getString(3));
        account.setFirstName(resultSet.getString(4));
        account.setLastName(resultSet.getString(5));
        account.setEmail(resultSet.getString(6));
        account.setAdmin(resultSet.getInt(7)==0);
        account.setState(resultSet.getString(8));
        account.setAddr1(resultSet.getString(9));
        account.setAddr2(resultSet.getString(10));
        account.setCity(resultSet.getString(11));
        account.setState(resultSet.getString(12));
        account.setZip(resultSet.getString(13));
        account.setCountry(resultSet.getString(14));
        account.setPhone(resultSet.getString(15));
    }

    public Account findUserByUsernameAndPassword(String username, String password)
    {
        Account account=null;
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(FIND_USER_BY_USERNAME_AND_PASSWORD);
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,password);
            ResultSet resultSet=preparedStatement.executeQuery();
            if(resultSet.next())
            {
                account=new Account();
                resultSetToUser(resultSet,account);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return account;
    }

    public boolean getUserByUsername(String username)
    {
        boolean result=false;
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(GET_USER_BY_USERNAME);
            preparedStatement.setString(1,username);
            ResultSet resultSet=preparedStatement.executeQuery();
            if(resultSet.next())
            {
                result=true;
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return result;
    }

    public int maxNumbersOfUser(){
        int result=0;
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(GET_USER_LIST);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next())
            {
                if(result<Integer.parseInt(resultSet.getString(1))){
                    result=Integer.parseInt(resultSet.getString(1));
                }
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e)
        {
            e.printStackTrace();
        }

        return result;
    }


    public int addUser(Account account)
    {
        int result=0;
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(ADD_USER);
            preparedStatement.setString(1,(maxNumbersOfUser()+1)+"");
            preparedStatement.setString(2,account.getUserName());
            preparedStatement.setString(3,account.getPassword());
            preparedStatement.setString(4,account.getEmail());
            preparedStatement.setInt(5,1);
            result=preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return result;
    }

    private void resultSetToProfile(ResultSet resultSet,Profile profile)throws Exception
    {
        profile.setId(resultSet.getString(1));
        profile.setLangpref(resultSet.getString(2));
        profile.setFavcategory(resultSet.getString(3));
        profile.setMylistopt(resultSet.getInt(4)==1);
        profile.setBanneropt(resultSet.getInt(5)==1);
    }

    private void resultSetToCartLog(ResultSet resultSet, CartLog cartLog)throws Exception
    {
        cartLog.setItemId(resultSet.getString(1));
        cartLog.setQuantity(resultSet.getInt(2));
        cartLog.setInstock(resultSet.getInt(3));
        cartLog.setTotal(resultSet.getInt(4));
    }

    private void resultSetToOrdersLog(ResultSet resultSet, OrdersLog ordersLog)throws Exception
    {
        ordersLog.setOrderId(resultSet.getInt(1));
        ordersLog.setOrderdate(resultSet.getDate(2).toString());
        ordersLog.setItemId(resultSet.getString(3));
        ordersLog.setQuantity(resultSet.getInt(4));
        ordersLog.setTotal(resultSet.getInt(5));
        ordersLog.setTotalPrice(resultSet.getInt(6));
    }


}
