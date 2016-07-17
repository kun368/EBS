package com.zzkun.dao;

import com.zzkun.model.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

/**
 * Created by Administrator on 2016/7/17.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:springmvc-servlet.xml")
public class UserDaoTest {

    @Autowired
    private UserDao userDao;


    @Test
    public void login() throws Exception {

    }

    @Test
    public void addUser() throws Exception {
        User user = new User("zzk", "123", "kun368", "男", "kun368@126.com", "17854258245", User.UserType.USER);
        userDao.addUser(user);
    }

    @Test
    public void allUser() throws Exception {

    }

    @Test
    public void getUser() throws Exception {

    }

    @Test
    public void deleteUser() throws Exception {

    }

    @Test
    public void modifyUser() throws Exception {

    }

}