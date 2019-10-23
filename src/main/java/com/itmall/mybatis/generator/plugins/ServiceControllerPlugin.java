package com.itmall.mybatis.generator.plugins;


import freemarker.core.ParseException;
import freemarker.template.*;
import org.mybatis.generator.api.GeneratedJavaFile;
import org.mybatis.generator.api.IntrospectedTable;
import org.mybatis.generator.api.PluginAdapter;

import java.io.*;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServiceControllerPlugin extends PluginAdapter {


    public boolean validate(List<String> warnings) {
        return true;
    }


    @Override
    public List<GeneratedJavaFile> contextGenerateAdditionalJavaFiles(IntrospectedTable introspectedTable) {
        String javaRepositoryPackage = this.getContext().getJavaClientGeneratorConfiguration().getTargetPackage();
        String javaMapperType = introspectedTable.getMyBatis3JavaMapperType();
        String topPackage = javaRepositoryPackage.substring(0, javaRepositoryPackage.lastIndexOf('.'));
        String javaClassName = javaMapperType.substring(javaMapperType.lastIndexOf('.') + 1, javaMapperType.length()).replace("Mapper", "");
        String targetProject = this.getContext().getJavaClientGeneratorConfiguration().getTargetProject();


        Map<String, String> root = new HashMap<String, String>();
        root.put("package", topPackage);
        root.put("entityName", javaClassName);
        String remark = introspectedTable.getRemarks();
//        if (remark != null && remark.length() > 1) {
//            remark += "管理";
//        }
        root.put("entityComment", remark);
        root.put("idType", "Integer");
        root.put("project", "合规管理平台");
        root.put("version", "1.0.0");
        root.put("author", "zuoll");
        root.put("createTime", LocalDateTime.now().toString());
        root.put("objectName", new StringBuilder().append(Character.toLowerCase(javaClassName.charAt(0)))
                .append(javaClassName.substring(1)).toString());


        genVo(targetProject, topPackage, javaClassName, root);
        genService(targetProject, topPackage, javaClassName, root);
        genServiceImpl(targetProject, topPackage, javaClassName, root);
        genController(targetProject, topPackage, javaClassName, root);


        return null;
    }

    @SuppressWarnings("deprecation")
    private void genVo(String targetProject, String topPackage, String javaClassName, Map<String, String> root) {
        String dirPath = targetProject + "/" + topPackage.replaceAll("\\.", "/") + "/vo/";
        String fileName = javaClassName + "Vo.java";
        File dir = new File(dirPath);
        File file = new File(dirPath + fileName);
        if (file.exists()) {
            file.delete();
            System.err.println(file + " was overwritten");
        }

        try {
            dir.mkdirs();
            file.createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
        }


        Configuration cfg = new Configuration();
        cfg.setClassForTemplateLoading(this.getClass(), "/");
        cfg.setObjectWrapper(new DefaultObjectWrapper());


        try {
            Template temp = cfg.getTemplate("vo.ftl");
            Writer out = new OutputStreamWriter(new FileOutputStream(file));
            temp.process(root, out);
            out.flush();
        } catch (TemplateNotFoundException e) {
            e.printStackTrace();
        } catch (MalformedTemplateNameException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }

        System.err.println("save " + file.getAbsolutePath());
    }


    @SuppressWarnings("deprecation")
    private void genService(String targetProject, String topPackage, String javaClassName, Map<String, String> root) {
        String dirPath = targetProject + "/" + topPackage.replaceAll("\\.", "/") + "/service/";
        String fileName = javaClassName + "Service.java";
        File dir = new File(dirPath);
        File file = new File(dirPath + fileName);
        if (file.exists()) {
            file.delete();
            System.err.println(file + " was overwritten");
        }

        try {
            dir.mkdirs();
            file.createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
        }


        Configuration cfg = new Configuration();
        cfg.setClassForTemplateLoading(this.getClass(), "/");
        cfg.setObjectWrapper(new DefaultObjectWrapper());


        try {
            Template temp = cfg.getTemplate("service.ftl");
            Writer out = new OutputStreamWriter(new FileOutputStream(file));
            temp.process(root, out);
            out.flush();
        } catch (TemplateNotFoundException e) {
            e.printStackTrace();
        } catch (MalformedTemplateNameException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }

        System.err.println("save " + file.getAbsolutePath());
    }


    @SuppressWarnings("deprecation")
    private void genServiceImpl(String targetProject, String topPackage, String javaClassName, Map<String, String> root) {
        String dirPath = targetProject + "/" + topPackage.replaceAll("\\.", "/") + "/service/impl/";
        String fileName = javaClassName + "ServiceImpl.java";
        File dir = new File(dirPath);
        File file = new File(dirPath + fileName);
        if (file.exists()) {
            file.delete();
            System.err.println(file + " was overwritten");
        }

        try {
            dir.mkdirs();
            file.createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
        }


        Configuration cfg = new Configuration();
        cfg.setClassForTemplateLoading(this.getClass(), "/");
        cfg.setObjectWrapper(new DefaultObjectWrapper());


        try {
            Template temp = cfg.getTemplate("serviceImpl.ftl");
            Writer out = new OutputStreamWriter(new FileOutputStream(file));
            temp.process(root, out);
            out.flush();
        } catch (TemplateNotFoundException e) {
            e.printStackTrace();
        } catch (MalformedTemplateNameException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }

        System.err.println("save " + file.getAbsolutePath());
    }


    @SuppressWarnings("deprecation")
    private void genController(String targetProject, String topPackage, String javaClassName,
                               Map<String, String> root) {
        String dirPath = targetProject + "/" + topPackage.replaceAll("\\.", "/") + "/controller/";
        String fileName = javaClassName + "Controller.java";
        File dir = new File(dirPath);
        File file = new File(dirPath + fileName);
        if (file.exists()) {
            file.delete();
            System.err.println(file + " was overwritten.");
        }

        try {
            dir.mkdirs();
            file.createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
        }


        Configuration cfg = new Configuration();
        cfg.setClassForTemplateLoading(this.getClass(), "/");
        cfg.setObjectWrapper(new DefaultObjectWrapper());


        try {
            Template temp = cfg.getTemplate("controller.ftl");
            Writer out = new OutputStreamWriter(new FileOutputStream(file));
            temp.process(root, out);
            out.flush();
        } catch (TemplateNotFoundException e) {
            e.printStackTrace();
        } catch (MalformedTemplateNameException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }

        System.err.println("save " + file.getAbsolutePath());
    }


}

