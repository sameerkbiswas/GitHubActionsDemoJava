package org.example.cicd.githubactions;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
class ApiControllerTests {

    private final MockMvc mockMvc = MockMvcBuilders.standaloneSetup(new ApiController()).build();

    @Test
    void contextLoads() {
    }

    @Test
    void helloEndpointReturnsDefaultGreeting() throws Exception {
        mockMvc.perform(get("/api/hello"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.message").value("Hello, world!"));
    }

    @Test
    void greetingsEndpointIncludesName() throws Exception {
        mockMvc.perform(get("/api/greetings/Ada"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.message").value("Hello, Ada!"));
    }

}
