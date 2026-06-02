package com.design.ak;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@EnableCaching
@SpringBootApplication
public class AkDesignManageApplication {

	public static void main(String[] args) {
		SpringApplication.run(AkDesignManageApplication.class, args);
	}

}
