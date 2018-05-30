<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="/css/question.css?v=1" rel="stylesheet" /><script src="/client/jQuery/jquery-1.3.2.min.js?v=1" type="text/javascript"></script><script src="/system/js/pubfunctions.js?v=15" type="text/javascript"></script><script src="/system/js/common/questionnaire.js?v=1" type="text/javascript"></script><title>问卷调查</title>
<script>
	$(function(){
		if('false' == 'true'){
			alert("问卷调查已结束");
			window.close();
		}
		if(''!=''){
			alert('');
		}
	})	
</script>
</head>
<body>
	<form action="/addQuestionnaire.html" method="post" id="allProjectFrom" name="allProjectFrom">
		<input type="hidden" name="struts.token.name" value="token" />
		<input type="hidden" name="token" value="56KJ50QTTJQ1J9E98CYS50F4ITTA1LCQ" />
		<div class="jlcwj">
			<div class="jlcwj_bt">
		    	<div class="jlcwj_bt_logo"><img src="/image/question/jlcwj_logo.gif" /></div>
		        <div class="jlcwj_bt_tm"><img src="/image/question/jlcwj_bt.gif" /></div>
		    </div>
		    <input type="hidden" name="questionnaireResearch.researchId" value="2" id="questionnaireResearch_researchId"/>
	    	<div class="jlcwj_nr">
		    	<div class="jlcwj_nr_bt">
		        	<div class="jlcwj_nr_bt_yi"><b>尊敬的自可知客户</b>
				    	<p>我们努力完善网站、商品和服务。请您参与我们的问卷调查，以便我们提供更好的服务。</p>
					</div>
		        </div>
				<div class="jlcwj_nr_bt1">
					<div class="jlcwj_nr_bt1_zt1">
						<b>1、您对于自可知目前的网站、商品和服务，总体满意吗？<font color="red">*</font></b>
						<ul>
							<li><input name="customerFillAnswerList[0].questionAnswer" type="radio" value="sq4"  class="jlcwj_fxk" /><span>很不满意</span></li>
							<li><input name="customerFillAnswerList[0].questionAnswer" type="radio" value="sq5"  class="jlcwj_fxk" /><span>不太满意</span></li>
							<li><input name="customerFillAnswerList[0].questionAnswer" type="radio" value="sq6"  class="jlcwj_fxk" /><span>一般</span></li>
							<li><input name="customerFillAnswerList[0].questionAnswer" type="radio" value="sq7"  class="jlcwj_fxk" /><span>比较满意</span></li>
						</ul>
					</div>
					 <div class="jlcwj_nr_bt1_zt1">
						<b>2、自可知的定位哪几个最能吸引您？<font color="red">*</font></b>
							            	
						<input type="hidden" name="customerFillAnswerList[1].questionId" value="5"/>
						<input type="hidden" name="question_is_must_select" value="yes"/>
						<input type="hidden" name="question_type" value="checkbox"/>
						<ul>
							<li><input name="customerFillAnswerList[1].questionAnswer" type="checkbox" value="sq14"  class="jlcwj_fxk" /><span>支持零售,1元起</span></li>
							<li><input name="customerFillAnswerList[1].questionAnswer" type="checkbox" value="sq15"  class="jlcwj_fxk" /><span>正品保证</span></li>
							<li><input name="customerFillAnswerList[1].questionAnswer" type="checkbox" value="sq16"  class="jlcwj_fxk" /><span>现货销售</span></li>
						</ul>
					</div>
					<div class="jlcwj_nr_bt1_zt1">
		        		<b>3、您是否与我们的在线客服人员交流过？是否满意<font color="red">*</font></b>
		            	<input type="hidden" name="customerFillAnswerList[4].questionId" value="8"/>
		            	<input type="hidden" name="question_is_must_select" value="yes"/>
		            	<input type="hidden" name="question_type" value="radio"/>
		            	<ul>
	       					<li><input name="customerFillAnswerList[4].questionAnswer" type="radio" value="sq23"  class="jlcwj_fxk" /><span>没交流过</span></li>
		                    <li><input name="customerFillAnswerList[4].questionAnswer" type="radio" value="sq24"  class="jlcwj_fxk" /><span>交流过，不满意</span></li>
		                    <li><input name="customerFillAnswerList[4].questionAnswer" type="radio" value="sq25"  class="jlcwj_fxk" /><span>交流过，一般</span></li>
		                    <li><input name="customerFillAnswerList[4].questionAnswer" type="radio" value="sq26"  class="jlcwj_fxk" /><span>交流过，满意</span></li>
						</ul>
	                </div>
					<div class="jlcwj_nr_bt1_zt3">
		        		<b>4、您觉得自可知哪块你觉得不够完善？最让你不满意的地方</b>
		            	<input type="hidden" name="customerFillAnswerList[6].questionId" value="10"/>
		            	<input type="hidden" name="question_is_must_select" value="no"/>
		            	<input type="hidden" name="question_type" value="text"/>
		            	<p><textarea name="customerFillAnswerList[6].questionAnswer" id="textarea_6" cols="" rows="" class="jlcwj_wbk" onkeyup="limitInput('textarea_6',500,'');"></textarea><input type="hidden" id="limit_6" value="1"/></p>
					</div>
					<div class="jlcwj_nr_bt1_zt1">
		        		<b>5、您目前的身份是？<font color="red">*</font></b>
		            	<input type="hidden" name="customerFillAnswerList[7].questionId" value="11"/>
		            	<input type="hidden" name="question_is_must_select" value="yes"/>
		            	<input type="hidden" name="question_type" value="radio"/>
		            	<ul>
	       					<li><input name="customerFillAnswerList[7].questionAnswer" type="radio" value="sq29"  class="jlcwj_fxk" /><span>采购人员</span></li>
	       					<li><input name="customerFillAnswerList[7].questionAnswer" type="radio" value="sq30"  class="jlcwj_fxk" /><span>工程技术人员</span></li>
		                    <li><input name="customerFillAnswerList[7].questionAnswer" type="radio" value="sq31"  class="jlcwj_fxk" /><span>学校师生</span></li>
		                    <li><input name="customerFillAnswerList[7].questionAnswer" type="radio" value="sq32"  class="jlcwj_fxk" /><span>其他</span></li>
	                    </ul>
	                </div>
				</div>
				<div class="jlcwj_nr_bt2">
					<div class="jlcwj_nr_bt1_zt3">
		        		<b>6、您愿意留下您的联系方式吗，以便我们跟进问题。</b>
		            	<input type="hidden" name="customerFillAnswerList[8].questionId" value="12"/>
		            	<input type="hidden" name="question_is_must_select" value="no"/>
		            	<input type="hidden" name="question_type" value="text"/>
		            	<p><textarea name="customerFillAnswerList[8].questionAnswer"  id="textarea_8" cols="" rows="" class="jlcwj_wbk" onkeyup="limitInput('textarea_8',200,'');"></textarea><input type="hidden" id="limit_8" value="1"/></p>
					</div>
					<div class="jlcwj_nr_bt1_zt1">
		        		<b>10、请问您是怎么知道自可知的？<font color="red">*</font></b>
		            	<input type="hidden" name="customerFillAnswerList[9].questionId" value="13"/>
		            	<input type="hidden" name="question_is_must_select" value="yes"/>
		            	<input type="hidden" name="question_type" value="radio"/>
		            	<ul>
	       					<li><input name="customerFillAnswerList[9].questionAnswer" type="radio" value="sq34"  class=" jlcwj_fxk" /><span>朋友介绍</span></li>
					                    
		                    <li><input name="customerFillAnswerList[9].questionAnswer" type="radio" value="sq35"  class=" jlcwj_fxk" /><span>搜索引擎</span></li>
				                    
		                    <li><input name="customerFillAnswerList[9].questionAnswer" type="radio" value="sq36"  class=" jlcwj_fxk" /><span>嘉立创erp系统</span></li>
				                    
		                    <li><input name="customerFillAnswerList[9].questionAnswer" type="radio" value="sq37"  class=" jlcwj_fxk" /><span>通过你们业务员推广</span></li>
				                    
		                    <li><input name="customerFillAnswerList[9].questionAnswer" type="radio" value="sq38"  class=" jlcwj_fxk" /><span>其他方式</span></li>
				                    
	                    </ul>
					</div>
			        <div class="jlcwj_nr_bt1_zt3">
		            	<p><input name="" type="button" class="jlcwj_an" onclick="saveCustomerQuestionaire()"/></p>
		           	</div>
		        </div>
       		</div>
		</div>
	</form>
</body>
</html>
</html>