package com.test.hplus.controllers;

import com.test.hplus.beans.Login;
import com.test.hplus.beans.Product;
import com.test.hplus.beans.User;
import com.test.hplus.exceptions.ApplicationException;
import com.test.hplus.repository.UserRepository;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.Scope;
import org.springframework.core.task.AsyncTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.async.DeferredResult;

@Controller
@SessionAttributes("currentuser")
public class UserProfileController {
	
	@Autowired
    private UserRepository userRepository;
	
	@Autowired
    private AsyncTaskExecutor taskExecutor;
	
	@InitBinder
    public void initBinder(WebDataBinder binder){
       binder.registerCustomEditor(Date.class, "dateOfBirth", new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }
	
	@GetMapping("/viewuserprofile")
	public DeferredResult<String> viewProfile(@RequestParam("username") String username,  
	    @SessionAttribute("login")Login login, Model model, HttpServletRequest request){
		
		DeferredResult<String> deferredResult = new DeferredResult<>();
        System.out.println("in user profile controller");
        System.out.println("username criteria: "+username);
        System.out.println("Async supported in application: "+request.isAsyncSupported());
        System.out.println("Thread from the servlet container: "+Thread.currentThread().getName());
        
        taskExecutor.execute(()->{
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("Thread from the spring mvc task executor: "+Thread.currentThread().getName());
            User user = userRepository.searchByName(username);
            model.addAttribute("username", login.getUsername());
            model.addAttribute("user", user);
            deferredResult.setResult("viewUserProfile");
            //deferredResult.setResult("profile");
        });
         return deferredResult;
	}
	
	@GetMapping("/viewadminuserprofile")
	public DeferredResult<String> viewAdminUserProfile(@RequestParam("username") String username,  
	    @SessionAttribute("login")Login login, Model model, HttpServletRequest request){
		
		DeferredResult<String> deferredResult = new DeferredResult<>();
        System.out.println("in user profile controller");
        System.out.println("username criteria: "+username);
        System.out.println("Async supported in application: "+request.isAsyncSupported());
        System.out.println("Thread from the servlet container: "+Thread.currentThread().getName());
        
        taskExecutor.execute(()->{
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("Thread from the spring mvc task executor: "+Thread.currentThread().getName());
            User user = userRepository.searchByName(username);
            model.addAttribute("username", login.getUsername());
            model.addAttribute("user", user);
            deferredResult.setResult("viewAdminUserProfile");
            //deferredResult.setResult("profile");
        });
         return deferredResult;
	}
	
	@GetMapping("/updateProfile")
    public String goUpdateProfile(@SessionAttribute("login")Login login, @SessionAttribute("currentuser")User currentuser, Model model){
        System.out.println("going to update profile page");
        model.addAttribute("currentuser", currentuser);
        model.addAttribute("username", login.getUsername());
        return "updateProfile";
    }
	
	@GetMapping("/updateAdminProfile")
    public String goUpdateAdminProfile(@SessionAttribute("login")Login login, @SessionAttribute("currentuser")User currentuser, Model model){
        System.out.println("going to update admin profile page");
        model.addAttribute("currentuser", currentuser);
        model.addAttribute("username", login.getUsername());
        return "updateAdminProfile";
    }
	
	@RequestMapping(value = "/updateManageProfile", method = RequestMethod.GET, params = "edit")
    public String goEditProfile(@ModelAttribute("user")User selectuser, @SessionAttribute("login")Login login, Model model){
        System.out.println("going to update manage profile page");
       
    	User user = userRepository.searchByName(selectuser.getUsername());
        model.addAttribute("username", login.getUsername());
        model.addAttribute("user", user);
        return "updateManageProfile";
        
    }
	
	@RequestMapping(value = "/updateManageProfile", method = RequestMethod.GET, params = "delete")
    public String goDeleteProfile(@ModelAttribute("user")User selectuser, @SessionAttribute("login")Login login, Model model){
        System.out.println("going to delete profile page");
        
        userRepository.deleteByName(selectuser.getUsername());
        model.addAttribute("user", selectuser);
    	model.addAttribute("username", login.getUsername());
    	return "thankYouManageDeleted";
    }
	
	@GetMapping("/manageProfiles")
	public DeferredResult<String> manageProfiles(@SessionAttribute("login")Login login, Model model){
	        DeferredResult<String> deferredResult = new DeferredResult<>();
	        System.out.println("in user profile controller");
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
	           users = userRepository.selectAllUsers();
	           model.addAttribute("username", login.getUsername());
	           model.addAttribute("users", users);
	           deferredResult.setResult("manageProfiles");
	           //deferredResult.setResult("profile");
	       });
	       
