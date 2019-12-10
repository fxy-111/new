package cn.bdqn.utils;

import org.springframework.core.convert.converter.Converter;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 自定义日期转换器
 */
public class String2DateConverter implements Converter<String, Date> {
    @Override
    public Date convert(String source) {

        //判断传过来的值是否等于空
        if (source==null){
            return null;
        }
        try{
            //设置转换格式
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            //返回转换值
            return sdf.parse(source);
        }catch (Exception e){
            //如果不是---格式重新转换
            try{
                //设置转换格式
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
                //返回转换值
                return sdf.parse(source);
            }catch (Exception e1){
                e1.printStackTrace();
                throw new RuntimeException();
            }
        }
    }
}
