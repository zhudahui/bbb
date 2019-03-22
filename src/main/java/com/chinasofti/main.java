package com.chinasofti;

import com.alibaba.excel.ExcelReader;
import com.alibaba.excel.read.context.AnalysisContext;
import com.alibaba.excel.read.event.AnalysisEventListener;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.AcroFields;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import org.apache.commons.io.IOUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

public class main {

    public static void main(String[] args) throws Exception{
        // FileInputStream in = new FileInputStream("C:\\Users\\combo\\Desktop\\student.xlsx");
        // try {
        //     ExcelReader reader = new ExcelReader(in, ExcelTypeEnum.XLSX, null,
        //             new AnalysisEventListener<List<String>>() {
        //                 @Override
        //                 public void invoke(List<String> object, AnalysisContext context) {
        //
        //                     System.out.println(context.getCurrentRowNum() + ":" + object);
        //                 }
        //                 @Override
        //                 public void doAfterAllAnalysed(AnalysisContext context) {
        //
        //                 }
        //             });
        //
        //     reader.read();
        // } catch (Exception e) {
        //     e.printStackTrace();
        // } finally {
        //     IOUtils.closeQuietly(in);
        // }

        editPdfTemplate("C:\\Users\\combo\\Desktop\\audit.pdf", "C:\\Users\\combo\\Desktop\\audit_out.pdf");


    }

    public static void editPdfTemplate(String templateFile, String outFile)
            throws IOException, DocumentException {
        PdfReader reader = new PdfReader(templateFile); // 模版文件目录
        PdfStamper ps = new PdfStamper(reader, new FileOutputStream(outFile)); // 生成的输出流
        BaseFont bf = BaseFont.createFont("STSong-Light","UniGB-UCS2-H",BaseFont.NOT_EMBEDDED);
        AcroFields s =  ps.getAcroFields();
//设置文本域表单的字体
// 对于模板要显中文的，在此处设置字体比在pdf模板中设置表单字体的好处：
//1.模板文件的大小不变；2.字体格式满足中文要求
        s.setFieldProperty("fill_3","textfont",bf,null);
        s.setFieldProperty("fill_5","textfont",bf,null);
        s.setFieldProperty("fill_2","textfont",bf,null);
        s.setFieldProperty("fill_4","textfont",bf,null);
        s.setFieldProperty("fill_6","textfont",bf,null);
//编辑文本域表单的内容
        s.setField("fill_3", "姚 秀 才");
        s.setField("fill_5", "cf");
        s.setField("fill_2", "cn-990000");
        s.setField("fill_4",  "模版文件目录");
        s.setField("fill_6", "模版文件目录");
        ps.setFormFlattening(true); // 这句不能少
        ps.close();
        reader.close();
    }
}
