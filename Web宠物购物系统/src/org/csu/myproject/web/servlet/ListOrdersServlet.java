package org.csu.myproject.web.servlet;

import org.csu.myproject.domain.Order;
import org.csu.myproject.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ListOrdersServlet extends HttpServlet {
    private static final String LIST_ORDERS="/WEB-INF/jsp/order/ListOrders.jsp";
    private static final String ERROR="/WEB-INF/jsp/common/Error.jsp";
    private String userId;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        userId=session.getAttribute("userId").toString();
        CatalogService catalogService=new CatalogService();
        if(userId==null)
        {
            req.getRequestDispatcher(ERROR).forward(req,resp);
        }
        List<Order> orderList=catalogService.getOrderList(userId);
        session.setAttribute("orderList",orderList);
        req.getRequestDispatcher(LIST_ORDERS).forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
