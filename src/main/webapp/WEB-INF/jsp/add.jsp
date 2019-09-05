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
        $.post('getTypesList.do',$("form").serialize(),function(obj){
            var select=$("[name='tid']");
            select.append('<option value="0">--请选择--</option>');
            for(var i in obj){
            	 select.append('<option value="'+obj[i].tid+'">'+obj[i].tname+'</option>');
                }
            },'json')


            $("#tj").click(function(){
              $.post('add.do',$("form").serialize(),function(obj){
                 if(obj>0){
                    alert("添加成功");
                    location='list.do';
                     }else{
                         alert("添加失败");
                         }
                  },'json')
                })
	
})

</script>
<body>
<form action="" method="post">
    电影名称：<input type="text" name="mname"><br>
    介绍：<input type="text" name="content"><br>
    导演：<input type="text" name="daoyan"><br>
    上映日期 ：<input type="text" name="mdate"><br>
    类别：<select name="tid">
    </select>
    <input type="button" value="添加" id="tj">
</form>

</body>
</html>