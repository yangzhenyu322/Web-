package org.csu.myproject.persistence;

import java.sql.*;

public class DBUtil {
    private  static final String URL="jdbc:mysql://127.0.0.1:3306/petstore?useUnicode=true&characterEncoding=utf8&useSSL=false";
    private static final String DRIVER_CLASS="com.mysql.jdbc.Driver";
    private  static final String USERNAME="root";
    private  static final String PASSWORD="root";

    public static Connection getConnection() throws Exception
    {
        Class.forName(DRIVER_CLASS);
        Connection connection= DriverManager.getConnection(URL,USERNAME,PASSWORD);
        System.out.println("数据库连接成功！！！！！！！！！！！！！！！！");
        return connection;
    }

    public static void closeConnection(Connection connection) throws Exception
    {
        if(connection!=null)
        {
            connection.close();
        }
    }

    public static void closeStatement(Statement statement) throws Exception
    {
        if(statement!=null)
        {
            statement.close();
        }
    }

    public static void closePreparedStatement(PreparedStatement preparedStatement) throws Exception
    {
        if(preparedStatement!=null)
        {
            preparedStatement.close();
        }
    }

    public static void closeResultSet(ResultSet resultSet) throws Exception
    {
        if(resultSet!=null)
        {
            resultSet.close();
        }
    }
}
