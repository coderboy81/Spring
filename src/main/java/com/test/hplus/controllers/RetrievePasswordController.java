package com.test.hplus.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.hplus.beans.User;
import com.test.hplus.exceptions.ApplicationException;
import com.test.hplus.repository.UserRepository;

@Controller
@SessionAttributes("currentuser")
public class RetrievePasswordController {
	
	@Autowired
    private UserRepository userRepository;
	
	@PostMapping("/retrievepassword")
    public String retrievePassword(@ModelAttribute("currentuser")User currentuser, Model model){
        User user  = userRepository.searchByNameAndEmail(currentuser.getUsername(), currentuser.getEmail());
        if(user==null){
            throw new ApplicationException("Password not found");
            //return "retrievePassword";
        }
        model.addAttribute("password", user.getPassword());
        return "retrieveSuccess";
    }

    @ExceptionHandler(ApplicationException.class)
    public String handleException(){
        System.out.println("in exception handler of RetrievePassword Controller");
        return "errorRetrieved";
    }

}
