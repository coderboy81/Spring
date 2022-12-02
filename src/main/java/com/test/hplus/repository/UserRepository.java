package com.test.hplus.repository;

import com.test.hplus.beans.Gender;
import com.test.hplus.beans.User;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface UserRepository extends CrudRepository<User, Integer> {

    @Query("select u from User u where u.username= :name")
    public User searchByName(@Param("name") String username);
    
    @Modifying
    @Query("delete from User u where u.username= :name")
    void deleteByName(@Param("name") String username);
    
    @Modifying
    @Query("update User u set u.password= :password, u.firstName= :firstName,"
    					   + "u.lastName= :lastName, u.language= :language,"
    					   + "u.dateOfBirth= :dateOfBirth, u.gender= :gender,"
    					   + "u.email= :email, u.city= :city, u.country= :country,"
    					   + "u.status= :status where u.username= :name")
    void updateByName(@Param("name") String username, @Param("password") String password,
    		          @Param("firstName") String firstName, @Param("lastName") String lastName,
    		          @Param("language") String language, @Param("dateOfBirth") Date dateOfBirth,
    		          @Param("gender") Gender gender, @Param("email") String email,
    		          @Param("city") String city, @Param("country") String country,
    		          @Param("status") String status);
    
    @Query("select u from User u ORDER BY u.firstName ASC")
    public List<User> selectAllUsers();
    
    @Query("select u from User u where u.firstName like %:name%")
    public List<User> searchByFirstName(@Param("name") String firstName);
    
    @Query("select u from User u where u.username= :name and u.password= :password")
    public User searchByNameAndPassword(@Param("name") String username, @Param("password") String password);
    
    @Query("select u from User u where u.username= :name and u.email= :email")
    public User searchByNameAndEmail(@Param("name") String username, @Param("email") String email);
    
}