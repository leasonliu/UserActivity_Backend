package mainpage.service;

import mainpage.dao.UserDao;
import mainpage.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private UserDao userDao;

    @Override
    public User getLoginInfo(User user) {
        return userDao.findByUsernameAndPassword(user.getUsername(), user.getPassword());
    }

}
