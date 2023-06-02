package com.ht.demo.service.util;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author hdengxian
 * @Date 2023/3/15 12:50
 */
public class HttpClientUtil {
    private static final String ENCODING="utf-8";


    public static String sendGet(HttpGet httpGet) throws IOException {

        String body = "";
        //创建httpclient对象
        CloseableHttpClient client = HttpClientPoolManager.createSSLClientDefault();

        //执行请求操作，并拿到结果（同步阻塞）
        CloseableHttpResponse response = client.execute(httpGet);
        //获取结果实体
        HttpEntity entity = response.getEntity();
        if (entity != null) {
            //按指定编码转换结果实体为String类型
            body = EntityUtils.toString(entity,ENCODING);
        }
        EntityUtils.consume(entity);
        //释放链接
        response.close();
        try {
            httpGet.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
        client.close();

        return body;
    }


    public static String sendPost(HttpPost httpPost, String requestParam) throws IOException {

        String body = "";
        //创建httpclient对象
        CloseableHttpClient client = HttpClientPoolManager.createSSLClientDefault();
        //装填参数
        httpPost.setEntity(new StringEntity(requestParam, Charset.forName("UTF-8")));
        //执行请求操作，并拿到结果（同步阻塞）
        CloseableHttpResponse response = client.execute(httpPost);
        //获取结果实体
        HttpEntity entity = response.getEntity();
        if (entity != null) {
            //按指定编码转换结果实体为String类型
            body = EntityUtils.toString(entity,ENCODING);
        }
        EntityUtils.consume(entity);
        //释放链接
        response.close();
        try {
            httpPost.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
        client.close();

        return body;
    }

    public static String sendPost(HttpPost httpPost, Map<String, String> map) throws IOException {

        String body = "";
        //创建httpclient对象
        CloseableHttpClient client = HttpClientPoolManager.createSSLClientDefault();

        //装填参数
        List<NameValuePair> nvps = new ArrayList<>();
        if (map != null) {
            for (Map.Entry<String, String> entry : map.entrySet()) {
                nvps.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
            }
        }
        httpPost.setEntity(new UrlEncodedFormEntity(nvps, ENCODING));
        //执行请求操作，并拿到结果（同步阻塞）
        CloseableHttpResponse response = client.execute(httpPost);
        //获取结果实体
        HttpEntity entity = response.getEntity();
        if (entity != null) {
            //按指定编码转换结果实体为String类型
            body = EntityUtils.toString(entity,ENCODING);
        }
        EntityUtils.consume(entity);
        //释放链接
        response.close();
        try {
            httpPost.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
        client.close();

        return body;
    }
}
