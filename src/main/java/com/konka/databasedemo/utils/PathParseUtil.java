package com.konka.databasedemo.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 路径解析工具
 *
 * 根据class.getResources().getPath获取的路径不能直接使用，需要解析
 *
 * @author MoGuichun
 * @version 1.0.0
 * @date 2018-8-21
 */
public class PathParseUtil {

    /**
     * file:开始的，linux系统以此开头
     */
    public static final Pattern FILE_PREFIX_PATTERM = Pattern.compile("file:");

    /**
     * 冒号和斜杠
     */
    public static final Pattern COLON_SLASH = Pattern.compile(":/");

    /**
     * 首次符是斜杠
     */
    public static final Pattern FIRST_SLASH = Pattern.compile("^/");


    public static String getParsedPath(String path) {

        // 针对windows系统的格式 /D:/xxx/yy
        Matcher firstSlashMatcher = FIRST_SLASH.matcher(path);

        if(firstSlashMatcher.find()) {

            Matcher colonSlash = COLON_SLASH.matcher(path);

            if (colonSlash.find()) {

                path = firstSlashMatcher.replaceAll("");

            }

        }

        // 针对linux系统
        Matcher filePrefixPathMather = FILE_PREFIX_PATTERM.matcher(path);
        if (filePrefixPathMather.find()) {

            path = filePrefixPathMather.replaceAll("");

        }

        return path;

    }

}
