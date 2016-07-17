package com.zzkun.dao;

import com.zzkun.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by kun on 2016/7/10.
 */
@Repository
@Transactional
public class UserDao {

    @Autowired
    private SessionFactory sessionFactory;


    private Session curSession() {
        return sessionFactory.getCurrentSession();
    }


    public void addUser(User user) {
        curSession().save(user);
    }

    public List<User> allUser() {
        return (List<User>) curSession().createQuery("from User").list();
    }

    public User getUser(Integer id) {
        return curSession().get(User.class, id);
    }

    public User findByUsername(String username) {
        return (User) curSession().createQuery("from User where username = :username")
                .setParameter("username", username)
                .uniqueResult();
    }

    public void deleteUser(Integer id) {
        Session session = curSession();
        User user = session.get(User.class, id);
        if(user != null)
            session.delete(user);
    }
}
