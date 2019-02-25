package com.example.demo.endpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
    private static final Logger LOG = LoggerFactory.getLogger(TestController.class);

    @GetMapping("/")
    public ResponseEntity<String> handle() {
        LOG.info("test #2");
        return ResponseEntity.ok("Ok");
    }

}
