package com.controller;

import com.entities.User;
import com.exception.SpringException;
import com.method.UserMethod;
import com.service.UserService;
import java.io.IOException;
import java.security.Principal;
import javax.resource.spi.work.SecurityContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.preauth.PreAuthenticatedAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("userController")
@RequestMapping("/user")
public class UserController 
{
    @Autowired
    private UserService userService;
    
    @RequestMapping(value="/index", method = RequestMethod.GET)
    public ModelAndView index(Principal principal) 
    {
        User user = userService.getUserByPseudo(principal.getName());
        ModelAndView mav = new ModelAndView("user/index");
        mav.addObject("user", user);
        return mav;
    }
    
    //Formulaire de MAJ d'utilisateur
    @RequestMapping(value="/updateUser", method=RequestMethod.GET)
    public ModelAndView edit(Principal principal)
    {
        User user = userService.getUserByPseudo(principal.getName());
        ModelAndView mav = new ModelAndView("user/editUser");
        mav.addObject("user", user);
        return mav;
    }
    
    //MAJ d'utilisateur
    @RequestMapping(value="/updateUser", method=RequestMethod.POST)
    public ModelAndView update(@ModelAttribute("user") User user, BindingResult result, Principal principal)
    {
        int userId = userService.getUserByPseudo(principal.getName()).getId();
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
            ModelAndView mav = new ModelAndView("user/editUser");
            mav.addObject("error", msg);
            return mav;
        }           
                           
        return new ModelAndView("redirect:/user/index.html");
    }
    
    @RequestMapping(value = "/editUser", method = RequestMethod.GET)
    public ModelAndView editUserGet(@ModelAttribute("user") User user,Principal principal, BindingResult result) 
    {
        ModelAndView mav = new ModelAndView("user/editUser");
        mav.addObject("user", userService.getUserByPseudo(principal.getName()));
        return mav;
    }
    
    @RequestMapping(value="/editUser", method=RequestMethod.POST)
    public @ResponseBody String editUserPost(@ModelAttribute("user") User user, BindingResult result, Principal principal,
            @RequestParam String password,
            @RequestParam String name,
            @RequestParam String surname,
            @RequestParam String mailAddress,
            @RequestParam String img,
            @RequestParam int id
            )
    {
        String returnText;
        if(!result.hasErrors()){
        User u = userService.getUser(id);
        if(!"".equals(name))
            u.setName(name);
        if(!"".equals(surname))
            u.setSurname(surname);
        if(!"".equals(img))
            u.setImg(img);
        if(!"".equals(mailAddress))
            u.setMailAddress(mailAddress);
        if(!"".equals(password))
        {
            u.setPassword(password);
            userService.updateUser(u);
        }
        else
        {
            userService.updateUserByAdmin(u);
        }
        returnText = "Your edit was successful";
        }else{
            returnText = "Sorry, an error has occur...";
        }
        return returnText;    
        
    }
    
    @RequestMapping(value = "/isEmailWithoutId", method = RequestMethod.GET)
    @ResponseBody
    public String isEmailWithoutId(HttpServletResponse response,Principal principal, @RequestParam int id, @RequestParam String mail) throws IOException {
        User user = userService.getUserByMail(mail); 
        if(user!=null)
        {
            if(user.getId()==id)
            {
                return "";
            }
            else
            {
                return "This email already exists";
            }
        }
        else
        {
            return "";
        }
        
    }
}