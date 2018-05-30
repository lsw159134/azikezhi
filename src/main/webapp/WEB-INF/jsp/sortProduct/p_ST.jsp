<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<!DOCTYPE html>
<html lang="lang=zh-cmn-Hans">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>在芯间-最专业的电子元器件查询平台</title>
		<style type="text/css">
			.tableBody{
				margin-top: 70px
			}
			.tableBody td{
				width: 300px;
				height:20px
				word-wrap:break-word;
				text-align: center;
			}
			
			.line1{
				background-color: #6495ED;		
			}
			.line2{
				background-color: #C5C1AA;		
			}
			a{
				text-decoration: none;
				color: red;
			}
			#fixed{
				background-color:#8B814C;
				position: fixed;
				top: 0px;
			}
			#fixed td{
				text-align: center;
			}
		</style>
	</head>
	<body>
		<table id="fixed" cellpadding="0" cellspacing="0" border="1px solid;" style="text-atdgn: center;table-layout: fixed;width: 100%;height: 70px;">
			<tr>
				<td style="width: 50px">序号</td>
				<td style="width: 200px">型号</td>
				<td style="width:500px">封装</td>
				<td style="width: 200px">内核</td>
				<td style="width: 120px">工作频率(MHz)</td>
				<td style="width: 120px">FLASH(kB)</td>
				<td style="width: 120px">E2PROM(B)</td>
				<td style="width: 120px">RAM(kB)</td>
				<td style="width: 120px">Timers(16bit)</td>
				<td style="width: 120px">Timers(32bit)</td>
				<td style="width: 300px">Other timer functions</td>
				<td style="width: 200px">A/D(12-bit channels)</td>
				<td style="width: 200px">A/D(16-bit channels)</td>
				<td style="width: 200px">D/A Converters(12 bit)</td>
				<td style="width: 200px">I/Os (High Current)</td>
				<td style="width: 200px">Display controller</td>
				<td style="width: 200px">Integrated op-amps</td>
				<td style="width: 50px">I2C</td>
				<td style="width: 50px">SPI</td>
				<td style="width: 50px">I2S</td>
				<td style="width: 50px">CAN</td>
				<td style="width: 100px">USB</td>
				<td style="width: 70px">USART</td>
				<td style="width: 60px">UART</td>
				<td style="width: 120px">串行接口</td>
				<td style="width: 120px">并行接口</td>
				<td style="width: 200px">Supply Voltage (V) min~max</td>
				<td style="width: 200px">Supply Current (µA) (Lowest power mode/Run mode)</td>
				<td style="width: 200px">Operating Temperature (°C) min~max</td>
			</tr>
		</table>
		<table class="tableBody" cellpadding="0" cellspacing="0" border="1px sotdd" style="text-atdgn: center;table-layout: fixed;width: 100%;height: 100%;">
			<tr class="line1">
				<td style="width: 50px">1</td>
				<td style="width: 200px">
					<a title="STM32F100C4" href="javascript:window.open('search?keyword=STM32F100C4&amp;
					value=product&amp;page=1')">STM32F100C4</a>
				</td>
				<td style="width:500px">LQFP 48 7x7x1.4
				</td>
				<td style="width: 200px">ARM Cortex-M3
				</td>
				<td style="width: 120px">24
				</td>
				<td style="width: 120px">16
				</td>
				<td style="width: 120px"></td>
				<td style="width: 120px">4
				</td>
				<td style="width: 120px">6
				</td>
				<td style="width: 120px"></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td style="width: 200px">10
				</td>
				<td style="width: 200px"></td>
				<td style="width: 200px">2
				</td>
				<td style="width: 200px">37
				</td>
				<td style="width: 200px"></td>
				<td style="width: 200px"></td>
				<td style="width: 50px">1</td>
				<td style="width: 50px">1</td>
				<td style="width: 50px"></td>
				<td style="width: 50px"></td>
				<td style="width: 100px"></td>
				<td style="width: 70px">2</td>
				<td style="width: 60px"></td>
				<td style="width: 120px">HDMI CEC
				</td>
				<td style="width: 120px"></td>
				<td style="width: 200px">2~3.6</td>
				<td style="width: 200px">1.7~358</td>
				<td style="width: 200px">-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>2</td>
				<td>
					<a title="STM32F100C6" href="javascript:window.open('search?keyword=STM32F100C6&amp;
					value=product&amp;page=1')">STM32F100C6</a>
				</td>
				<td>LQFP 48 7x7x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>24
				</td>
				<td>32
				</td>
				<td></td>
				<td>4
				</td>
				<td>6
				</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10
				</td>
				<td></td>
				<td>2
				</td>
				<td>37
				</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td></td>
				<td></td>
				<td>2</td>
				<td></td>
				<td>HDMI CEC
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~358</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line1">
				<td>3</td>
				<td>
					<a title="STM32F100C8" href="javascript:window.open('search?keyword=STM32F100C8&amp;
					value=product&amp;page=1')">STM32F100C8</a>
				
				</td>
				<td>LQFP 48 7x7x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>24
				</td>
				<td>64
				</td>
				<td></td>
				<td>8
				</td>
				<td>7
				</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10
				</td>
				<td></td>
				<td>2
				</td>
				<td>37
				</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td></td>
				<td>HDMI CEC
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~358</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>4</td>
				<td>
					<a title="STM32F100CB" href="javascript:window.open('search?keyword=STM32F100CB&amp;
					value=product&amp;page=1')">STM32F100CB</a>
					
				</td>
				<td>LQFP 48 7x7x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>24</td>
				<td>128</td>
				<td></td>
				<td>8</td>
				<td>7</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td>2</td>
				<td>37</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td></td>
				<td>HDMI CEC
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~358</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line1">
				<td>5</td>
				<td>
					<a title="STM32F100R4" href="javascript:window.open('search?keyword=STM32F100R4&amp;
					value=product&amp;page=1')">STM32F100R4</a>
				
				</td>
				<td>LQFP 64 10x10x1.4,TFBGA 64 5x5x1.2
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>24</td>
				<td>16</td>
				<td></td>
				<td>4</td>
				<td>6</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td></td>
				<td></td>
				<td>2</td>
				<td></td>
				<td>HDMI CEC
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~358</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>6</td>
				<td>
					<a title="STM32F100R6" href="javascript:window.open('search?keyword=STM32F100R6&amp;
					value=product&amp;page=1')">STM32F100R6</a>
					
				</td>
				<td>LQFP 64 10x10x1.4,TFBGA 64 5x5x1.2
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>24
				</td>
				<td>32
				</td>
				<td></td>
				<td>4
				</td>
				<td>6</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td></td>
				<td></td>
				<td>2</td>
				<td></td>
				<td>HDMI CEC
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~358</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>7</td>
				<td>
					<a title="STM32F100R8" href="javascript:window.open('search?keyword=STM32F100R8&amp;
					value=product&amp;page=1')">STM32F100R8</a>
				
				</td>
				<td>LQFP 64 10x10x1.4,TFBGA 64 5x5x1.2
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>24
				</td>
				<td>64
				</td>
				<td></td>
				<td>8
				</td>
				<td>7</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td></td>
				<td>HDMI CEC
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~358</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>8</td>
				<td>
					<a title="STM32F100RB" href="javascript:window.open('search?keyword=STM32F100RB&amp;
					value=product&amp;page=1')">STM32F100RB</a>
				
				</td>
				<td>LQFP 64 10x10x1.4,TFBGA 64 5x5x1.2
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>24
				</td>
				<td>128
				</td>
				<td></td>
				<td>8
				</td>
				<td>7</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td></td>
				<td>HDMI CEC
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~358</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>9</td>
				<td>
					<a title="STM32F100RC" href="javascript:window.open('search?keyword=STM32F100RC&amp;
					value=product&amp;page=1')">STM32F100RC</a>
				
				</td>
				<td>LQFP 64 10x10x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>24
				</td>
				<td>256
				</td>
				<td></td>
				<td>24
				</td>
				<td>11</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td>2</td>
				<td>HDMI CEC
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>2.2~396</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>10</td>
				<td>
					<a title="STM32F100RD" href="javascript:window.open('search?keyword=STM32F100RD&amp;
					value=product&amp;page=1')">STM32F100RD</a>
				
				</td>
				<td>LQFP 64 10x10x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>24
				</td>
				<td>384
				</td>
				<td></td>
				<td>32
				</td>
				<td>11</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>5</td>
				<td></td>
				<td>HDMI CEC
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>2.2~396</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>11</td>
				<td>
					<a title="STM32F100RE" href="javascript:window.open('search?keyword=STM32F100RE&amp;
					value=product&amp;page=1')">STM32F100RE</a>
				
				</td>
				<td>LQFP 64 10x10x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>24
				</td>
				<td>512
				</td>
				<td></td>
				<td>32
				</td>
				<td>11</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>5</td>
				<td></td>
				<td>HDMI CEC
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>2.2~396</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>12</td>
				<td>
					<a title="STM32F100V8" href="javascript:window.open('search?keyword=STM32F100V8&amp;
					value=product&amp;page=1')">STM32F100V8</a>
				
				</td>
				<td>LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>24
				</td>
				<td>64
				</td>
				<td></td>
				<td>8
				</td>
				<td>7</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td></td>
				<td>HDMI CEC
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~358</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line1">
				<td>13</td>
				<td>
					<a title="STM32F100VB" href="javascript:window.open('search?keyword=STM32F100VB&amp;
					value=product&amp;page=1')">STM32F100VB</a>
				
				</td>
				<td>LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>24
				</td>
				<td>128
				</td>
				<td></td>
				<td>8
				</td>
				<td>7</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td></td>
				<td>HDMI CEC
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~358</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>14</td>
				<td>
					<a title="STM32F100VC" href="javascript:window.open('search?keyword=STM32F100VC&amp;
					value=product&amp;page=1')">STM32F100VC</a>
				
				</td>
				<td>LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>24
				</td>
				<td>256
				</td>
				<td></td>
				<td>24
				</td>
				<td>11</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>5</td>
				<td></td>
				<td>HDMI CEC
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>2.2~396</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>15</td>
				<td>
					<a title="STM32F100VD" href="javascript:window.open('search?keyword=STM32F100VD&amp;
					value=product&amp;page=1')">STM32F100VD</a>
				
				</td>
				<td>LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>24
				</td>
				<td>384
				</td>
				<td></td>
				<td>32
				</td>
				<td>11</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>5</td>
				<td></td>
				<td>HDMI CEC
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>2.2~396</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>16</td>
				<td>
					<a title="STM32F100VE" href="javascript:window.open('search?keyword=STM32F100VE&amp;
					value=product&amp;page=1')">STM32F100VE</a>
				
				</td>
				<td>LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>24
				</td>
				<td>512
				</td>
				<td></td>
				<td>32
				</td>
				<td>11</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>5</td>
				<td></td>
				<td>HDMI CEC
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>2.2~396</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line1">
				<td>17</td>
				<td>
					<a title="STM32F100ZC" href="javascript:window.open('search?keyword=STM32F100ZC&amp;
					value=product&amp;page=1')">STM32F100ZC</a>
				
				</td>
				<td>LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>24
				</td>
				<td>256
				</td>
				<td></td>
				<td>24
				</td>
				<td>11</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>112</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>5</td>
				<td></td>
				<td>HDMI CEC
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>2.2~396</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>18</td>
				<td>
					<a title="STM32F100ZD" href="javascript:window.open('search?keyword=STM32F100ZD&amp;
					value=product&amp;page=1')">STM32F100ZD</a>
				
				</td>
				<td>LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>24
				</td>
				<td>384
				</td>
				<td></td>
				<td>
					32
				</td>
				<td>11</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>112</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>5</td>
				<td></td>
				<td>HDMI CEC
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>2.2~396</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>19</td>
				<td>
					<a title="STM32F100ZE" href="javascript:window.open('search?keyword=STM32F100ZE&amp;
					value=product&amp;page=1')">STM32F100ZE</a>
				
				</td>
				<td>LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>24
				</td>
				<td>512
				</td>
				<td></td>
				<td>
					32
				</td>
				<td>11</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>112</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>5</td>
				<td></td>
				<td>HDMI CEC
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>2.2~396</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>20</td>
				<td>
					<a title="STM32F101C4" href="javascript:window.open('search?keyword=STM32F101C4&amp;
					value=product&amp;page=1')">STM32F101C4</a>
				
				</td>
				<td>LQFP 48 7x7x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>16
				</td>
				<td></td>
				<td>
					4
				</td>
				<td>2</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td></td>
				<td>36</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td></td>
				<td></td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~363</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>21</td>
				<td>
					<a title="STM32F101C6" href="javascript:window.open('search?keyword=STM32F101C6&amp;
					value=product&amp;page=1')">STM32F101C6</a>
				
				</td>
				<td>LQFP 48 7x7x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>32
				</td>
				<td></td>
				<td>
					6
				</td>
				<td>2</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td></td>
				<td>36</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td></td>
				<td></td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~363</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>22</td>
				<td>
					<a title="STM32F101C8" href="javascript:window.open('search?keyword=STM32F101C8&amp;
					value=product&amp;page=1')">STM32F101C8</a>
				
				</td>
				<td>LQFP 48 7x7x1.4,UFQFPN 48 7x7x0.55
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>64
				</td>
				<td></td>
				<td>
					10
				</td>
				<td>3</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td></td>
				<td>36</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~363</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>23</td>
				<td>
					<a title="STM32F101CB" href="javascript:window.open('search?keyword=STM32F101CB&amp;
					value=product&amp;page=1')">STM32F101CB</a>
				
				</td>
				<td>LQFP 48 7x7x1.4,UFQFPN 48 7x7x0.55
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>128
				</td>
				<td></td>
				<td>
					16
				</td>
				<td>3</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td></td>
				<td>36</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~363</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>24</td>
				<td>
					<a title="STM32F101R4" href="javascript:window.open('search?keyword=STM32F101R4&amp;
					value=product&amp;page=1')">STM32F101R4</a>
				
				</td>
				<td>LQFP 64 10x10x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>16
				</td>
				<td></td>
				<td>
					4
				</td>
				<td>2</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td></td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td></td>
				<td></td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~363</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>25</td>
				<td>
					<a title="STM32F101R6" href="javascript:window.open('search?keyword=STM32F101R6&amp;
					value=product&amp;page=1')">STM32F101R6</a>
				
				</td>
				<td>LQFP 64 10x10x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>32
				</td>
				<td></td>
				<td>
					6
				</td>
				<td>2</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td></td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td></td>
				<td></td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~363</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>26</td>
				<td>
					<a title="STM32F101R8" href="javascript:window.open('search?keyword=STM32F101R8&amp;
					value=product&amp;page=1')">STM32F101R8</a>
				
				</td>
				<td>LQFP 64 10x10x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>64
				</td>
				<td></td>
				<td>
					10
				</td>
				<td>3</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td></td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~391</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>27</td>
				<td>
					<a title="STM32F101RB" href="javascript:window.open('search?keyword=STM32F101RB&amp;
					value=product&amp;page=1')">STM32F101RB</a>
				
				</td>
				<td>LQFP 64 10x10x1.4,TFBGA 64 5x5x1.2
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>128
				</td>
				<td></td>
				<td>
					16
				</td>
				<td>3</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td></td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~391</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>28</td>
				<td>
					<a title="STM32F101RC" href="javascript:window.open('search?keyword=STM32F101RC&amp;
					value=product&amp;page=1')">STM32F101RC</a>
				
				</td>
				<td>LQFP 64 10x10x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>256
				</td>
				<td></td>
				<td>
					32
				</td>
				<td>6</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.9~433</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>29</td>
				<td>
					<a title="STM32F101RD" href="javascript:window.open('search?keyword=STM32F101RD&amp;
					value=product&amp;page=1')">STM32F101RD</a>
				
				</td>
				<td>LQFP 64 10x10x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>384
				</td>
				<td></td>
				<td>
					48
				</td>
				<td>6</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.9~433</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>30</td>
				<td>
					<a title="STM32F101RE" href="javascript:window.open('search?keyword=STM32F101RE&amp;
					value=product&amp;page=1')">STM32F101RE</a>
				
				</td>
				<td>LQFP 64 10x10x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>512
				</td>
				<td></td>
				<td>
					48
				</td>
				<td>6</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.9~433</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>31</td>
				<td>
					<a title="STM32F101RF" href="javascript:window.open('search?keyword=STM32F101RF&amp;
					value=product&amp;page=1')">STM32F101RF</a>
				
				</td>
				<td>LQFP 64 10x10x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>768
				</td>
				<td></td>
				<td>
					80
				</td>
				<td>12</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.9~433</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>32</td>
				<td>
					<a title="STM32F101RG" href="javascript:window.open('search?keyword=STM32F101RG&amp;
					value=product&amp;page=1')">STM32F101RG</a>
				
				</td>
				<td>LQFP 64 10x10x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>1024
				</td>
				<td></td>
				<td>
					80
				</td>
				<td>12</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.9~433</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>33</td>
				<td>
					<a title="STM32F101T4" href="javascript:window.open('search?keyword=STM32F101T4&amp;
					value=product&amp;page=1')">STM32F101T4</a>
					
				</td>
				<td>VFQFPN 36 6x6x1-0
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>16
				</td>
				<td></td>
				<td>
					4
				</td>
				<td>2</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td></td>
				<td>26</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td></td>
				<td></td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~363</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>34</td>
				<td>
					<a title="STM32F101T6" href="javascript:window.open('search?keyword=STM32F101T6&amp;
					value=product&amp;page=1')">STM32F101T6</a>
				
				</td>
				<td>VFQFPN 36 6x6x1-0
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>32
				</td>
				<td></td>
				<td>
					6
				</td>
				<td>2</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td></td>
				<td>26</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td></td>
				<td></td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~363</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>35</td>
				<td>
					<a title="STM32F101T8" href="javascript:window.open('search?keyword=STM32F101T8&amp;
					value=product&amp;page=1')">STM32F101T8</a>
				
				</td>
				<td>VFQFPN 36 6x6x1-0
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>64
				</td>
				<td></td>
				<td>
					10
				</td>
				<td>3</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td></td>
				<td>26</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td></td>
				<td></td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~391</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>36</td>
				<td>
					<a title="STM32F101T8" href="javascript:window.open('search?keyword=STM32F101T8&amp;
					value=product&amp;page=1')">STM32F101T8</a>
				
				</td>
				<td>VFQFPN 36 6x6x1-0
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>64
				</td>
				<td></td>
				<td>
					16
				</td>
				<td>3</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td></td>
				<td>26</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td></td>
				<td></td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~391</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>37</td>
				<td>
					<a title="STM32F101V8" href="javascript:window.open('search?keyword=STM32F101V8&amp;
					value=product&amp;page=1')">STM32F101V8</a>
				
				</td>
				<td>LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>64
				</td>
				<td></td>
				<td>
					10
				</td>
				<td>3</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td></td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~391</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>38</td>
				<td>
					<a title="STM32F101VB" href="javascript:window.open('search?keyword=STM32F101VB&amp;
					value=product&amp;page=1')">STM32F101VB</a>
				
				</td>
				<td>LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>128
				</td>
				<td></td>
				<td>
					16
				</td>
				<td>3</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td></td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~391</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>39</td>
				<td>
					<a title="STM32F101VC" href="javascript:window.open('search?keyword=STM32F101VC&amp;
					value=product&amp;page=1')">STM32F101VC</a>
				
				</td>
				<td>LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>256
				</td>
				<td></td>
				<td>
					32
				</td>
				<td>6</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.9~433</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>40</td>
				<td>
					<a title="STM32F101VD" href="javascript:window.open('search?keyword=STM32F101VD&amp;
					value=product&amp;page=1')">STM32F101VD</a>
				
				</td>
				<td>LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>384
				</td>
				<td></td>
				<td>
					48
				</td>
				<td>6</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.9~433</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>41</td>
				<td>
					<a title="STM32F101VE" href="javascript:window.open('search?keyword=STM32F101VE&amp;
					value=product&amp;page=1')">STM32F101VE</a>
				
				</td>
				<td>LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>512
				</td>
				<td></td>
				<td>
					48
				</td>
				<td>6</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.9~433</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>42</td>
				<td>
					<a title="STM32F101VF" href="javascript:window.open('search?keyword=STM32F101VF&amp;
					value=product&amp;page=1')">STM32F101VF</a>
					
				</td>
				<td>LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>768
				</td>
				<td></td>
				<td>
					80
				</td>
				<td>12</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.9~433</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>43</td>
				<td>
					<a title="STM32F101VG" href="javascript:window.open('search?keyword=STM32F101VG&amp;
					value=product&amp;page=1')">STM32F101VG</a>
				
				</td>
				<td>LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>1024
				</td>
				<td></td>
				<td>
					80
				</td>
				<td>12</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.9~433</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>44</td>
				<td>
					<a title="STM32F101ZC" href="javascript:window.open('search?keyword=STM32F101ZC&amp;
					value=product&amp;page=1')">STM32F101ZC</a>
				
				</td>
				<td>LQFP 144 20x20x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>256
				</td>
				<td></td>
				<td>
					32
				</td>
				<td>6</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>112</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.9~433</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>45</td>
				<td>
					<a title="STM32F101ZD" href="javascript:window.open('search?keyword=STM32F101ZD&amp;
					value=product&amp;page=1')">STM32F101ZD</a>
				
				</td>
				<td>LQFP 144 20x20x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>384
				</td>
				<td></td>
				<td>
					48
				</td>
				<td>6</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>112</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.9~433</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>46</td>
				<td>
					<a title="STM32F101ZE" href="javascript:window.open('search?keyword=STM32F101ZE&amp;
					value=product&amp;page=1')">STM32F101ZE</a>
				
				</td>
				<td>LQFP 144 20x20x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>512
				</td>
				<td></td>
				<td>
					48
				</td>
				<td>6</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>112</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.9~433</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>47</td>
				<td>
					<a title="STM32F101ZF" href="javascript:window.open('search?keyword=STM32F101ZF&amp;
					value=product&amp;page=1')">STM32F101ZF</a>
				
				</td>
				<td>LQFP 144 20x20x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>768
				</td>
				<td></td>
				<td>
					80
				</td>
				<td>12</td>
				<td></td>
				<td>24-bit downcounter,2xWDG,SysTick
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>112</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.9~433</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>48</td>
				<td>
					<a title="STM32F101ZG" href="javascript:window.open('search?keyword=STM32F101ZG&amp;
					value=product&amp;page=1')">STM32F101ZG</a>
				
				</td>
				<td>LQFP 144 20x20x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>36
				</td>
				<td>1024
				</td>
				<td></td>
				<td>
					80
				</td>
				<td>12</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>112</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.9~433</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>49</td>
				<td>
					<a title="STM32F102C4" href="javascript:window.open('search?keyword=STM32F102C4&amp;
					value=product&amp;page=1')">STM32F102C4</a>
				
				</td>
				<td>LQFP 48 7x7x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>48
				</td>
				<td>16
				</td>
				<td></td>
				<td>
					4
				</td>
				<td>2</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td></td>
				<td>36</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td></td>
				<td>USB Device
				</td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.55~348</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>50</td>
				<td>
					<a title="STM32F102C6" href="javascript:window.open('search?keyword=STM32F102C6&amp;
					value=product&amp;page=1')">STM32F102C6</a>
				
				</td>
				<td>LQFP 48 7x7x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>48
				</td>
				<td>32
				</td>
				<td></td>
				<td>
					6
				</td>
				<td>2</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td></td>
				<td>36</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td></td>
				<td>USB Device
				</td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.55~348</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>51</td>
				<td>
					<a title="STM32F102C8" href="javascript:window.open('search?keyword=STM32F102C8&amp;
					value=product&amp;page=1')">STM32F102C8</a>
				
				</td>
				<td>LQFP 48 7x7x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>48
				</td>
				<td>64
				</td>
				<td></td>
				<td>
					10
				</td>
				<td>3</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td></td>
				<td>36</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td></td>
				<td>USB Device
				</td>
				<td>3</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~373</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>52</td>
				<td>
					<a title="STM32F102CB" href="javascript:window.open('search?keyword=STM32F102CB&amp;
					value=product&amp;page=1')">STM32F102CB</a>
				
				</td>
				<td>LQFP 48 7x7x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>48
				</td>
				<td>128
				</td>
				<td></td>
				<td>
					16
				</td>
				<td>3</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td></td>
				<td>36</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td></td>
				<td>USB Device
				</td>
				<td>3</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~373</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>53</td>
				<td>
					<a title="STM32F102R4" href="javascript:window.open('search?keyword=STM32F102R4&amp;
					value=product&amp;page=1')">STM32F102R4</a>
				
				</td>
				<td>LQFP 48 7x7x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>48
				</td>
				<td>16
				</td>
				<td></td>
				<td>
					4
				</td>
				<td>2</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td></td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td></td>
				<td>USB Device
				</td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.55~348</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>54</td>
				<td>
					<a title="STM32F102R6" href="javascript:window.open('search?keyword=STM32F102R6&amp;
					value=product&amp;page=1')">STM32F102R6</a>
				
				</td>
				<td>LQFP 48 7x7x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>48
				</td>
				<td>32
				</td>
				<td></td>
				<td>
					6
				</td>
				<td>2</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td></td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td></td>
				<td>USB Device
				</td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.55~348</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>55</td>
				<td>
					<a title="STM32F102R8" href="javascript:window.open('search?keyword=STM32F102R8&amp;
					value=product&amp;page=1')">STM32F102R8</a>
				
				</td>
				<td>LQFP 48 7x7x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>48
				</td>
				<td>64
				</td>
				<td></td>
				<td>
					10
				</td>
				<td>3</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td></td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td></td>
				<td>USB Device
				</td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~373</td>
				<td>-40~85</td>
			</tr>
			<tr class="line2">
				<td>56</td>
				<td>
					<a title="STM32F102RB" href="javascript:window.open('search?keyword=STM32F102RB&amp;
					value=product&amp;page=1')">STM32F102RB</a>
				
				</td>
				<td>LQFP 48 7x7x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>48
				</td>
				<td>128
				</td>
				<td></td>
				<td>
					16
				</td>
				<td>3</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td></td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td></td>
				<td>USB Device
				</td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~373</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>57</td>
				<td>
					<a title="STM32F103C4" href="javascript:window.open('search?keyword=STM32F103C4&amp;
					value=product&amp;page=1')">STM32F103C4</a>
				
				</td>
				<td>LQFP 48 7x7x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>16
				</td>
				<td></td>
				<td>
					6
				</td>
				<td>3</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td></td>
				<td>36</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.55~337</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>58</td>
				<td>
					<a title="STM32F103C6" href="javascript:window.open('search?keyword=STM32F103C6&amp;
					value=product&amp;page=1')">STM32F103C6</a>
				
				</td>
				<td>LQFP 48 7x7x1.4,UFQFPN 48 7x7x0.55
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>32
				</td>
				<td></td>
				<td>
					10
				</td>
				<td>3</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td></td>
				<td>36</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.55~337</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line1">
				<td>59</td>
				<td>
					<a title="STM32F103C8" href="javascript:window.open('search?keyword=STM32F103C8&amp;
					value=product&amp;page=1')">STM32F103C8</a>
				
				</td>
				<td>LQFP 48 7x7x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>64
				</td>
				<td></td>
				<td>
					20
				</td>
				<td>4</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td></td>
				<td>36</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~373</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>60</td>
				<td>
					<a title="STM32F103CB" href="javascript:window.open('search?keyword=STM32F103CB&amp;
					value=product&amp;page=1')">STM32F103CB</a>
				
				</td>
				<td>LQFP 48 7x7x1.4,UFQFPN 48 7x7x0.55
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>128
				</td>
				<td></td>
				<td>
					20
				</td>
				<td>4</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td></td>
				<td>36</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~373</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line1">
				<td>61</td>
				<td>
					<a title="STM32F103R4" href="javascript:window.open('search?keyword=STM32F103R4&amp;
					value=product&amp;page=1')">STM32F103R4</a>
				
				</td>
				<td>LQFP 64 10x10x1.4,TFBGA 64 5x5x1.2
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>16
				</td>
				<td></td>
				<td>
					6
				</td>
				<td>3</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td></td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.55~337</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>62</td>
				<td>
					<a title="STM32F103R6" href="javascript:window.open('search?keyword=STM32F103R6&amp;
					value=product&amp;page=1')">STM32F103R6</a>
				
				</td>
				<td>LQFP 64 10x10x1.4,TFBGA 64 5x5x1.2
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>32
				</td>
				<td></td>
				<td>
					10
				</td>
				<td>3</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td></td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.55~337</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line1">
				<td>63</td>
				<td>
					<a title="STM32F103R8" href="javascript:window.open('search?keyword=STM32F103R8&amp;
					value=product&amp;page=1')">STM32F103R8</a>
				
				</td>
				<td>LQFP 64 10x10x1.4,TFBGA 64 5x5x1.2
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>64
				</td>
				<td></td>
				<td>
					20
				</td>
				<td>4</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td></td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~373</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>64</td>
				<td>
					<a title="STM32F103RB" href="javascript:window.open('search?keyword=STM32F103RB&amp;
					value=product&amp;page=1')">STM32F103RB</a>
				
				</td>
				<td>LQFP 64 10x10x1.4,TFBGA 64 5x5x1.2
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>128
				</td>
				<td></td>
				<td>
					20
				</td>
				<td>4</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td></td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td></td>
				<td>
				</td>
				<td></td>
				<td>2~3.6</td>
				<td>1.7~373</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>65</td>
				<td>
					<a title="STM32F103RC" href="javascript:window.open('search?keyword=STM32F103RC&amp;
					value=product&amp;page=1')">STM32F103RC</a>
				
				</td>
				<td>LQFP 64 10x10x1.4,WLCSP 64
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>256
				</td>
				<td></td>
				<td>
					64
				</td>
				<td>8</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>SDIO
				</td>
				<td>2~3.6</td>
				<td>1.9~421</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>66</td>
				<td>
					<a title="STM32F103RD" href="javascript:window.open('search?keyword=STM32F103RD&amp;
					value=product&amp;page=1')">STM32F103RD</a>
				
				</td>
				<td>LQFP 64 10x10x1.4,WLCSP 64
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>384
				</td>
				<td></td>
				<td>
					64
				</td>
				<td>8</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>SDIO
				</td>
				<td>2~3.6</td>
				<td>1.9~421</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>67</td>
				<td>
					<a title="STM32F103RE" href="javascript:window.open('search?keyword=STM32F103RE&amp;
					value=product&amp;page=1')">STM32F103RE</a>
				
				</td>
				<td>LQFP 64 10x10x1.4,WLCSP 64
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>512
				</td>
				<td></td>
				<td>
					64
				</td>
				<td>8</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>SDIO
				</td>
				<td>2~3.6</td>
				<td>1.9~421</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>68</td>
				<td>
					<a title="STM32F103RF" href="javascript:window.open('search?keyword=STM32F103RF&amp;
					value=product&amp;page=1')">STM32F103RF</a>
				
				</td>
				<td>LQFP 64 10x10x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>768
				</td>
				<td></td>
				<td>
					96
				</td>
				<td>14</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>SDIO
				</td>
				<td>2~3.6</td>
				<td>1.9~421</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line1">
				<td>69</td>
				<td>
					<a title="STM32F103RG" href="javascript:window.open('search?keyword=STM32F103RG&amp;
					value=product&amp;page=1')">STM32F103RG</a>
				
				</td>
				<td>LQFP 64 10x10x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>1024
				</td>
				<td></td>
				<td>
					96
				</td>
				<td>14</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>SDIO
				</td>
				<td>2~3.6</td>
				<td>1.9~421</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>70</td>
				<td>
					<a title="STM32F103T4" href="javascript:window.open('search?keyword=STM32F103T4&amp;
					value=product&amp;page=1')">STM32F103T4</a>
				
				</td>
				<td>VFQFPN 36 6x6x1-0
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>16
				</td>
				<td></td>
				<td>
					6
				</td>
				<td>3</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td></td>
				<td>26</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td>
				</td>
				<td>2~3.6</td>
				<td>1.55~337</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line1">
				<td>71</td>
				<td>
					<a title="STM32F103T6" href="javascript:window.open('search?keyword=STM32F103T6&amp;
					value=product&amp;page=1')">STM32F103T6</a>
				
				</td>
				<td>VFQFPN 36 6x6x1-0
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>32
				</td>
				<td></td>
				<td>
					10
				</td>
				<td>3</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td></td>
				<td>26</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td>
				</td>
				<td>2~3.6</td>
				<td>1.55~373</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>72</td>
				<td>
					<a title="STM32F103T8" href="javascript:window.open('search?keyword=STM32F103T8&amp;
					value=product&amp;page=1')">STM32F103T8</a>
				
				</td>
				<td>VFQFPN 36 6x6x1-0
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>64
				</td>
				<td></td>
				<td>
					20
				</td>
				<td>4</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td></td>
				<td>26</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td>
				</td>
				<td>2~3.6</td>
				<td>1.7~373</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line1">
				<td>73</td>
				<td>
					<a title="STM32F103TB" href="javascript:window.open('search?keyword=STM32F103TB&amp;
					value=product&amp;page=1')">STM32F103TB</a>
				
				</td>
				<td>VFQFPN 36 6x6x1-0
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>128
				</td>
				<td></td>
				<td>
					20
				</td>
				<td>4</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>10</td>
				<td></td>
				<td></td>
				<td>26</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>1</td>
				<td></td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>2</td>
				<td></td>
				<td>
				</td>
				<td>
				</td>
				<td>2~3.6</td>
				<td>1.7~373</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>74</td>
				<td>
					<a title="STM32F103V8" href="javascript:window.open('search?keyword=STM32F103V8&amp;
					value=product&amp;page=1')">STM32F103V8</a>
				
				</td>
				<td>LFBGA 100 10x10x1.7,LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>64
				</td>
				<td></td>
				<td>
					20
				</td>
				<td>4</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td></td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td></td>
				<td>
				</td>
				<td>
				</td>
				<td>2~3.6</td>
				<td>1.7~373</td>
				<td>-40~85</td>
			</tr>
			<tr class="line1">
				<td>75</td>
				<td>
					<a title="STM32F103VB" href="javascript:window.open('search?keyword=STM32F103VB&amp;
					value=product&amp;page=1')">STM32F103VB</a>
				
				</td>
				<td>LFBGA 100 10x10x1.7,LQFP 100 14x14x1.4,UFBGA 100 7x7x0.6
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>128
				</td>
				<td></td>
				<td>
					20
				</td>
				<td>4</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td></td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>2</td>
				<td></td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td></td>
				<td>
				</td>
				<td>
				</td>
				<td>2~3.6</td>
				<td>1.7~373</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>76</td>
				<td>
					<a title="STM32F103VC" href="javascript:window.open('search?keyword=STM32F103VC&amp;
					value=product&amp;page=1')">STM32F103VC</a>
				
				</td>
				<td>LFBGA 100 10x10x1.7,LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>256
				</td>
				<td></td>
				<td>
					48
				</td>
				<td>8</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>
					FSMC,SDIO
				</td>
				<td>2~3.6</td>
				<td>1.9~421</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line1">
				<td>77</td>
				<td>
					<a title="STM32F103VD" href="javascript:window.open('search?keyword=STM32F103VD&amp;
					value=product&amp;page=1')">STM32F103VD</a>
				
				</td>
				<td>LFBGA 100 10x10x1.7,LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>384
				</td>
				<td></td>
				<td>
					64
				</td>
				<td>8</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>
					FSMC,SDIO
				</td>
				<td>2~3.6</td>
				<td>1.9~421</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>78</td>
				<td>
					<a title="STM32F103VE" href="javascript:window.open('search?keyword=STM32F103VE&amp;
					value=product&amp;page=1')">STM32F103VE</a>
				
				</td>
				<td>LFBGA 100 10x10x1.7,LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>512
				</td>
				<td></td>
				<td>
					64
				</td>
				<td>8</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>
					FSMC,SDIO
				</td>
				<td>2~3.6</td>
				<td>1.9~421</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line1">
				<td>79</td>
				<td>
					<a title="STM32F103VF" href="javascript:window.open('search?keyword=STM32F103VF&amp;
					value=product&amp;page=1')">STM32F103VF</a>
				
				</td>
				<td>LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>768
				</td>
				<td></td>
				<td>
					96
				</td>
				<td>14</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>
					FSMC,SDIO
				</td>
				<td>2~3.6</td>
				<td>1.9~421</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>80</td>
				<td>
					<a title="STM32F103VG" href="javascript:window.open('search?keyword=STM32F103VG&amp;
					value=product&amp;page=1')">STM32F103VG</a>
				
				</td>
				<td>LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>1024
				</td>
				<td></td>
				<td>
					96
				</td>
				<td>14</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>
					FSMC,SDIO
				</td>
				<td>2~3.6</td>
				<td>1.9~421</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line1">
				<td>81</td>
				<td>
					<a title="STM32F103ZC" href="javascript:window.open('search?keyword=STM32F103ZC&amp;
					value=product&amp;page=1')">STM32F103ZC</a>
				
				</td>
				<td>LFBGA 144 10x10x1.7,LQFP 144 20x20x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>256
				</td>
				<td></td>
				<td>
					48
				</td>
				<td>8</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>21</td>
				<td></td>
				<td>2</td>
				<td>112</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>
					FSMC,SDIO
				</td>
				<td>2~3.6</td>
				<td>1.9~421</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>82</td>
				<td>
					<a title="STM32F103ZD" href="javascript:window.open('search?keyword=STM32F103ZD&amp;
					value=product&amp;page=1')">STM32F103ZD</a>
				
				</td>
				<td>LFBGA 144 10x10x1.7,LQFP 144 20x20x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>384
				</td>
				<td></td>
				<td>
					64
				</td>
				<td>8</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>21</td>
				<td></td>
				<td>2</td>
				<td>112</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>
					FSMC,SDIO
				</td>
				<td>2~3.6</td>
				<td>1.9~421</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line1">
				<td>83</td>
				<td>
					<a title="STM32F103ZE" href="javascript:window.open('search?keyword=STM32F103ZE&amp;
					value=product&amp;page=1')">STM32F103ZE</a>
				
				</td>
				<td>LFBGA 144 10x10x1.7,LQFP 144 20x20x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>512
				</td>
				<td></td>
				<td>
					64
				</td>
				<td>8</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>21</td>
				<td></td>
				<td>2</td>
				<td>112</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>
					FSMC,SDIO
				</td>
				<td>2~3.6</td>
				<td>1.9~421</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>84</td>
				<td>
					<a title="STM32F103ZF" href="javascript:window.open('search?keyword=STM32F103ZF&amp;
					value=product&amp;page=1')">STM32F103ZF</a>
				
				</td>
				<td>LFBGA 144 10x10x1.7,LQFP 144 20x20x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>768
				</td>
				<td></td>
				<td>
					96
				</td>
				<td>14</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>21</td>
				<td></td>
				<td>2</td>
				<td>112</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>
					FSMC,SDIO
				</td>
				<td>2~3.6</td>
				<td>1.9~421</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line1">
				<td>85</td>
				<td>
					<a title="STM32F103ZG" href="javascript:window.open('search?keyword=STM32F103ZG&amp;
					value=product&amp;page=1')">STM32F103ZG</a>
				
				</td>
				<td>LFBGA 144 10x10x1.7,LQFP 144 20x20x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>1024
				</td>
				<td></td>
				<td>
					96
				</td>
				<td>14</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>21</td>
				<td></td>
				<td>2</td>
				<td>112</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>1</td>
				<td>USB Device
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>
					FSMC,SDIO
				</td>
				<td>2~3.6</td>
				<td>1.9~421</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>86</td>
				<td>
					<a title="STM32F105R8" href="javascript:window.open('search?keyword=STM32F105R8&amp;
					value=product&amp;page=1')">STM32F105R8</a>
				
				</td>
				<td>LQFP 64 10x10x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>64
				</td>
				<td></td>
				<td>
					64
				</td>
				<td>7</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>2</td>
				<td>USB OTG FS
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>
				</td>
				<td>2~3.6</td>
				<td>1.9~393</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line1">
				<td>87</td>
				<td>
					<a title="STM32F105RB" href="javascript:window.open('search?keyword=STM32F105RB&amp;
					value=product&amp;page=1')">STM32F105RB</a>
				
				</td>
				<td>LQFP 64 10x10x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>128
				</td>
				<td></td>
				<td>
					64
				</td>
				<td>7</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>2</td>
				<td>USB OTG FS
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>
				</td>
				<td>2~3.6</td>
				<td>1.9~393</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>88</td>
				<td>
					<a title="STM32F105RC" href="javascript:window.open('search?keyword=STM32F105RC&amp;
					value=product&amp;page=1')">STM32F105RC</a>
				
				</td>
				<td>LQFP 64 10x10x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>256
				</td>
				<td></td>
				<td>
					64
				</td>
				<td>7</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>2</td>
				<td>USB OTG FS
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>
				</td>
				<td>2~3.6</td>
				<td>1.9~393</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line1">
				<td>89</td>
				<td>
					<a title="STM32F105V8" href="javascript:window.open('search?keyword=STM32F105V8&amp;
					value=product&amp;page=1')">STM32F105V8</a>
				
				</td>
				<td>LQFP 64 10x10x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>64
				</td>
				<td></td>
				<td>
					64
				</td>
				<td>7</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>2</td>
				<td>USB OTG FS
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>
				</td>
				<td>2~3.6</td>
				<td>1.9~393</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>90</td>
				<td>
					<a title="STM32F105VB" href="javascript:window.open('search?keyword=STM32F105VB&amp;
					value=product&amp;page=1')">STM32F105VB</a>
				
				</td>
				<td>LFBGA 100 10x10x1.7,LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>128
				</td>
				<td></td>
				<td>
					64
				</td>
				<td>7</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>2</td>
				<td>USB OTG FS
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>
				</td>
				<td>2~3.6</td>
				<td>1.9~393</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line1">
				<td>91</td>
				<td>
					<a title="STM32F105VC" href="javascript:window.open('search?keyword=STM32F105VC&amp;
					value=product&amp;page=1')">STM32F105VC</a>
				
				</td>
				<td>LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>256
				</td>
				<td></td>
				<td>
					64
				</td>
				<td>7</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>2</td>
				<td>3</td>
				<td>2</td>
				<td>2</td>
				<td>USB OTG FS
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				</td>
				<td>
				</td>
				<td>2~3.6</td>
				<td>1.9~393</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>92</td>
				<td>
					<a title="STM32F107RB" href="javascript:window.open('search?keyword=STM32F107RB&amp;
					value=product&amp;page=1')">STM32F107RB</a>
				
				</td>
				<td>LQFP 64 10x10x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>128
				</td>
				<td></td>
				<td>
					64
				</td>
				<td>7</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>3</td>
				<td>2</td>
				<td>2</td>
				<td>USB OTG FS
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				Ethernet
				</td>
				<td>
				</td>
				<td>2~3.6</td>
				<td>1.9~393</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line1">
				<td>93</td>
				<td>
					<a title="STM32F107RC" href="javascript:window.open('search?keyword=STM32F107RC&amp;
					value=product&amp;page=1')">STM32F107RC</a>
				
				</td>
				<td>LQFP 64 10x10x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>256
				</td>
				<td></td>
				<td>
					64
				</td>
				<td>7</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>51</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>3</td>
				<td>2</td>
				<td>2</td>
				<td>USB OTG FS
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				Ethernet
				</td>
				<td>
				</td>
				<td>2~3.6</td>
				<td>1.9~393</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line2">
				<td>94</td>
				<td>
					<a title="STM32F107VB" href="javascript:window.open('search?keyword=STM32F107VB&amp;
					value=product&amp;page=1')">STM32F107VB</a>
				
				</td>
				<td>LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>128
				</td>
				<td></td>
				<td>
					64
				</td>
				<td>7</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>3</td>
				<td>2</td>
				<td>2</td>
				<td>USB OTG FS
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				Ethernet
				</td>
				<td>
				</td>
				<td>2~3.6</td>
				<td>1.9~393</td>
				<td>-40~105,85</td>
			</tr>
			<tr class="line1">
				<td>95</td>
				<td>
					<a title="STM32F107VC" href="javascript:window.open('search?keyword=STM32F107VC&amp;
					value=product&amp;page=1')">STM32F107VC</a>
				
				</td>
				<td>LFBGA 100 10x10x1.7,LQFP 100 14x14x1.4
				</td>
				<td>ARM Cortex-M3
				</td>
				<td>72
				</td>
				<td>256
				</td>
				<td></td>
				<td>
					64
				</td>
				<td>7</td>
				<td></td>
				<td>2 x WDG,24-bit down counter,RTC
				</td>
				<td>16</td>
				<td></td>
				<td>2</td>
				<td>80</td>
				<td></td>
				<td></td>
				<td>1</td>
				<td>3</td>
				<td>2</td>
				<td>2</td>
				<td>USB OTG FS
				</td>
				<td>3</td>
				<td>2</td>
				<td>
				Ethernet
				</td>
				<td>
				</td>
				<td>2~3.6</td>
				<td>1.9~393</td>
				<td>-40~85</td>
			</tr>
		</table>
	</body>
	<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript">
		window.onscroll=function(){
		    var sl=-Math.max(document.body.scrollLeft,document.documentElement.scrollLeft);
		    document.getElementById('fixed').style.left=sl+8+'px';
		};
		$(function () {  
		    var tr = $(".line1");  
		    tr.mouseover(function () {  
		        $(this).children("td").css("background-color", "#8B814C");  
		    }).mouseout(function () {  
		        $(this).children("td").css("background-color", "#6495ED");  
		    });  
		});
		$(function () {  
		    var tr = $(".line2");  
		    tr.mouseover(function () {  
		        $(this).children("td").css("background-color", "#8B814C");  
		    }).mouseout(function () {  
		        $(this).children("td").css("background-color", "#C5C1AA");  
		    });  
		});
	</script>
</html>