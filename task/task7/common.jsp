<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        body{
            margin:0;
            padding:0;
        }
        #header{
            width:100%;
            height:50px;
            border-bottom:1px solid #aaa;
            background-color:#eee;
        }
        #wrap{
            width:742px;
            height:20px;
            margin-left:120px;
        }
        img{
            height:40px;
            margin:5px 30px;
            float:left;
        }
        input[type="text"]{
            height:30px;
            width:600px;
            margin:8px 20px;
            font-size:20px;
            vertical-align:middle;

        }
        input[type="submit"]{
            height:32px;
            width:100px;
            margin-left:10px;
        }
         #result{
            margin:5px;
            border-bottom:1px solid #eee;
            padding-bottom:10px;
        }
        #result:last-child{
            border-bottom:none;
            margin-bottom:25px;
        }
        a{
            text-decoration: none;
            color:blue;
        }

        a:visited{
            color:blue;
        }
        a:hover{
            color:red;
        }
        a:active{
            color: deeppink;;
        }
        span{
            color:red;
        }
        #displayUrl{
            font-size:10px;
            color:green;
        }
        #snippet{
            font-size:12px;
            color:#333;
        }
    </style>
</head>
<body>
    <div id="header" >
        <img src="images/webICon.jpg">
        <form action="showResult.jsp">
            <input type="text" name="title" />
            <input type="submit" value="搜索" />
        </form>
    </div>
    <div id="wrap">

    </div>



<script type="text/javascript">
    //创建xhr对象的兼容函数
    function createXHR(){
        if(typeof XMLHttpRequest != "undefined")
        {
            return new XMLHttpRequest();
        }
        else if(typeof ActiveXObject != "undefined")//用于IE5及IE6
        {
            if(typeof arguments.callee.activeXString != "string")
            {
                var versions = ["MSXML2.XMLHttp.6.0","MSXML2.XMLHttp.3.0","MSXML2.XMLHttp"],i,len;
                for(i=0,len = versions.length;i < len;i++)
                {
                    try
                    {
                        new ActiveXObject(versions[i]);
                        arguments.callee.activeXString = versions[i];
                        break;
                    }catch(ae)
                    {

                    }
                }
            }
            return new ActiveXObject(arguments.callee.activeXString);
        }else
        {
            throw new Error("No XHR object available.");
        }
    }
    //向URL末尾添加参数的函数
    function addURLParam(url,name,value) {
        url += (url.indexOf("?") == -1?"?":"&");
        url += encodeURIComponent(name) + "=" + encodeURIComponent(value);
        return url;
    }
    //构建请求url
    <%request.setCharacterEncoding("utf-8");%>
    var url = "https://api.cognitive.microsoft.com/bing/v5.0/search?q=" + "<%= request.getParameter("title") %>" + "&count=10&offset=0&mkt=zh-CN&safesearch=Moderate";


    //创建
    var xhr = createXHR();

    //接收
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4) //请求/响应过程的活动阶段
        {
            if( (xhr.status >= 200 && xhr.status < 300) || xhr.status == 304)//http状态（响应结果）
            {
                //alert(xhr.responseXML.documentElement.innerHTML);
                var result = JSON.parse(xhr.responseText);
                var resultBlock;
                for (var i = 0; i < 10; i++) {

                    resultBlock = document.createElement('div');
                    resultBlock.setAttribute('id','result');
                    resultBlock.innerHTML = "<span><a id='name'></a></span> <br /> <span id='displayUrl'></span> <br /> <span id='snippet'></span>";

                    resultBlock.children[0].firstChild.innerHTML = result.webPages.value[i].name;
                    resultBlock.children[0].firstChild.setAttribute('href',result.webPages.value[i].url);
                    resultBlock.children[2].innerHTML =  result.webPages.value[i].displayUrl;
                    resultBlock.children[4].innerHTML = result.webPages.value[i].snippet;
                    document.getElementById('wrap').appendChild(resultBlock);
                }
            }
            else
            {
                alert("请求失败：" + xhr.status);//在本地运行的话status为0，但返回正常的responseText值
            }
        }
    };

    xhr.open("get",url,true);

    //重写响应的MIME类型
    //xhr.overrideMimeType("text/xml");
    //增加或修改HTTP请求头部信息
    xhr.setRequestHeader("Host","api.cognitive.microsoft.com");
    xhr.setRequestHeader("Ocp-Apim-Subscription-Key","526051fe22634315a5e1b85773104fbe");
    //发送
    xhr.send(null);

</script>
</body>
</html>