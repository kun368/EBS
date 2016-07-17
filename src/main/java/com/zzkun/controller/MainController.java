package com.zzkun.controller;

import com.zzkun.model.User;
import com.zzkun.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2016/7/17.
 */
@Controller
public class MainController {

    @Autowired
    private UserService userService;

    @RequestMapping({"/", "/index", "login"})
    public String index() {
        return "Login";
    }

    @RequestMapping("/doLogin")
    public String doLogin(@RequestParam String userName,
                          @RequestParam String passWord,
                          HttpSession session,
                          Model model,
                          RedirectAttributes redirectAttributes) {
        User user = userService.canManage(userName, passWord);
        if(user != null) {
            session.setAttribute("user", user);
            return "redirect:/user/manage";
        } else {
            redirectAttributes.addFlashAttribute("tip", "用户名密码错误，或账号没有管理员权限！");
            return "redirect:/";
        }
    }

    @RequestMapping("/doLogout")
    public String doLogout(HttpSession session,
                           RedirectAttributes redirectAttributes) {
        session.removeAttribute("user");
        redirectAttributes.addFlashAttribute("tip", "后台退出成功！");
        return "redirect:/";
    }
}
