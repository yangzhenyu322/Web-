package org.csu.myproject.persistence;

import org.csu.myproject.domain.Category;

import java.util.List;

public interface CategoryDAO {
    List<Category>getCategoryList();

    Category getCategory(String catagoryId);
}
