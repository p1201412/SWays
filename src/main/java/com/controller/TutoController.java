package com.controller;

import com.entities.Tutorial;
import com.service.TutorialService;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("tutoController")
@RequestMapping("/admin")
public class TutoController {
    
    @Autowired
    private TutorialService tutoService;
    
    //Formulaire de MAJ de tuto
    @RequestMapping(value="/updateTuto/{tutoId}/", method=RequestMethod.GET)
    public ModelAndView edit(@PathVariable Integer tutoId){
        Tutorial tuto = tutoService.getTutorial(tutoId);
        ModelAndView mav = new ModelAndView("admin/editTuto", "tuto", tuto);
        return mav;
    }
    
    // MAJ de tuto
    @RequestMapping(value="/updateTuto/{tutoId}/", method=RequestMethod.POST)
    public ModelAndView update(@ModelAttribute("tuto") Tutorial tuto, BindingResult result, @PathVariable Integer tutoId){
        tuto.setId(tutoId);
        tutoService.updateTutorial(tuto);
        
        return new ModelAndView("redirect:/admin/viewTuto.html");
    }
    
     //Affichage des Tutos
    @RequestMapping(value="/viewTuto", method = RequestMethod.GET)
    public ModelAndView listTutorial(Principal principal) 
    {
        String name = principal.getName();
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("tutos",  tutoService.tutorialList());
        ModelAndView mav = new ModelAndView("admin/tutosList", model);
        mav.addObject("tutoname",name);
        return mav;
    }
    
    // ajout tuto
    @RequestMapping(value="/addTuto",method=RequestMethod.POST)
    public @ResponseBody String addTuto(@ModelAttribute(value="tuto") Tutorial tuto, BindingResult result ){
        String returnText;
        if(!result.hasErrors()){
            tutoService.addTutorial(tuto);            
            returnText = "Your adding  was successful, Thanks for your contribution, the SilentWays team";
        }
        else {
           returnText = "Sorry, an error has occur... Please Try again in few minutes"; 
        }
        return returnText;
    }
    
        //Sign in
    @RequestMapping(value = "/addTuto", method = RequestMethod.GET)
    public ModelAndView addTutorial(@ModelAttribute(value="tuto") Tutorial tuto, BindingResult result) 
    {
        return new ModelAndView("admin/addTuto");
    }
}
