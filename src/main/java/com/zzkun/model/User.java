package com.zzkun.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by kun on 2016/7/10.
 */
@Entity
@Table(name = "user")
public class User {

    public enum UserType {
        ADMIN, USER;
    }

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    private int id;

    @Column(unique = true)
    private String username;

    private String password;

    private String nickName;

    private String sex;

    private String email;

    private String phone;

    @Enumerated(value = EnumType.STRING)
    private UserType userType;


    public User() {
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(String username, String password, String nickName, String sex, String email, String phone) {
        this.username = username;
        this.password = password;
        this.nickName = nickName;
        this.sex = sex;
        this.email = email;
        this.phone = phone;
    }

    public User(String username, String password, String nickName, String sex,
                String email, String phone, UserType userType) {
        this.username = username;
        this.password = password;
        this.nickName = nickName;
        this.sex = sex;
        this.email = email;
        this.phone = phone;
        this.userType = userType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setUserType(UserType userType) {
        this.userType = userType;
    }

    public UserType getUserType() {
        return userType;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", nickName='" + nickName + '\'' +
                ", sex='" + sex + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", userType=" + userType +
                '}';
    }


}
