package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.freemind.dao.CategoryDao;
import com.freemind.model.CategoryModel;
import com.freemind.services.CategoryService;
@Service("categoryService")
@Transactional
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	   CategoryDao categoryDao;
		@Override
		public void saveCategory(CategoryModel categorymodel) {
			// TODO Auto-generated method stub
			categoryDao.saveCategory(categorymodel);
		}
		@Override
		public List<CategoryModel> listCategory() {
			// TODO Auto-generated method stub
			return categoryDao.listCategory();
		}
		@Override
		public CategoryModel categoryListById(Integer id) {
			// TODO Auto-generated method stub
			return categoryDao.categoryListById(id);
		}
		@Override
		public void updateCategory(CategoryModel categorymodel) {
			// TODO Auto-generated method stub
			categoryDao.updateCategory(categorymodel);
		}
		@Override
		public CategoryModel getCategoryByName(String categoryName) {
			return categoryDao.getCategoryByName(categoryName);
		}

}
