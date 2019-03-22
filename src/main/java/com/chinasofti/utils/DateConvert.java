package com.chinasofti.utils;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConvert implements Converter<String, Date> {
    @Override
    public Date convert(String source) {
        SimpleDateFormat simpleDateFormatA = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat simpleDateFormatB = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat simpleDateFormatC = new SimpleDateFormat("yyyy/MM/dd");
        Date parse = null;
        try {
            parse = simpleDateFormatA.parse(source);
        } catch (ParseException e) {
            try {
                parse = simpleDateFormatB.parse(source);
            } catch (ParseException e1) {
                try {
                    parse = simpleDateFormatC.parse(source);
                } catch (ParseException e2) {
                    e2.printStackTrace();
                }
            }
        }
        return parse;
    }
}
