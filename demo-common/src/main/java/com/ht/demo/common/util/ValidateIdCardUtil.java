package com.ht.demo.common.util;

import com.ht.demo.common.appexception.AppErrorCodeEnum;
import com.ht.demo.common.appexception.AppErrorMessage;
import com.ht.demo.common.appexception.AppException;
import com.ht.demo.common.util.enums.DateStyleEnum;
import org.apache.commons.lang3.StringUtils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 1、将身份证1到17位分别乘以系数（7 9 10 5 8 4 2 1 6 3 7 9 10 5 8 4 2），
 * 2、将分别乘以系数、得到的值相加
 * 3、将系数之和除以11，取得余数，余数结果只可能为：（0 1 2 3 4 5 6 7 8 9 10），如果不在此范围则身份证号码不合法，
 * 4、余数分别对应身份证号最后一位为：             1 0 X 9 8 7 6 5 4 3 2
 * 身份证格式校验,身份证有效性校验
 * @author huangxian
 * @date 2022/4/15 13:43
 */
public class ValidateIdCardUtil {
    private static final Map<Integer, String> AREA_MAP = new HashMap();

    private static final SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

    //身份证号码长度
    private static final int ID_CARD_LENGTH_15 = 15;
    private static final int ID_CARD_LENGTH_18 = 18;

    static {
        AREA_MAP.put(11, "北京");
        AREA_MAP.put(12, "天津");
        AREA_MAP.put(13, "河北");
        AREA_MAP.put(14, "山西");
        AREA_MAP.put(15, "内蒙古");
        AREA_MAP.put(21, "辽宁");
        AREA_MAP.put(22, "吉林");
        AREA_MAP.put(23, "黑龙江");
        AREA_MAP.put(31, "上海");
        AREA_MAP.put(32, "江苏");
        AREA_MAP.put(33, "浙江");
        AREA_MAP.put(34, "安徽");
        AREA_MAP.put(35, "福建");
        AREA_MAP.put(36, "江西");
        AREA_MAP.put(37, "山东");
        AREA_MAP.put(41, "河南");
        AREA_MAP.put(42, "湖北");
        AREA_MAP.put(43, "湖南");
        AREA_MAP.put(44, "广东");
        AREA_MAP.put(45, "广西");
        AREA_MAP.put(46, "海南");
        AREA_MAP.put(50, "重庆");
        AREA_MAP.put(51, "四川");
        AREA_MAP.put(52, "贵州");
        AREA_MAP.put(53, "云南");
        AREA_MAP.put(54, "西藏");
        AREA_MAP.put(61, "陕西");
        AREA_MAP.put(62, "甘肃");
        AREA_MAP.put(63, "青海");
        AREA_MAP.put(64, "宁夏");
        AREA_MAP.put(65, "新疆");
        AREA_MAP.put(71, "台湾");
        AREA_MAP.put(81, "香港");
        AREA_MAP.put(82, "澳门");
        AREA_MAP.put(91, "外国");
    }

    /** 从第一位到第十七位的系数分别为：7 9 10 5 8 4 2 1 6 3 7 9 10 5 8 4 2 **/
    final static int[] POWER_LIST = {7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2};
    /** 将身份证号从1到17位乘以系数之和，再除以11得到的余数。
     * 余数只可能是以下几种:           0 1 2 3 4 5 6 7 8 9 10 这11个数字。
     * 其分别对应的最后一位身份证的号码： 1 0 X 9 8 7 6 5 4 3 2
     * 如果余数与身份证最后一位不一致，则身份证号码不合法 **/
    final static int[] PARITYBIT = {'1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'};

