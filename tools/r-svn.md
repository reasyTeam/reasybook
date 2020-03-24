一个用于统计SVN代码行数的工具

# 前置软件  

安装之前，需要安装1.8版本java runtime environment(jre)  
以及安装svn命令行，可以下载tortoise svn时，选择加入命令行选项。  

# 安装

注意是全局安装，需要加-g

> npm i r-svn -g

![安装图片](./imgs/install.jpg)

# 统计

1.进入项目更目录   

2.右键+shift，选择在此处打开命令窗口

3.输入r-svn指令  

4.按照提示输入需要统计的起始版本，结束版本

> 例如，我要统计如下3622 至 3647两个版本之间的代码行数  
> 输入起始版本:3622
> 输入结束版本:3647

![安装图片](./imgs/ct.jpg)


![安装图片](./imgs/start.jpg)


5.等待一会，如果卡在 “代码分析中” 请等待一分钟后按(Ctr+C)

6.浏览器会自动打开结果