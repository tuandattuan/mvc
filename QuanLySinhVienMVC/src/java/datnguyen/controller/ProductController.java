/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datnguyen.controller;

import datnguyen.entity.Product;
import java.io.IOException;
import java.time.Instant;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Admin
 */
@Controller
@RequestMapping(value = "/product")
public class ProductController {
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String showProductList(ModelMap modelMap) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("QuanLySinhVienMVCPU");
        EntityManager em = factory.createEntityManager();
        Query q = em.createNamedQuery("Product.findAll", Product.class);
        List<Product> productList = q.getResultList();
        modelMap.put("productList", productList);
        return "list";
    }
    
    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String view(@RequestParam HashMap<String, String> fromData, ModelMap modelMap) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("QuanLySinhVienMVCPU");
        EntityManager em = factory.createEntityManager();
        
        Product product = null;
        
        if(fromData.containsKey("id") && !fromData.get("id").isEmpty()) {
            try {
                 product = em.find(Product.class, Integer.parseInt(fromData.get("id")));
            } catch(Exception e){}   
        } 
        
        if(product == null) {
            product = new Product();
        }
        modelMap.put("product", product);
        
        
        return "view";
    }
    
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@RequestParam HashMap<String, String> fromData) {
        String title = fromData.get("title");
        String des = fromData.get("description");
        String thumbnail = fromData.get("thumbnail");
        
        float price = Float.parseFloat(fromData.get("price"));
        float discount = Float.parseFloat(fromData.get("discount"));
        Date currentTime = new Date();
        
        int id = 0;
        if(fromData.containsKey("id") && !fromData.get("id").isEmpty()) {
            id = Integer.parseInt(fromData.get("id"));
        }
//        
//        
//        
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("QuanLySinhVienMVCPU");
        EntityManager em = factory.createEntityManager();
//        
//        
         if (id > 0) {
            Product editProduct = em.find(Product.class, id);
            em.getTransaction().begin();
            editProduct.setTitle(title);
            editProduct.setContent(des);
            editProduct.setThumbnail(thumbnail);
            editProduct.setPrice(price);
            editProduct.setDiscount(discount);
            editProduct.setCreatedAt(currentTime);
            editProduct.setUpdatedAt(currentTime); 
            
            
            em.getTransaction().commit();
            
        } else  {
           
            em.getTransaction().begin();
            Product product = new Product();
            product.setTitle(title);
            product.setContent(des);
            product.setThumbnail(thumbnail);
            product.setPrice(price);
            product.setDiscount(discount);
            product.setCreatedAt(currentTime);
            product.setUpdatedAt(currentTime);
            em.persist(product);
            em.getTransaction().commit();
        }
        
        
        return "redirect:list.html";
    }
    
    
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam HashMap<String, String> fromData) {
        
       
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("QuanLySinhVienMVCPU");
        EntityManager em = factory.createEntityManager();
        Product product = null;
        if(fromData.containsKey("id") && !fromData.get("id").isEmpty()) {
            try {
                 product = em.find(Product.class, Integer.parseInt(fromData.get("id")));
            } catch(Exception e){}   
        } 
        
        if(product != null) {
        em.getTransaction().begin();
        em.remove(product);
        em.getTransaction().commit();
        
        }
        return "redirect:list.html";
    }
    
    
    
        
    
    
    
    
    
}
