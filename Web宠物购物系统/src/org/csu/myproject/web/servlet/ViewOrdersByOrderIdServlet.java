package org.csu.myproject.web.servlet;

import org.csu.myproject.domain.CartItem;
import org.csu.myproject.domain.Order;
import org.csu.myproject.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class ViewOrdersByOrderIdServlet extends HttpServlet {
    private int orderId;
    private Order order;
    private String userId;
    private List<CartItem> customRecordList;
    private static final String VIEW_ORDER="/WEB-INF/jsp/order/ViewOrder.jsp";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        orderId=Integer.parseInt(req.getParameter("orderId"));
        HttpSession session=req.getSession();
        userId=session.getAttribute("userId").toString();
        CatalogService catalogService=new CatalogService();
        order=catalogService.getOrderByOrderId(orderId);
        customRecordList=catalogService.getCustomRecord(userId,orderId);
        session.setAttribute("order",order);
        session.setAttribute("customRecordList",customRecordList);
        req.getRequestDispatcher(VIEW_ORDER).forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
