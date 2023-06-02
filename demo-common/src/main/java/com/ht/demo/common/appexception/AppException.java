package com.ht.demo.common.appexception;

/**
 * 自定义异常类
 * @auther hdengxian
 * @Date 2022/12/23 13:10
 */
public class AppException extends RuntimeException{

   private Integer code;
   private String message;
   private AppErrorCodeEnum responseCode;

   public AppException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
      super(message, cause, enableSuppression, writableStackTrace);
   }

   public AppException(AppErrorCodeEnum responseCode){
      super(responseCode.getMessage());
      this.code = responseCode.getCode();
      this.message = responseCode.getMessage();
      this.responseCode = responseCode;
   }
   public AppException(AppErrorCodeEnum responseCode, String message){
      super(message);
      responseCode.setMessage(message);
      this.code = responseCode.getCode();
      this.message = responseCode.getMessage();
      this.responseCode = responseCode;

   }


   public AppException(Integer code, String message){
      super(message);
      this.code=code;
      this.message=message;
      AppErrorCodeEnum codeEnum = AppErrorCodeEnum.getInstance(code);
      codeEnum.setMessage(message);

      if (codeEnum == null) {
         this.responseCode = AppErrorCodeEnum.CUSTOM_ERROR;
      } else {
         this.responseCode = codeEnum;
      }
   }

   public AppException(String message){
      super(message);
      AppErrorCodeEnum codeEnum = AppErrorCodeEnum.CUSTOM_ERROR;
      this.responseCode = AppErrorCodeEnum.CUSTOM_ERROR;
      this.code=codeEnum.getCode();
      this.message=message;
      codeEnum.setMessage(message);
   }



   public AppException(AppErrorCodeEnum responseCode, Throwable cause){
      super(cause);
      this.responseCode = responseCode;
   }

   public Integer getCode() {
      if (responseCode!=null){
         code=responseCode.getCode();
      }
      return code;
   }

   public void setCode(Integer code) {
      this.code = code;
   }

   @Override
   public String getMessage() {
      if (message!=null){
         return message;
      }
      if (responseCode!=null){
         message=responseCode.getMessage();
      }
      return message;
   }

   public void setMessage(String message) {
      this.message = message;
   }

   public AppErrorCodeEnum getResponseCode() {
      return responseCode;
   }

   public void setResponseCode(AppErrorCodeEnum responseCode) {
      this.responseCode = responseCode;
   }

}
