package com.test.hplus.controllers;

import com.test.hplus.beans.Login;
import com.test.hplus.beans.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.Arrays;
import java.util.List;

@Controller
public class HomeController {

    @GetMapping("/home")
    public String goHome(){
        System.out.println("in home controller");
        return "index";
    }

    @GetMapping("/goToSearch")
    public String goToSearch(@SessionAttribute("login")Login login, Model model){
    	model.addAttribute("username", login.getUsername());
        System.out.println("going to search page");
        return "search";
    }
    
    @GetMapping("/goToAdminSearch")
    public String goToAdminSearch(@SessionAttribute("login")Login login, Model model){
    	model.addAttribute("username", login.getUsername());
        System.out.println("going to admin search page");
        return "adminSearch";
    }

    @GetMapping("/goToLogin")
    public String goToLogin(){
        System.out.println("going to login page");
        return "login";
    }

    @GetMapping("/goToRegistration")
    public String goToRegistration(){
        System.out.println("going to register page");
        return "register";
    }
    
    @GetMapping("/goToRetrievePassword")
    public String goToRetrievePassword(){
        System.out.println("going to retrieve password page");
        return "retrievePassword";
    }
    
    @GetMapping("/thankYou")
    public String goThankYou(){
        System.out.println("going to thank you page");
        return "thankYou";
    }
    
    @GetMapping("/viewUserProfile")
    public String goViewUserProfile(@SessionAttribute("login")Login login, Model model){
        System.out.println("going to view user profile page");
        return "viewUserProfile";
    }

   @ModelAttribute("newuser")
    public User getDefaultUser(){
        return new User();
    }
   
   @ModelAttribute("currentuser")
   public User getDefaultCurrentUser(){
       return new User();
   }

    @ModelAttribute("genderItems")
    public List<String> getGenderItems(){
        return Arrays.asList(new String[]{"Male", "Female", "Other"});
    }

    @ModelAttribute("login")
    public Login getDefaultLogin(){
        return new Login();
    }
 }
