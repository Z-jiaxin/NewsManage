package com.daxin.bean;

public class Category {
    private Integer id;

    private String categoryname;

    public Category() {
    }

    public Category(Integer id, String categoryname) {
        this.id = id;
        this.categoryname = categoryname;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname == null ? null : categoryname.trim();
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", categoryname='" + categoryname + '\'' +
                '}';
    }
}