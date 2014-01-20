package com.controller;

import com.entities.User;
import com.exception.SpringException;
import com.method.UserMethod;
import com.service.UserService;
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

@Controller("userController")
@RequestMapping("/users")
public class UserController 
{
    @Autowired
    private UserService userService;

    //Affichage des utilisateurs
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView listArticles() 
    {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("users",  userService.userList());

        return new ModelAndView("usersList", model);
    }
    
    //Ajout d'un utilisateur
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addUser(@ModelAttribute("user") User user, BindingResult result) 
    {
        return new ModelAndView("addUser");
    }
    
    //Sauvegarde lors d'un ajout d'utilisateur
    @RequestMapping(value = "/save", method = RequestMethod.POST)
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
            throw new SpringException(msg);
        }
        
        return new ModelAndView("redirect:/users.html");
  }
    
     
    
    //Suppression d'un utilisateur
    @RequestMapping(value="/delete/{userId}/")
    public String deleteContact(@PathVariable Integer userId) 
    {
        userService.deleteUser(userId);
        return "redirect:/users.html";
    }
    
    //Formulaire de MAJ d'utilisateur
    @RequestMapping(value="/updateUser/{userId}/", method=RequestMethod.GET)
    public ModelAndView edit(@PathVariable Integer userId)
    {
        User user = userService.getUser(userId);
        ModelAndView mav = new ModelAndView("editUser", "user", user);
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
                           
        return "redirect:/users.html";
    }
        
    
   
    
}