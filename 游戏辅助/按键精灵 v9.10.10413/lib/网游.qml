[Comment]
命令库是按键精灵8.0版推出的全新功能
您可以把自己常用的函数和子程序写在命令库里让很多个脚本去调用
命令库最大的优势是让多个脚本共享一个命令，修改一处就等于修改多处
目前命令库功能还在测试当中，有任何建议可以在按键精灵论坛提出，网址：http://bbs.ajjl.cn

******注意！这是官方提供的命令库，请勿修改！避免以后按键精灵升级时覆盖您的修改。******//
******          如需新增命令库，可在命令库点击右键选择“新建”命令库            ******//



[General]
MacroID=eb6e2723-6175-4804-a00c-d12ea20def68




[Script]
Sub 前台喊话(数组内容,每句间隔秒,循环时间秒)
    //文字="既然你诚心诚意的发问了|那我就大发慈悲的告诉你|为了防止世界被破坏|为了守护世界的和平|贯彻爱与真实的邪恶|可爱又迷人的反派角色|武藏|小次郎|我们是穿梭在银河中的火箭队.白洞..喵"
    //数组内容=Split(文字,"|")
    //例子：Call lib.网游.前台喊话(数组内容,1,5)
    Dim 数量,i
    Rem 开始
    For 数量=0 To UBound(数组内容)
        SayString 数组内容(数量)
        KeyPressS 13,1
        For i=1 To 每句间隔秒
            Delay 1000
        Next
    Next 
    For i=1 To 循环时间秒
        Delay 1000
    Next
    Goto 开始
End Sub
Sub 方形渐开线(中心点x坐标,中心点y坐标,两点间距离,圈数)
    //例子：Call lib.网游.方形渐开线(400,300,20,20)
    Dim x,y,v,i,j,k
    x=中心点x坐标: y=中心点y坐标
    //设置2点间距离
    v=两点间距离
    i=1
    For 圈数
        j=0:k=v
        For 2
            For i
                x=x+j:y=y+k
                MoveTo x,y
                Delay 10
                //LeftClick 1
            Next 
            j=v:k=0
        Next 
        i=i+1:v=v*(-1)
    Next
End Sub
Sub 圆形渐开线(中心点x坐标,中心点y坐标,两点间距离,递增半径,圈数)
    //例子：Call lib.网游.圆形渐开线(400,300,20,20,20)
    Dim x0,y0,rr,l,n,r,x,y
    //设置圆心坐标
    x0=中心点x坐标:y0=中心点y坐标
    //设置递增半径
    rr=递增半径
    //设置点间距
    l=两点间距离
    //初始化角度
    n=0
    //设置第一圈半径
    r=30
    //设置画圆圈数
    For 圈数
        While n<3.1415926*2
            //画圆公式
            x=x0+r*cos(n)
            y=y0-r*sin(n)
            MoveTo x,y 
            Delay 10
            //LeftClick 1
            //l/r：点距除以半径，取得2点间相对圆心的角度
            //能有效控制扫描点的密度，2点间的距离就比较平均
            n=n+l/r
        Wend 
        //画完一圈后重置角度
        n=0
        //画完一圈后半径递增rr
        r=r+rr
    Next 
End Sub
Sub 椭圆渐开线(中心点x坐标,中心点y坐标,两点间距离,横坐标范围)
    //例子：Call lib.网游.椭圆渐开线(400,300,20,300)
    //声明变量
    Dim x0,y0,n,x,y,color0,cor,l,r
    //标记渐开线找怪开始
    Rem start
    //变量初始化
    x0=中心点x坐标:n=1:y0=中心点y坐标:x=中心点x坐标
    //设置2点间距离
    l=两点间距离
    //限定横坐标范围不超过800
    While x<中心点x坐标+横坐标范围
        //根据渐开线公式计算下一个点的横坐标并赋值给x
        x=x0+4*(cos(n)+n*sin(n))
        //根据渐开线公式计算下一个点的纵坐标并赋值给y
        y=y0+3*(sin(n)-n*cos(n))
        //在鼠标移动之前，获取目标点色值并赋值给color0
        color0=GetPixelColor(x,y)
        //马上移动鼠标到目标点
        Call SetCursorPos(x,y)
        //循环延时
        Delay 10
        //获取鼠标移动后该点色值并赋值给color
        cor=GetPixelColor(x,y)
        //同一点取得的两次色值比较，不同，则执行以下的打怪脚本
        If cor<>color0 Then
            //左键单击
            //LeftClick 1
            //打怪延时
            //Delay 3000
        End If 
        //计算当前点(x,y)到原点(x0,y0)的距离
        r=Sqr((x-x0)^2+(y-y0)^2)
        //渐开线参数增量，其中l/r：点距除以半径，取得2点间相对圆心的角度
        //能有效控制扫描点的密度，2点间的距离就比较平均
        n=n+l/r
    Wend 
    Goto start
    //跳转到开始，重复渐开线搜索
End Sub


//制作：一只鱼
//日期：2009.12.22



