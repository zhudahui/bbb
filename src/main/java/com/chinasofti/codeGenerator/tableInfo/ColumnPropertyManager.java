package com.chinasofti.codeGenerator.tableInfo;


import org.apache.commons.lang3.StringUtils;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class ColumnPropertyManager {

    private List<ColumnProperty> properties;

    private Set<String> javaImports;

    public ColumnPropertyManager(List<ColumnProperty> properties) {
        this.properties = properties;
        this.javaImports = new HashSet<>();
    }

    public boolean hasDateType() {
        for (ColumnProperty property : properties) {
            if(property.isDateType()) {
                return true;
            }
        }
        return false;
    }

    public boolean hasDecimalType() {
        for (ColumnProperty property : properties) {
            if(property.isDecimalType()) {
                return true;
            }
        }
        return false;
    }

    public List<ColumnProperty> getProperties() {
        return properties;
    }

    public void setProperties(List<ColumnProperty> properties) {
        this.properties = properties;
    }

    public void postHandleColumnProperty() {
        for (ColumnProperty p : properties) {
            p.setPropertyName(com.chinasofti.utils.StringUtils.underline2Camel(p.getColumnName()));
            p.setPropertyCapitalName(com.chinasofti.utils.StringUtils.underline2Camel(p.getColumnName(), false));
            String typeName = p.getTypeName();
            if (StringUtils.equalsIgnoreCase(typeName, "mediumint")
                            || StringUtils.equalsIgnoreCase(typeName, "int")
                            || StringUtils.equalsIgnoreCase(typeName, "smallint unsigned")
                            || StringUtils.equalsIgnoreCase(typeName, "mediumint unsigned")
                    ) {
                p.setPropertyJavaType("Integer");
            } else if(StringUtils.equalsIgnoreCase(typeName, "tinyint")) {
                p.setPropertyJavaType("Byte");
            } else if(StringUtils.equalsIgnoreCase(typeName, "smallint")
                        || StringUtils.equalsIgnoreCase(typeName, "tinyint unsigned")
                    ) {
                p.setPropertyJavaType("Short");
            } else if (StringUtils.equalsIgnoreCase(typeName, "bit")) {
                p.setPropertyJavaType("Boolean");
            } else if (StringUtils.equalsIgnoreCase(typeName, "bigint")
                        || StringUtils.equalsIgnoreCase(typeName, "int unsigned")
                    ) {
                p.setPropertyJavaType("Long");
            } else if (StringUtils.equalsIgnoreCase(typeName, "double")) {
                p.setPropertyJavaType("Double");
            } else if(StringUtils.equalsIgnoreCase(typeName, "float")) {
                p.setPropertyJavaType("Float");
            } else if(StringUtils.equalsIgnoreCase(typeName, "decimal")
                        || StringUtils.equalsIgnoreCase(typeName, "decimal unsigned")
                        || StringUtils.equalsIgnoreCase(typeName, "double unsigned")
                        || StringUtils.equalsIgnoreCase(typeName, "float unsigned")
                    ) {
                p.setPropertyJavaType("BigDecimal");
                javaImports.add("java.math.BigDecimal");
            } else if(
                    StringUtils.equalsIgnoreCase(typeName, "char")
                            || StringUtils.equalsIgnoreCase(typeName, "varchar")
                            || StringUtils.equalsIgnoreCase(typeName, "tinytext")
                            || StringUtils.equalsIgnoreCase(typeName, "text")
                            || StringUtils.equalsIgnoreCase(typeName, "mediumtext")
                            || StringUtils.equalsIgnoreCase(typeName, "longtext")
                    ) {
                p.setPropertyJavaType("String");
            } else if(
                    StringUtils.equalsIgnoreCase(typeName, "tinyblob")
                            || StringUtils.equalsIgnoreCase(typeName, "blob")
                            || StringUtils.equalsIgnoreCase(typeName, "mediumblob")
                            || StringUtils.equalsIgnoreCase(typeName, "longblob")
                    ) {
                p.setPropertyJavaType("Byte[]");
            } else if(
                    StringUtils.equalsIgnoreCase(typeName, "date")
                            || StringUtils.equalsIgnoreCase(typeName, "time")
                            || StringUtils.equalsIgnoreCase(typeName, "datetime")
                            || StringUtils.equalsIgnoreCase(typeName, "timestamp")
                            || StringUtils.equalsIgnoreCase(typeName, "year")
                    ) {
                p.setPropertyJavaType("Date");
                javaImports.add("java.util.Date");
            } else if(StringUtils.equalsIgnoreCase(typeName, "bigint unsigned")) {
                p.setPropertyJavaType("BigInteger");
                javaImports.add("java.math.BigInteger");
            } else {
                p.setPropertyJavaType("Object");
            }
        }
    }

    public Map<String, ColumnProperty> buildColumnIndex() {
        Map<String, ColumnProperty> tmpIndex = new HashMap<>();
        for (ColumnProperty property : properties) {
            tmpIndex.put(property.getColumnName(), property);
        }
        return tmpIndex;
    }

    public void postHandlePrimaryKey(PrimaryKeyPropertyManager primaryKeyPropertyManager) {
        List<PrimaryKeyProperty> primaryKeyProperties = primaryKeyPropertyManager.getProperties();
        if(primaryKeyProperties != null && !primaryKeyProperties.isEmpty()) {
            Map<String, ColumnProperty> columnIndex = buildColumnIndex();
            for (PrimaryKeyProperty primaryKeyProperty : primaryKeyProperties) {
                ColumnProperty columnProperty = columnIndex.get(primaryKeyProperty.getColumnName());
                columnProperty.setPrimaryKey(true);
            }
            javaImports.add("javax.persistence.GeneratedValue");
            javaImports.add("javax.persistence.Id");
        }
    }

    public Set<String> getJavaImports() {
        return javaImports;
    }

    public void setJavaImports(Set<String> javaImports) {
        this.javaImports = javaImports;
    }
}
