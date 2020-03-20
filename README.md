# ReasyBook

[@ReasyTeam](https://github.com/reasyTeam)公共资源文件使用说明书。[https://reasyteam.github.io/reasybook](https://reasyteam.github.io/reasybook)



# 使用说明

```
# clone 
git colone https://github.com/reasyTeam/reasybook

# 安装gitbook
npm i gitbook -g

# 安装插件
cd reasybook
npm i
gitbook install

# 本地查看
gitbook serve

# 打包发布更新
npm run build 
## 或者
gitbook build
ren _book docs
```

> 运行`npm run build`的时候可能会报错，这个时候删除目录中的`docs`文件夹，再运`npm run build`行命令即可



# 更新说明

1. 准备好需要更新或添加的markdown文件，添加到相应分类的目录中去

2. 在summary中添加相应的目录信息使得可以连接到第一步中添加的文件
3. 运行`gitbook build`进行本地预览，或者跳过该步骤
4. 运行`npm run build`进行打包
5. 给当前仓库提交`PR`或者直接更新当前库的代码
6. 进入[Reasybook ](https://reasyteam.github.io/reasybook/)查看更新的内容