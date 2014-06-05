package com.suier.hello.service;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service
public class HelloService implements HelloServiceInterface {

	
	private static final Logger LOGGER = Logger.getLogger(HelloService.class);

	public String getHello(String param) {
		
		LOGGER.debug("Called HelloService with param: " + param);

		return "Hello " + param + "!";
	}
}
