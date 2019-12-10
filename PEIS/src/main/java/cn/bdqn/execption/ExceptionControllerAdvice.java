package cn.bdqn.execption;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

/**
 * 异常通知
 */
@ControllerAdvice
public class ExceptionControllerAdvice {


    @ExceptionHandler(value = {MyException.class})
    public ModelAndView myException(Exception e){

        MyException myException = null;
        if (e instanceof MyException){
            myException = (MyException)e;
        }else {
            myException = new MyException("网络开小差了~");
        }


        ModelAndView mv = new ModelAndView();
        mv.addObject("error",myException.getMessage());
        mv.setViewName("error");
        return mv;
    }
}
