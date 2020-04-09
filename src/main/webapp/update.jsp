<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/8
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>编辑</title>

    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>


    <style type="text/css">
        body {
            background-color:#00b38a;
            text-align:center;
        }

        .lp-login {
            position:absolute;
            width:500px;
            height:300px;
            top:50%;
            left:50%;
            margin-top:-250px;
            margin-left:-250px;
            background: #fff;
            border-radius: 4px;
            box-shadow: 0 0 10px #12a591;
            padding: 57px 50px 35px;
            box-sizing: border-box
        }


        .lp-login .submitBtn {
            display:block;
            text-decoration:none;
            height: 48px;
            width: 150px;
            line-height: 48px;
            font-size: 16px;
            color: #fff;
            text-align: center;
            background-image: -webkit-gradient(linear, left top, right top, from(#09cb9d), to(#02b389));
            background-image: linear-gradient(90deg, #09cb9d, #02b389);
            border-radius: 3px
        }


        input[type='text'] {
            height:30px;
            width:250px;
        }

        span {
            font-style: normal;
            font-variant-ligatures: normal;
            font-variant-caps: normal;
            font-variant-numeric: normal;
            font-variant-east-asian: normal;
            font-weight: normal;
            font-stretch: normal;
            font-size: 14px;
            line-height: 22px;
            font-family: "Hiragino Sans GB", "Microsoft Yahei", SimSun, Arial, "Helvetica Neue", Helvetica;
        }

    </style>
    <script type="text/javascript">
        $(function(){
            $(".submitBtn").bind("click",function(){
                var name = $("#name").val();
                var address = $("#address").val();
                var phone = $("#phone").val();


                if(name == null || $.trim(name).length == 0){
                    alert("sorry,必须输入姓名~");
                    return;
                }

                if(address == null || $.trim(address).length == 0){
                    alert("sorry,必须输入地址~");
                    return;
                }

                if(phone == null || $.trim(phone).length == 0){
                    alert("sorry,必须输入电话~");
                    return;
                }
            })
        })

        //检查输入值是否为整数
        /*function checkFormat(obj){
            var reg = /^[0-9]+[0-9]*]*$/;
            if($.trim($(obj).val()).length>0){
                if(!reg.test($(obj).val())){
                    alert("输入格式错误！请输整数！");
                    $(obj).val("");
                }else{
                    $(obj).val(parseInt($(obj).val()));
                }
            }
        }*/
    </script>
</head>
<body>
<form method="post" action="/resume/add">
<table class="lp-login" >
    <tr>
        <td align="right"><span>姓名</span></td>
        <td align="center">
            <input type="text" id="id" name="id" hidden="hidden" value="${resume.id}" ></input>
            <input type="text" id="name" name="name"  value="${resume.name}"></input>
        </td>
    </tr>
    <tr>
        <td align="right"><span>地址</span></td>
        <td align="center">
            <input type="text" id="address"  name="address"  value="${resume.address}"></input>
        </td>
    </tr>
    <tr>
        <td align="right"><span>电话</span></td>
        <td align="center">
            <input type="text" id="phone"  name="phone" value="${resume.phone}"></input>
        </td>
    </tr>
    <tr>
        <td align="center">
            <input type="submit" value="确定"></input>
            <button><a href="/resume/query">取消</a></button>
        </td>
    </tr>

</table>
</form>
</body>
</html>
