package org.csu.myproject.domain;

import java.math.BigDecimal;
import java.util.*;

public class Cart {
    public final List<CartItem> cartItemList=new ArrayList<>();
    public final Map<String,CartItem> cartItemMap= Collections.synchronizedMap(new HashMap<String,CartItem>());

    public Iterator<CartItem>getCartItems()
    {
        return cartItemList.iterator();
    }

    public List<CartItem>getCartItemList()
    {
        return cartItemList;
    }

    public int getNumberOfItems()
    {
        return cartItemList.size();
    }

    public Iterator<CartItem>getAllCartItem()
    {
        return cartItemList.iterator();
    }

    public boolean containItemId(String itemId)
    {
        return cartItemMap.containsKey(itemId);
    }

    public void addItem(Item item,boolean isInStock)
    {
        CartItem cartItem=(CartItem)cartItemMap.get(item.getItemId());
        if(cartItem==null)
        {
            cartItem=new CartItem();
            cartItem.setItem(item);
            cartItem.setQuantity(0);
            cartItem.setInStock(isInStock);
            cartItemMap.put(item.getItemId(),cartItem);
            cartItemList.add(cartItem);
        }
        cartItem.incrementQuantity();
    }

    public Item removeItemByItemId(String itemId)
    {
        CartItem cartItem=(CartItem)cartItemMap.remove(itemId);
        if(cartItem==null)
        {
            return null;
        }
        else
        {
            cartItemList.remove(cartItem);
            return cartItem.getItem();
        }
    }

    public void incrementQuantityByItemId(String itemId)
    {
        CartItem cartItem=(CartItem)cartItemMap.get(itemId);
        cartItem.incrementQuantity();
    }

    public void setQuantityByItemId(String itemId,int quantity)
    {
        CartItem cartItem=(CartItem)cartItemMap.get(itemId);
        cartItem.setQuantity(quantity);
    }

    public BigDecimal getSubTotal()
    {
        BigDecimal subTotal=new BigDecimal("0");
        Iterator<CartItem>cartItemList=getAllCartItem();
        while(cartItemList.hasNext())
        {
            CartItem cartItem=(CartItem)cartItemList.next();
            Item item=cartItem.getItem();
            BigDecimal listPrice=item.getListPrice();
            BigDecimal quantity=new BigDecimal(String.valueOf(cartItem.getQuantity()));
            subTotal=subTotal.add(listPrice.multiply(quantity));
        }
        return subTotal;
    }
}
