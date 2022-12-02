package com.test.hplus.beans;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


@Entity
public class User {

    @Id
    private int id;

    @Size(min=5, message = " Username cannot be less than 5 characters")
    private String username;

    @Pattern(regexp = "((?=.*[A-Z]).{6,10})", message = " Password must have one upper case, one lower case and should be between 6 and 10 characters")
    private String password;

    @Enumerated(EnumType.STRING)
    private Gender gender;

    @NotNull(message = " Language cannot be left empty")
    private String language;
    
    @Pattern(regexp = "^(?=.{1,64}@)[\\p{L}0-9_-]+(\\.[\\p{L}0-9_-]+)*@" 
            + "[^-][\\p{L}0-9-]+(\\.[\\p{L}0-9-]+)*(\\.[\\p{L}]{2,})$", message = " Incorrect email format")
    private String email;
    
    private String city;
    private String country;
    private String status;

    @NotEmpty(message = " First name cannot be empty")
    private String firstName;
    private String lastName;
    
    @NotNull(message = " Date of birth cannot be left empty")
    private Date dateOfBirth;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email= email;
    }
    
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city= city;
    }
    
    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country= country;
    }
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status= status;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
}
