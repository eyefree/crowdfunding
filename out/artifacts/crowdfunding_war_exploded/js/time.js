//获取当天日期
function date()
{
    var date = new Date();
    // 2018的第一天
    var until = new Date('2019-07-01 00:00:00');
    // 计算时会发生隐式转换，调用valueOf()方法，转化成时间戳的形式
    var days = (until - date)/1000/3600/24;
    // 下面都是简单的数学计算
    var day = Math.floor(days);
    var hours = (days - day)*24;
    var hour = Math.floor(hours);
    var minutes = (hours - hour)*60;
    var minute = Math.floor(minutes);
    var seconds = (minutes - minute)*60;
    var second = Math.floor(seconds);
    document.getElementById("divBottom1").innerHTML=day+" ";
    document.getElementById("divBottom2").innerHTML=" "+hour+":"+minute+":"+second;
}
setInterval("date()",1000);