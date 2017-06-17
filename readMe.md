
# 部署指南

## 1.环境准备准备
	按照以下工具，配置环境变量，确保maven可以正常运行。
	1. eclipse 3.2
	2. apache-maven-3.2.3
	3. jkd1.7
	4. tomcat7.0
 
## 2.修改数据库配置文件
	cardmanage\src\main\resources\env.properties
	jdbc.driverClassName=com.mysql.jdbc.Driver
	jdbc.url.server=jdbc:mysql://localhost:3306/cardmanage?useUnicode=true&characterEncoding=UTF-8
	jdbc.username=root
	jdbc.password=root
	修改数据库和登录帐号和密码。
## 3.执行数据库脚本
	cardmanage\src\main\scripts\cardmanage.sql

## 4.执行maven命令，打包 <code>mvn package </code>
 
## 5.将打好的包放在tomcat目录下，启动tomcat.
	登录地址:http://localhost:8080/cardmanage/login.jsp
	
	![登陆效果]( src/main/webapp/images/cardmanage_login.jpg )
	![登陆效果]( https://github.com/975545486/cardmanage/blob/master/src/main/webapp/images/cardmanage_login.jpg)
	默认用户名:system 默认密码:system
	
## 贡献代码


1. Fork 项目
2. 创建分支: `git checkout -b my-new-feature`
3. 提交改变: `git commit -am 'Add some feature'`
4. 推送分支: `git push origin my-new-feature`
5. 提交拉请求 :

## 问题反馈
	15838028035@163.com
	
