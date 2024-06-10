pipeline {
    agent any
//     environment {
//         registryUrl= "ccr.ccs.tencentyun.com"       #搭建docker私有仓库（Harbor）或者 用DockerHub 或者用云平台的“容器镜像服务”
//         registry_user= "xxx"
//         registry_pass= "xxx"
//         env=test       //"test" or "prod"        #选择打包及发布的环境
//     }
//     options {
//         timestamps()                    //设置在项目打印日志时带上对应时间
//         disableConcurrentBuilds()       //不允许同时执行流水线，被用来防止同时访问共享资源等
//         buildDiscarder(logRotator(numToKeepStr: '3'))   // 表示保留n次构建历史
//     }

    //gitlab  webhook触发器
    //聚合项目，代码发生以下动作后，所有子项目将被触发构建,可选择使用（前提需要gitlab配置 webhook）
    //triggers{    //方法一，为All时
    //   gitlab( triggerOnPush: true,                       //代码有push动作就会触发job
    //       triggerOnMergeRequest: true,                   //代码有merge动作就会触发job
    //        branchFilterType: "All")          //为All时（只有符合条件的分支才会触发构建 “All/NameBasedFilter/RegexBasedFilter”）
    //}
    //triggers{    //方法二，为branchFilterType时
    //   gitlab( triggerOnPush: true,
    //       triggerOnMergeRequest: true,
    //        branchFilterType: "branchFilterType",          //为branchFilterType时
    //        includeBranchesSpec: "dev")      //基于branchFilterType值，输入期望包括的分支的规则
    //}

    stages {
        stage('Print Message') {
            steps {
                script{
                    String gitCommitMessage = getCommitMessage()
                    println("GIT CommitMessage: " + gitCommitMessage)
                    if(gitCommitMessage != "release-inyaw-gateway" && gitCommitMessage != "release-inyaw-all") {
                        exit 1
                    }
                }
           }
        }
//         stage('Print Message') {      //自动获取代码+打印信息
//             steps {
//                 echo "workspace: ${WORKSPACE}  build_id: ${BUILD_ID}  branch(gitlab分支名): ${env.BRANCH_NAME}"
//                 echo "registryUrl: ${registryUrl}"
//            }
//         }
//         //此步骤在调试Jenkinsfile时可以注释以便了解目录结构
//         stage('Delete Workspace') {         //清理工作目录
//             steps {
//                 echo "清理工作目录: ${WORKSPACE}"
//                 deleteDir()     //表示删除当前目录(${WORKSPACE})下内容，通常用在构建完毕之后清空工作空间
//             }
//         }
//         stage('Packaging projetc') {   //编译构建
//             steps {
//                 echo 'mvn打包子项目'
//                 script {
//                     sh 'source /etc/profile && mvn clean package -pl ${JOB_NAME%%/*} -am -amd -P${env} -Dmaven.test.skip=true'     //springboot maven 多模块 jenkins 单独打包子项目
//                 }
//             }
//         }
//         stage('Build & Push Image to Harbor') {   //构建、推送镜像
//             steps {
//                 echo '构建，推送镜像到docker镜像仓库'
//                 dir ('./') {       //指定工作目录（默认为${WORKSPACE}）
//                     script {
//                         sh 'mv ${JOB_NAME%%/*}/Dockerfile  ./'
//                         sh 'docker login  --username=${registry_user} --password=${registry_pass}   ${registryUrl}'
//                         def app = docker.build('${registryUrl}/${JOB_NAME%%/*}:${env}')
//                         app.push('${env}')
//                         sh 'docker rmi ${registryUrl}/${JOB_NAME%%/*}:${env}'     //删除jenkins本地新建的镜像
//                     }
//                 }
//                 //推送镜像后，删除工作空间除Jenkinsfile & start.sh以外所有文件
//                 sh '''rm -rf `ls | egrep -v '(Jenkinsfile|start.sh)'`'''
//             }
//         }
//
//         stage('Deploy to the Target server') {  //部署
//             //when {
//             //    beforeAgent true
//             //    branch "${env.BRANCH_NAME}"              //gitlab分支名称
//             //}
//             steps {
//                 timeout(time: 40, unit: 'SECONDS') {    // 设置远程部署超过40秒，将终止该步骤
//                 //部署到${env}环境
//                 sh 'bash ./start.sh ${JOB_NAME%%/*} ${registryUrl}/${JOB_NAME%%/*}:${env}　${env}'    //位置变量1：工程名字  ； 位置变量2：镜像名字  ； 位置变量3：指定环境
//                 }
//             }
//         }

    }
}