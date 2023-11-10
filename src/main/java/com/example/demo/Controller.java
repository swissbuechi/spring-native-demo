package com.example.demo;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class Controller {

    private static final Logger LOGGER = LogManager.getLogger(Controller.class);

    private final ExampleService exampleService;

    public Controller(ExampleService exampleService) {
        this.exampleService = exampleService;
    }

    @GetMapping
    public String hello() {
        LOGGER.info("hello");
        return exampleService.hello();
    }

}
