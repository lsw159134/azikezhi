<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
    String realPath = request.getSession().getServletContext().getRealPath("/");
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + contextPath + "/";
%>

<html>
<head>
    <link rel="stylesheet" href="css/StudyEnglish.css">
</head>
<body>
<div id="table">
    <table cellspacing="0" cellpadding="0">
        <tr>
            <td class="td_1">教学方法</td>
            <td>母语学习法，让学英语像学母语一样自然流利</td>
        </tr>
        <tr>
            <td class="td_1">讲义</td>
            <td>剑桥国际英语教程+自编讲义</td>
        </tr>
        <tr>
            <td rowspan="4" class="td_1">课程内容</td>
            <td>模拟情境教学:见面问候、自我介绍 、外出就餐、表达心情 、表达想法、工作会话、电话沟通、职业介绍、时尚社交、体育运动、兴趣爱好……</td>
        </tr>
        <tr>
            <td>职场必学:安排约见、介绍公司、业务往来、询盘还盘、采购订货、质量交期、包装装运、产品售后、会议讨论、工作报告……</td>
        </tr>
        <tr>
            <td>出国旅游：预订机票、预订酒店、客房服务、报关通关、问路指路、预订桌位、饭馆就餐、寻找商品、景点旅游、旅途感受、结交朋友……</td>
        </tr>
        <tr>
            <td>结合剑桥商务英语书本内容，文化点滴、词汇扩展、会话练习、观点展示、语法重点、角色扮演、听力阅读等环节来循序渐进的提高听说读写能力</td>
        </tr>
        <tr>
            <td class="td_1">课程特色</td>
            <td>教学过程中导入美剧、电影、英文歌曲，让英语学习不再枯燥无味</td>
        </tr>
        <tr>
            <td rowspan="4" class="td_1">课程等级</td>
            <td>1级：针对没有英语基础的初学者，注重基础词汇、语法和语言功能的运用<br>
                1A级：学会音标以及拼读，以及简单的日常会话 (15课时 1000元)<br>
                1B级：纠正发音，拓展词汇，融入真实生活情境，掌握固定句型(15课时 1000元)
            </td>
        </tr>
        <tr>
            <td>2级：针对具有英语水平的学习者，旨在进一步培养语言运用技能<br>
                2A级：熟练掌握常用词汇句型，提高听说能力(15课时 1000元)<br>
                2B级 : 扩大情景对话场景范围，巩固常用语法词汇知识点，增大输入输出量(15课时 1000元)<br>
            </td>
        </tr>
        <tr>
            <td>3级：针对具备初级偏上英语水平的学习者，旨在掌握和运用比较复杂的语言结构、提高流利度<br>
                3A级 : 开始听写训练，情景对话难度随着水平的提高而上升，提高口语流利度(15课时 1000元)<br>
                3B 级：在语速较慢时，能听懂熟悉话题的广播、电视节目要点；能即兴谈论自己熟悉、感兴趣的话题(15课时 1000元)<br>
            </td>
        </tr>
        <tr>
            <td>4级：针对具有中级英语水平的学习者，旨在培养学习者运用准确、流利的英语进行交流的能力<br>
                4A 级：能与母语人士就熟悉生活话题进行常速沟通；阅读邮件杂志等(15课时 1000元)<br>
                4B级 : 能自如组织语句，可轻松就熟悉的话题（如城市，国家，节日，日常事务，个人经历，未来计划等,进行日常沟通；能自己写邮件、演讲稿、工作安排等(15课时 1000元)<br>
            </td>
        </tr>
    </table>
</div>

</body>
</html>