package com.example.demo;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class ExampleService {

    @Value("${test.name}")
    private String name;

    public String hello() {
        return "Hello, " + name;
    }

}
