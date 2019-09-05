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
    function page(cpage) {
		$("[name='cpage']").val(cpage);
		$("#page").submit();
			}

    function qx() {
		$("[name='mids']").each(function(){
         $(this).attr("checked",!$(this).attr("checked"))
			})
	}

	function deleteAll() {
		  $.post('deleteAll.do',$("#delete").serialize(),function(obj){
              if(obj>0){
                 alert("删除成功");
                 location='list.do';
                  }else{
                      alert("删除失败");
                      }
               },'json')
	}
	
</script>

<body>
<form action="list.do" method="post" id="page">
<input type="hidden" name="cpage">
电影名称：<input type="text" name="mname" value="${map.mname}">
<button>查询</button>
</form>



<form action="deleteAll.do" method="post" id="delete">
<input type="button" value="添加" onclick="location='toAdd.do'">
<input type="button" value="批量删除" onclick="deleteAll()">
   <table>
      <tr>
      <td><input type="checkbox" onclick="qx()">全选</td> 
         <td>编号</td>
         <td>电影名称</td>
         <td>简介</td>
         <td>导演</td>
         <td>上映日期</td>
         <td>类别</td>
         <td>操作</td>
      </tr>
      
      <c:forEach items="${moviceList}" var="m">
         <tr>
         <td><input type="checkbox" value="${m.mid}" name="mids"></td>
            <td>${m.mid}</td>
            <td>${m.mname}</td>
            <td>${m.content}</td>
            <td>${m.daoyan}</td>
            <td>${m.mdate}</td>
            <td>${m.tname}</td>
            <td><input type="button" value="修改" onclick="location='toUpdate.do?mid=${m.mid}'"></td>
         </tr>
      </c:forEach>
      <tr>
        <td colspan="8">
         <input type="button" value="首页" onclick="page('1')">
         <input type="button" value="上一页" onclick="page('${page.pageNum-1}')">
         <input type="button" value="下一页" onclick="page('${page.pageNum+1}')">
         <input type="button" value="尾页" onclick="page('${page.pages}')">
      </td>
      </tr>
   </table>
   </form>
</body>
</html>