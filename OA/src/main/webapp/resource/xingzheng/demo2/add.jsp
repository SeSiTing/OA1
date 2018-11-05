<!doctype html>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../../../css/common.css">
    <link rel="stylesheet" href="../../../css/main.css">
    <script type="text/javascript" src="../../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../../js/colResizable-1.3.min.js"></script>
    <script type="text/javascript" src="../../../js/common.js"></script>


    <script type="text/javascript">
        $(function () {
            $("#carid").blur(function () {
                var newcarid = $("#carid").val();
                var carid = "-1";
                $.ajax({
                    url: "/car/void/onlyone",
                    data: {newcarid: newcarid, carid: carid},
                    type: "get",
                    dataType: "text",
                    success: function (rs) {
                        if (rs == "true") {
                            $("#spcarid").html("");
                        } else {
                            $("#spcarid").html("*车牌号重复，请重新输入");
                            $("#carid").val("");
                        }
                    }
                })
            })

            $("form").submit(function (e) {
                var carid = $("#carid").val();
                if (carid=="") {
                    $("#spcarid").html("*请输入车牌号");
                    e.preventDefault();
                }
            })
        })
    </script>
</head>

<body>
<div id="forms" class="mt10">
    <div class="box">
        <div class="box_border">
            <div class="box_top"><b class="pl15">添加车辆</b></div>
            <div class="box_center">
                <form action="/car/string/add_car" class="jqtransform" method="post">
                    <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="td_right">车牌号：</td>
                            <td class="">
                                <input type="text" name="carid" id="carid" class="input-text lh30" size="40">
                                <span id="spcarid" style="color: red"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_right">车型：</td>
                            <td><input type="" name="type" class="input-text lh30" size="40"></td>
                        </tr>
                        <tr>
                            <td class="td_right">颜色：</td>
                            <td><input type="" name="color" class="input-text lh30" size="40"></td>
                        </tr>
                        <tr>
                            <td class="td_right">备注：</td>
                            <td><textarea name="remark" class="input-text lh30"></textarea></td>
                        </tr>
                        <tr>
                            <td class="td_right">&nbsp;</td>
                            <td class="">
                                <input type="submit" name="button" class="btn btn82 btn_save2" value="保存">
                                <input type="button" name="button" class="btn btn82 btn_res"
                                       onclick="location.href='javascript:history.go(-1)'" value="返回">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
</body>

</html>