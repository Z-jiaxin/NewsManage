package com.daxin.service;

import com.daxin.bean.Category;
import com.daxin.bean.CategoryExample;
import com.daxin.bean.NewsExample;
import com.daxin.dao.CategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {

    @Autowired
    CategoryMapper categoryMapper;

    /**
     * 获取类型列表
     * @return
     */
    public List getCategories(){
        List<Category> categories = categoryMapper.selectByExample(null);
        return categories;
    }

    /**
     * 根据id查出类型
     * @param id
     */
    public Category getCategoryById(Integer id) {
        Category category = categoryMapper.selectByPrimaryKey(id);
        return category;
    }

    /**
     * 更新类别信息
     */
    public void updateCategory(Category category) {
        categoryMapper.updateByPrimaryKeySelective(category);
    }

    /**
     * 根据id删除类型
     * @param id
     */
    public void deleteCategory(Integer id) {
        categoryMapper.deleteByPrimaryKey(id);
    }

    /**
     * 添加类型名
     * @param category
     */
    public void addCategory(Category category) {
        categoryMapper.insertSelective(category);
    }

    /**
     * 校验类型名
     * @param categoryName
     * @return
     */
    public boolean checkCategory(String categoryName) {
        CategoryExample example = new CategoryExample();
        CategoryExample.Criteria criteria = example.createCriteria();
        criteria.andCategorynameEqualTo(categoryName);
        long count = categoryMapper.countByExample(example);
        return count == 0;
    }
}
