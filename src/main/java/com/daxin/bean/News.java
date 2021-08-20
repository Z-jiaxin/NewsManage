package com.daxin.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class News {
    private Integer id;

    private String title;

    private String content;


    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date issuetime;

    private Integer clicks;

    private String froms;

    private String imgs;

    private Integer categoryId;

    private Category category;

    public News() {
    }

    public News(Integer id, String title, String content, Date issuetime, Integer clicks, String froms, String imgs, Integer categoryId) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.issuetime = issuetime;
        this.clicks = clicks;
        this.froms = froms;
        this.imgs = imgs;
        this.categoryId = categoryId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getIssuetime() {
        return issuetime;
    }

    public void setIssuetime(Date issuetime) {
        this.issuetime = issuetime;
    }

    public Integer getClicks() {
        return clicks;
    }

    public void setClicks(Integer clicks) {
        this.clicks = clicks;
    }

    public String getFroms() {
        return froms;
    }

    public void setFroms(String froms) {
        this.froms = froms == null ? null : froms.trim();
    }

    public String getImgs() {
        return imgs;
    }

    public void setImgs(String imgs) {
        this.imgs = imgs == null ? null : imgs.trim();
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", issuetime=" + issuetime +
                ", clicks=" + clicks +
                ", froms='" + froms + '\'' +
                ", imgs='" + imgs + '\'' +
                ", categoryId=" + categoryId +
                ", category=" + category +
                '}';
    }
}