package org.csu.myproject.web.servlet;

import org.csu.myproject.domain.Cart;
import org.csu.myproject.domain.Item;
import org.csu.myproject.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class RemoveItemFromCartServlet extends HttpServlet {
    private String removeItemId;
    private String userId;
    private Cart cart;
    private static final String SHOPPING_CART="/WEB-INF/jsp/cart/Cart.jsp";
    private static final String ERROR="/WEB-INF/jsp/common/Error.jsp";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        removeItemId=req.getParameter("removeItemId");
        HttpSession session=req.getSession();
        userId=session.getAttribute("userId").toString();
        cart=(Cart)session.getAttribute("cart");
        Item item=cart.removeItemByItemId(removeItemId);
        if(userId==null)
        {
            req.getRequestDispatcher(ERROR).forward(req,resp);
        }
        if(item==null)
        {
            session.setAttribute("msg","尝试从一个空的购物车已出货物");
            req.getRequestDispatcher(ERROR).forward(req,resp);
        }
        else
        {
            CatalogService catalogService=new CatalogService();
            catalogService.removeItemFromCart(userId,removeItemId);
            req.getRequestDispatcher(SHOPPING_CART).forward(req,resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
