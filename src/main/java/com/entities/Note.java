package com.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.util.Date;
import java.util.Random;

@Entity
@Table(name="Note")
public class Note {
    @Id
    private int id;
    private String title;
    @Column(length=1500)
    private String content;
    private Date addedDate;

    public Date getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(Date addedDate) {
        this.addedDate = addedDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Note(Date addedDate, String content, String title) {
        this.addedDate = addedDate;
        this.content = content;
        this.id = new Random().nextInt(100000);
        this.title = title;
    }
    public Note(){
        super();
    }
}
