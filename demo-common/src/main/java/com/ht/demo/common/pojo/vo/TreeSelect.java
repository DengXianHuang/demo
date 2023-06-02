package com.ht.demo.common.pojo.vo;

import com.ht.demo.common.pojo.bo.system.SysDeptBO;
import com.ht.demo.common.pojo.bo.system.SysMenuBO;
import org.apache.commons.collections.CollectionUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class TreeSelect {

    private Long id;

    private String label;

    private List<TreeSelect> children;


    public TreeSelect(SysMenuBO menu) {
        this.id = menu.getSysMenuId();
        this.label = menu.getMenuName();
        this.children = CollectionUtils.isNotEmpty(menu.getChildren()) ? menu.getChildren().stream().map(TreeSelect::new).collect(Collectors.toList()) : new ArrayList<>();
    }

    public TreeSelect(SysDeptBO dept) {
        this.id = dept.getSysDeptId();
        this.label = dept.getDeptName();
        this.children = CollectionUtils.isNotEmpty(dept.getChildren()) ? dept.getChildren().stream().map(TreeSelect::new).collect(Collectors.toList()) : new ArrayList<>();
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public List<TreeSelect> getChildren() {
        return children;
    }

    public void setChildren(List<TreeSelect> children) {
        this.children = children;
    }
}
