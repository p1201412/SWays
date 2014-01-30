package com.controller;

import com.entities.User;
import com.service.KeyboardService;
import com.service.UserService;
import java.io.IOException;
import java.security.Principal;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("gameController")
@RequestMapping("/user/games")
public class GameController 
{
    @Autowired
    private UserService userService;
    
    @Autowired
    private KeyboardService keyboardService;

    @RequestMapping(value="/index", method = RequestMethod.GET)
    public ModelAndView index() 
    {
        return new ModelAndView("user/games/index");
    }

    
    //Game
    @RequestMapping(value="/piano", method = RequestMethod.GET)
    public ModelAndView piano(Principal principal) 
    {
        User user = userService.getUserByPseudo(principal.getName());
        ModelAndView mav = new ModelAndView("user/games/piano");
        mav.addObject("keys", keyboardService.liste());
        mav.addObject("user", user);
        return mav;
    }
    
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public String add(HttpServletResponse response,Principal principal, @RequestParam int points) throws IOException {
        User user = userService.getUserByPseudo(principal.getName()); 
        user.setPoints(user.getPoints()+points);
        userService.updateUserByAdmin(user); 
        return "" + user.getPoints();
    }
    
    @RequestMapping(value = "/getPoints", method = RequestMethod.GET)
    @ResponseBody
    public String getPoints(HttpServletResponse response,Principal principal) throws IOException {
        User user = userService.getUserByPseudo(principal.getName()); 
        return "" + user.getPoints();
    }
   
}