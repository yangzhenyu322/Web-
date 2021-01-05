package org.csu.myproject.web.servlet;

import org.csu.myproject.domain.Category;
import org.csu.myproject.domain.Product;
import org.csu.myproject.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class ViewCategoryServlet extends HttpServlet {
    private String categoryId;
    private static final String VIEW_CATEGORY="/WEB-INF/jsp/catalog/Category.jsp";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        categoryId=req.getParameter("categoryId");
        CatalogService catalogService=new CatalogService();
        Category category=catalogService.getCategory(categoryId);
        List<Product>productList=catalogService.getProductListByCategory(categoryId);
        HttpSession session=req.getSession();
        session.setAttribute("category",category);
        session.setAttribute("productList",productList);
        req.getRequestDispatcher(VIEW_CATEGORY).forward(req,resp);
    }
}