	       return deferredResult;
	}


	@PostMapping("/updateprofile")
    public String updateProfile(@Valid @ModelAttribute("currentuser")User user, BindingResult result, @SessionAttribute("login")Login login, Model model){
        System.out.println("in user profile controller");
        System.out.println(user.getDateOfBirth());

        if(result.hasErrors()){
        	model.addAttribute("username", login.getUsername());
            return "updateProfile";
        }
        
        System.out.println("Current user username: "+user.getUsername());
        
        user.setStatus("programmer");
        userRepository.updateByName(user.getUsername(), user.getPassword(),
        							user.getFirstName(), user.getLastName(),
        							user.getLanguage(), user.getDateOfBirth(),
        							user.getGender(), user.getEmail(),
        							user.getCity(), user.getCountry(), user.getStatus());
        
        //userRepository.deleteByName(user.getUsername());
        //userRepository.save(user);
        model.addAttribute("dataSaved", "User updated successfully");
        model.addAttribute("username", login.getUsername());
        //return "login";
        return "thankYouUpdated";
        
    }
	
	@PostMapping("/updateadminprofile")
    public String updateAdminProfile(@Valid @ModelAttribute("currentuser")User user, BindingResult result, @SessionAttribute("login")Login login, Model model){
        System.out.println("in user profile controller");
        System.out.println(user.getDateOfBirth());

        if(result.hasErrors()){
        	model.addAttribute("username", login.getUsername());
            return "updateAdminProfile";
        }
        
        System.out.println("Current user username: "+user.getUsername());
        
        user.setStatus("admin");
        userRepository.updateByName(user.getUsername(), user.getPassword(),
        							user.getFirstName(), user.getLastName(),
        							user.getLanguage(), user.getDateOfBirth(),
        							user.getGender(), user.getEmail(),
        							user.getCity(), user.getCountry(), user.getStatus());
        
        //userRepository.deleteByName(user.getUsername());
        //userRepository.save(user);
        model.addAttribute("dataSaved", "User updated successfully");
        model.addAttribute("username", login.getUsername());
        //return "login";
        return "thankYouAdminUpdated";
        
    }
	
	@PostMapping("/updatemanageprofile")
    public String updateManageProfile(@Valid @ModelAttribute("user")User user, BindingResult result, @SessionAttribute("login")Login login, Model model){
        System.out.println("in user profile controller");
        System.out.println(user.getDateOfBirth());

        if(result.hasErrors()){
        	model.addAttribute("username", login.getUsername());
            return "updateManageProfile";
        }
        
        System.out.println("Current user username: "+user.getUsername());
        
        //user.setStatus("admin");
        userRepository.updateByName(user.getUsername(), user.getPassword(),
        							user.getFirstName(), user.getLastName(),
        							user.getLanguage(), user.getDateOfBirth(),
        							user.getGender(), user.getEmail(),
        							user.getCity(), user.getCountry(), user.getStatus());
        
        //userRepository.deleteByName(user.getUsername());
        //userRepository.save(user);
        model.addAttribute("dataSaved", "User updated successfully");
        model.addAttribute("user", user);
        model.addAttribute("username", login.getUsername());
        //return "login";
        return "thankYouManageUpdated";
        
    }
	
	@GetMapping("/manageprofile")
    public DeferredResult<String> manageProfile(@RequestParam("username") String username,  
    	    @SessionAttribute("login")Login login, Model model, HttpServletRequest request){
		
    		DeferredResult<String> deferredResult = new DeferredResult<>();
            System.out.println("in user profile controller");
            System.out.println("username criteria: "+username);
            System.out.println("Async supported in application: "+request.isAsyncSupported());
            System.out.println("Thread from the servlet container: "+Thread.currentThread().getName());
            
            taskExecutor.execute(()->{
                try {
                    Thread.sleep(3000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println("Thread from the spring mvc task executor: "+Thread.currentThread().getName());
                User user = userRepository.searchByName(username);
                model.addAttribute("username", login.getUsername());
                model.addAttribute("user", user);
                //deferredResult.setResult("thankYouAdminUpdated");
                deferredResult.setResult("viewManageProfile");
                //deferredResult.setResult("profile");
            });
             return deferredResult;
        
    }
	
    @GetMapping("/goToUserHome")
    public String goToUserHome(@SessionAttribute("login")Login login, Model model){
    	System.out.println("in user profile controller");
        System.out.println("username from session: "+login.getUsername());
        //call to userrepository to get all the user information
        User user = userRepository.searchByName(login.getUsername());
        System.out.println("Current user firstname: "+user.getFirstName());
        model.addAttribute("currentuser", user);
    	model.addAttribute("username", login.getUsername());
        System.out.println("going to user home page");
        return "profile";
    }
    
    @GetMapping("/goToAdminHome")
    public String goToAdminHome(@SessionAttribute("login")Login login, Model model){
    	System.out.println("in user profile controller");
        System.out.println("username from session: "+login.getUsername());
        //call to userrepository to get all the user information
        User user = userRepository.searchByName(login.getUsername());
        System.out.println("Current user username: "+user.getUsername());
        model.addAttribute("currentuser", user);
    	model.addAttribute("username", login.getUsername());
        System.out.println("going to admin home page");
        return "adminProfile";
    }

    @PostMapping("/userprofile")
    public String getUserProfile(@SessionAttribute("login")Login login, Model model){
        System.out.println("in user profile controller");
        System.out.println("username from session: "+login.getUsername());
        //call to userrepository to get all the user information
        User user = userRepository.searchByName(login.getUsername());
        System.out.println("Current user username: "+user.getUsername());
        model.addAttribute("currentuser", user);
        model.addAttribute("username", login.getUsername());
        return "profile";
    }
    
    @PostMapping("/adminprofile")
    public String getAdminProfile(@SessionAttribute("login")Login login, Model model){
        System.out.println("in user profile controller");
        System.out.println("username from session: "+login.getUsername());
        //call to userrepository to get all the user information
        User user = userRepository.searchByName(login.getUsername());
        System.out.println("Current user username: "+user.getUsername());
        model.addAttribute("currentuser", user);
        model.addAttribute("username", login.getUsername());
        return "adminProfile";
    }
}
