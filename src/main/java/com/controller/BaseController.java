package com.controller;

import com.entities.Keys;
import com.entities.User;
import com.method.UserMethod;
import com.service.EmailService;
import com.service.GeneratedLinkService;
import com.service.KeysService;
import com.service.UserService;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller("baseController")
@SessionAttributes( {"userId"})
public class BaseController 
{
     
    @Autowired
    private UserService userService;
    
    @Autowired
    private EmailService emailService;
    
    @Autowired
    private KeysService keysService;
    
    @Autowired
    private GeneratedLinkService generatedLinkService;
    
    
    @RequestMapping(value = "/isPseudoExist", method = RequestMethod.GET)
    @ResponseBody
    public String isPseudoExist(HttpServletResponse response,
            @RequestParam String pseudo) throws IOException {
        if(userService.getUserByPseudo(pseudo)!=null)
            return "This pseudo is already existing";
        else
            return "";
    }
    
    @RequestMapping(value = "/isEmailExist", method = RequestMethod.GET)
    public @ResponseBody String isEmailExist(@RequestParam String mail) 
    {
        if(userService.getUserByMail(mail)!=null)
            return "This email is already existing";
        else
            return "";    
    }

    
    @RequestMapping(value="/addUser",method=RequestMethod.POST)
    public @ResponseBody String addUser(@ModelAttribute(value="user") User user, BindingResult result ){
        String returnText;
        if(!result.hasErrors()){
            Date date = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat ("dd/MM/yyyy");
            String registrationDate = dateFormat.format(date);
            user.setRegistrationDate(registrationDate);
            
            userService.addUser(user);
            Keys key = new Keys();
            key.setUserId(user.getId());
            keysService.updateKey(key);
            String linkGen = emailService.generateEmailLink();
            generatedLinkService.link(user.getId(),linkGen);
            String link = " http://localhost:8080/SW/" + linkGen + "/";
            String text = "Bonjour "+user.getSurname()+" "+ user.getName() +  "\n Voici votre lien d'activation : " + link +"\n Pseudo :"+ user.getPseudo() +"\nClé d'activation :" + key.getKey();
            emailService.sendEmail(user.getMailAddress(), "thimab@gmail.com", "Lien d'activation Silent Ways", text);
            
            
            returnText = "Your sign in was successful, please check your email to enable your account";
        }else{
            returnText = "Sorry, an error has occur...";
        }
        return returnText;
    }
    
    
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
    
 //Activation de compte
    @RequestMapping(value = "/{linkGen}", method = RequestMethod.GET)
    public ModelAndView signin(@ModelAttribute("user") User user, BindingResult result,@PathVariable String linkGen) 
    {
        user.setId(generatedLinkService.getUserIdByLink(linkGen));
        user = userService.getUser(user.getId());
        //user.setKey(keysService.getKeyByUserId(user.getId()));
        ModelAndView mav = new ModelAndView("anonymous/enableAccount");
        
        mav.addObject("user" ,user);
        return mav;
    }
    
    @RequestMapping(value="/{linkGen}", method = RequestMethod.POST)
    public ModelAndView enableAccount(@ModelAttribute("user")User user,@PathVariable String linkGen) 
    {
        
        Keys key = new Keys();
        key.setUserId(user.getId());
        key.setKey(keysService.getKeyByUserId(user.getId()));
        
        if(user.getKey().equals(key.getKey()))
        {
            keysService.deleteKey(key);
            user = userService.getUser(user.getId());
            user.setEnabled(true);
            userService.updateUserByAdmin(user);
            
            ModelAndView mav = new ModelAndView("redirect:/login.html");
            return mav;
        }
        else
        {
            ModelAndView mav = new ModelAndView("/anonymous/enableAccount");
            mav.addObject("msg","Clé d'activation non valide");
            return mav;   
        }
    }
    
    //Mot de passe oublié
    @RequestMapping(value="/passForget")
    public ModelAndView passForget(@ModelAttribute("user")User user,BindingResult result)
    {
        ModelAndView mav = new ModelAndView("anonymous/passForget");
        return mav;
    }
    
    @RequestMapping(value="/sendForgotMail", method = RequestMethod.POST)
    public ModelAndView sendForgotMail(@ModelAttribute("user")User user,BindingResult result) 
    {
        ModelAndView mav = new ModelAndView("anonymous/login");
        User userMail = userService.getUserByMail(user.getMailAddress());
        if(userMail==null)
        {
            mav = new ModelAndView("anonymous/passForget");
            mav.addObject("error","Email don't exist");
        }
        else
        {
            User userf = userService.getUserByMail(user.getMailAddress());
            String linkGenForgot = emailService.generateEmailLink();
           
            
            String link = " http://localhost:8080/SWays1/forgot/"+ linkGenForgot + "/";
            generatedLinkService.link(userf.getId(),linkGenForgot);
            String text = "Bonjour "+ userf.getPseudo()+ "\nVous nous avez demander de changer votre mot de passe, voici le lien pour le faire : " + link;
            emailService.sendEmail(user.getMailAddress(), "thimab@gmail.com", "SilentWays", text);
        }
        return mav;
    }
    @RequestMapping(value="/forgot/{linkGenForgot}", method = RequestMethod.GET)
    public ModelAndView password(@ModelAttribute("user")User user,@PathVariable String linkGenForgot, BindingResult result)
    {
        user.setId(generatedLinkService.getUserIdByLink(linkGenForgot));
        user = userService.getUser(user.getId());
        ModelAndView mav = new ModelAndView("anonymous/passwordChange");
        
        mav.addObject("user" ,user);
        return mav;
    }
    
    @RequestMapping(value="/forgot/{linkGenForgot}", method = RequestMethod.POST)
    public ModelAndView passwordChange(@ModelAttribute("user")User user,@PathVariable String linkGenForgot,BindingResult result)
    {
        ModelAndView mav = new ModelAndView("redirect:/login.html");
        
        if(user.getPassword().equals(user.getConfirmPassword()))
        {
            userService.updateUser(user); 
            generatedLinkService.delete(linkGenForgot);
        }
        else
        {
            mav = new ModelAndView("anonymous/passwordChange");
            mav.addObject("error","Password doesn't match");
        }
        return mav;
    }
}
 