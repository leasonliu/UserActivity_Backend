package mainpage.controller;

import mainpage.model.User;
import mainpage.service.LoginService;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {
    private static final Logger logger = Logger.getLogger(LoginController.class);

    public LoginController() {
        System.out.println("Login controller");
    }

    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "/")
    public ModelAndView main(ModelAndView model) {
        model.setViewName("index");
        return model;
    }

    @ResponseBody
    @CrossOrigin
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Map login(@RequestBody User user) {
        User user2 = loginService.getLoginInfo(user);
        Map<String, String> map = new HashMap<>();
        if (user2 == null) {
            map.put("status", "404");
            map.put("data", "");
            return map;
        } else {
            map.put("status", "200");
            map.put("data", user2.getId() + "");
            return map;
        }
    }
}
