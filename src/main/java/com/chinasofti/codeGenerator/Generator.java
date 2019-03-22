package com.chinasofti.codeGenerator;

import com.chinasofti.codeGenerator.tableInfo.ColumnProperty;
import com.chinasofti.codeGenerator.tableInfo.ColumnPropertyManager;
import com.chinasofti.codeGenerator.tableInfo.PrimaryKeyProperty;
import com.chinasofti.codeGenerator.tableInfo.PrimaryKeyPropertyManager;
import com.chinasofti.utils.StringUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

public class Generator {

    private static final String PROJECT_PATH;
    private static Properties dbConnectionInfo;

    private static String encoding = "utf-8";
    private static String javaPackagePrefix = "/src/main/java/";
    private static String resourcePathPrefix = "/src/main/resources/";
    private static String templatesLocation = "/src/main/resources/templates/";

    private static String tableName = "auditrule";

    private static String entityName = "Auditrule";
    private static String entityPackage = "com.chinasofti.entity";

    private static String daoName = "AuditruleDao";
    private static String daoPackage = "com.chinasofti.mapping";

    private static String xmlName = "AuditruleMapper";
    private static String xmlPath = "mapper";


    static {
        File f = new File("");
        PROJECT_PATH = f.getAbsolutePath();
        InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("db.properties");
        dbConnectionInfo = new Properties();
        dbConnectionInfo.setProperty("db.driverClass", "com.mysql.jdbc.Driver");
        dbConnectionInfo.setProperty("db.url", "jdbc:mysql://192.168.2.10:3306/loan?useUnicode=true&characterEncoding=UTF-8");
        dbConnectionInfo.setProperty("db.username", "root");
        dbConnectionInfo.setProperty("db.password", "1");
    }

    public static void main(String[] args) throws Exception {
        //收集数据库表信息
        Class.forName(dbConnectionInfo.getProperty("db.driverClass"));
        log("正在读取数据库表" + tableName + "信息...");
        Connection conn = DriverManager.getConnection(
                dbConnectionInfo.getProperty("db.url"),
                dbConnectionInfo.getProperty("db.username"),
                dbConnectionInfo.getProperty("db.password")
        );
        String catalog = conn.getCatalog();
        DatabaseMetaData dbMetaData = conn.getMetaData();
        ResultSet columnsRs = dbMetaData.getColumns(catalog, "%", tableName, "%");
        List<ColumnProperty> columnProperties = resolveResultSet(columnsRs, ColumnProperty.class);
        ResultSet primaryKeysRs = dbMetaData.getPrimaryKeys(catalog, "%", tableName);
        List<PrimaryKeyProperty> primaryKeyProperties = resolveResultSet(primaryKeysRs, PrimaryKeyProperty.class);
        primaryKeyProperties.sort(Comparator.comparingInt(PrimaryKeyProperty::getKeySeq));
        ColumnPropertyManager columnPropertyManager = new ColumnPropertyManager(columnProperties);
        PrimaryKeyPropertyManager primaryKeyPropertyManager = new PrimaryKeyPropertyManager(primaryKeyProperties);

        columnPropertyManager.postHandleColumnProperty();
        primaryKeyPropertyManager.postHandlePrimaryKeyProperty(columnPropertyManager);
        columnPropertyManager.postHandlePrimaryKey(primaryKeyPropertyManager);

        Map<String, Object> globalCtx = new HashMap<>();
        Map<String, Object> entityCtx = buildEntityContext(columnPropertyManager, primaryKeyPropertyManager);
        globalCtx.put("entityCtx", entityCtx);

        Map<String, Object> daoCtx = buildDaoContext(columnPropertyManager, primaryKeyPropertyManager);
        globalCtx.put("daoCtx", daoCtx);

        Map<String, Object> xmlCtx = buildXmlContext(columnPropertyManager, primaryKeyPropertyManager);
        globalCtx.put("xmlCtx", xmlCtx);

        globalCtx.put("entityPackage", entityPackage);
        globalCtx.put("entityName", entityName);

        globalCtx.put("daoName", daoName);
        globalCtx.put("daoPackage", daoPackage);
        globalCtx.put("columnProperties", columnProperties);
        globalCtx.put("tableName", tableName);
        VelocityContext ctx = new VelocityContext(globalCtx);
        initVelocity();

        log("渲染实体类 " + entityName);
        render("entity.vm", entityPackage, entityName, "java", ctx);
        log("渲染DAO " + daoName);
        render("dao.vm", daoPackage, daoName, "java", ctx);
        log("渲染XML " + xmlName);
        renderXml(ctx);
        log("完成！");
    }

