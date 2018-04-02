package mainpage.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import mainpage.service.MainService;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
public class MainController {
    private static final Logger logger = Logger.getLogger(MainController.class);

    public MainController() {
        System.out.println("Main controller");
    }

    @Autowired
    private MainService mainService;

    @ResponseBody
    @CrossOrigin
    @RequestMapping(value = "/addActivity", method = RequestMethod.POST)
    public Map login(@RequestBody String data) {
        JsonObject jsonObject = new JsonParser().parse(data).getAsJsonObject();
        Map<String, String> map = new HashMap<>();
        if (mainService.addActivity(jsonObject)) {
            map.put("status", "200");
            map.put("data", "");
            return map;
        } else {
            map.put("status", "500");
            map.put("data", "");
            return map;
        }
    }

    @ResponseBody
    @CrossOrigin
    @RequestMapping(value = "/summary/{userId}", method = RequestMethod.GET)
    public Map summary(@PathVariable(value = "userId") int userId) {
        ArrayList<Set>[] dataList = mainService.getSummary(userId);
        Map<String, String> map = new HashMap<>();
        if (dataList != null && dataList.length > 0) {
            Map<Set, Set> dataMap = new HashMap<>();
            for (int i = 0; i < dataList.length; i++) {
                dataMap.put(dataList[i].get(0), dataList[i].get(1));
            }
            Gson gson = new GsonBuilder().disableHtmlEscaping().create();
            map.put("status", "200");
            map.put("data", gson.toJson(dataMap));
            return map;
        } else {
            map.put("status", "404");
            map.put("data", "");
            return map;
        }
    }
}
