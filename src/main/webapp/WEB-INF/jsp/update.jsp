<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="css/index_work.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery-1.8.2.min.js">
</script>
<script type="text/javascript">

$(function(){
        $.post('getTypesList.do',function(obj){
            var select=$("[name='tid']");
            select.append('<option value="0">--请选择--</option>');
            for(var i in obj){
            	 select.append('<option value="'+obj[i].tid+'">'+obj[i].tname+'</option>');
                }
            },'json')	
})

function xiugai() {
	 $.post('update.do',$("form").serialize(),function(obj){
         if(obj>0){
            alert("修改成功");
            location.href="list.do";
             }else{
                 alert("修改失败");
                 }
          },'json')
}

</script>
<body>
<form action="" method="post">
<input type="hidden" name="mid" value="${toupdate.mid}">
    电影名称：<input type="text" name="mname" value="${toupdate.mname}"><br>
    介绍：<input type="text" name="content" value="${toupdate.content}"><br>
    导演：<input type="text" name="daoyan" value="${toupdate.daoyan}"><br>
    上映日期 ：<input type="text" name="mdate" value="${toupdate.mdate}"><br>
    类别：<select name="tid">
    </select>
    <input type="button" value="修改" onclick="xiugai()">
</form>

</body>
</html>