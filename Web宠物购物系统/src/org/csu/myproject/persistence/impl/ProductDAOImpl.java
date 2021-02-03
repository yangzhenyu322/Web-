package org.csu.myproject.persistence.impl;

import org.csu.myproject.domain.Product;
import org.csu.myproject.persistence.DBUtil;
import org.csu.myproject.persistence.ProductDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAOImpl implements ProductDAO {

    private static final String GET_PRODUCT_LIST_CATEGORY="SELECT productId,category AS categoryId,name,descn AS description FROM product WHERE category=?";
    private static final String GET_PRODUCT="SELECT productId,category AS categoryId,name,descn AS description FROM product WHERE productId=?";
    private static final String SEARCH_PRODUCT_LIST="SELECT productId,category AS categoryId,name,descn AS description FROM product WHERE lower(name) like ?";
    @Override
    public List<Product> getProductListByCategory(String categoryId) {
        List<Product>productList=new ArrayList<>();
        try{
            Connection connection= DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(GET_PRODUCT_LIST_CATEGORY);
            preparedStatement.setString(1,categoryId);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next())
            {
                Product product=new Product();
                product.setProductId(resultSet.getString(1));
                product.setCategoryId(resultSet.getString(2));
                product.setName(resultSet.getString(3));
                product.setDescription(resultSet.getString(4));
                productList.add(product);
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeResultSet(resultSet);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return productList;
    }

    @Override
    public Product getProduct(String productId) {
        Product product=null;
        try{
            Connection connection= DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(GET_PRODUCT);
            preparedStatement.setString(1,productId);
            ResultSet resultSet=preparedStatement.executeQuery();
            if(resultSet.next())
            {
                product=new Product();
                product.setProductId(resultSet.getString(1));
                product.setCategoryId(resultSet.getString(2));
                product.setName(resultSet.getString(3));
                product.setDescription(resultSet.getString(4));
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeResultSet(resultSet);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public List<Product> searchProductList(String keywords) {
        List<Product>productList=new ArrayList<>();
        try{
            Connection connection= DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(SEARCH_PRODUCT_LIST);
            preparedStatement.setString(1,keywords);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next())
            {
                Product product=new Product();
                product.setProductId(resultSet.getString(1));
                product.setCategoryId(resultSet.getString(2));
                product.setName(resultSet.getString(3));
                product.setDescription(resultSet.getString(4));
                productList.add(product);
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeResultSet(resultSet);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return productList;
    }
}
