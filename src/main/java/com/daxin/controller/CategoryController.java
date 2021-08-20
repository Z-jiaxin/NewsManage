package com.daxin.controller;

import com.daxin.bean.Category;
import com.daxin.bean.Msg;
import com.daxin.service.CategoryService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLOutput;
import java.util.List;

@Controller
public class CategoryController {

    @Autowired
    CategoryService categoryService;

    /**
     * 校验类型名
     * @param categoryName
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkCategory")
    public Msg checkCategory(@RequestParam("categoryName")String categoryName){
        //数据库类型名重复校验
        boolean b = categoryService.checkCategory(categoryName);
        if(b) {
            return Msg.success();
        }else {
            return Msg.fail();
        }
    }

    /**
     * 添加类别信息
     */
    @RequestMapping("/addCategory")
    @ResponseBody
    public Msg addCategory(Category category){
        categoryService.addCategory(category);
        return Msg.success();
    }

    /**
     * 删除类别信息
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/deleteCategory/{id}",method = RequestMethod.DELETE)
    public Msg deleteCategoryById(@PathVariable(value = "id") Integer id){
        categoryService.deleteCategory(id);
        return Msg.success();
    }

    /**
     * 更改类别信息
     * @param category
     * @return
     */
    @RequestMapping(value = "/updateCategory/{id}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateCategoryById(Category category){
        categoryService.updateCategory(category);
        return Msg.success();
    }

    /**
     * 根据id获得类型
     */
    @ResponseBody
    @RequestMapping(value="/getCategory/{id}",method= RequestMethod.GET)
    public Msg getCategoryById(@PathVariable(value = "id") Integer id){
        Category category = categoryService.getCategoryById(id);
        return Msg.success().add("category",category);
    }

    /**
     * 获取类型列表
     * @return
     */
    @RequestMapping("/getCate")
    @ResponseBody
    public Msg getCategories(){
        List categories = categoryService.getCategories();
        return Msg.success().add("categories",categories);
    }

    /**
     * 获取类型列表
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping(value="/getCategories/{pn}")
    public String getCategories(@PathVariable(value="pn")Integer pn, Model model){
        //引入PageHelper分页插件
        //在查询之前只需要调用,，传入页码，以及每页的大小
        PageHelper.startPage(pn, 5);
        //startPage后面紧跟的这个查询就是一个分页查询
        List categories = categoryService.getCategories();
        //使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了
        //封装了详细的分页信息，包括我们查询出来的数据
        PageInfo page = new PageInfo(categories,5);
        model.addAttribute("pageInfo",page);
        return "categoryList";
    }
}
