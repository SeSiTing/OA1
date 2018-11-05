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
    <script type="text/javascript" src="../../../js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="../../../js/jquery.validate.js"></script>

    <script type="text/javascript">
        $(function () {
            $("#starttime").blur(function () {
                var sti = $("#starttime").val();
                var eti = $("#endtime").val();
                if (eti!=null&&eti!="") {
                    if (sti >= eti) {
                        alert("起始时间必须小于结束时间");
                        $("#starttime").val("");
                    }
                }

            })
            $("#endtime").blur(function () {
                var sti = $("#starttime").val();
                var eti = $("#endtime").val();
                if (sti!=null) {
                    if (sti >= eti&&sti!="") {
                        alert("起始时间必须小于结束时间");
                        $("#endtime").val("");
                    }
                }

            })

            $("form").validate({
                rules: {
                    carid: {
                        required: true,
                        remote: "/car/void/checkcar"
                    },
                    starttime: {
                        required: true,
                        remote: {
                            type: "get",
                            url: "/car/void/checktime",
                            data: {
                                endtime: function () {
                                    return $("#endtime").val();
                                },
                                carid: function () {
                                    return $("#carid").val();
                                }
                            }
                        }
                    },
                    endtime: {
                        required: true,
                        remote: {
                            type: "get",
                            url: "/car/void/checktime",
                            data: {
                                starttime: function () {
                                    return $("#starttime").val();
                                },
                                carid: function () {
                                    return $("#carid").val();
                                }
                            }
                        }
                    },
                    miles: {
                        required: true,
                        digits: true
                    },
                    address: {required: true},
                    adminId: {required: true},
                    remark: {required: true}
                },
                messages: {
                    carid: {
                        required: "-请输入车牌号-",
                        remote: "-车牌号有误，请重新输入-"
                    },
                    starttime: {
                        required: "-请输入起始时间-",
                        remote: "-已被预约，请换车或换时间-"
                    },
                    endtime: {
                        required: "-请输入结束时间-",
                        remote: "-已被预约，请换车或换时间-"
                    },
                    miles: {
                        required: "-请输入里程-",
                        digits: "-请输入整数-"
                    },
                    address: {required: "-请输入目的地-"},
                    adminId: {required: "-请输审批人-"},
                    remark: {required: "-请输入用车事由-"}
                }
            })
        })
    </script>
</head>

<body>
<div id="forms" class="mt10">
    <div class="box">
        <div class="box_border">
            <div class="box_top"><b class="pl15">预定车辆</b></div>
            <div class="box_center">
                <form action="list.jsp" class="jqtransform">
                    <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="td_right">车牌号：</td>
                            <td class="">
                                <input type="text" id="carid" name="carid" class="input-text lh30" size="40">
                                <span id="spcarid"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_right">用车人：</td>
                            <td name="userId">admin</td>
                        </tr>

                        <tr>
                            <td class="td_right">时间：</td>
                            <td><input type="date" name="starttime" id="starttime" class="input-text lh30"
                                       size="40"></br>to</br>
                                <input type="date" name="endtime" id="endtime" class="input-text lh30" size="40">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_right">目的地：</td>
                            <td><input type="text" name="address" id="address" class="input-text lh30" size="40">
                            </td>

                        </tr>
                        <tr>
                            <td class="td_right">申请里程：</td>
                            <td><input type="text" name="miles" id="miles" class="input-text lh30" size="40">
                            </td>

                        </tr>
                        <tr>
                            <td class="td_right">用车事由：</td>
                            <td><textarea class="input-text lh30" id="remark" name="remark"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_right">下一步审批人：</td>
                            <td>
                                <select class="input-text lh30" name="adminId" id="adminId">
                                    <option value="">请选择</option>
                                    <option>张三</option>
                                    <option>李四</option>
                                </select>
                            </td>

                        </tr>
                        <tr>
                            <td class="td_right">&nbsp;</td>
                            <td class="">
                                <input type="submit" name="button" class="btn btn82 btn_save2" value="确定">
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