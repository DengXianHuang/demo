# demo

#### 介绍
一个空的springboot框架项目，整合了mybatis，mybatis-plus，redis，jedis，mysql。封装了统一返回对象、分页查询、拦截器、请求过滤，登录验证。持续跟新中，后续将提供AOP+自定义注解实现按钮级别的权限校验

#### 启动说明
demo-ui是前端vue，用的若依开源的
启动后端项目前，建立数据库，将sql文件夹下的demo.sql导入，字符集用的是uf8mb4
配置自己的redis，在application-dev.properties文件中，本地只需要配置这个文件，系统默认使用dev的文件



#### 安装教程

1. 启动dev环境 
   nohup java -Dspring.profiles.active=dev -Xmx64M -Xss256K -Dfile.encoding=UTF-8 -jar route-admin.jar &
2. 启动线上环境
   nohup java -Dspring.profiles.active=online -Xmx64M -Xss256K -Dfile.encoding=UTF-8 -jar route-admin.jar &
3. xxxx


#### 使用说明

1.  xxxx
2.  xxxx
3.  xxxx

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request


#### 特技

1.  使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2.  Gitee 官方博客 [blog.gitee.com](https://blog.gitee.com)
3.  你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解 Gitee 上的优秀开源项目
4.  [GVP](https://gitee.com/gvp) 全称是 Gitee 最有价值开源项目，是综合评定出的优秀开源项目
5.  Gitee 官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6.  Gitee 封面人物是一档用来展示 Gitee 会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)
