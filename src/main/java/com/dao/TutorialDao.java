/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dao;

import com.entities.Tutorial;
import java.util.List;
/**
 *
 * @author Louis
 */
public interface TutorialDao {
    
    public List<Tutorial> tutorialList();
    
    public Tutorial getTutorial(int id);
    
    public Tutorial getTutorialByAuthor(String authorName);
    
    public Tutorial getTutorialBySubject(String subject);
    
    public void deleteTutorial(int id);
    
    public void addTutorial(Tutorial tuto);
    
    public void updateTutorial(Tutorial tuto);
      
}
