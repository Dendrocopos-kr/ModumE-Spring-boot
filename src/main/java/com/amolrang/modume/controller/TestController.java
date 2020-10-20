package com.amolrang.modume.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.amolrang.modume.model.ChatModel;
import com.amolrang.modume.service.TestService;
import com.amolrang.modume.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class TestController {
	@Autowired
	private TestService service;
	
	@RequestMapping(value = "/test", produces="text/plain;charset=UTF-8")
	public String test(Principal principal) {
		log.info("principal:{}",principal);
		return principal.toString();
	}
 }
