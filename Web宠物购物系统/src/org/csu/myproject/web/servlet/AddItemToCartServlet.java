package org.csu.myproject.web.servlet;

import org.csu.myproject.domain.Cart;
import org.csu.myproject.domain.CartItem;
import org.csu.myproject.domain.Item;
import org.csu.myproject.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AddItemToCartServlet extends HttpServlet {
    private String workingItemId;
    private String userId;
    private Cart cart;
    private static final String SHOPPING_CART="/WEB-INF/jsp/cart/Cart.jsp";
    private static final String TOURIST_WARNING="/WEB-INF/jsp/common/TouristWarning.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        workingItemId=req.getParameter("workingItemId");
        CatalogService catalogService=new CatalogService();
        HttpSession session=req.getSession();
        cart=(Cart) session.getAttribute("cart");
        if(session.getAttribute("userId")==null)
        {
            req.getRequestDispatcher(TOURIST_WARNING).forward(req,resp);
        }
        userId=session.getAttribute("userId").toString();
        if(cart==null)
        {
            cart=new Cart();
        }
        if(cart.containItemId(workingItemId))
        {
            cart.incrementQuantityByItemId(workingItemId);
            CartItem cartItem=(CartItem) cart.cartItemMap.get(workingItemId);
            catalogService.updateCart(userId,cartItem);
            catalogService.updateCartRecord(userId,cartItem);
        }
        else
        {
            boolean isInStock=catalogService.isItemInStock(workingItemId);
            Item item=catalogService.getItem(workingItemId);
            cart.addItem(item,isInStock);
            catalogService.addItemToCart(userId,item,isInStock);
            catalogService.addItemToCartRecord(userId,item,isInStock);
        }
        session.setAttribute("cart",cart);
        req.getRequestDispatcher(SHOPPING_CART).forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
