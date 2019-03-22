package com.chinasofti.codeGenerator.tableInfo;

import org.apache.commons.lang3.StringUtils;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class PrimaryKeyPropertyManager {

    private List<PrimaryKeyProperty> properties;

    private Set<String> javaImports;

    public PrimaryKeyPropertyManager(List<PrimaryKeyProperty> properties) {
        this.properties = properties;
        this.javaImports = new HashSet<>();
    }

    /**
     * 是否是联合主键
     * @return
     */
    public boolean isUnionPrimaryKey() {
        return properties != null && properties.size() > 1;
    }

    public PrimaryKeyProperty getPrimaryKey() {
        return properties.get(0);
    }

    public boolean isSinglePrimaryKey() {
        return properties != null && properties.size() == 1;
    }

    public List<PrimaryKeyProperty> getProperties() {
        return properties;
    }

    public void setProperties(List<PrimaryKeyProperty> properties) {
        this.properties = properties;
    }

    public Set<String> getJavaImports() {
        return javaImports;
    }

    public void setJavaImports(Set<String> javaImports) {
        this.javaImports = javaImports;
    }

    public void postHandlePrimaryKeyProperty(ColumnPropertyManager columnPropertyManager) {
        Map<String, ColumnProperty> columnIndex = columnPropertyManager.buildColumnIndex();
        for (PrimaryKeyProperty property : properties) {
            String columnName = property.getColumnName();
            ColumnProperty columnProperty = columnIndex.get(columnName);
            String javaType = columnProperty.getPropertyJavaType();
            if(StringUtils.equalsIgnoreCase("BigInteger", javaType)) {
                javaImports.add("java.math.BigInteger");
            } else if(StringUtils.equalsIgnoreCase("BigDecimal", javaType)) {
                javaImports.add("java.math.BigDecimal");
            } else if(StringUtils.equalsIgnoreCase("Date", javaType)) {
                javaImports.add("java.util.Date");
            }
        }
    }
}
