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

<form action="submitPassiveComponent" method="post">
    <input type="hidden" value="${pc.passivecomponentsuid}" name="passivecomponentsuid" />
    <table cellpadding="0" cellspacing="0" border="1" >
        <tr>
            <td>名称:</td>
            <td><input type="text" value="${pc.name}" name="name"></td>
        </tr>
        <tr>
            <td>电话:</td>
            <td><input type="text" name="phone" value="${pc.phone}"></td>
        </tr>
        <tr>
            <td>手机:</td>
            <td><input type="text" name="cellphone" value="${pc.cellphone}"></td>
        </tr>
        <tr>
            <td>QQ:</td>
            <td><input type="text" name="qq" value="${pc.qq}"></td>
        </tr>
        <tr>
            <td>地址:</td>
            <td><input type="text" name="address" value="${pc.address}"></td>
        </tr>
        <tr>
            <td>标签:</td>
            <%--<td><input type="text" name="label"></td>--%>
            <td>
                <select name="label">
                    <option value="" <c:if test="${empty pc.label}" >selected</c:if>></option>
                    <option value="贴片电容" <c:if test="${pc.label=='贴片电容'}" >selected</c:if>>贴片电容</option>
                    <option value="贴片电阻" <c:if test="${pc.label=='贴片电阻'}" >selected</c:if>>贴片电阻</option>
                    <option value="直插电阻" <c:if test="${pc.label=='直插电阻'}" >selected</c:if>>直插电阻</option>
                    <option value="晶振" <c:if test="${pc.label=='晶振'}" >selected</c:if>>晶振</option>
                    <option value="电感" <c:if test="${pc.label=='电感'}" >selected</c:if>>电感</option>
                    <option value="直插LED" <c:if test="${pc.label=='直插LED'}" >selected</c:if>>直插LED</option>
                    <option value="贴片LED" <c:if test="${pc.label=='贴片LED'}" >selected</c:if>>贴片LED</option>
                    <option value="按键开关" <c:if test="${pc.label=='按键开关'}" >selected</c:if>>按键开关</option>
                    <option value="电位器" <c:if test="${pc.label=='电位器'}" >selected</c:if>>电位器</option>
                    <option value="磁珠" <c:if test="${pc.label=='磁珠'}" >selected</c:if>>磁珠</option>
                    <option value="电解电容" <c:if test="${pc.label=='电解电容'}" >selected</c:if>>电解电容</option>
                    <option value="蜂鸣器" <c:if test="${pc.label=='蜂鸣器'}" >selected</c:if>>蜂鸣器</option>
                    <option value="连接器" <c:if test="${pc.label=='连接器'}" >selected</c:if>>连接器</option>
                    <option value="保险丝" <c:if test="${pc.label=='保险丝'}" >selected</c:if>>保险丝</option>
                    <option value="数码管" <c:if test="${pc.label=='数码管'}" >selected</c:if>>数码管</option>
                    <option value="测试座" <c:if test="${pc.label3=='测试座'}" >selected</c:if>>测试座</option>
                    <option value="钽电容" <c:if test="${pc.label3=='钽电容'}" >selected</c:if>>钽电容</option>
                    <option value="卡座" <c:if test="${pc.label3=='卡座'}" >selected</c:if>>卡座</option>
                    <option value="排针排母" <c:if test="${pc.label3=='排针排母'}" >selected</c:if>>排针排母</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>标签1:</td>
            <%--<td><input type="text" name="label1"></td>--%>
            <td>
                <select name="label1">
                    <option value="" <c:if test="${empty pc.label1}" >selected</c:if>></option>
                    <option value="贴片电容" <c:if test="${pc.label1=='贴片电容'}" >selected</c:if>>贴片电容</option>
                    <option value="贴片电阻" <c:if test="${pc.label1=='贴片电阻'}" >selected</c:if>>贴片电阻</option>
                    <option value="直插电阻" <c:if test="${pc.label1=='直插电阻'}" >selected</c:if>>直插电阻</option>
                    <option value="晶振" <c:if test="${pc.label1=='晶振'}" >selected</c:if>>晶振</option>
                    <option value="电感" <c:if test="${pc.label1=='电感'}" >selected</c:if>>电感</option>
                    <option value="直插LED" <c:if test="${pc.label1=='直插LED'}" >selected</c:if>>直插LED</option>
                    <option value="贴片LED" <c:if test="${pc.label1=='贴片LED'}" >selected</c:if>>贴片LED</option>
                    <option value="按键开关" <c:if test="${pc.label1=='按键开关'}" >selected</c:if>>按键开关</option>
                    <option value="电位器" <c:if test="${pc.label1=='电位器'}" >selected</c:if>>电位器</option>
                    <option value="磁珠" <c:if test="${pc.label1=='磁珠'}" >selected</c:if>>磁珠</option>
                    <option value="电解电容" <c:if test="${pc.label1=='电解电容'}" >selected</c:if>>电解电容</option>
                    <option value="蜂鸣器" <c:if test="${pc.label1=='蜂鸣器'}" >selected</c:if>>蜂鸣器</option>
                    <option value="连接器" <c:if test="${pc.label1=='连接器'}" >selected</c:if>>连接器</option>
                    <option value="保险丝" <c:if test="${pc.label1=='保险丝'}" >selected</c:if>>保险丝</option>
                    <option value="数码管" <c:if test="${pc.label1=='数码管'}" >selected</c:if>>数码管</option>
                    <option value="测试座" <c:if test="${pc.label3=='测试座'}" >selected</c:if>>测试座</option>
                    <option value="钽电容" <c:if test="${pc.label3=='钽电容'}" >selected</c:if>>钽电容</option>
                    <option value="卡座" <c:if test="${pc.label3=='卡座'}" >selected</c:if>>卡座</option>
                    <option value="排针排母" <c:if test="${pc.label3=='排针排母'}" >selected</c:if>>排针排母</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>标签2:</td>
            <%--<td><input type="text" name="label2"></td>--%>
            <td>
                <select name="label2">
                    <option value="" <c:if test="${empty pc.label2}" >selected</c:if>></option>
                    <option value="贴片电容" <c:if test="${pc.label2=='贴片电容'}" >selected</c:if>>贴片电容</option>
                    <option value="贴片电阻" <c:if test="${pc.label2=='贴片电阻'}" >selected</c:if>>贴片电阻</option>
                    <option value="直插电阻" <c:if test="${pc.label2=='直插电阻'}" >selected</c:if>>直插电阻</option>
                    <option value="晶振" <c:if test="${pc.label2=='晶振'}" >selected</c:if>>晶振</option>
                    <option value="电感" <c:if test="${pc.label2=='电感'}" >selected</c:if>>电感</option>
                    <option value="直插LED" <c:if test="${pc.label2=='直插LED'}" >selected</c:if>>直插LED</option>
                    <option value="贴片LED" <c:if test="${pc.label2=='贴片LED'}" >selected</c:if>>贴片LED</option>
                    <option value="按键开关" <c:if test="${pc.label2=='按键开关'}" >selected</c:if>>按键开关</option>
                    <option value="电位器" <c:if test="${pc.label2=='电位器'}" >selected</c:if>>电位器</option>
                    <option value="磁珠" <c:if test="${pc.label2=='磁珠'}" >selected</c:if>>磁珠</option>
                    <option value="电解电容" <c:if test="${pc.label2=='电解电容'}" >selected</c:if>>电解电容</option>
                    <option value="蜂鸣器" <c:if test="${pc.label2=='蜂鸣器'}" >selected</c:if>>蜂鸣器</option>
                    <option value="连接器" <c:if test="${pc.label2=='连接器'}" >selected</c:if>>连接器</option>
                    <option value="保险丝" <c:if test="${pc.label2=='保险丝'}" >selected</c:if>>保险丝</option>
                    <option value="数码管" <c:if test="${pc.label2=='数码管'}" >selected</c:if>>数码管</option>
                    <option value="测试座" <c:if test="${pc.label3=='测试座'}" >selected</c:if>>测试座</option>
                    <option value="钽电容" <c:if test="${pc.label3=='钽电容'}" >selected</c:if>>钽电容</option>
                    <option value="卡座" <c:if test="${pc.label3=='卡座'}" >selected</c:if>>卡座</option>
                    <option value="排针排母" <c:if test="${pc.label3=='排针排母'}" >selected</c:if>>排针排母</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>标签3:</td>
            <%--<td><input type="text" name="label3"></td>--%>
            <td>
                <select name="label3">
                    <option value="" <c:if test="${empty pc.label3}" >selected</c:if>></option>
                    <option value="贴片电容" <c:if test="${pc.label3=='贴片电容'}" >selected</c:if>>贴片电容</option>
                    <option value="贴片电阻" <c:if test="${pc.label3=='贴片电阻'}" >selected</c:if>>贴片电阻</option>
                    <option value="直插电阻" <c:if test="${pc.label3=='直插电阻'}" >selected</c:if>>直插电阻</option>
                    <option value="晶振" <c:if test="${pc.label3=='晶振'}" >selected</c:if>>晶振</option>
                    <option value="电感" <c:if test="${pc.label3=='电感'}" >selected</c:if>>电感</option>
                    <option value="直插LED" <c:if test="${pc.label3=='直插LED'}" >selected</c:if>>直插LED</option>
                    <option value="贴片LED" <c:if test="${pc.label3=='贴片LED'}" >selected</c:if>>贴片LED</option>
                    <option value="按键开关" <c:if test="${pc.label3=='按键开关'}" >selected</c:if>>按键开关</option>
                    <option value="电位器" <c:if test="${pc.label3=='电位器'}" >selected</c:if>>电位器</option>
                    <option value="磁珠" <c:if test="${pc.label3=='磁珠'}" >selected</c:if>>磁珠</option>
                    <option value="电解电容" <c:if test="${pc.label3=='电解电容'}" >selected</c:if>>电解电容</option>
                    <option value="蜂鸣器" <c:if test="${pc.label3=='蜂鸣器'}" >selected</c:if>>蜂鸣器</option>
                    <option value="连接器" <c:if test="${pc.label3=='连接器'}" >selected</c:if>>连接器</option>
                    <option value="保险丝" <c:if test="${pc.label3=='保险丝'}" >selected</c:if>>保险丝</option>
                    <option value="数码管" <c:if test="${pc.label3=='数码管'}" >selected</c:if>>数码管</option>
                    <option value="测试座" <c:if test="${pc.label3=='测试座'}" >selected</c:if>>测试座</option>
                    <option value="钽电容" <c:if test="${pc.label3=='钽电容'}" >selected</c:if>>钽电容</option>
                    <option value="卡座" <c:if test="${pc.label3=='卡座'}" >selected</c:if>>卡座</option>
                    <option value="排针排母" <c:if test="${pc.label3=='排针排母'}" >selected</c:if>>排针排母</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>标签4:</td>
            <%--<td><input type="text" name="label4"></td>--%>
            <td>
                <select name="label4">
                    <option value="" <c:if test="${empty pc.label4}" >selected</c:if>></option>
                    <option value="贴片电容" <c:if test="${pc.label4=='贴片电容'}" >selected</c:if>>贴片电容</option>
                    <option value="贴片电阻" <c:if test="${pc.label4=='贴片电阻'}" >selected</c:if>>贴片电阻</option>
                    <option value="直插电阻" <c:if test="${pc.label4=='直插电阻'}" >selected</c:if>>直插电阻</option>
                    <option value="晶振" <c:if test="${pc.label4=='晶振'}" >selected</c:if>>晶振</option>
                    <option value="电感" <c:if test="${pc.label4=='电感'}" >selected</c:if>>电感</option>
                    <option value="直插LED" <c:if test="${pc.label4=='直插LED'}" >selected</c:if>>直插LED</option>
                    <option value="贴片LED" <c:if test="${pc.label4=='贴片LED'}" >selected</c:if>>贴片LED</option>
                    <option value="按键开关" <c:if test="${pc.label4=='按键开关'}" >selected</c:if>>按键开关</option>
                    <option value="电位器" <c:if test="${pc.label4=='电位器'}" >selected</c:if>>电位器</option>
                    <option value="磁珠" <c:if test="${pc.label4=='磁珠'}" >selected</c:if>>磁珠</option>
                    <option value="电解电容" <c:if test="${pc.label4=='电解电容'}" >selected</c:if>>电解电容</option>
                    <option value="蜂鸣器" <c:if test="${pc.label4=='蜂鸣器'}" >selected</c:if>>蜂鸣器</option>
                    <option value="连接器" <c:if test="${pc.label4=='连接器'}" >selected</c:if>>连接器</option>
                    <option value="保险丝" <c:if test="${pc.label4=='保险丝'}" >selected</c:if>>保险丝</option>
                    <option value="数码管" <c:if test="${pc.label4=='数码管'}" >selected</c:if>>数码管</option>
                    <option value="测试座" <c:if test="${pc.label3=='测试座'}" >selected</c:if>>测试座</option>
                    <option value="钽电容" <c:if test="${pc.label3=='钽电容'}" >selected</c:if>>钽电容</option>
                    <option value="卡座" <c:if test="${pc.label3=='卡座'}" >selected</c:if>>卡座</option>
                    <option value="整流桥" <c:if test="${pc.label3=='整流桥'}" >selected</c:if>>整流桥</option>
                    <option value="二三极管" <c:if test="${pc.label3=='二三极管'}" >selected</c:if>>二三极管</option>
                    <option value="排针排母" <c:if test="${pc.label3=='排针排母'}" >selected</c:if>>排针排母</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>说明:</td>
            <td><input type="text" name="illustration" value="${pc.illustration}"></td>
        </tr>
        <tr>
            <td>说明1:</td>
            <td><input type="text" name="explain1" value="${pc.explain1}"></td>
        </tr>
        <tr>
            <td>说明2:</td>
            <td><input type="text" name="explain2" value="${pc.explain2}"></td>
        </tr>
        <tr>
            <td>说明3:</td>
            <td><input type="text" name="explain3" value="${pc.explain3}"></td>
        </tr>
        <tr>
            <td>电话:</td>
            <td><input type="text" name="phone1" value="${pc.phone1}"></td>
        </tr>
        <tr>
            <td>电话:</td>
            <td><input type="text" name="phone2" value="${pc.phone2}"></td>
        </tr>
        <tr>
            <td>手机:</td>
            <td><input type="text" name="cellphone1" value="${pc.cellphone1}"></td>
        </tr>
        <tr>
            <td>顶:</td>
            <td><input type="text" name="up" value="${pc.up}"></td>
        </tr>
        <tr>
            <td>踩:</td>
            <td><input type="text" name="down" value="${pc.down}"></td>
        </tr>
        <tr>
            <td>QQ:</td>
            <td><input type="text" name="qq1" value="${pc.qq1}"></td>
        </tr>
        <tr>
            <td>QQ:</td>
            <td><input type="text" name="qq2" value="${pc.qq2}"></td>
        </tr>
        <tr>
            <td>QQ:</td>
            <td><input type="text" name="qq3" value="${pc.qq3}" }></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="提交" style="width: 150px;height: 30px;"></td>
        </tr>
    </table>
</form>
</body>
</html>