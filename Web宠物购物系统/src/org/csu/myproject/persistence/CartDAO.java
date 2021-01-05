package org.csu.myproject.persistence;

import org.csu.myproject.domain.Cart;
import org.csu.myproject.domain.CartItem;
import org.csu.myproject.domain.Item;

public interface CartDAO {
    void removeItemFromCart(String userId,String itemId);

    Cart getCartByUserId(String userId);

    void addItemToCart(String userId, Item item,boolean isInStock);

    void updateCart(String userId, CartItem cartItem);

    void addItemToCartRecord(String userId, Item item, boolean isInStock);

    void updateCartRecord(String userId, CartItem cartItem);
}
