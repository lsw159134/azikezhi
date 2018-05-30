<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
         contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String contextPath = request.getContextPath();
    String realPath = request.getSession().getServletContext().getRealPath("/");
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + contextPath + "/";
%>
<!doctype html>
<html lang="Hans">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>添加被动元器件</title>

    <style>
        *{
            margin: 0px auto;
        }
        body{
            margin-top:20px;
            text-align: center;
            padding: 15px;
        }
        th,td{
            padding: 10px;
        }
        input{
            height: 20px;
        }
        select{
            height: 30px;
            width: 150px;
        }
    </style>
</head>
<body>

<form action="addPassiveComponent" method="post">
    <table cellpadding="0" cellspacing="0" border="1" >
        <tr>
            <td>名称:</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>电话:</td>
            <td><input type="text" name="phone"></td>
        </tr>
        <tr>
            <td>手机:</td>
            <td><input type="text" name="cellphone"></td>
        </tr>
        <tr>
            <td>QQ:</td>
            <td><input type="text" name="qq"></td>
        </tr>
        <tr>
            <td>地址:</td>
            <td><input type="text" name="address"></td>
        </tr>
        <tr>
            <td>标签:</td>
            <%--<td><input type="text" name="label"></td>--%>
            <td>
                <select name="label">
                    <option value="" selected></option>
                    <option value="贴片电容">贴片电容</option>
                    <option value="贴片电阻">贴片电阻</option>
                    <option value="直插电阻">直插电阻</option>
                    <option value="晶振">晶振</option>
                    <option value="电感">电感</option>
                    <option value="直插LED">直插LED</option>
                    <option value="贴片LED">贴片LED</option>
                    <option value="按键开关">按键开关</option>
                    <option value="电位器">电位器</option>
                    <option value="磁珠">磁珠</option>
                    <option value="电解电容">电解电容</option>
                    <option value="蜂鸣器">蜂鸣器</option>
                    <option value="连接器">连接器</option>
                    <option value="保险丝">保险丝</option>
                    <option value="测试座">测试座</option>
                    <option value="钽电容">钽电容</option>
                    <option value="卡座">卡座</option>
                    <option value="整流桥">整流桥</option>
                    <option value="二三极管">二三极管</option>
                    <option value="排针排母">排针排母</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>标签1:</td>
            <%--<td><input type="text" name="label1"></td>--%>
            <td>
                <select name="label1">
                    <option value="" selected></option>
                    <option value="贴片电容">贴片电容</option>
                    <option value="贴片电阻">贴片电阻</option>
                    <option value="直插电阻">直插电阻</option>
                    <option value="晶振">晶振</option>
                    <option value="电感">电感</option>
                    <option value="直插LED">直插LED</option>
                    <option value="贴片LED">贴片LED</option>
                    <option value="按键开关">按键开关</option>
                    <option value="电位器">电位器</option>
                    <option value="磁珠">磁珠</option>
                    <option value="电解电容">电解电容</option>
                    <option value="数码管">数码管</option>
                    <option value="蜂鸣器">蜂鸣器</option>
                    <option value="连接器">连接器</option>
                    <option value="保险丝">保险丝</option>
                    <option value="测试座">测试座</option>
                    <option value="钽电容">钽电容</option>
                    <option value="卡座">卡座</option>
                    <option value="整流桥">整流桥</option>
                    <option value="二三极管">二三极管</option>
                    <option value="排针排母">排针排母</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>标签2:</td>
            <%--<td><input type="text" name="label2"></td>--%>
            <td>
                <select name="label2">
                    <option value="" selected></option>
                    <option value="贴片电容">贴片电容</option>
                    <option value="贴片电阻">贴片电阻</option>
                    <option value="直插电阻">直插电阻</option>
                    <option value="晶振">晶振</option>
                    <option value="电感">电感</option>
                    <option value="直插LED">直插LED</option>
                    <option value="贴片LED">贴片LED</option>
                    <option value="按键开关">按键开关</option>
                    <option value="电位器">电位器</option>
                    <option value="磁珠">磁珠</option>
                    <option value="电解电容">电解电容</option>
                    <option value="数码管">数码管</option>
                    <option value="蜂鸣器">蜂鸣器</option>
                    <option value="连接器">连接器</option>
                    <option value="保险丝">保险丝</option>
                    <option value="测试座">测试座</option>
                    <option value="钽电容">钽电容</option>
                    <option value="卡座">卡座</option>
                    <option value="整流桥">整流桥</option>
                    <option value="二三极管">二三极管</option>
                    <option value="排针排母">排针排母</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>标签3:</td>
            <%--<td><input type="text" name="label3"></td>--%>
            <td>
                <select name="label3">
                    <option value="" selected></option>
                    <option value="贴片电容">贴片电容</option>
                    <option value="贴片电阻">贴片电阻</option>
                    <option value="直插电阻">直插电阻</option>
                    <option value="晶振">晶振</option>
                    <option value="电感">电感</option>
                    <option value="直插LED">直插LED</option>
                    <option value="贴片LED">贴片LED</option>
                    <option value="按键开关">按键开关</option>
                    <option value="电位器">电位器</option>
                    <option value="磁珠">磁珠</option>
                    <option value="电解电容">电解电容</option>
                    <option value="蜂鸣器">蜂鸣器</option>
                    <option value="连接器">连接器</option>
                    <option value="保险丝">保险丝</option>
                    <option value="测试座">测试座</option>
                    <option value="数码管">数码管</option>
                    <option value="钽电容">钽电容</option>
                    <option value="卡座">卡座</option>
                    <option value="整流桥">整流桥</option>
                    <option value="二三极管">二三极管</option>
                    <option value="排针排母">排针排母</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>标签4:</td>
            <%--<td><input type="text" name="label4"></td>--%>
            <td>
                <select name="label4">
                    <option value="" selected></option>
                    <option value="贴片电容">贴片电容</option>
                    <option value="贴片电阻">贴片电阻</option>
                    <option value="直插电阻">直插电阻</option>
                    <option value="晶振">晶振</option>
                    <option value="电感">电感</option>
                    <option value="直插LED">直插LED</option>
                    <option value="贴片LED">贴片LED</option>
                    <option value="按键开关">按键开关</option>
                    <option value="电位器">电位器</option>
                    <option value="磁珠">磁珠</option>
                    <option value="电解电容">电解电容</option>
                    <option value="蜂鸣器">蜂鸣器</option>
                    <option value="连接器">连接器</option>
                    <option value="保险丝">保险丝</option>
                    <option value="测试座">测试座</option>
                    <option value="数码管">数码管</option>
                    <option value="钽电容">钽电容</option>
                    <option value="卡座">卡座</option>
                    <option value="整流桥">整流桥</option>
                    <option value="二三极管">二三极管</option>
                    <option value="排针排母">排针排母</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>说明:</td>
            <td><input type="text" name="illustration"></td>
        </tr>
        <tr>
            <td>说明1:</td>
            <td><input type="text" name="explain1"></td>
        </tr>
        <tr>
            <td>说明2:</td>
            <td><input type="text" name="explain2"></td>
        </tr>
        <tr>
            <td>说明3:</td>
            <td><input type="text" name="explain3"></td>
        </tr>
        <tr>
            <td>电话:</td>
            <td><input type="text" name="phone1"></td>
        </tr>
        <tr>
            <td>电话:</td>
            <td><input type="text" name="phone2"></td>
        </tr>
        <tr>
            <td>手机:</td>
            <td><input type="text" name="cellphone1"></td>
        </tr>
        <tr>
            <td>QQ:</td>
            <td><input type="text" name="qq1"></td>
        </tr>
        <tr>
            <td>QQ:</td>
            <td><input type="text" name="qq2"></td>
        </tr>
        <tr>
            <td>QQ:</td>
            <td><input type="text" name="qq3"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="提交" style="width: 150px;height: 30px;"></td>
        </tr>
    </table>
</form>
</body>
</html>