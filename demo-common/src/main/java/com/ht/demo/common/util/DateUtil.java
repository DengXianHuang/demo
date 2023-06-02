package com.ht.demo.common.util;


import com.ht.demo.common.util.enums.DateStyleEnum;
import com.ht.demo.common.util.enums.WeekEnum;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * 时间工具类
 *
 * @author huangxian
 * @date 2022/3/18 23:29
 */
public class DateUtil {
    private static final ThreadLocal<SimpleDateFormat> SIMPLEDATEFORMAT = new ThreadLocal<SimpleDateFormat>();

    private static final Object LOCK_FLAG = new Object();

    private static final long ONE_MINUTE = 60;
    private static final long ONE_HOUR = 3600;
    private static final long ONE_DAY = 86400;
    private static final long ONE_MONTH = 2592000;
    private static final long ONE_YEAR = 31104000;

    // 私有构造方法
    private DateUtil() {
    }

    /**
     * 获取SimpleDateFormat
     *
     * @param pattern 日期格式
     * @return SimpleDateFormat对象
     * @throws RuntimeException 异常：非法日期格式
     */
    private static SimpleDateFormat getDateFormat(String pattern) throws RuntimeException {
        SimpleDateFormat dateFormat = SIMPLEDATEFORMAT.get();
        if (dateFormat == null) {
            synchronized (LOCK_FLAG) {
                if (dateFormat == null) {
                    dateFormat = new SimpleDateFormat(pattern);
                    dateFormat.setLenient(false);
                    SIMPLEDATEFORMAT.set(dateFormat);
                }
            }
        }
        dateFormat.applyPattern(pattern);
        return dateFormat;
    }

    /**
     * 获取日期中的某数值。如获取月份
     *
     * @param date     日期
     * @param dateType 日期格式
     * @return 数值
     */
    private static int getInteger(Date date, int dateType) {
        int num = 0;
        Calendar calendar = Calendar.getInstance();
        if (date != null) {
            calendar.setTime(date);
            num = calendar.get(dateType);
        }
        return num;
    }