    private static Map<String, Object> buildXmlContext(ColumnPropertyManager columnPropertyManager, PrimaryKeyPropertyManager primaryKeyPropertyManager) {
        String PRIMARY_KEY_TYPE = "primaryKeyType";
        String PRIMARY_KEY = "primaryKey";
        String SINGLE_PRIMARY_KEY = "single";
        String UNION_PRIMARY_KEY = "union";
        String NONE_PRIMARY_KEY = "none";
        Map<String,Object> ctx = new HashMap<>();
        Map<String, ColumnProperty> columnIndex = columnPropertyManager.buildColumnIndex();
        if(primaryKeyPropertyManager.isSinglePrimaryKey()) {
            PrimaryKeyProperty primaryKey = primaryKeyPropertyManager.getPrimaryKey();
            ColumnProperty columnProperty = columnIndex.get(primaryKey.getColumnName());
            ctx.put(PRIMARY_KEY_TYPE, SINGLE_PRIMARY_KEY);
            ctx.put(PRIMARY_KEY, columnProperty);
        } else if(primaryKeyPropertyManager.isUnionPrimaryKey()) {
            List<ColumnProperty> primaryKeys = new ArrayList<>();
            List<PrimaryKeyProperty> primaryKeyProperties = primaryKeyPropertyManager.getProperties();
            for (PrimaryKeyProperty primaryKeyProperty : primaryKeyProperties) {
                ColumnProperty columnProperty = columnIndex.get(primaryKeyProperty.getColumnName());
                primaryKeys.add(columnProperty);
            }
            ctx.put(PRIMARY_KEY_TYPE, UNION_PRIMARY_KEY);
            ctx.put(PRIMARY_KEY, primaryKeys);
        } else {
            //无主键
            ctx.put(PRIMARY_KEY_TYPE, NONE_PRIMARY_KEY);
        }
        return ctx;
    }

    private static void renderXml(VelocityContext ctx) throws Exception{
        Template template = Velocity.getTemplate("xml.vm", encoding);
        String path = PROJECT_PATH + resourcePathPrefix + xmlPath;
        File dir = new File(path);
        if(!dir.exists()) {
            dir.mkdirs();
        }
        FileOutputStream fos = new FileOutputStream(path + "/" + xmlName + ".xml", true);
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(fos, encoding));
        template.merge(ctx, writer);
        writer.close();
    }

    private static void render(String templateName, String packageName, String className, String suffix, VelocityContext ctx) throws Exception{
        Template template = Velocity.getTemplate(templateName, encoding);
        String path = PROJECT_PATH + javaPackagePrefix + packageNameToPath(packageName);
        File dir = new File(path);
        if(!dir.exists()) {
            dir.mkdirs();
        }
        FileOutputStream fos = new FileOutputStream(path + "/" + className + "." + suffix, true);
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(fos, encoding));
        template.merge(ctx, writer);
        writer.close();
    }

    private static Map<String, Object> buildDaoContext(ColumnPropertyManager columnPropertyManager, PrimaryKeyPropertyManager primaryKeyPropertyManager) {
        Map<String, Object> ctx = new HashMap<>();
        List<String> imports = new ArrayList<>();

        imports.add("org.springframework.stereotype.Repository");
        imports.add("com.chinasofti.commonmapper.CommonMapper");
        imports.add(entityPackage + "." + entityName);
        // 引入通用Mapper后，这些代码废弃
        // imports.add("org.apache.ibatis.annotations.Param");
        // imports.add("java.util.List");
        // imports.addAll(primaryKeyPropertyManager.getJavaImports());
        ctx.put("imports",imports);
        return ctx;
    }

    private static String packageNameToPath(String packageName) {
        return packageName.replaceAll("\\.", "/");
    }

    private static Map<String, Object> buildEntityContext(ColumnPropertyManager columnPropertyManager, PrimaryKeyPropertyManager primaryKeyPropertyManager) {
        Map<String, Object> ctx = new HashMap<>();
        ctx.put("imports", columnPropertyManager.getJavaImports());
        return ctx;
    }

    private static <T> List<T> resolveResultSet(ResultSet resultSet, Class<T> targetClass) throws Exception {
        ResultSetMetaData metaData = resultSet.getMetaData();
        int columnCount = metaData.getColumnCount();
        List<String> columnNames = new ArrayList<>();
        for (int i = 1; i <= columnCount; i++) {
            String columnName = metaData.getColumnName(i);
            columnNames.add(columnName);
        }
        List<T> result = new ArrayList<>();
        while (resultSet.next()) {
            T target = targetClass.newInstance();
            for (String columnName : columnNames) {
                Object columnValue = resultSet.getObject(columnName);
                BeanUtils.copyProperty(target, StringUtils.underline2Camel(columnName), columnValue);
            }
            result.add(target);
        }

        return result;
    }

    private static void initVelocity() {
        Properties p = new Properties();
        p.setProperty(Velocity.FILE_RESOURCE_LOADER_PATH, PROJECT_PATH + templatesLocation);
        p.setProperty(Velocity.ENCODING_DEFAULT, encoding);
        p.setProperty(Velocity.INPUT_ENCODING, encoding);
        p.setProperty(Velocity.OUTPUT_ENCODING, encoding);
        p.setProperty("file.resource.loader.unicode", "true");
        Velocity.init(p);
    }

    static void log(String message) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println("[MESSAGE] - " + format.format(new Date()) + " - " + message);
    }
}
