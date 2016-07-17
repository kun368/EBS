package com.zzkun.controller;

import com.zzkun.model.User;
import com.zzkun.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2016/7/17.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/manage")
    public String manageMain(HttpSession session,
                             RedirectAttributes redirectAttributes) {
        if(session.getAttribute("user") == null) {
            redirectAttributes.addFlashAttribute("tip", "您还没有登陆，不能进入后台！");
            return "redirect:/";
        }
        return "manage/Index";
    }

    @RequestMapping("/list")
    public String list(Model model,
                       HttpSession session,
                       RedirectAttributes redirectAttributes) {
        if(session.getAttribute("user") == null) {
            redirectAttributes.addFlashAttribute("tip", "您还没有登陆，不能进入后台！");
            return "redirect:/";
        }
        List<User> users = userService.allUserExceptAdmin();
        model.addAttribute("userList", users);
        return "manage/UserList";
    }

    @RequestMapping("/add")
    public String add(HttpSession session,
                      RedirectAttributes redirectAttributes) {
        if(session.getAttribute("user") == null) {
            redirectAttributes.addFlashAttribute("tip", "您还没有登陆，不能进入后台！");
            return "redirect:/";
        }
        return "manage/UserAdd";
    }

    @RequestMapping("/doAdd")
    public String doAdd(@RequestParam String userName,
                        @RequestParam String passWord,
                        @RequestParam String name,
                        @RequestParam String sex,
                        @RequestParam String mobile,
                        @RequestParam String email) {
        User user = new User(userName, passWord, name, sex, email, mobile);
        userService.addUser(user);
        return "redirect:/user/list";
    }

    @RequestMapping("/modify/{id}")
    public String modifyUser(@PathVariable Integer id,
                             Model model,
                             HttpSession session,
                             RedirectAttributes redirectAttributes) {
        if(session.getAttribute("user") == null) {
            redirectAttributes.addFlashAttribute("tip", "您还没有登陆，不能进入后台！");
            return "redirect:/";
        }
        User user = userService.getUser(id);
        model.addAttribute("userName", user.getUsername());
        model.addAttribute("name", user.getNickName());
        model.addAttribute("passWord", user.getPassword());
        model.addAttribute("sex", user.getSex());
        model.addAttribute("mobile", user.getPhone());
        model.addAttribute("email", user.getEmail());
        model.addAttribute("id", id);
        model.addAttribute("sexId", user.getSex().equals("男") ? 1 : 2);
        return "manage/UserModify";
    }


    @RequestMapping("/doDelete/{id}")
    public String doDelete(@PathVariable Integer id) {
        userService.deleteUser(id);
        return "redirect:/user/list";
    }

    @RequestMapping("/doModify/{id}")
    public String doModify(@PathVariable Integer id,
                           @RequestParam String userName,
                           @RequestParam String passWord,
                           @RequestParam String name,
                           @RequestParam String sex,
                           @RequestParam String mobile,
                           @RequestParam String email) {
        User newUser = new User(userName, passWord, name, sex, email, mobile);
        userService.modifyUser(id, newUser);
        return "redirect:/user/list";
    }
}
