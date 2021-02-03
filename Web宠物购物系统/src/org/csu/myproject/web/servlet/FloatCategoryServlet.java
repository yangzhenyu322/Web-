package org.csu.myproject.web.servlet;

import org.csu.myproject.domain.Product;
import org.csu.myproject.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class FloatCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryId=req.getParameter("categoryId");
        CatalogService catalogService=new CatalogService();
        List<Product> productList=catalogService.getProductListByCategory(categoryId);
        String result ="Product ID             Name\n";
        int i=0;
        while(i<productList.size())
        {
            Product product=productList.get(i);
            result+=product.getProductId()+"       "+product.getName()+"\n";
            i++;
        }
        resp.setContentType("text/xml");
        PrintWriter out=resp.getWriter();
        out.write(result);
        out.flush();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
