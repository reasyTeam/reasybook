# Reasy-vue-cli
`Reasy Team`基于`Vue`、`Vue-router`、[@reasy-team/reasy-ui-vue](https://www.npmjs.com/package/@reasy-team/reasy-ui-vue)、[YApi](https://yapi.ymfe.org/)、[mock-mini-server](https://github.com/moshang-xc/mock-mini-server)的快速项目搭建脚手架

**集成以下功能配置**
- b28翻译机制，全局注入翻译函数`Vue.prototype._`
- 本地假数据服务器[YApi](https://yapi.ymfe.org/)/[mock-mini-server](https://github.com/moshang-xc/mock-mini-server)
- `Vue-router`, `Vue`, `axios`, `@reasy-team/reasy-ui-vue`
- 项目模板生成

## 安装和使用
```
# 安装
npm i @reasy-team/reasy-vue-cli -g

# 使用，myApp为项目路径
reasy-vue-cli myApp
cd myApp

# 开发环境
npm run dev

# 生成dll
npm run dll

# 生成环境
npm run build

# 开启mock-mini-server
npm run server

```
> 其中myApp为初始化项目的跟目录，当前路径下存在myApp文件夹，直接使用，不存在则在当前路径下创建该文件夹

## 目录结构
```
├── build # 编译相关，template转ast转render函数
    ├── dll # dll依赖处理，避免重复打包
        ├── generator.js # dll配置文件生成器
        ├── venders.js # dll合并规则配置文件
    ├── webpack.base.config.js # 基础配置
    ├── webpack.dev.config.js # 开发环境配置
    ├── webpack.dll.config.js # dllPlugin配置
    ├── webpack.prod.config.js # 生成环境配置
├── config # 开发环境配置项
├── src # 项目初始化源码目录
    ├── assets # 静态文件
    ├── css # 公共css文件
        ├── vars.scss # 全局CSS变量
    ├── goform # 假数据文件
    ├── libs # 工具类
        ├── http.js # 基于axios的http请求封装
        ├── util.js # 工具函数
        ├── validate.js # 数据校验
    ├── pages # Vue页面文件
        ├── components # Vue组件
        ├── modules # 各模块文件
        ├── index.vue # 首页
        ├── login.vue # 登录页
        ├── quickset.vue # 快速设置页
        ├── navigator.vue # 导航菜单
    ├── router # 路由相关配置
        ├── config.js # 导航信息配置文件
        ├── index.js # Vue-router配置文件
    ├── App.vue # 入口文件
    ├── main.js # 入口文件
├── .babelrc # babel配置文件
├── .eslintignore # eslint ignore
├── .eslintrc.js # eslint配置
├── index.ejs # 模板页
├── mockDebug.js # mock-mini-server中间件调试文件
├── mockhttp.js # mock-mini-server配置文件
├── package.json # 项目信息文件
├── postcss.config.js # postcss配置文件
```

**说明**
- 如果使用`YApi`则可忽略`mock-mini-server`相关配置
- `mock-mini-server`通过开发中间件，可以实现数据的`CRUD`(Create, Read, Update, Delete)操作
- 如需使用`VUEX`，请自行安装，同时修改`build/dll/venders中的配置，加入dll打包中去`
- 提供的`pages`中的模板仅供参考，可以使用，也可以删除
- 提供的`router`中的配置仅供参考，可以使用，也可以删除
- 对于`goform`的删除和位置修改，需要同步修改`webpack.prod.config.js`和`webpack.dev.config.js`中的配置
- `css/vars.scss`中的css变量与组件是保持一致的，故不能随意修改组件相关的变量，以免风格不统一
- 运行`npm run build`需要确保`npm run dll`已被运行过生成相应的`dll`文件

## 语言相关

{% raw %}

全局注入翻译函数`Vue.prototype._`，这样在所有的组件上都能通过`this._('xxx')`去调用翻译函数，当然`window._('xxx')`依然有效，对于`template`中的词条需要如下书写形式才能正确的进行翻译

```js
<template>
    <a href="/logout">{{_('Logout')}}</a>
</template>
```

{% endraw %}