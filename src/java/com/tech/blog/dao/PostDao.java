
package com.tech.blog.dao;

import java.sql.*;
import com.tech.blog.entities.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
    
    Connection con;
    
    public PostDao(Connection con){
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories()
    {
        ArrayList<Category> list = new ArrayList<>();
            
        try{
            
            String q = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            
            while(set.next())
            {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category cat = new Category(cid, name, description);
                list.add(cat);
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
    
    public boolean savePost(Post p){
        boolean f = false;
        
        try{
            String q = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1,p.getpTitle());
            pstmt.setString(2,p.getpContent());
            pstmt.setString(3,p.getpCode());
            pstmt.setString(4,p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
            
            pstmt.executeUpdate();
            f=true;
        
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return f;
    }
    
    
    public List<Post> getAllPost()
    {
        List<Post> list = new ArrayList<>();
        
        try {
            PreparedStatement p = con.prepareStatement("Select * from posts");
            ResultSet set = p.executeQuery();
            while(set.next())
            {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                Post  ps = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(ps);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public List<Post> getPostByCatId(int catId)
    {
        List<Post> list = new ArrayList<>();
        
        try {
            
            PreparedStatement p = con.prepareStatement("Select * from posts where catId = ?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();
            while(set.next())
            {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                
                int userId = set.getInt("userId");
                Post  ps = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(ps);
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public List<Post> getPostByUserId(int userId)
    {
        List<Post> list = new ArrayList<>();
        
        try {
            
            PreparedStatement p = con.prepareStatement("Select * from posts where userId = ?");
            p.setInt(1, userId);
            ResultSet set = p.executeQuery();
            while(set.next())
            {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                
                int catId = set.getInt("catId");
                Post  ps = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(ps);
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    
}
