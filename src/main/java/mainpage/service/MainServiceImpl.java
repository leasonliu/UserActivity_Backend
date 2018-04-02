package mainpage.service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import mainpage.dao.MainDao;
import mainpage.model.Activity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.*;

@Service
public class MainServiceImpl implements MainService {
    @Autowired
    private MainDao mainDao;

    @Override
    public boolean addActivity(JsonObject jsonObject) {
        int userId = jsonObject.get("userId").getAsInt();
        JsonObject data = jsonObject.get("data").getAsJsonObject();
        Date date = new Date();
        Timestamp timestamp = new Timestamp(date.getTime());
        for (Map.Entry<String, JsonElement> entry : data.entrySet()) {
            Activity activity = new Activity();
            activity.setUserID(userId);
            activity.setActivity(entry.getKey());
            activity.setDuration(entry.getValue().getAsFloat());
            activity.setTimestamp(timestamp);
            mainDao.save(activity);
        }
        return true;
    }

    @Override
    public ArrayList<Set>[] getSummary(int userId) {
        return mainDao.findByUserID(userId);
    }
}
