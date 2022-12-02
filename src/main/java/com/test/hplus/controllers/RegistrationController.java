package com.test.hplus.controllers;

import com.test.hplus.beans.Login;
import com.test.hplus.beans.User;
import com.test.hplus.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class RegistrationController {

    @Autowired
    private UserRepository userRepository;

    @InitBinder
    public void initBinder(WebDataBinder binder){
       binder.registerCustomEditor(Date.class, "dateOfBirth", new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }    

    @Autowired
    private JavaMailSender javaMailSender;

    @PostMapping("/registeruser")
    public String registerUser(@Valid @ModelAttribute("newuser")User user, BindingResult result, Model model){
        System.out.println("in registration controller");
        System.out.println(user.getDateOfBirth());

        if(result.hasErrors()){
            return "register";
        }    
        
        user.setStatus("programmer");
        userRepository.save(user);
        model.addAttribute("dataSaved", "User registered successfully");
        
        String to = user.getEmail();
        String subject = "Confirmation Email";
        String text = "THANK YOU.\n User registered successfully! This is a confirmation email.";
        
        //sendEmail(to, subject, text);
        
        //return "login";
        return "thankYou";
    }
    
    @GetMapping("/emailInvitation")
    public String goEmailInitation(@SessionAttribute("login")Login login, Model model){
    	model.addAttribute("username", login.getUsername());
        System.out.println("going to email invitation page");
        return "emailInvitation";
    }

    @RequestMapping(value = "/emailinvitation", method = RequestMethod.POST)
    public String goemailinvitation(@RequestParam("to") String to, @SessionAttribute("login")Login login, Model model){
        System.out.println("Addresses: "+to);
        
        String subject = "Email Invitation";
        String text = "Hi\n\nYou are invited to join us.  Please visit http://localhost:8080/goToRegistration to register.  THANK YOU!";
        
        //sendEmail(to, subject, text);
        
        model.addAttribute("username", login.getUsername());
        return "emailInvitationSent";        
    }

	void sendEmail(String to, String subject, String text) {
	
	    SimpleMailMessage msg = new SimpleMailMessage();
	    
	    String[] toArray = null;
	    toArray = to.split(","); 
	    
	    for (int i = 0; i< toArray.length; i++){  
	    	System.out.println(toArray[i]); 
	    	
	    	msg.setTo(toArray[i]);
	    	
		    msg.setSubject(subject);
		    msg.setText(text);
		
		    javaMailSender.send(msg);
	    	
	    } 
	}
}
