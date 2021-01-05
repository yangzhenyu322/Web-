package org.csu.myproject.web.servlet;

import org.csu.myproject.domain.Item;
import org.csu.myproject.domain.Product;
import org.csu.myproject.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class ViewProductServlet extends HttpServlet {
    private static final String VIEW_PRODUCT="/WEB-INF/jsp/catalog/Product.jsp";
    private String productId;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        productId=req.getParameter("productId");
        CatalogService catalogService=new CatalogService();
        Product product=catalogService.getProduct(productId);
        List<Item> itemList=catalogService.getItemListByProduct(productId);
        HttpSession session=req.getSession();
        session.setAttribute("product",product);
        session.setAttribute("itemList",itemList);
        req.getRequestDispatcher(VIEW_PRODUCT).forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
