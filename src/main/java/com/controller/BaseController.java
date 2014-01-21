package com.controller;

import com.entities.User;
import com.method.UserMethod;
import com.service.UserService;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller("baseController")
@SessionAttributes( {"userId"})
public class BaseController 
{
    
    @Autowired
    private UserService userService;
    
    //Index
    @RequestMapping(value="/index", method = RequestMethod.GET)
    public ModelAndView index() 
    {
        return new ModelAndView("anonymous/index");
    }
    
    
    //Login
    @RequestMapping(value="/login",method= RequestMethod.GET)
     public ModelAndView loginForm(@ModelAttribute("user") User user, BindingResult result) 
    {
        return new ModelAndView("anonymous/login");
    }
     
    @RequestMapping(value="/loginfailed", method = RequestMethod.GET)
    public String loginerror(ModelMap model)
    {
        model.addAttribute("error", "true");
        return "anonymous/login";
    }
    
    //Sign in
    @RequestMapping(value = "/signin", method = RequestMethod.GET)
    public ModelAndView signin(@ModelAttribute("user") User user, BindingResult result) 
    {
        return new ModelAndView("anonymous/signin");
    }
    
    //Sauvegarde lors d'un ajout d'utilisateur
    @RequestMapping(value = "/signin", method = RequestMethod.POST)
    @SuppressWarnings("empty-statement")
    public ModelAndView saveUser(@ModelAttribute("user") User  user, BindingResult result) 
    {
        User uTemp = userService.getUserByPseudo(user.getPseudo());
        User uTemp2 = userService.getUserByMail(user.getMailAddress());
        UserMethod methods = new UserMethod();
        String msg = methods.canAdd(user, uTemp, uTemp2);
        
        if(msg.equals(""))
        {
            Date date = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat ("dd/MM/yyyy");
            String registrationDate = dateFormat.format(date);
            user.setRegistrationDate(registrationDate);
            userService.addUser(user); 
        }
        else
        {
            ModelAndView mav = new ModelAndView("anonymous/signin");
            mav.addObject("error", msg);
            return mav;
        }
        
        return new ModelAndView("anonymous/login");
  }
}
