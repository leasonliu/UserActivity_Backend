package mainpage.service;

import com.google.gson.JsonObject;

import java.util.ArrayList;
import java.util.Set;


public interface MainService {

    boolean addActivity(JsonObject jsonObject);

    ArrayList<Set>[] getSummary(int userId);
}
