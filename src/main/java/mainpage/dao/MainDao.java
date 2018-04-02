package mainpage.dao;

import mainpage.model.Activity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.ArrayList;
import java.util.Set;

public interface MainDao extends JpaRepository<Activity, Long> {
    @Query(value = "select a.activity AS Activity, SUM(a.duration) AS Duration from Activity a where a.userID = :userId and DATE_SUB(curdate(), INTERVAL 7 DAY) <= date(a.timestamp) group by a.activity", nativeQuery = true)
    ArrayList<Set>[] findByUserID(@Param("userId") int userId);
}
