package com.test.hplus.controllers;

import com.test.hplus.beans.Login;
import com.test.hplus.beans.Product;
import com.test.hplus.beans.User;
import com.test.hplus.repository.ProductRepository;
import com.test.hplus.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.AsyncTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.request.async.DeferredResult;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;

@Controller
public class SearchController {

    @Autowired
    private ProductRepository productRepository;
    
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AsyncTaskExecutor taskExecutor;

    @GetMapping("/search")
    public DeferredResult<String> search(@RequestParam("search") String search,  
    	@SessionAttribute("login")Login login, Model model, HttpServletRequest request){
        DeferredResult<String> deferredResult = new DeferredResult<>();
        System.out.println("in search controller");
        System.out.println("search criteria: "+search);
        System.out.println("Async supported in application: "+request.isAsyncSupported());
        System.out.println("Thread from the servlet container: "+Thread.currentThread().getName());

       /* return ()->{
            Thread.sleep(3000);
            System.out.println("Thread from the spring mvc task executor: "+Thread.currentThread().getName());
            List<Product> products = new ArrayList<>();
            products = productRepository.searchByName(search);
            model.addAttribute("products", products);
            return "search";
        };*/

       taskExecutor.execute(()->{
           try {
               Thread.sleep(3000);
           } catch (InterruptedException e) {
               e.printStackTrace();
           }
           System.out.println("Thread from the spring mvc task executor: "+Thread.currentThread().getName());
           List<User> users = new ArrayList<>();
           users = userRepository.searchByFirstName(search);
           List<Product> products = new ArrayList<>();
           products = productRepository.searchByName(search);
           model.addAttribute("username", login.getUsername());
           model.addAttribute("users", users);
           model.addAttribute("products", products);
           deferredResult.setResult("search");
           //deferredResult.setResult("profile");
       });
        return deferredResult;
    }
    
    @GetMapping("/adminsearch")
    public DeferredResult<String> adminsearch(@RequestParam("search") String search,  
    	@SessionAttribute("login")Login login, Model model, HttpServletRequest request){
        DeferredResult<String> deferredResult = new DeferredResult<>();
        System.out.println("in search controller");
        System.out.println("search criteria: "+search);
        System.out.println("Async supported in application: "+request.isAsyncSupported());
        System.out.println("Thread from the servlet container: "+Thread.currentThread().getName());

       /* return ()->{
            Thread.sleep(3000);
            System.out.println("Thread from the spring mvc task executor: "+Thread.currentThread().getName());
            List<Product> products = new ArrayList<>();
            products = productRepository.searchByName(search);
            model.addAttribute("products", products);
            return "search";
        };*/

       taskExecutor.execute(()->{
           try {
               Thread.sleep(3000);
           } catch (InterruptedException e) {
               e.printStackTrace();
           }
           System.out.println("Thread from the spring mvc task executor: "+Thread.currentThread().getName());
           List<User> users = new ArrayList<>();
           users = userRepository.searchByFirstName(search);
           List<Product> products = new ArrayList<>();
           products = productRepository.searchByName(search);
           model.addAttribute("username", login.getUsername());
           model.addAttribute("users", users);
           model.addAttribute("products", products);
           deferredResult.setResult("adminSearch");
           //deferredResult.setResult("profile");
       });
        return deferredResult;
    }

}
