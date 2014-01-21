package com.controller;

import com.entities.User;
import com.exception.SpringException;
import com.method.UserMethod;
import com.service.UserService;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("adminController")
@RequestMapping("/admin")
public class AdminController 
{
    @Autowired
    private UserService userService;

    @RequestMapping(value="/index", method = RequestMethod.GET)
    public ModelAndView index() 
    {
        return new ModelAndView("admin/index");
    }

    
    //Affichage des utilisateurs
    @RequestMapping(value="/viewUser", method = RequestMethod.GET)
    public ModelAndView listArticles(Principal principal) 
    {
        String name = principal.getName();
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("users",  userService.userList());
        ModelAndView mav = new ModelAndView("admin/usersList", model);
        mav.addObject("username",name);
        return mav;
    }
    
    //Suppression d'un utilisateur
    @RequestMapping(value="/deleteUser/{userId}/")
    public String deleteContact(@PathVariable Integer userId) 
    {
        userService.deleteUser(userId);
        return "redirect:/admin/viewUser.html";
    }
    
    //Formulaire de MAJ d'utilisateur
    @RequestMapping(value="/updateUser/{userId}/", method=RequestMethod.GET)
    public ModelAndView edit(@PathVariable Integer userId)
    {
        User user = userService.getUser(userId);
        ModelAndView mav = new ModelAndView("admin/editUser", "user", user);
        return mav;
    }
    
    //MAJ d'utilisateur
    @RequestMapping(value="/updateUser/{userId}/", method=RequestMethod.POST)
    public String update(@ModelAttribute("user") User user, BindingResult result, @PathVariable Integer userId)
    {
        //Utilisateur avec le meme id
        user.setId(userId);
        User uSameId = userService.getUser(user.getId()); 
        //Utilisateur avec le meme pseudo
        User uSamePseudo = userService.getUserByPseudo(user.getPseudo());
        //Utilisateur avec le meme email
        User uSameEmail = userService.getUserByMail(user.getMailAddress());
        
        UserMethod methods = new UserMethod();
        String msg = methods.canUpdate(user, uSameId, uSamePseudo, uSameEmail);
        
        
        if(msg.equals(""))
        {
            user.setId(userId);
            userService.updateUser(user);
        }
        else
        {
            throw new SpringException(msg);
        }           
                           
        return "redirect:/admin/viewUser.html";
    }
   
}