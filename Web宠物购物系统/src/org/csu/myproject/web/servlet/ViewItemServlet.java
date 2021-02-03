package org.csu.myproject.web.servlet;

import org.csu.myproject.domain.Item;
import org.csu.myproject.domain.ItemHistory;
import org.csu.myproject.domain.Product;
import org.csu.myproject.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;

public class ViewItemServlet extends HttpServlet {
    private static final String VIEW_ITEM="/WEB-INF/jsp/catalog/Item.jsp";
    private String itemId;
    private String userId;
    private Product product;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        itemId=req.getParameter("itemId");
        CatalogService catalogService=new CatalogService();
        Item item=catalogService.getItem(itemId);
        HttpSession session=req.getSession();
        userId= (String) session.getAttribute("userId");
        product= (Product) session.getAttribute("product");
        ItemHistory itemHistory=new ItemHistory();
        itemHistory.setItemId(itemId);
        itemHistory.setProductId(product.getProductId());
        itemHistory.setCategory(product.getCategoryId());
        java.util.Date date=new java.util.Date();
        Timestamp timestamp=new Timestamp(date.getTime());
        itemHistory.setHistoryDate(timestamp);
        catalogService.UpdateItemHistory(userId,itemHistory);
        session.setAttribute("item",item);
        req.getRequestDispatcher(VIEW_ITEM).forward(req,resp);
    }
}
