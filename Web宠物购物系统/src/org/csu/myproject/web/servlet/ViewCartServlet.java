package org.csu.myproject.web.servlet;

import org.csu.myproject.domain.Cart;
import org.csu.myproject.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ViewCartServlet extends HttpServlet {
    private static final String SHOPPING_CART="/WEB-INF/jsp/cart/Cart.jsp";
    private static final String ERROR="/WEB-INF/jsp/common/Error.jsp";
    private String userId;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        Cart cart=(Cart)session.getAttribute("cart");
        userId=session.getAttribute("userId").toString();
        if(userId==null)
        {
            req.getRequestDispatcher(ERROR).forward(req,resp);
        }
        if(cart==null)
        {
            CatalogService catalogService=new CatalogService();
            cart=catalogService.getCartByUserId(userId);
            session.setAttribute("cart",cart);
        }
        req.getRequestDispatcher(SHOPPING_CART).forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
