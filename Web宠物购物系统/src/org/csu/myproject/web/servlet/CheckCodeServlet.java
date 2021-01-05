package org.csu.myproject.web.servlet;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

public class CheckCodeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int width=100;
        int height=50;
        BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        Graphics g=image.getGraphics();
        g.setColor(Color.PINK);
        g.fillRect(0,0,width,height);
        g.setColor(Color.BLUE);
        g.drawRect(0,0,width-1,height-1);
        String str="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random random=new Random();
        HttpSession session=req.getSession();
        StringBuilder stringBuilder=new StringBuilder();
        Font f=new Font(null,Font.PLAIN,20);
        g.setFont(f);
        g.setColor(Color.RED);
        for(int i=1;i<=4;i++)
        {
            int index=random.nextInt(str.length());
            char ch=str.charAt(index);
            stringBuilder.append(ch);
            g.drawString(ch+"",width/5*i,height/2);
        }
        session.setAttribute("checkcode_session",stringBuilder.toString());
        g.setColor(Color.green);
        for(int i=0;i<10;i++)
        {
            int x1=random.nextInt(width);
            int x2=random.nextInt(width);
            int y1=random.nextInt(height);
            int y2=random.nextInt(height);
            g.drawLine(x1,y1,x2,y2);
        }
        ImageIO.write(image,"jpg",resp.getOutputStream());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
