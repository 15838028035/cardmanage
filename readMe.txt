
1.环境准备准备,
按照以下工具，配置环境变量，确保maven可以正常运行。
 MyEclipse 10. 
 apache-maven-3.2.3
 jkd1.6
 
2.修改数据库配置文件
	cardmanage\src\main\resources\env.properties
	jdbc.driverClassName=com.mysql.jdbc.Driver
	jdbc.url.server=jdbc:mysql://localhost:3306/cardmanage?useUnicode=true&characterEncoding=UTF-8
	jdbc.username=root
	jdbc.password=root
	修改数据库和登录帐号和密码。
3.执行数据库脚本
	cardmanage\src\main\scripts\cardmanage.sql

4.执行maven命令，打包mvn package 
 
5.将打好的包放在tomcat目录下，启动tomcat.
	登录地址:http://localhost:8080/cardmanage/login.jsp
	默认用户名:system 默认密码:123456

备注:
  (1)执行验收测试
 	 mvn -Pfitnesse test http://localhost:8000
  	 mvn -Pfitnesse-integration integration-test
  	 http://localhost:8001
  (2)验收测试java代码目录:
  	cardmanage\src\acceptancetest\java
  	验收测试java代码请继承基类AbstractAcceptanceTestBaseTestCase.该基类拥有事物控制功能，验收测试执行完后，数据会自动回滚。
  	
  	
  