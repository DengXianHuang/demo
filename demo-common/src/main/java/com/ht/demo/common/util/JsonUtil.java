package com.ht.demo.common.util;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

/**
 * json工具类
 * @author huangxian
 * @date 2019/6/8 12:23
 */
public class JsonUtil {
    public static Gson gson;
    static {
        //.serializeNulls() 序列化空值。
        GsonBuilder gb = new GsonBuilder();
        gb.disableHtmlEscaping();
//        gb.excludeFieldsWithoutExposeAnnotation();
        /*gb.setFieldNamingPolicy(
                FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES);*/
        gson = gb.create();
    }

    /**
     * 用法：
     * Type type = new TypeToken<List<String>>(){}.getType();
     * List<String> ids = (List<String>)JsonUtil.json2List(body, type);
     * 用到的jar包：
     * import com.google.common.reflect.TypeToken;
     * import java.lang.reflect.Type;
     * @param src
     * @param type
     * @return
     */
    public static List<?> json2List(String src, Type type) {
        List<?> objList = null;
        objList = gson.fromJson(src, type);
        return objList;
    }
    public static List<?> json2List(String src, List<?> list) {
        Type type = new TypeToken<List<?>>(){}.getType();
        List<?> res = json2List(src, type);
        return res;
    }


    public static <T> T parseJson(String jsonStr, Class<T> tClass) {
        if (jsonStr==null){
            return null;
        }
        return gson.fromJson(jsonStr, tClass);
    }

    /**
     * 使用Gson生成json字符串
     * @param src
     * @return
     */
    public static String toJson(Object src) {
        if (src==null){
            return null;
        }
        return gson.toJson(src);
    }

    public static String parseString(String body, String field) {
        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = null;
        try {
            node = mapper.readTree(body);
            JsonNode leaf = node.get(field);
            if (leaf != null) {
                return leaf.asText();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }


    public static List<String> parseStringList(String body, String field) {
        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = null;
        try {
            node = mapper.readTree(body);
            JsonNode leaf = node.get(field);

            if (leaf != null) {
                return mapper.convertValue(leaf, new TypeReference<List<String>>() {
                });
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Integer parseInteger(String body, String field) {

        if (StringUtils.isEmpty(body)){
            return null;
        }

        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = null;
        try {
            node = mapper.readTree(body);
            JsonNode leaf = node.get(field);
            if (leaf != null) {
                return leaf.asInt();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Long parseLong(String body, String field) {

        if (StringUtils.isEmpty(body)){
            return null;
        }

        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = null;
        try {
            node = mapper.readTree(body);
            JsonNode leaf = node.get(field);
            if (leaf != null) {
                return leaf.asLong();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }


    public static Object parseIntegerList(String body, String field) {
        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = null;
        try {
            node = mapper.readTree(body);
            JsonNode leaf = node.get(field);

            if (leaf != null) {
                return mapper.convertValue(leaf, new TypeReference<Object>() {
                });
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }


    public static Boolean parseBoolean(String body, String field) {
        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = null;
        try {
            node = mapper.readTree(body);
            JsonNode leaf = node.get(field);
            if (leaf != null) {
                return leaf.asBoolean();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Short parseShort(String body, String field) {
        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = null;
        try {
            node = mapper.readTree(body);
            JsonNode leaf = node.get(field);
            if (leaf != null) {
                Integer value = leaf.asInt();
                return value.shortValue();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Byte parseByte(String body, String field) {
        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = null;
        try {
            node = mapper.readTree(body);
            JsonNode leaf = node.get(field);
            if (leaf != null) {
                Integer value = leaf.asInt();
                return value.byteValue();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static <T> T parseObject(String body, String field, Class<T> clazz) {
        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = null;
        try {
            node = mapper.readTree(body);
            node = node.get(field);
            if (node==null){
                return null;
            }
            return mapper.treeToValue(node, clazz);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static <T> List<T> parseObjectList(String body, String field, List<T> list) {
        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = null;
        try {
            node = mapper.readTree(body);
            node = node.get(field);
            if (node==null){
                return null;
            }
            Type type = new com.google.gson.reflect.TypeToken<ArrayList<T>>() {
            }.getType();
            List<T> objList = null;
            objList = gson.fromJson(JsonUtil.toJson(node), type);
            return objList;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Object toNode(String json) {
        if (json == null) {
            return null;
        }
        ObjectMapper mapper = new ObjectMapper();
        try {
            JsonNode jsonNode = mapper.readTree(json);
            return jsonNode;
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }


}
