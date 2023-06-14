package com.ht.demo.app.exception;

import com.ht.demo.common.appexception.AppErrorCodeEnum;
import com.ht.demo.common.appexception.AppException;
import com.ht.demo.common.appexception.ResultData;
import org.hibernate.validator.internal.engine.path.PathImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.multipart.MaxUploadSizeExceededException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.ValidationException;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * @auther hdengxian
 * @Date 2023/1/12 13:26
 */
@ControllerAdvice
@Order( value = Ordered.LOWEST_PRECEDENCE )
public class GlobalExceptionHandler {
    private final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseBody
    public ResultData badArgumentHandler(IllegalArgumentException e, HttpServletRequest req) {
        logger.error("badArgumentHandler e{}",e);
        return ResultData.badArgumentValue();
    }

    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    @ResponseBody
    public Object badArgumentHandler(MethodArgumentTypeMismatchException e, HttpServletRequest req) {
        String url= req.getRequestURI();
        String bizCode = req.getHeader("bizCode");
        String queryString = getQueryString(req);
        logger.error("badArgumentHandler,url:{},bizCode:{},queryString:{} e{}", url, bizCode, queryString, e);
        return ResultData.badArgumentValue();
    }

    @ExceptionHandler(MissingServletRequestParameterException.class)
    @ResponseBody
    public Object badArgumentHandler(MissingServletRequestParameterException e) {
        logger.error("badArgumentHandler e{}",e);
        return ResultData.badArgumentValue();
    }

    @ExceptionHandler(HttpMessageNotReadableException.class)
    @ResponseBody
    public Object badArgumentHandler(HttpMessageNotReadableException e) {
        logger.error("badArgumentHandler e{}",e);
        return ResultData.badArgumentValue();
    }

    @ExceptionHandler(ValidationException.class)
    @ResponseBody
    public Object badArgumentHandler(ValidationException e) {
        logger.error("badArgumentHandler e{}",e);
        if (e instanceof ConstraintViolationException) {
            ConstraintViolationException exs = (ConstraintViolationException) e;
            Set<ConstraintViolation<?>> violations = exs.getConstraintViolations();
            for (ConstraintViolation<?> item : violations) {
                String message = ((PathImpl) item.getPropertyPath()).getLeafNode().getName() + item.getMessage();
                return new ResultData(AppErrorCodeEnum.SYSTEM_ERROR.getCode(), message);
            }
        }
        return ResultData.badArgumentValue();
    }


    @ExceptionHandler(AppException.class)
    @ResponseBody
    public Object AppExceptionHandler(AppException e,HttpServletRequest req) {
        String url=  req.getRequestURI();
        String queryString = getQueryString(req);
        String bizCode = req.getHeader("bizCode");
        logger.error("AppExceptionHandler url:{},queryString:{}, bizCode:{},e:{}", url, queryString, bizCode, e);
        if (e instanceof AppException) {
            if (e.getResponseCode().equals(AppErrorCodeEnum.CUSTOM_ERROR)){
                return new ResultData(e.getCode(),e.getMessage());
            }
            return ResultData.badArgumentValue(e);
        }

        return ResultData.badArgumentValue(e);
    }

    @ExceptionHandler(Exception.class)
    @ResponseBody
    public Object seriousHandler(Exception e,HttpServletRequest req) {
        String url= req.getRequestURI();
        String bizCode=req.getHeader("bizCode");
        String queryString =getQueryString(req);
        logger.error("seriousHandler method:{},url:{},bizCode:{},queryString:{} e{}",url,bizCode,queryString,e);

        return ResultData.badArgumentValue();
    }

    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public Object handleFileMax(){
        return new ResultData(AppErrorCodeEnum.SYSTEM_ERROR.getCode(),"你上传的图片或视频太大,请上传2M以下的图片或视频");
    }

    public String getQueryString(HttpServletRequest req){
        Map map=req.getParameterMap();
        Set keSet=map.entrySet();
        StringBuilder stringBuilder = new StringBuilder();
        for (Iterator itr = keSet.iterator(); itr.hasNext(); ) {
            Map.Entry me = (Map.Entry) itr.next();
            Object ok = me.getKey();
            Object ov = me.getValue();
            String[] value = new String[1];
            if (ov instanceof String[]) {
                value = (String[]) ov;
            } else {
                value[0] = ov.toString();
            }
            for (int k = 0; k < value.length; k++) {
//                System.out.println(ok+"="+value[k]);
                stringBuilder.append(ok + "=" + value[k] + " || ");
            }
        }

        return stringBuilder.toString();
    }




}
