package org.csu.myproject.persistence;

import org.csu.myproject.domain.Product;

import java.util.List;

public interface ProductDAO {
    List<Product> getProductListByCategory(String categoryId);

    Product getProduct(String productId);

    List<Product>searchProductList(String keywords);
}
