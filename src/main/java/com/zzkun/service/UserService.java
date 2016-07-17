package com.zzkun.service;

import com.zzkun.dao.UserDao;
import com.zzkun.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/7/17.
 */
@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    /**
     * 判断是否能够登陆后台管理系统
     * 只有用户名密码正确，且具有管理员权限的可以登录
     * @param username 用户名
     * @param password 密码
     * @return 可以登录返回user，不能登陆返回null
     */
    public User canManage(String username, String password) {
        User user = userDao.findByUsername(username);
        if(user != null && user.getPassword().equals(password)
                && user.getUserType().equals(User.UserType.ADMIN))
            return user;
        return null;
    }

    /**
     * 列出除了上帝账户外的管理员
     * @return 账户list
     */
    public List<User> allUserExceptAdmin() {
        List<User> users = userDao.allUser();
        users.removeIf(x -> x.getUsername().equalsIgnoreCase("admin"));
        return users;
    }


    public void addUser(User user) {
        userDao.addUser(user);
    }

    public User getUser(Integer id) {
        return userDao.getUser(id);
    }

    public void deleteUser(Integer id) {
        userDao.deleteUser(id);
    }

    public void modifyUser(Integer id, User user) {
        User preUser = userDao.getUser(id);
        preUser.setUsername(user.getUsername());
        preUser.setPassword(user.getPassword());
        preUser.setEmail(user.getEmail());
        preUser.setNickName(user.getNickName());
        preUser.setPhone(user.getPhone());
        preUser.setSex(user.getSex());
        preUser.setUserType(user.getUserType());
        userDao.addUser(preUser);
    }
}
