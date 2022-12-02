package com.test.hplus.controllers;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class RegistrationControllerTest {

	@Test
	void test() {
		
		RegistrationController test = new RegistrationController();
		
		String to = "shawnchan@universal-picker.com";
        String subject = "Confirmation Email";
        String text = "THANK YOU.\n User registered successfully! This is a confirmation email.";
        
		test.sendEmail(to, subject, text);
	}

}
