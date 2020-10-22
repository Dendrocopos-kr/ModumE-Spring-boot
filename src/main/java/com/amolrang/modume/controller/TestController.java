package com.amolrang.modume.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amolrang.modume.service.TestService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController {
	@Autowired
	private TestService service;

	@RequestMapping(value = "/test", produces="text/plain;charset=UTF-8")
	public String test(Principal principal,OAuth2AuthenticationToken authentication) {
		log.info("principal:{}",principal);
		return principal.toString();
	}
	
	@RequestMapping(value = "/userinfo", produces="text/plain;charset=UTF-8")
	public String userInfo() {
		return "/userInfo";
	}
 }