    /**
     * 身份证验证
     *
     * @param certNo 号码内容
     * @return 是否有效 null和"" 都是false
     */
    public static boolean isIDCard(String certNo) {
        if (certNo == null || (certNo.length() != 15 && certNo.length() != 18)) {
            return false;
        }
        final char[] cs = certNo.toUpperCase().toCharArray();
        //校验位数
        int power = 0;
        for (int i = 0; i < cs.length; i++) {
            if (i == cs.length - 1 && cs[i] == 'X')
                break;//最后一位可以 是X或x
            if (cs[i] < '0' || cs[i] > '9')
                return false;
            if (i < cs.length - 1) {
                power += (cs[i] - '0') * POWER_LIST[i];
            }
        }

        //校验区位码
        if (!AREA_MAP.containsKey(Integer.valueOf(certNo.substring(0, 2)))) {
            return false;
        }

        //校验年份
        String year = null;
        year = certNo.length() == 15 ? getIdCardCalendar(certNo) : certNo.substring(6, 10);

        final int iYear = Integer.parseInt(year);
        if (iYear < 1900 || iYear > Calendar.getInstance().get(Calendar.YEAR))
            return false;//1900年的PASS，超过今年的PASS

        //校验月份
        String month = certNo.length() == 15 ? certNo.substring(8, 10) : certNo.substring(10, 12);
        final int iMonth = Integer.parseInt(month);
        if (iMonth < 1 || iMonth > 12) {
            return false;
        }

        //校验天数
        String day = certNo.length() == 15 ? certNo.substring(10, 12) : certNo.substring(12, 14);
        final int iDay = Integer.parseInt(day);
        if (iDay < 1 || iDay > 31)
            return false;
        //校验"校验码"
        if (certNo.length() == 15)
            return true;
        return cs[cs.length - 1] == PARITYBIT[power % 11];
    }

    private static String getIdCardCalendar(String certNo) {
        // 获取出生年月日
        String birthday = certNo.substring(6, 12);
        SimpleDateFormat ft = new SimpleDateFormat("yyMMdd");
        Date birthdate = null;
        try {
            birthdate = ft.parse(birthday);
        } catch (java.text.ParseException e) {
            e.printStackTrace();
        }
        Calendar cday = Calendar.getInstance();
        cday.setTime(birthdate);
        String year = String.valueOf(cday.get(Calendar.YEAR));
        return year;
    }

    /**
     * 根据身份证号码返回年龄和生日
     * map中的key：
     * age：表示Integer类型的年龄
     * date：表示时间类型(java.util.Date)生日
     * dateStr：字符串类型（String）的生日
     * @param idCardNo
     * @return
     * @throws AppException
     */
    public static Map<String, Object> getBirthDate(String idCardNo) throws AppException {
        if (!isIDCard(idCardNo)) {
            throw new AppException(AppErrorCodeEnum.CUSTOM_ERROR, AppErrorMessage.ID_CARD_ERROR);
        }
        // 获取出生年月日
        if (StringUtils.isEmpty(idCardNo)) {
            throw new AppException(AppErrorCodeEnum.CUSTOM_ERROR, AppErrorMessage.ID_CARD_ERROR);
        }
        Integer age = 0;
        Date date = new Date();
        //当前年分
        Integer year = DateUtil.getYear(date);
        //当前月份
        Integer month = DateUtil.getMonth(date);

        StringBuffer buffer = new StringBuffer();
        if (idCardNo.length() == ID_CARD_LENGTH_15) {
            //1980年以前的身份证号需要拼上：19
            //身份证上的年
            String cardYear = "19" + idCardNo.substring(6, 8);
            //身份证上的月份
            String cardMonth = idCardNo.substring(8, 10);
            //身份证上的日
            String cardDay = idCardNo.substring(10, 12);
            buffer.append(cardYear).append("-").append(cardMonth).append("-").append(cardDay);
            age = year - Integer.parseInt(cardYear);
            //小于等于当前月份则没有过生日
            if (Integer.parseInt(cardMonth) <= month) {
                age += 1;
            }
        } else if (idCardNo.length() == ID_CARD_LENGTH_18) {
            String cardYear = idCardNo.substring(6).substring(0, 4);
            String cardMonth = idCardNo.substring(10).substring(0, 2);
            String cardDay = idCardNo.substring(12).substring(0, 2);
            age = Integer.valueOf(year) - Integer.parseInt(cardYear);
            //小于等于当前月份则没有过生日
            if (Integer.parseInt(cardMonth) <= month) {
                age += 1;
            }
            buffer.append(cardYear).append("-").append(cardMonth).append("-").append(cardDay);
        } else {
            throw new AppException(AppErrorCodeEnum.CUSTOM_ERROR, AppErrorMessage.ID_CARD_ERROR);
        }
        if (age < 0) {
            throw new AppException(AppErrorCodeEnum.CUSTOM_ERROR, AppErrorMessage.ID_CARD_ERROR);
        }

        Map<String, Object> map = new HashMap<>();
        map.put("age", age);
        map.put("date", DateUtil.StringToDate(buffer.toString(), DateStyleEnum.YYYY_MM_DD));
        map.put("dateStr", buffer.toString());
        return map;
    }

}
