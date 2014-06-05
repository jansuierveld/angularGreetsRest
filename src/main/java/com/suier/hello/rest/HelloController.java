package com.suier.hello.rest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.suier.hello.service.HelloService;

@Controller
public class HelloController {

	@Autowired
	private HelloService helloService;

	@Autowired
	private View jsonView;

	private static final String DATA_FIELD = "data";
	private static final String ERROR_FIELD = "error";

	private static final Logger LOGGER = Logger.getLogger(HelloController.class);
	
	
	@RequestMapping(value = "/rest/hello/{name}", method = RequestMethod.GET)
	public ModelAndView getHello(@PathVariable("name") String name) {
		
		LOGGER.debug("Called HelloController with param: " + name);
		
		/* validate. Must be done client side. But is here double checked */
		if (isEmpty(name) || name.length() < 5 || name.length() > 20) {
			return new ModelAndView(jsonView, ERROR_FIELD, "Error invoking getHello - Invalid parameter.");
		}
		
		return new ModelAndView(jsonView, DATA_FIELD, this.helloService.getHello(name));
	}
	
	public static boolean isEmpty(String s) {
		return (null == s) || s.trim().length() == 0;
	}

	

	public void setHelloService(HelloService helloService) {
		this.helloService = helloService;
	}

	public void setJsonView(View jsonView) {
		this.jsonView = jsonView;
	}

	

}
