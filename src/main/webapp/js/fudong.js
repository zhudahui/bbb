var img=document.getElementById("main");
//设置div起始点坐标
var x=0,y=0;
//设置div行进速度
var xSpeed=2,ySpeed=1;
//设置图片移动
var w=document.body.clientWidth-200,h=document.body.clientHeight-100;
function floatdiv(){
    //比较图片是否到达边界，如查到达边界 改变方向;如未到达边界
    if(x>w||x<0) xSpeed= -xSpeed;
    if(y>h||y<0) ySpeed= -ySpeed;

    x+=xSpeed;
    y+=ySpeed;

    //设置坐标值，起始坐标+速度
    img.style.top=y+"px";
    img.style.left=x+"px";
    setTimeout("floatdiv()",10);
}
floatdiv();