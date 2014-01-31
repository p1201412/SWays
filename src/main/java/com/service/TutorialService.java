package com.service;

import java.util.List;
import com.entities.Tutorial;

public interface TutorialService {
    
    public List<Tutorial> tutorialList();
    
    public Tutorial getTutorial(int id);
    
    public Tutorial getTutorialByAuthor(String authorName);
    
    public Tutorial getTutorialBySubject(String subject);
    
    public void deleteTutorial(int id);
    
    public void addTutorial(Tutorial tuto);
    
    public void updateTutorial(Tutorial tuto);
    
}
