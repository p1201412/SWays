package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "mydb.game_keyboard")
public class Keyboard
{
    @Id 
    @GeneratedValue
    @Column(name="id")
    private int id;
    
    @Column(name="noteD")
    private String noteD;
    
    @Column(name="noteD2")
    private String noteD2;
    
    @Column(name="noteA")
    private String noteA;
    
    @Column(name="win")
    private int win;
    
    @Column(name="loose")
    private int loose;
    
    @Column(name="question")
    private String question;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNoteD() {
        return noteD;
    }

    public void setNoteD(String noteD) {
        this.noteD = noteD;
    }

    public String getNoteD2() {
        return noteD2;
    }

    public void setNoteD2(String noteD2) {
        this.noteD2 = noteD2;
    }

    public String getNoteA() {
        return noteA;
    }

    public void setNoteA(String noteA) {
        this.noteA = noteA;
    }

    public int getWin() {
        return win;
    }

    public void setWin(int win) {
        this.win = win;
    }

    public int getLoose() {
        return loose;
    }

    public void setLoose(int loose) {
        this.loose = loose;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }
    
    
    
    
    
}