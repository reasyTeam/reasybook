# reasy-util [![js-standard-style](https://img.shields.io/badge/code%20style-standard-brightgreen.svg)](http://standardjs.com)
Reasy Team 数据验证和工具库函数

## 安装
```
npm i @reasy-team/util -D
```

## 使用
```
// esm
import {getType} from '@reasy-team/util'

// cmd
const {getType} = require('@reasy-team/util')
```

## API

### util

- [getType](#getType(obj))
- [isObject](#isObject(obj))
- [isEmptyObject](#isEmptyObject(obj))
- [isDefined](#isDefined(val))
- [isUndef](#isUndef(val))
- [ipToInt](#ipToInt(ip))
- [isSameNet](#isSameNet(lanIp,-wanIp,-lanMask,-wanMask))
- [deepClone](#deepClone(obj))
- [debounce](#debounce(func,-seconds,-[immediate=false]))
- [throttle](#throttle(func,-wait))
- [encodeText](#encodeText(str))
- [decodeText](#decodeText(str))
- [guid](#guid())

### validate

- [getUtf8Length](#getUtf8Length(str))
- [required](#required(str))
- [byteLen](#byteLen(str,-[min],-[max]))
- [len](#len(str,-[min],-[max]))
- [num](#num(str,-min,-max))
- [float](#float(str,-min,-max))
- [even](#even(str,-min,-max))
- [url](#url(str))
- [phoneNumber](#phoneNumber(str))
- [domain](#domain(str,-min,-max))
- [mac](#mac(str))
- [specialMac](#specialMac(str))
- [ip](#ip(str))
- [ipNet](#ipNet(str))
- [privateIP](#privateIP(str))
- [netSegmentCheck](#netSegmentCheck(ip,-lanIp,-mask))
- [mask](#mask(str))
- [allMask](#allMask(str))
- [email](#email(str))
- [hex](#hex(str))
- [chkHalf](#chkHalf(str))
- [ascii](#ascii(str))
- [noSpaceStartEnd](#noSpaceStartEnd(str))
- [lanMask](#lanMask(str))
- [noSpace](#noSpace(str))


## 说明

### getType(obj)
通过`Object.prototype.toString`获取值得类型

**参数**
- obj(*any*): 需要处理的值

**返回**

***(string)***: 返回值对应的构造函数名，例如`Object`

**示例**
```js
getType('test') // String
getType([]) // Array
```



### isObject(obj)

是否是`Object`类型，即`getType`的值为`Object`

**参数**
- obj(*any*): 需要处理的值

**返回**
***(boolean)***: 是返回`true`，否则返回`false`

**示例**
```js
isObject('test') // false
isObject([]) // false
isObject({}) // true
```



### isEmptyObject(obj)

是否为空对象

**参数**
- obj(*any*): 需要处理的值

**返回**
***(boolean)***: 是返回`true`，否则返回`false`

**示例**
```js
isEmptyObject({}) // true
isEmptyObject([]) // false
```



### isDefined(val)

不为`null`或者`undefined`

**参数**
- val(*any*): 需要处理的值

**返回**
***(boolean)***: 是返回`true`，否则返回`false`

**示例**
```js
isDefined('test') // true
isDefined() // false
isDefined(null) // false
```



### isUndef(val)

`val`是`null`或者`undefined`

**参数**
- val(*any*): 需要处理的值

**返回**
***(boolean)***: 是返回`true`，否则返回`false`

**示例**
```js
isUndef('test') // false
isUndef() // true
isUndef(null) // true
```



### ipToInt(ip)

将Ip地址转成整数

**参数**
- ip(*string*): 需要处理的值

**返回**
***(number)***: 返回值对应的构造函数名，例如`Object`

**示例**
```js
ipToInt('192.168.168.168') // 3232278696
ipToInt('192.168.0.1') // 3232235521
```



### isSameNet(lanIp, wanIp, lanMask, wanMask)

检测lan口IP和wank口IP是否在同一网段

**参数**
- lanIp(*string*): Lan口IP
- wanIp(*string*): Wan口IP
- lanMask(*string*): Lan口mask
- wanMask(*string*): Wan口mask

**返回**
***(boolean)***: 是返回`true`，否则返回`false`

**示例**
```js
isSameNet('192.168.3.1', '192.168.3.2', '255.255.255.0', '255.255.255.0') // true
isSameNet('192.168.3.1', '192.168.13.2', '255.255.255.0', '255.255.255.0') // false
```



### deepClone(obj)

对象的深度克隆

**参数**
- obj(*any*): 需要克隆的值，如果参数为非对象或者function，则原样返回

**返回**
**(any)**: 返回克隆后的对象

**示例**
```js
deepClone('test') === 'test' // true

let obj = {
  a: 'text'
}
let cloneObj = deepClone(obj) 
cloneObj === obj // fasle
console.log(cloneObj) // {a: 'text'}
```



### debounce(func, seconds, [immediate=false])

创建一个`debounced`（防抖动）函数，该函数会从上一次被调用后，延迟 `wait` 毫秒后调用 `func` 方法。 `func`只会被调用一次。

**参数**
- func(*Function*): 回调函数
- seconds(*number*): 延迟执行毫秒数
- \[immediate=false](boolean): 是否立即执行

**返回**
***(Function)***: 返回新的`debounced`（防抖动）函数。

**示例**
```js
debounce('test') // String
debounce([]) // Array
```


### throttle(func, wait)

创建一个`throttle`（节流）函数，该函数从上一次调用后，延迟`wait`毫秒后调用`func`方法，期间多次调用直接忽略。

**参数**
- func(*Function*): 回调函数
- seconds(*number*): 延迟执行毫秒数

**返回**
***(Function)***: 返回新的`throttle`（节流）函数。

**示例**
```js
throttle('test') // String
throttle([]) // Array
```



### encodeText(str)

html文本特殊字符编码，处理如下字符:`<`，`>`，`"`，`'`，`&`，`空格`

**参数**
- str(*string*): 需要处理的字符串

**返回**
***(string)***: 转码后的字符串

**示例**
```js
encodeText('< >"\'&') // &lt;&nbsp;&gt;&quot;&#39;&amp;
```



### decodeText(str)

`html`文本特殊字符转码成源码。

**参数**
- str(*string*): 需要处理的字符串

**返回**
***(string)***: 字符串对应的源码字符串

**示例**
```js
decodeText('&lt;&nbsp;&gt;&quot;&#39;&amp;') // < >"'&
```



### guid()

获取唯一表示`GUID`

**返回**
***(string)***: GUID

**示例**
```js

```


**以下为数据校验相关函数，验证成功默认返回`undefined`，验证失败返回对应的错误信息**

### getUtf8Length(str)

获取`utf-8`编码字节长度

**参数**
- str(*string*): 需要处理的字符串

**返回**
***(number)***: 字节长度

**示例**
```js
getUtf8Length('test') // 4
getUtf8Length('中文测试') // 12
```

### required(str)

`str`为必填项

**参数**
- str(*string*): 需要处理的字符串

**返回**
***(string)***: 为空返回对应的错误信息，否则返回`undefined`

**示例**
```js
required('') // This field is required
required('不为空') // undefined
```


### len(str, [min], [max])

判断给定的字符串`str`长度(非字节)是否在设定的范围`[min, max]`内。
> 注意：如果`max<min`，则不处理直接返回

**参数**
- str(*string*): 需要处理的字符串
- \[min]*(number)*: 最小长度，可不填
- \[max]*(number)*: 最大长度，可不填

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
len('test') // undefined
len('test', 8,12) // Range: 8 to 12 characters
```



### byteLen(str, [min], [max])

判断给定的字符串`str`字节长度是否在设定的范围`[min, max]`内。
> 注意：如果`max<min`，则不处理直接返回

**参数**
- str(*string*): 需要处理的字符串
- \[min]*(number)*: 最小长度，可不填
- \[max]*(number)*: 最大长度，可不填

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
byteLen('test'， 2，6) // undefined
byteLen('中文好几个字节', 6, 12) // Range: 6 to 12 bytes
```



### num(str, min, max)

判定str为数字字符串，且值大小在设定的范围`[min, max]`内。
> 注意：如果`max<min`，则不处理直接返回

**参数**
- str(*string*): 需要处理的字符串
- \[min]*(number)*: 最小长度，可不填
- \[max]*(number)*: 最大长度，可不填

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
num('test') // String
num([]) // Array
```



### float(str, min, max)

判定str为数字字符串，且值大小在设定的范围`[min, max]`内。
> 注意：如果`max<min`，则不处理直接返回

**参数**
- str(*string*): 需要处理的字符串
- \[min]*(number)*: 最小长度，可不填
- \[max]*(number)*: 最大长度，可不填

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
float('123') // undefined
float('123xx') // Must be float 
```



### even(str, min, max)

判定str为偶数数字字符串，且值大小在设定的范围`[min, max]`内。
> 注意：如果`max<min`，则不处理直接返回

**参数**
- str(*string*): 需要处理的字符串
- \[min]*(number)*: 最小长度，可不填
- \[max]*(number)*: 最大长度，可不填

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
even('8') // undefined
even('9') // Must be even
```



### url(str)

验证url的合法性，不包括协议部分即`http://`等

**参数**
- str(*string*): 需要处理的值

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
url('test') // undefined
url('') // Invalid URL
```



### phoneNumber(str)

验证电话号码的合法性

**参数**
- str(*string*): 需要处理的值

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
phoneNumber('test') // undefined
phoneNumber('') // Enter a valid phone number
```



### domain(str, min, max)

验证域名的合法性，且字节大小在设定的范围`[min, max]`内。
> 注意：如果`max<min`，则不进行字节大小的处理

**参数**
- str(*string*): 需要处理的值

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
domain('192.168.3.6') // undefined
domain('www.baidu.com') // undefined
domain('19213.134.134') // Enter a valid IP address or domain name.
```



### mac(str)

验证mac地址的合法性

**参数**
- str(*string*): 需要处理的值

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
mac('00:02:00:00:00:00') // undefined
mac('00:00:00:00:00:00') // The MAC address cannot be 00:00:00:00:00:00.
```



### specialMac(str)

**参数**
- str(*string*): 需要处理的值

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
specialMac('0023-00ad-0034') // undefined
```



### ip(str)

验证IP地址的合法性，最高位在`1-223`之间，且不能是127

**参数**
- str(*string*): 需要处理的值

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
ip('192.168.3.1') // undefined
ip('192.255.3.255') // Please enter a valid IP address.
```



### ipNet(str)

验证合法IP，且最后一位不能取`0`或`255`

**参数**
- str(*string*): 需要处理的值

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
ipNet('192.255.3.255') // undefined
```



### privateIP(str)

私有IP验证
> A类地址范围：10.0.0.0—10.255.255.255
> B类地址范围：172.16.0.0---172.31.255.555
> C类地址范围：192.168.0.0---192.168.255.255

**参数**
- str(*string*): 需要处理的值

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
privateIP('172.17.242.2') // undefined
privateIP('172.15.242.2') // Enter a valid private IP address
```



### netSegmentCheck(ip, lanIp, mask)

输入IP地址与lanIP是否在同一个网段

**参数**
- ip(*string*): 待验证ip地址
- lanIp(*string*): lan口IP
- mask(*string*): Lan口mask

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
netSegmentCheck('192.168.3.1', '192.168.3.6', '255.255.255.0') // undefined
netSegmentCheck('192.168.13.1', '192.167.3.6', '255.255.0.0') // It must belong to the same network segment as that of the LAN IP address
```



### mask(str)

子网掩码合法性验证，不包括`255.255.255.255`

**参数**
- str(*string*): 需要处理的值

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
mask('255.255.255.254') // undefined
mask('252.255.253.254') // Enter a valid subnet mask
```



### allMask(str)

全子网掩码验证，包括`255.255.255.255`

**参数**
- str(*string*): 需要处理的值

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
allMask('255.255.255.255') // undefined
allMask('252.255.253.254') // Enter a valid subnet mask
```



### email(str)

邮箱合法性验证

**参数**
- str(*string*): 需要处理的值

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
email('75598233@qq.com') // undefined
```



### hex(str)

16进制字符合法性验证

**参数**
- str(*string*): 需要处理的值

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
hex('0123456789abcdefABCDEF') // undefined
hex('asf') // Only hexadecimal characters are allowed.
```



### chkHalf(str)

是否包含全角字符验证

**参数**
- str(*string*): 需要处理的值

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
chkHalf('this is hale测试') // undefined
chkHalf('测试ｊｋｄｆ　f') // Full-width characters are not allowed.
```



### ascii(str)

`ascii`合法性验证

**参数**
- atr(*string*): 需要处理的值

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
ascii('fgdg ') // undefined
ascii('電飯鍋fg') // Please enter non-Chinese characters.
```



### noSpaceStartEnd(str)

字符串首尾是否包含空格验证

**参数**
- str(*string*): 需要处理的值

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
noSpaceStartEnd('this is no blank') // undefined
noSpaceStartEnd('     this is no blank ') // The first and last characters of the SSID cannot be spaces.
```



### lanMask(str)

子网掩码合法性验证，不包含`255.255.255.255`，`255.255.255.254`

**参数**
- str(*string*): 需要处理的值

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
lanMask('255.255.254.0') // undefined
lanMask('255.255.255.254') // Enter a valid subnet mask
```



### noSpace(str)

是否包含空格合法性验证

**参数**
- str(*string*): 需要处理的值

**返回**
***(string)***: 范围内返回`undefined`，否则返回对应的错误信息

**示例**
```js
noSpace('test') // undefined
noSpace('tes t') // Spaces are disallowed
```