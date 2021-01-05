package org.csu.myproject.web.servlet;

import org.csu.myproject.domain.Cart;
import org.csu.myproject.domain.CartItem;
import org.csu.myproject.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Iterator;

public class UpdateItemFromCartServlet extends HttpServlet {
    private static final String SHOPPING_CART="/WEB-INF/jsp/cart/Cart.jsp";
    private static final String ERROR="/WEB-INF/jsp/common/Error.jsp";
    private String userId;
    private Cart cart;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        userId=session.getAttribute("userId").toString();
        cart=(Cart)session.getAttribute("cart");
        CatalogService catalogService=new CatalogService();
        if(userId==null)
        {
            req.getRequestDispatcher(ERROR).forward(req,resp);
        }
        Iterator<CartItem>cartItems=cart.getAllCartItem();
        while(cartItems.hasNext())
        {
            CartItem cartItem=cartItems.next();
            String itemId=cartItem.getItem().getItemId();
            try{
                int quantity=Integer.parseInt(req.getParameter(itemId));
                cart.setQuantityByItemId(itemId,quantity);
                catalogService.updateCart(userId,cartItem);
                catalogService.updateCartRecord(userId,cartItem);
                if(quantity<1)
                {
                    cartItems.remove();
                    catalogService.removeItemFromCart(userId,itemId);
                }
            }catch (Exception e)
            {
                session.setAttribute("message", "The Quantities of Item must be Integer!");
                req.getRequestDispatcher(ERROR).forward(req, resp);
            }
        }

        session.setAttribute("cart",cart);
        req.getRequestDispatcher(SHOPPING_CART).forward(req,resp);
    }
}
