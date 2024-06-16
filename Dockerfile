FROM openjdk:21-jdk-slim

#将本地项目jar包拷贝到Docker容器中的位置
ADD build/libs/inyaa-gateway.jar ./
EXPOSE 8001
#开机启动
ENTRYPOINT ["java","-jar","/inyaa-gateway.jar"]
# ENTRYPOINT ["java","-jar","/inyaa-gateway.jar", "--spring.profiles.active=pro"]




