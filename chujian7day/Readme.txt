初见《7天客户端》须知：

1，业务代码主要在Modules目录下
    （MVC结构）
    Home    ： 开始界面
    Reserve ： 预订 和 附近酒店
    Pay ： 支付
    Activity ： 活动
    MyProfile ： 我的7天

    （非MVC结构）
    Service：数据业务层，服务器访问API都放这里 （暂时这样，有争议再提出来）
    
2，一些可以公用的组件，尽量放在CJLib/目录下
    

3，图片资源放在Resources目录下，
    Guide目录放新手指引图片，其他按需要添加。
    
4，对项目文件修改的，需要提出来大家商议后再修改。

5，UI元素的定位使用手动编码定位，不使用storyboard。

6，一般情况下使用ARC来进行内存管理，要注意CoreFoundation类不受ARC管理。