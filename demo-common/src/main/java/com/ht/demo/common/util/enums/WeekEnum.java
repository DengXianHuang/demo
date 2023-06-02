package com.ht.demo.common.util.enums;

import java.text.DecimalFormat;

/**
 * @author huangxian
 * @date 2022/3/18 23:31
 */
public enum WeekEnum {

    MONDAY("星期一", "周一", "Monday", "Mon.", 1),
    TUESDAY("星期二", "周二", "Tuesday", "Tues.", 2),
    WEDNESDAY("星期三", "周三", "Wednesday", "Wed.", 3),
    THURSDAY("星期四", "周四", "Thursday", "Thur.", 4),
    FRIDAY("星期五", "周五", "Friday", "Fri.", 5),
    SATURDAY("星期六", "周六", "Saturday", "Sat.", 6),
    SUNDAY("星期日", "周日", "Sunday", "Sun.", 0);

    String name_cn;
    String name_cnShort;
    String name_en;
    String name_enShort;
    int    number;

    WeekEnum(String name_cn, String name_cnShort, String name_en, String name_enShort, int number) {
        this.name_cn = name_cn;
        this.name_cnShort = name_cnShort;
        this.name_en = name_en;
        this.name_enShort = name_enShort;
        this.number = number;
    }

    public static WeekEnum getWeekByNumber(int number) {
        for (WeekEnum week : WeekEnum.values()) {
            if (week.getNumber() == number) {
                return week;
            }
        }
        return WeekEnum.MONDAY;
    }
    public String getChineseName() {
        return name_cn;
    }

    public String getChineseShortName() {
        return name_cnShort;
    }

    public String getName() {
        return name_en;
    }

    public String getShortName() {
        return name_enShort;
    }

    public int getNumber() {
        return number;
    }

    public static void main(String[] args) {
        Long l = 9990L;
        Double ratio=5000/1000.00;
        ratio=(100-ratio)/100.00;
        DecimalFormat df=new DecimalFormat("0.00");

        Long realThdrawalAccount =Double.valueOf(df.format((float)l*ratio)).longValue();
        System.out.println(realThdrawalAccount);
    }
}
