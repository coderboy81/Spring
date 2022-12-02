package com.test.hplus.repository;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

import javax.activation.DataSource;
import javax.persistence.EntityManager;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@DataJpaTest
class UserRepositoryTest {

	  @Autowired private JdbcTemplate jdbcTemplate;
	  @Autowired private EntityManager entityManager;
	  @Autowired private UserRepository userRepository;
	  
	@Test
	void test() {

	    assertThat(jdbcTemplate).isNotNull();
	    assertThat(entityManager).isNotNull();
	    assertThat(userRepository).isNotNull();
	}

}
