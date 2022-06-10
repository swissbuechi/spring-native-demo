package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class Controller {

    private final ExampleService exampleService;

    public Controller(ExampleService exampleService) {
        this.exampleService = exampleService;
    }

    @GetMapping
    public String hello() {
        return exampleService.hello();
    }

}
