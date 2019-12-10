package cn.bdqn.execption;

/**
 * 异常类
 */
public class MyException extends Exception {


    private String message;

    /**
     * 构造函数
     * @param message
     */
    public MyException(String message) {
        this.message = message;
    }

    /**
     * 重写父类的方法
     * @return
     */
    @Override
    public String getMessage() {
        return message;
    }
}
