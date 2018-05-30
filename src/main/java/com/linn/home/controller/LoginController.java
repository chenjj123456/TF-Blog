package com.linn.home.controller;

import com.linn.frame.controller.BaseController;
import com.linn.frame.entity.ResultBean;
import com.linn.frame.util.SysContent;
import com.linn.home.entity.User;
import com.linn.home.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * 登录controller
 * Created by Administrator on 2018-02-07.
 */
@Controller
public class LoginController extends BaseController{

    @Resource
    private UserService userService ;

    /**
     * 登出
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/admin/logout")
    private ResultBean toAdminLogout(HttpSession session,
                                     HttpServletRequest request,
                                     HttpServletResponse response) throws Exception {
        //删除cookie
        Cookie cookie = new Cookie("user", null);
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);
        //删除Session
        request.getSession().removeAttribute("user");
        //删除session
        return new ResultBean(SysContent.SUCCESS,"登出成功!");
    }

    /**
     * 跳转到登录页面
     * @return
     * @throws Exception
     */
    @RequestMapping("/login")
    private String toAdminLogin() throws Exception {
        return "/admin/login";
    }

    /**
     * 登录
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/admin/subLogin",method = RequestMethod.POST)
    public ResultBean subLogin(@RequestBody Map<String, String> map){

        Subject subject = SecurityUtils.getSubject();

        UsernamePasswordToken token = new UsernamePasswordToken(map.get("userName"),map.get("passWord"));
        try{
            subject.login(token);
            System.out.println("认证结果：" +  subject.isAuthenticated());
        } catch (UnknownAccountException uae)
        {
            logger.error(uae.getMessage(), uae);
            return new ResultBean(SysContent.ERROR,"账号不存在!");
        }
        catch (IncorrectCredentialsException ice)
        {
            logger.error(ice.getMessage(), ice);
            return new ResultBean(SysContent.ERROR,"密码错误!");
        }
        catch (LockedAccountException lae)
        {
            logger.error(lae.getMessage(), lae);
            return new ResultBean(SysContent.ERROR,"账号被锁定!");
        }
        catch (Exception e)
        {
            logger.error(e.getMessage(), e);
            return new ResultBean(SysContent.ERROR,"未知错误,请联系管理员!");
        }
        return new ResultBean(SysContent.SUCCESS,"登录成功!");
    }

    @RequestMapping("/admin")
    public String toAdminIndex(){
        return "/admin/index";
    }

    /**
     * 没有权限
     *
     * @param model 数据传输对象
     * @return 返回视图
     */
    @RequestMapping(value = "/unauth")
    public String unauth(Model model)
    {
        if (!SecurityUtils.getSubject().isAuthenticated())
        {
            return "redirect:/login";
        }
        return "/unauth";
    }

    /**
     * 系统错误页面
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String toError(Model model)
    {
        return "/error";
    }
}