    public static Date setZeroMinuteAndSecond(Date date) {
        Calendar calendar = Calendar.getInstance();
        if (date != null) {
            calendar.setTime(date);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MINUTE, 0);
        }
        return calendar.getTime();
    }

    /**
     * 增加日期中某类型的某数值。如增加日期
     *
     * @param date     日期字符串
     * @param dateType 类型
     * @param amount   数值
     * @return 计算后日期字符串
     */
    private static String addInteger(String date, int dateType, int amount) {
        String dateString = null;
        DateStyleEnum dateStyle = getDateStyle(date);
        if (dateStyle != null) {
            Date myDate = stringToDate(date, dateStyle);
            myDate = addInteger(myDate, dateType, amount);
            dateString = dateToString(myDate, dateStyle);
        }
        return dateString;
    }

    /**
     * 增加日期中某类型的某数值。如增加日期
     *
     * @param date     日期
     * @param dateType 类型
     * @param amount   数值
     * @return 计算后日期
     */
    private static Date addInteger(Date date, int dateType, int amount) {
        Date myDate = null;
        if (date != null) {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            calendar.add(dateType, amount);
            myDate = calendar.getTime();
        }
        return myDate;
    }

    /**
     * 获取精确的日期
     *
     * @param timestamps 时间long集合
     * @return 日期
     */
    private static Date getAccurateDate(List<Long> timestamps) {
        Date date = null;
        long timestamp = 0;
        Map<Long, long[]> map = new HashMap<Long, long[]>();
        List<Long> absoluteValues = new ArrayList<Long>();

        if (timestamps != null && timestamps.size() > 0) {
            if (timestamps.size() > 1) {
                for (int i = 0; i < timestamps.size(); i++) {
                    for (int j = i + 1; j < timestamps.size(); j++) {
                        long absoluteValue = Math.abs(timestamps.get(i) - timestamps.get(j));
                        absoluteValues.add(absoluteValue);
                        long[] timestampTmp = {timestamps.get(i), timestamps.get(j)};
                        map.put(absoluteValue, timestampTmp);
                    }
                }

                // 有可能有相等的情况。如2012-11和2012-11-01。时间戳是相等的。此时minAbsoluteValue为0
                // 因此不能将minAbsoluteValue取默认值0
                long minAbsoluteValue = -1;
                if (!absoluteValues.isEmpty()) {
                    minAbsoluteValue = absoluteValues.get(0);
                    for (int i = 1; i < absoluteValues.size(); i++) {
                        if (minAbsoluteValue > absoluteValues.get(i)) {
                            minAbsoluteValue = absoluteValues.get(i);
                        }
                    }
                }

                if (minAbsoluteValue != -1) {
                    long[] timestampsLastTmp = map.get(minAbsoluteValue);

                    long dateOne = timestampsLastTmp[0];
                    long dateTwo = timestampsLastTmp[1];
                    if (absoluteValues.size() > 1) {
                        timestamp = Math.abs(dateOne) > Math.abs(dateTwo) ? dateOne : dateTwo;
                    }
                }
            } else {
                timestamp = timestamps.get(0);
            }
        }

        if (timestamp != 0) {
            date = new Date(timestamp);
        }
        return date;
    }

    /**
     * 判断字符串是否为日期字符串
     *
     * @param date 日期字符串
     * @return true or false
     */
    public static boolean isDate(String date) {
        boolean isDate = false;
        if (date != null) {
            if (getDateStyle(date) != null) {
                isDate = true;
            }
        }
        return isDate;
    }

    /**
     * 获取日期字符串的日期风格。失敗返回null。
     *
     * @param date 日期字符串
     * @return 日期风格
     */
    public static DateStyleEnum getDateStyle(String date) {
        DateStyleEnum dateStyle = null;
        Map<Long, DateStyleEnum> map = new HashMap<Long, DateStyleEnum>();
        List<Long> timestamps = new ArrayList<Long>();
        for (DateStyleEnum style : DateStyleEnum.values()) {
            if (style.isShowOnly()) {
                continue;
            }
            Date dateTmp = null;
            if (date != null) {
                try {
                    ParsePosition pos = new ParsePosition(0);
                    dateTmp = getDateFormat(style.getValue()).parse(date, pos);
                    if (pos.getIndex() != date.length()) {
                        dateTmp = null;
                    }
                } catch (Exception e) {
                }
            }
            if (dateTmp != null) {
                timestamps.add(dateTmp.getTime());
                map.put(dateTmp.getTime(), style);
            }
        }
        Date accurateDate = getAccurateDate(timestamps);
        if (accurateDate != null) {
            dateStyle = map.get(accurateDate.getTime());
        }
        return dateStyle;
    }

    /**
     * 将日期字符串转化为日期。失败返回null。
     *
     * @param date      日期字符串
     * @param dateStyle
     * @return 日期
     */
    public static Date StringToDate(String date, DateStyleEnum dateStyle) {
//		DateStyle dateStyle = getDateStyle(date);
        return stringToDate(date, dateStyle);
    }


    /**
     * 将日期字符串转化为日期。失败返回null。
     *
     * @param date    日期字符串
     * @param pattern 日期格式
     * @return 日期
     */
    public static Date StringToDate(String date, String pattern) {
        Date myDate = null;
        if (date != null) {
            try {
                myDate = getDateFormat(pattern).parse(date);
            } catch (Exception e) {
            }
        }
        return myDate;
    }

    /**
     * 将日期字符串转化为日期。失败返回null。
     *
     * @param date      日期字符串
     * @param dateStyle 日期风格
     * @return 日期
     */
    public static Date stringToDate(String date, DateStyleEnum dateStyle) {
        Date myDate = null;
        if (dateStyle != null) {
            myDate = StringToDate(date, dateStyle.getValue());
        }
        return myDate;
    }

    /**
     * 获取日期对象
     *
     * @param millisTime 毫秒格式时间
     * @return Date 日期对象
     */
    public static Date getDate(long millisTime) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(millisTime);
        return calendar.getTime();
    }

    /**
     * 将日期转化为日期字符串。失败返回null。
     *
     * @param date    日期
     * @param pattern 日期格式
     * @return 日期字符串
     */
    public static String dateToString(Date date, String pattern) {
        String dateString = null;
        if (date != null) {
            try {
                dateString = getDateFormat(pattern).format(date);
            } catch (Exception e) {
            }
        }
        return dateString;
    }

    /**
     * 将日期转化为日期字符串。失败返回null。
     *
     * @param date      日期
     * @param dateStyle 日期风格
     * @return 日期字符串
     */
    public static String dateToString(Date date, DateStyleEnum dateStyle) {
        String dateString = null;
        if (dateStyle != null) {
            dateString = dateToString(date, dateStyle.getValue());
        }
        return dateString;
    }

    /**
     * 将日期格式化。失败返回null。
     *
     * @param date      日期
     * @param dateStyle 日期风格
     * @return 日期
     */
    public static Date dateFormat(Date date, DateStyleEnum dateStyle) {
        String dateString = null;
        if (dateStyle != null) {
            dateString = dateToString(date, dateStyle.getValue());
        }
        return StringToDate(dateString, dateStyle);
    }

    /**
     * 将日期字符串转化为另一日期字符串。失败返回null。
     *
     * @param date       旧日期字符串
     * @param newPattern 新日期格式
     * @return 新日期字符串
     */
    public static String StringToString(String date, String newPattern) {
        DateStyleEnum oldDateStyle = getDateStyle(date);
        return StringToString(date, oldDateStyle, newPattern);
    }

    /**
     * 将日期字符串转化为另一日期字符串。失败返回null。
     *
     * @param date         旧日期字符串
     * @param newDateStyle 新日期风格
     * @return 新日期字符串
     */
    public static String StringToString(String date, DateStyleEnum newDateStyle) {
        DateStyleEnum oldDateStyle = getDateStyle(date);
        return StringToString(date, oldDateStyle, newDateStyle);
    }

    /**
     * 将日期字符串转化为另一日期字符串。失败返回null。
     *
     * @param date        旧日期字符串
     * @param olddPattern 旧日期格式
     * @param newPattern  新日期格式
     * @return 新日期字符串
     */
    public static String StringToString(String date, String olddPattern, String newPattern) {
        return dateToString(StringToDate(date, olddPattern), newPattern);
    }

    /**
     * 将日期字符串转化为另一日期字符串。失败返回null。
     *
     * @param date         旧日期字符串
     * @param olddDteStyle 旧日期风格
     * @param newParttern  新日期格式
     * @return 新日期字符串
     */
    public static String StringToString(String date, DateStyleEnum olddDteStyle, String newParttern) {
        String dateString = null;
        if (olddDteStyle != null) {
            dateString = StringToString(date, olddDteStyle.getValue(), newParttern);
        }
        return dateString;
    }

    /**
     * 将日期字符串转化为另一日期字符串。失败返回null。
     *
     * @param date         旧日期字符串
     * @param olddPattern  旧日期格式
     * @param newDateStyle 新日期风格
     * @return 新日期字符串
     */
    public static String StringToString(String date, String olddPattern, DateStyleEnum newDateStyle) {
        String dateString = null;
        if (newDateStyle != null) {
            dateString = StringToString(date, olddPattern, newDateStyle.getValue());
        }
        return dateString;
    }

    /**
     * 将日期字符串转化为另一日期字符串。失败返回null。
     *
     * @param date         旧日期字符串
     * @param olddDteStyle 旧日期风格
     * @param newDateStyle 新日期风格
     * @return 新日期字符串
     */
    public static String StringToString(String date, DateStyleEnum olddDteStyle, DateStyleEnum newDateStyle) {
        String dateString = null;
        if (olddDteStyle != null && newDateStyle != null) {
            dateString = StringToString(date, olddDteStyle.getValue(), newDateStyle.getValue());
        }
        return dateString;
    }

    /**
     * 增加日期的年份。失败返回null。
     *
     * @param date       日期
     * @param yearAmount 增加数量。可为负数
     * @return 增加年份后的日期字符串
     */
    public static String addYear(String date, int yearAmount) {
        return addInteger(date, Calendar.YEAR, yearAmount);
    }

    /**
     * 增加日期的年份。失败返回null。
     *
     * @param date       日期
     * @param yearAmount 增加数量。可为负数
     * @return 增加年份后的日期
     */
    public static Date addYear(Date date, int yearAmount) {
        return addInteger(date, Calendar.YEAR, yearAmount);
    }

    /**
     * 增加日期的月份。失败返回null。
     *
     * @param date        日期
     * @param monthAmount 增加数量。可为负数
     * @return 增加月份后的日期字符串
     */
    public static String addMonth(String date, int monthAmount) {
        return addInteger(date, Calendar.MONTH, monthAmount);
    }

    /**
     * 增加日期的月份。失败返回null。
     *
     * @param date        日期
     * @param monthAmount 增加数量。可为负数
     * @return 增加月份后的日期
     */
    public static Date addMonth(Date date, int monthAmount) {
        return addInteger(date, Calendar.MONTH, monthAmount);
    }

    /**
     * 增加日期的天数。失败返回null。
     *
     * @param date      日期字符串
     * @param dayAmount 增加数量。可为负数
     * @return 增加天数后的日期字符串
     */
    public static String addDay(String date, int dayAmount) {
        return addInteger(date, Calendar.DATE, dayAmount);
    }

    /**
     * 增加日期的天数。失败返回null。
     *
     * @param date      日期
     * @param dayAmount 增加数量。可为负数
     * @return 增加天数后的日期
     */
    public static Date addDay(Date date, int dayAmount) {
        return addInteger(date, Calendar.DATE, dayAmount);
    }

    /**
     * 增加日期的小时。失败返回null。
     *
     * @param date       日期字符串
     * @param hourAmount 增加数量。可为负数
     * @return 增加小时后的日期字符串
     */
    public static String addHour(String date, int hourAmount) {
        return addInteger(date, Calendar.HOUR_OF_DAY, hourAmount);
    }

    /**
     * 增加日期的小时。失败返回null。
     *
     * @param date       日期
     * @param hourAmount 增加数量。可为负数
     * @return 增加小时后的日期
     */
    public static Date addHour(Date date, int hourAmount) {
        return addInteger(date, Calendar.HOUR_OF_DAY, hourAmount);
    }

    /**
     * 增加日期的分钟。失败返回null。
     *
     * @param date         日期字符串
     * @param minuteAmount 增加数量。可为负数
     * @return 增加分钟后的日期字符串
     */
    public static String addMinute(String date, int minuteAmount) {
        return addInteger(date, Calendar.MINUTE, minuteAmount);
    }

    /**
     * 增加日期的分钟。失败返回null。
     *
     * @param date         日期
     * @param minuteAmount 增加数量。可为负数
     * @return 增加分钟后的日期
     */
    public static Date addMinute(Date date, int minuteAmount) {
        return addInteger(date, Calendar.MINUTE, minuteAmount);
    }

    /**
     * 增加日期的秒钟。失败返回null。
     *
     * @param date         日期字符串
     * @param secondAmount 增加数量。可为负数
     * @return 增加秒钟后的日期字符串
     */
    public static String addSecond(String date, int secondAmount) {
        return addInteger(date, Calendar.SECOND, secondAmount);
    }

    /**
     * 增加日期的秒钟。失败返回null。
     *
     * @param date         日期
     * @param secondAmount 增加数量。可为负数
     * @return 增加秒钟后的日期
     */
    public static Date addSecond(Date date, int secondAmount) {
        return addInteger(date, Calendar.SECOND, secondAmount);
    }

    /**
     * 获取日期的年份。失败返回0。
     *
     * @param date 日期字符串
     * @return 年份
     */
    public static int getYear(String date) {
        return getYear(StringToDate(date, DateStyleEnum.YYYY_MM_DD_HH_MM_SS));
    }

    /**
     * 获取日期的年份。失败返回0。
     *
     * @param date 日期
     * @return 年份
     */
    public static int getYear(Date date) {
        return getInteger(date, Calendar.YEAR);
    }

    /**
     * 获取日期的月份。失败返回0。
     *
     * @param date 日期字符串
     * @return 月份
     */
    public static int getMonth(String date) {
        return getMonth(StringToDate(date, DateStyleEnum.YYYY_MM_DD_HH_MM_SS));
    }

    /**
     * 获取日期的月份。失败返回0。
     *
     * @param date 日期
     * @return 月份
     */
    public static int getMonth(Date date) {
        return getInteger(date, Calendar.MONTH) + 1;
    }

    /**
     * 获取日期的天数。失败返回0。
     *
     * @param date 日期字符串
     * @return 天
     */
    public static int getDay(String date) {
        return getDay(StringToDate(date, DateStyleEnum.YYYY_MM_DD_HH_MM_SS));
    }

    /**
     * 获取日期的天数。失败返回0。
     *
     * @param date 日期
     * @return 天
     */
    public static int getDay(Date date) {
        return getInteger(date, Calendar.DATE);
    }

    /**
     * 获取日期的小时。失败返回0。
     *
     * @param date 日期字符串
     * @return 小时
     */
    public static int getHour(String date) {
        return getHour(StringToDate(date, DateStyleEnum.YYYY_MM_DD_HH_MM_SS));
    }

    /**
     * 获取日期的小时。失败返回0。
     *
     * @param date 日期
     * @return 小时
     */
    public static int getHour(Date date) {
        return getInteger(date, Calendar.HOUR_OF_DAY);
    }

    /**
     * 获取日期的分钟。失败返回0。
     *
     * @param date 日期字符串
     * @return 分钟
     */
    public static int getMinute(String date) {
        return getMinute(StringToDate(date, DateStyleEnum.YYYY_MM_DD_HH_MM_SS));
    }

    /**
     * 获取日期的分钟。失败返回0。
     *
     * @param date 日期
     * @return 分钟
     */
    public static int getMinute(Date date) {
        return getInteger(date, Calendar.MINUTE);
    }

    /**
     * 获取日期的秒钟。失败返回0。
     *
     * @param date 日期字符串
     * @return 秒钟
     */
    public static int getSecond(String date) {
        return getSecond(StringToDate(date, DateStyleEnum.YYYY_MM_DD_HH_MM_SS));
    }

    /**
     * 获取日期的秒钟。失败返回0。
     *
     * @param date 日期
     * @return 秒钟
     */
    public static int getSecond(Date date) {
        return getInteger(date, Calendar.SECOND);
    }

    /**
     * 获取日期 。默认yyyy-MM-dd格式。失败返回null。
     *
     * @param date 日期字符串
     * @return 日期
     */
    public static String getDate(String date) {
        return StringToString(date, DateStyleEnum.YYYY_MM_DD);
    }

    /**
     * 获取日期的时间。默认HH:mm:ss格式。失败返回null。
     *
     * @param date 日期
     * @return 时间
     */
    public static String getTime(Date date, DateStyleEnum ds) {
        return DateToString(date, ds);
    }

    /**
     * 获取日期。默认yyyy-MM-dd格式。失败返回null。
     *
     * @param date 日期
     * @return 日期
     */
    public static String getDate(Date date) {
        return dateToString(date, DateStyleEnum.YYYY_MM_DD);
    }

    public static String getDate(Date date, DateStyleEnum style) {
        return dateToString(date, style);
    }

    /**
     * 获取日期。默认yyyy-MM-dd HH:mm:ss Z 格式。失败返回null。
     *
     * @param date 日期
     * @return 日期
     */
    public static String getDateZone(Date date) {
        return dateToString(date, DateStyleEnum.YYYY_MM_DD_HH_MM_SS_Z);
    }

    /**
     * 获取日期。yyyyMMddHHmmss 格式。失败返回null。
     *
     * @param date 日期
     * @return 日期
     */
    public static String getDateStr(Date date) {
        return dateToString(date, DateStyleEnum.YYYY_MM_DD_HH_MM_SS_STR);
    }

    /**
     * 获取日期。默认yyyy-MM-dd HH:mm:ss Z 格式。失败返回null。
     *
     * @param date 日期
     * @return 日期
     */
    public static String getTimeZone(String date) {
        return StringToString(date, DateStyleEnum.YYYY_MM_DD_HH_MM_SS_Z);
    }

    /**
     * 获取日期的时间。默认HH:mm:ss格式。失败返回null。
     *
     * @param date 日期字符串
     * @return 时间
     */
    public static String getTime(String date) {
        return StringToString(date, DateStyleEnum.HH_MM_SS);
    }

    /**
     * 获取日期的时间。默认HH:mm:ss格式。失败返回null。
     *
     * @param date 日期
     * @return 时间
     */
    public static String getTime(Date date) {
        return dateToString(date, DateStyleEnum.HH_MM_SS);
    }

    /**
     * 获取日期的星期。失败返回null。
     *
     * @param date 日期字符串
     * @return 星期
     */
    public static WeekEnum getWeek(String date) {
        WeekEnum week = null;
        DateStyleEnum dateStyle = getDateStyle(date);
        if (dateStyle != null) {
            Date myDate = stringToDate(date, dateStyle);
            week = getWeek(myDate);
        }
        return week;
    }

    /**
     * 获取日期的星期。失败返回null。
     *
     * @param date 日期
     * @return 星期
     */
    public static WeekEnum getWeek(Date date) {
        WeekEnum week = null;
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int weekNumber = calendar.get(Calendar.DAY_OF_WEEK) - 1;
        switch (weekNumber) {
            case 0:
                week = WeekEnum.SUNDAY;
                break;
            case 1:
                week = WeekEnum.MONDAY;
                break;
            case 2:
                week = WeekEnum.TUESDAY;
                break;
            case 3:
                week = WeekEnum.WEDNESDAY;
                break;
            case 4:
                week = WeekEnum.THURSDAY;
                break;
            case 5:
                week = WeekEnum.FRIDAY;
                break;
            case 6:
                week = WeekEnum.SATURDAY;
                break;
        }
        return week;
    }

    /**
     * 获取今天是周几
     *
     * @param date
     * @return
     * @return int
     * @since v2.0.0
     *
     * <PRE>
     * author 蒋永亮
     * Date 2015年10月7日
     * </PRE>
     */
    public static int getWeekDay(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int weekNumber = calendar.get(Calendar.DAY_OF_WEEK) - 1;
        if (weekNumber == 0) {
            weekNumber = 7;
        }
        return weekNumber;
    }

    /**
     * 获取两个日期相差的天数
     *
     * @param date      日期字符串
     * @param otherDate 另一个日期字符串
     * @return 相差天数。如果失败则返回-1
     */
    public static int getIntervalDays(String date, String otherDate) {
        return getIntervalDays(StringToDate(date, DateStyleEnum.YYYY_MM_DD_HH_MM_SS), StringToDate(otherDate, DateStyleEnum.YYYY_MM_DD_HH_MM_SS));
    }

    /**
     * @param date      日期
     * @param otherDate 另一个日期
     * @return 相差天数。如果失败则返回-1
     */
    public static int getIntervalDays(Date date, Date otherDate) {
        int num = -1;
        Date dateTmp = DateUtil.stringToDate(DateUtil.getDate(date), DateStyleEnum.YYYY_MM_DD);
        Date otherDateTmp = DateUtil.stringToDate(DateUtil.getDate(otherDate), DateStyleEnum.YYYY_MM_DD);
        if (dateTmp != null && otherDateTmp != null) {
            long time = Math.abs(dateTmp.getTime() - otherDateTmp.getTime());
            num = (int) (time / (24 * 60 * 60 * 1000));
        }
        return num;
    }

    public static int getIntervalHours(Date newTime, Date oldTime) {
        if (oldTime == null || newTime == null) {
            return 0;
        }
        int hours = 0;

        long time = newTime.getTime() - oldTime.getTime();
        if (time >= 0) {
            // 不足一小时按一小时算，计算尺度到毫秒
            hours = (int) ((time + 59 * 60 * 1000 + 59 * 1000 + 999) / (60 * 60 * 1000));
            return hours;
        } else {
            return -1;
        }
    }

    /**
     * 相差几分钟
     *
     * @param newTime
     * @param oldTime
     */
    public static int getIntervalMinute(Date newTime, Date oldTime) {
        if (oldTime == null || newTime == null) {
            return 0;
        }

        long time = newTime.getTime() - oldTime.getTime();
        if (time >= 0) {
            // 不足一分钟按一分钟算，计算尺度到毫秒
            return (int) (time + 59 * 1000 + 999) / (60 * 1000);
        } else {
            return -1;
        }
    }

    /**
     * newTime比oldTime 多几天
     *
     * <pre>
     * newTime == oldTime 返回0
     * newTime < oldTime 返回-1
     * newTime > oldTime 返回具体相差天数
     * </pre>
     *
     * @param newTime
     * @param oldTime
     * @return 天数
     */
    public static int getIntervalDay(Date oldTime, Date newTime) {

        if (oldTime == null || newTime == null) {
            return 0;
        }

        // 日期转换天
        String newDay = DateUtil.dateToString(newTime, "yyyy-MM-dd");
        String oldDay = DateUtil.dateToString(oldTime, "yyyy-MM-dd");

        /*
         * 判断到达日期
         */
        long newTimeLong = StringToDate(newDay, DateStyleEnum.YYYY_MM_DD_HH_MM_SS).getTime();
        long oldTimeLong = StringToDate(oldDay, DateStyleEnum.YYYY_MM_DD_HH_MM_SS).getTime();

        long diffTime = newTimeLong - oldTimeLong;

        if (diffTime < 0) {

            return -1;

        } else if (diffTime > 0) {
            return (int) (diffTime / (1000 * 3600 * 24));
        }

        return 0;
    }

    /**
     * 方法getIntervalDDHHMM的功能描述：计算2个日期相差几天，几时，几秒
     *
     * @param newTime
     * @param oldTime
     * @return
     * @return int
     * @since v1.0-SNAPSHOT
     *
     * <PRE>
     * author ShenQuan He
     * Date 2015年3月20日
     * </PRE>
     */
    public static String getIntervalDDHHMM(Date newTime, Date oldTime) {
        if (oldTime == null || newTime == null) {
            return null;
        }

        StringBuffer timeStr = new StringBuffer();

        long time = newTime.getTime() - oldTime.getTime();
        if (time >= 0) {
            long day = time / (24 * 60 * 60 * 1000);
            if (day > 0) {
                timeStr.append(day + "天");
            }
            long hour = (time / (60 * 60 * 1000) - day * 24);
            if (day > 0 || hour > 0) {
                timeStr.append(hour + "小时");
            }
            if (day <= 0) {
                long min = ((time / (60 * 1000)) - day * 24 * 60 - hour * 60);
                timeStr.append(min + "分钟");
            }

        }

        return timeStr.toString();
    }

    /**
     * 方法fromToday的功能描述：距离今天多久
     *
     * @param date
     * @return
     * @return String
     * @since v1.3.0
     *
     * <PRE>
     * author huzhanju
     * Date 2015年3月3日
     * </PRE>
     */
    public static String fromToday(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);

        long time = date.getTime() / 1000;
        long now = new Date().getTime() / 1000;
        long ago = now - time;
        if (ago <= ONE_HOUR) {
            return ago / ONE_MINUTE + "分钟前";
        } else if (ago <= ONE_DAY) {
            return ago / ONE_HOUR + "小时" + (ago % ONE_HOUR / ONE_MINUTE) + "分钟前";
        } else if (ago <= ONE_MONTH) {
            long day = ago / ONE_DAY;
            return day + "天前" + calendar.get(Calendar.HOUR_OF_DAY) + "点" + calendar.get(Calendar.MINUTE) + "分";
        } else if (ago <= ONE_YEAR) {
            long month = ago / ONE_MONTH;
            long day = ago % ONE_MONTH / ONE_DAY;
            return month + "个月" + day + "天前" + calendar.get(Calendar.HOUR_OF_DAY) + "点" + calendar.get(Calendar.MINUTE)
                    + "分";
        } else {
            long year = ago / ONE_YEAR;
            int month = calendar.get(Calendar.MONTH) + 1;// JANUARY which is 0
            // so month+1
            return year + "年前" + month + "月" + calendar.get(Calendar.DATE) + "日";
        }
    }

    /**
     * 方法isSameDay的功能描述：判断两个日期是否同一天
     *
     * @param day1
     * @param day2
     * @return Boolean
     * @since v1.3.0
     *
     * <PRE>
     * author huzhanju
     * Date 2015年3月21日
     * </PRE>
     */
    public static Boolean isSameDay(Date day1, Date day2) {
        if (null == day1 || null == day2) {
            return false;
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String ds1 = sdf.format(day1);
        String ds2 = sdf.format(day2);
        if (ds1.equals(ds2)) {
            return true;
        }
        return false;
    }

    /**
     * 方法getIntervalTimeAsString的功能描述 计算 两个日期 相差的时间 返回 eg <1天2小时10分钟6秒>
     *
     * @param startTime
     * @param endTime
     * @return
     * @return String
     * @since v1.3.0
     *
     * <PRE>
     * author Luo,Jingyu
     * Date 2015年4月1日
     * </PRE>
     */
    public static String getIntervalTimeAsString(Date startTime, Date endTime) {
        if (startTime == null || endTime == null) {
            return "";
        }
        long longTime = endTime.getTime() - startTime.getTime();
        long secondTime = longTime / 1000;// 多少秒
        long day = secondTime / ONE_DAY;// 计算差多少天
        long hour = secondTime % ONE_DAY / ONE_HOUR;// 计算差多少小时
        long min = secondTime % ONE_DAY % ONE_HOUR / ONE_MINUTE;// 计算差多少分钟
        long sec = secondTime % ONE_DAY % ONE_HOUR % ONE_MINUTE;// 计算差多少秒
        StringBuilder sb = new StringBuilder();
        sb.append(day).append("天").append(hour).append("小时").append(min).append("分钟").append(sec).append("秒");
        return sb.toString();

    }

    public static String getString(Date date, DateStyleEnum style) {
        return DateToString(date, style);
    }

    /**
     * 将日期转化为日期字符串。失败返回null。
     *
     * @param date      日期
     * @param dateStyle 日期风格
     * @return 日期字符串
     */
    public static String DateToString(Date date, DateStyleEnum dateStyle) {
        String dateString = null;
        if (dateStyle != null) {
            dateString = DateToString(date, dateStyle.getValue());
        }
        return dateString;
    }

    /**
     * 将日期转化为日期字符串。失败返回null。
     *
     * @param date    日期
     * @param pattern 日期格式
     * @return 日期字符串
     */
    public static String DateToString(Date date, String pattern) {
        String dateString = null;
        if (date != null) {
            try {
                dateString = getDateFormat(pattern).format(date);
            } catch (Exception e) {
            }
        }
        return dateString;
    }

    public static int getIntervalSecond(Date newTime, Date oldTime) {
        if (oldTime == null || newTime == null) {
            return 0;
        }

        long time = newTime.getTime() - oldTime.getTime();
        if (time >= 0) {
            // 相差的秒
            return (int) (time / 1000);
        } else {
            return 0;
        }
    }

    /**
     * 获取日期 。默认yyyy-MM-dd格式。失败返回null。
     *
     * @param date 日期
     * @return 日期
     */
    public static String getString(Date date) {
        return DateToString(date, DateStyleEnum.YYYY_MM_DD);
    }

    /**
     * 获取日期的时间。默认HH:mm:ss格式。失败返回null。
     *
     * @param date 日期字符串
     * @return 时间
     */
    public static String getTimeHMS(Date date) {
        return DateToString(date, DateStyleEnum.HH_MM);
    }

    /**
     * 获取日期。默认yyyy-MM-dd HH:mm:ss 格式。失败返回null。
     *
     * @param date 日期
     * @return 日期
     */
    public static String getDateYMDHMS(Date date) {
        return DateToString(date, DateStyleEnum.YYYY_MM_DD_HH_MM_SS);
    }

    /**
     * 方法getWeekDate的功能描述：返回第几周第几天
     *
     * @param week 第几周
     * @param day  多少天
     * @return
     * @return Date
     * @since v1.3.0
     *
     * <PRE>
     * author chenhongwei
     * Date 2015年8月17日
     * </PRE>
     */
    public static Date getWeekDate(int week, int day) {

        Calendar cal = Calendar.getInstance();

        cal.add(Calendar.WEEK_OF_MONTH, week);// 周数

        cal.set(Calendar.DAY_OF_WEEK, day);// 星期

        return cal.getTime();
    }

    /**
     * 获取日期 。默认yyyy-MM-dd格式。失败返回null。
     *
     * @param date 日期字符串
     * @return 日期
     */
    public static Date strToDate(String date) {
        return stringToDate(date, DateStyleEnum.YYYY_MM_DD);
    }


    /**
     * 获取（0~9）数字随机字符串
     */
    public static String getRandoms(int length) {

        Random r = new Random();
        String vars = "";
        for (int i = 0; i < length; i++) {
            vars += r.nextInt(10);
        }
        return vars;
    }

    public static int getRandomindex(int length) {
        int index = new Random().nextInt(length);
        return index;
    }

/*	//取某个范围不通的随机数
	public static int getRandomindex(int length, Map<Integer,RoomGroupUserDO> map, RoomGroupUserDO object){

		if (object.getSortIndex()!=null && map.get(object.getSortIndex())==null && object.getSortIndex()>0){
			map.put(object.getSortIndex(),object);
			return object.getSortIndex();
		}

		while (true){
			Integer index = new Random().nextInt(length);
			if (map.get(index)==null){
				map.put(index,object);
				return index;
			}
		}
	}*/

    //取某个范围不通的随机数
    public static int getRandomindex(int length, Map<Integer, Object> map, Object object) {
        while (true) {
            Integer index = new Random().nextInt(length);
            if (map.get(index) == null) {
                map.put(index, object);
                return index;
            }
        }
    }

    /**
     * 获取当前时间的前一天时间
     */
    public static Date getBeforeDay() {
        //使用roll方法进行向前回滚
        //cl.roll(Calendar.DATE, -1);
        //使用set方法直接进行设置
        Calendar cl = Calendar.getInstance();
        cl.setTime(new Date());
        int day = cl.get(Calendar.DATE);
        cl.set(Calendar.DATE, day - 1);
        return cl.getTime();
    }

    public static String getEndTime(Date date) {

        String endTime = "1天01小时00分";
        if (new Date().compareTo(date) < 0) {
            endTime = DateUtil.getIntervalTimeAsString(new Date(), date);
            return endTime;
        }

        Date afDate = DateUtil.addDay(new Date(), 1);
        String systime = dateToString(new Date(), DateStyleEnum.YYYY_MM_DD_HH_MM_SS_EN);
        String endTimes = dateToString(afDate, DateStyleEnum.YYYY_MM_DD_EN) + " 10:00:00";

        Date sysdate = DateUtil.stringToDate(systime, DateStyleEnum.YYYY_MM_DD_HH_MM_SS_EN);
        Date mydate = DateUtil.stringToDate(endTimes, DateStyleEnum.YYYY_MM_DD_HH_MM_SS_EN);

        endTime = DateUtil.getIntervalTimeAsString(sysdate, mydate);

        return endTime;
    }

    /**
     * 获取本月都第一天日期
     *
     * @return
     */
    public static Date getMonthFirstDay() {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        calendar.add(Calendar.MONTH, 0);
        return DateUtil.dateFormat(calendar.getTime(), DateStyleEnum.YYYY_MM_DD);
    }

    /**
     * 获取本月都最后一天
     *
     * @return
     */
    public static Date getMonthLastDay() {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
//		calendar.set(Calendar.DAY_OF_MONTH, 0);
//		calendar.add(Calendar.MONTH, 1);
//		return DateUtil.dateFormat(calendar.getTime(), DateStyle.YYYY_MM_DD);

        return getLastDayOfMonth(getYear(new Date()), getMonth(new Date()));
    }

    /**
     * 获取下个月都第一天日期
     *
     * @return
     */
    public static Date getNextMonthFirstDay() {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        calendar.add(Calendar.MONTH, 1);
        return DateUtil.dateFormat(calendar.getTime(), DateStyleEnum.YYYY_MM_DD);
    }


    /**
     * 获取某年某个月的第一天 日期
     *
     * @param year
     * @param month
     * @return
     */
    public static Date getFirstDayOfMonth(int year, int month) {
        Calendar cl = Calendar.getInstance();
        cl.set(Calendar.YEAR, year);
        cl.set(Calendar.MONTH, month - 1);
        int firstDay = cl.getActualMinimum(Calendar.DAY_OF_MONTH);
        cl.set(Calendar.DAY_OF_MONTH, firstDay);
        // 格式化日期
        return DateUtil.dateFormat(cl.getTime(), DateStyleEnum.YYYY_MM_DD);
    }

    /**
     * 获取某年某月的最后一天日期
     *
     * @param year
     * @param month
     * @return
     */
    public static Date getLastDayOfMonth(int year, int month) {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year);
        // 设置月份
        cal.set(Calendar.MONTH, month - 1);
        // 获取某月最大天数
        int lastDay = 0;
        //2月的平年瑞年天数
        if (month == 2) {
            lastDay = cal.getLeastMaximum(Calendar.DAY_OF_MONTH);
        } else {
            lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        }
        // 设置日历中月份的最大天数
        cal.set(Calendar.DAY_OF_MONTH, lastDay);

        return DateUtil.dateFormat(cal.getTime(), DateStyleEnum.YYYY_MM_DD);
    }

    /**
     * 前提条件是：start1 < end1 且 start2 < end2
     * 判断2个时间区间是否相重，
     * 相重返回true,不相重返回false
     *
     * @param start1
     * @param end1
     * @param start2
     * @param end2
     * @return
     */
    public static Boolean checkDate(Date start1, Date end1, Date start2, Date end2) {
        Boolean flag = true;
        if (end1.getTime() < start2.getTime()) {
            return false;
        }
        if (start1.getTime() > end2.getTime()) {
            return false;
        }
        return flag;
    }

    /**
     * date to LocalDateTime
     *
     * @param date
     * @return LocalDateTime
     * @author dyg
     * @date 2023/3/8 16:06
     */
    public static LocalDateTime dateToLocalDateTime(Date date) {
        Instant instant = date.toInstant();
        ZoneId zoneId = ZoneId.systemDefault();
        return instant.atZone(zoneId).toLocalDateTime();
    }

    /**
     * LocalDateTime to date
     * @param localDateTime
     * @return date
     * @author dyg
     * @date 2023/3/8 16:06
     */
    public static Date localDateTimeToDate(LocalDateTime localDateTime) {
        ZoneId zoneId = ZoneId.systemDefault();
        ZonedDateTime zdt = localDateTime.atZone(zoneId);
        return Date.from(zdt.toInstant());
    }


    public static String localDateTimeConvert(LocalDateTime localDateTime, String format){
        DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern(format);
        return dtf2.format(localDateTime);
    }

    /**
     * 计算时间差
     *
     * @param endTime   最后时间
     * @param startTime 开始时间
     * @return 时间差（天/小时/分钟）
     */
    public static String timeDistance(Date endDate, Date startTime) {
        long nd = 1000 * 24 * 60 * 60;
        long nh = 1000 * 60 * 60;
        long nm = 1000 * 60;
        // long ns = 1000;
        // 获得两个时间的毫秒时间差异
        long diff = endDate.getTime() - startTime.getTime();
        // 计算差多少天
        long day = diff / nd;
        // 计算差多少小时
        long hour = diff % nd / nh;
        // 计算差多少分钟
        long min = diff % nd % nh / nm;
        // 计算差多少秒//输出结果
        // long sec = diff % nd % nh % nm / ns;
        return day + "天" + hour + "小时" + min + "分钟";
    }

}
