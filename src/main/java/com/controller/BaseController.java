package com.controller;

import com.entities.User;
import com.exception.SpringException;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller("baseController")
@SessionAttributes( {"userId"})
public class BaseController 
{
    @Autowired
    private UserService userService;
    
    @RequestMapping(value="/", method = RequestMethod.GET)
    public ModelAndView index() 
    {
        return new ModelAndView("index");
    }
    
    @RequestMapping(value="/login",method= RequestMethod.GET)
     public ModelAndView loginForm(@ModelAttribute("user") User user, BindingResult result) 
    {
        return new ModelAndView("login");
    }
    
    @RequestMapping(value="/login",method= RequestMethod.POST)	
    public ModelAndView login(@ModelAttribute("user") User user, BindingResult result)
    {
            ModelAndView modelAndView = new ModelAndView();
            User u = userService.getUserByPseudo(user.getPseudo());
            if(u!=null)
            {
                if(user.getPassword().equals(u.getPassword()))
                {
                     modelAndView.addObject("userId", u.getId());
                }
                else
                {
                    throw new SpringException("PAs bon");
                }
            }
            else
            {
                throw new SpringException("Pas bon");
            }
            modelAndView.setViewName("index");
            return modelAndView;
    }
}
