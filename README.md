# sorrypy

`sorry有钱真的可以为所欲为`

## 说明

[sorry](https://github.com/xtyxtyx/sorry)是一款很有意思的应用，源自于`sorry有钱真的可以为所欲为`这个梗。
**亮点**是可以换自己的梗生成gif。

可惜部署环境是ubuntu+ruby，我就Fork别人，改一下，就变成我的了

荣誉首先属于[xtyxtyx](https://github.com/xtyxtyx/)，但我要一个star也不过分


`sorry客户真的可以为所欲为`样例：

![](static/cache/sorry-703a480ff26b72c4b2d2cc195b765f35.gif)

## Docker部署
一行搞定
```
docker run -d -p 15000:15000 --name sorry  rikasai/sorry:latest
```
> 如果难以直视`700多 MB`的 Docker 镜像，那你也给我忍受，sorry，开发者真的可以为所欲为


当然也可以
`
pip install -r requirements.txt
`

尽量使用3.9以上版本，低版本可能会`无法生成`或者`生成无字幕gif`。

shell运行
```
python app.py
```
浏览器打开
[http://127.0.0.1:15000/](http://127.0.0.1:15000/)

然后你就可以为所欲为了~~~



## 适配新Gif

目前，想要适配新的gif,需要改动3个文件（修改前建议备份）
```
templates/sorry/index.html
static/sorry/template.mp4
static/sorry/template.tpl
```
其中
```
index.html  按照句子的多少删掉或者增加<input>即可
template.mp4   替换成新视频
template.tpl   替换成新的字幕模板
```

### 字幕模板template.tpl
首先使用aegisub为模板视频创建字幕，保存为sorry.template.ass


![图片](https://dn-coding-net-production-pp.qbox.me/56a213df-9ff7-41e0-9b6c-96b1f0fe2cb6.png)

然后把文本替换成模板字符串 ```{{ sentences[n] }}``` 懒得换图了哈，以这个字符串为准

![图片](https://dn-coding-net-production-pp.qbox.me/6b07bc65-c3d7-4251-aad2-bd7b05af9102.png)

最后保存为template.tpl

现在这个网站就可以制作新的gif了

## 最后

都看到这里了，还不给我点个star就说不过去啦
https://github.com/lihuacai168/sorrypy



