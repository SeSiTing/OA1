<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fy" uri="http://java.sun.com/jsp/femye/fy" %>
<!doctype html>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../../../css/common.css">
    <link rel="stylesheet" href="../../../css/main.css">
    <script type="text/javascript" src="../../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../../js/colResizable-1.3.min.js"></script>
    <script type="text/javascript" src="../../../js/common.js"></script>

    <script type="text/javascript">
        /*全选*/
        $(function () {
            $("[name=all]").click(function () {
                var singles = $("[name=single]");
                for (var i = 0; i < singles.length; i++) {
                    singles[i].checked = $(this)[0].checked;
                }
            })
        })

        /*单个删除*/
        function del(cid) {
            var del=confirm("确认删除");
            if (del==true) {
                del2(cid);
            }
            function del2(cid) {
                $.ajax({
                    url:"/car/void/del_car",
                    data:{id:cid,_method:"delete"},
                    type:"post",
                    dataType:"text",
                    success:function (rs) {
                        if (rs == "true") {
                            $("#tr"+cid).html("");
                        }
                    }
                })
            }
        }

        /*批量删除*/
        function delall() {
            var delall = confirm("确认删除");
            if (delall==true) {
                delall2();
            }
            function delall2() {
                var singles = $("[name=single]");
                var k = -1;
                for (var i = 0; i < singles.length; i++) {
                    if (singles[i].checked == true) {
                        k = 1;
                        document.form1.action="/car/string/del_more";
                        document.form1.submit();
                        break;
                    }
                }
                if (k == -1) {
                    alert("请先选择删除的班级");
                }
            }
        }

        /*excel导出*/
        function excel() {
            var excel = confirm("确认导出");
            if (excel == true) {
                todaochu();
            }
        }

        function todaochu() {
            var singles = $("[name=single]");
            var k = -1;
            for (var i = 0; i < singles.length; i++) {
                if (singles[i].checked == true) {
                    k = 1;
                    document.form1.action="/car/string/excel_more";
                    document.form1.submit();
                    break;
                }
            }
            if (k == -1) {
                alert("请先选择导出的班级");
            }
        }
    </script>
</head>
<body>
<div class="box_bottom pb5 pt5 pr10" style="border-top:1px solid #dadada;">
    <div class="search_bar_btn" style="text-align:left;">
        <a href="/resource/xingzheng/demo2/yuding.jsp" class="ext_btn"><span class=""></span>用车预定</a>
    </div>
</div>


<div class="box_bottom pb5 pt5 pr10" style="border-top:1px solid #dadada;">
    <div class="search_bar_btn" style="text-align:center;">

        <a href="/resource/xingzheng/demo2/add.jsp" class="ext_btn"><span class="add"></span>添加车辆</a>
    </div>
</div>


<div id="table" class="mt10">
    <div class="box span10 oh">
        <form name="form1" action="">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
            <tr>
                <th><input name="all" type="checkbox"></th>
                <th>车牌号</th>
                <th>车型</th>
                <th>颜色</th>
                <th>备注</th>
                <th>操作</th>
            </tr>
                  <c:forEach items="${pi.list}" var="c">

            <tr id="tr${c.id}" class="tr" align="center">
                <input type="hidden" name="id" value="${c.id}">
                <td class="td_center"><input name="single" value="${c.id}" type="checkbox"></td>
                <td name="carid">${c.carid}</td>
                <td name="type">${c.type}</td>
                <td name="color">${c.color}</td>
                <td name="remark">${c.remark}</td>
                <td>
                    <a href="/car/string/show_one?carid=${c.carid}&type=${c.type}&color=${c.color}&remark=${c.remark}&id=${c.id}">编辑</a> |&nbsp;
                    <a href="javascript:void(0)" onclick="del(${c.id})">删除</a>
                </td>
            </tr>
                  </c:forEach>


            <tr>
                <td colspan="2"><input type="button" name="choose1" class="btn btn82 btn_del" value="删除"
                                       onclick="delall()">
                    <input type="button" name="choose2" class="btn btn82 btn_export" value="导出" onclick="excel()">
                </td>
                <td colspan="5" align="right">
                    <div class="page mt10">
                        <div class="pagination">
                            <ul>
                                    <fy:fy url="/car/string/show_all?1=1"
                                           pageInfo="${pi}"></fy:fy>
                            </ul>
                        </div>
                    </div>
                </td>

            </tr>
        </table>
        </form>


    </div>
</div>

</body>
</html>