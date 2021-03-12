package cicd.demo.svc3;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/data")
public class ApiController {
    @GetMapping("/data31")
    public String getData21() {
        return "data31";
    }

    @GetMapping("/data32")
    public String getData22() {
        return "data32";
    }

    @GetMapping("/data33")
    public String getData23() {
        return "data33";
    }
}
