package org.example.cicd.githubactions;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class ApiController {

    @GetMapping("/hello")
    public ApiResponse hello() {
        return new ApiResponse("Hello, world!");
    }

    @GetMapping("/greetings/{name}")
    public ApiResponse greet(@PathVariable String name) {
        return new ApiResponse("Hello, " + name + "!");
    }

    public record ApiResponse(String message) {
    }
}
