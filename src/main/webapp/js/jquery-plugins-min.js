/*!
 * jQuery Form Plugin
 * version: 2.87 (20-OCT-2011)
 * @requires jQuery v1.3.2 or later
 *
 * Examples and documentation at: http://malsup.com/jquery/form/
 * Dual licensed under the MIT and GPL licenses:
 *   http://www.opensource.org/licenses/mit-license.php
 *   http://www.gnu.org/licenses/gpl.html
 */
 
;(function($){$.fn.ajaxSubmit=function(options){if(!this.length){log('ajaxSubmit: skipping submit process - no element selected');return this;}
var method,action,url,$form=this;if(typeof options=='function'){options={success:options};}
method=this.attr('method');action=this.attr('action');url=(typeof action==='string')?$.trim(action):'';url=url||window.location.href||'';if(url){url=(url.match(/^([^#]+)/)||[])[1];}
options=$.extend(true,{url:url,success:$.ajaxSettings.success,type:method||'GET',iframeSrc:/^https/i.test(window.location.href||'')?'javascript:false':'about:blank'},options);var veto={};this.trigger('form-pre-serialize',[this,options,veto]);if(veto.veto){log('ajaxSubmit: submit vetoed via form-pre-serialize trigger');return this;}
if(options.beforeSerialize&&options.beforeSerialize(this,options)===false){log('ajaxSubmit: submit aborted via beforeSerialize callback');return this;}
var traditional=options.traditional;if(traditional===undefined){traditional=$.ajaxSettings.traditional;}
var qx,n,v,a=this.formToArray(options.semantic);if(options.data){options.extraData=options.data;qx=$.param(options.data,traditional);}
if(options.beforeSubmit&&options.beforeSubmit(a,this,options)===false){log('ajaxSubmit: submit aborted via beforeSubmit callback');return this;}
this.trigger('form-submit-validate',[a,this,options,veto]);if(veto.veto){log('ajaxSubmit: submit vetoed via form-submit-validate trigger');return this;}
var q=$.param(a,traditional);if(qx)
q=(q?(q+'&'+qx):qx);if(options.type.toUpperCase()=='GET'){options.url+=(options.url.indexOf('?')>=0?'&':'?')+q;options.data=null;}
else{options.data=q;}
var callbacks=[];if(options.resetForm){callbacks.push(function(){$form.resetForm();});}
if(options.clearForm){callbacks.push(function(){$form.clearForm(options.includeHidden);});}
if(!options.dataType&&options.target){var oldSuccess=options.success||function(){};callbacks.push(function(data){var fn=options.replaceTarget?'replaceWith':'html';$(options.target)[fn](data).each(oldSuccess,arguments);});}
else if(options.success){callbacks.push(options.success);}
options.success=function(data,status,xhr){var context=options.context||options;for(var i=0,max=callbacks.length;i<max;i++){callbacks[i].apply(context,[data,status,xhr||$form,$form]);}};var fileInputs=$('input:file',this).length>0;var mp='multipart/form-data';var multipart=($form.attr('enctype')==mp||$form.attr('encoding')==mp);if(options.iframe!==false&&(fileInputs||options.iframe||multipart)){if(options.closeKeepAlive){$.get(options.closeKeepAlive,function(){fileUpload(a);});}
else{fileUpload(a);}}
else{if($.browser.msie&&method=='get'&&typeof options.type==="undefined"){var ieMeth=$form[0].getAttribute('method');if(typeof ieMeth==='string')
options.type=ieMeth;}
$.ajax(options);}
this.trigger('form-submit-notify',[this,options]);return this;function fileUpload(a){var form=$form[0],el,i,s,g,id,$io,io,xhr,sub,n,timedOut,timeoutHandle;var useProp=!!$.fn.prop;if(a){if(useProp){for(i=0;i<a.length;i++){el=$(form[a[i].name]);el.prop('disabled',false);}}else{for(i=0;i<a.length;i++){el=$(form[a[i].name]);el.removeAttr('disabled');}};}
if($(':input[name=submit],:input[id=submit]',form).length){alert('Error: Form elements must not have name or id of "submit".');return;}
s=$.extend(true,{},$.ajaxSettings,options);s.context=s.context||s;id='jqFormIO'+(new Date().getTime());if(s.iframeTarget){$io=$(s.iframeTarget);n=$io.attr('name');if(n==null)
$io.attr('name',id);else
id=n;}
else{$io=$('<iframe name="'+id+'" src="'+s.iframeSrc+'" />');$io.css({position:'absolute',top:'-1000px',left:'-1000px'});}
io=$io[0];xhr={aborted:0,responseText:null,responseXML:null,status:0,statusText:'n/a',getAllResponseHeaders:function(){},getResponseHeader:function(){},setRequestHeader:function(){},abort:function(status){var e=(status==='timeout'?'timeout':'aborted');log('aborting upload... '+e);this.aborted=1;$io.attr('src',s.iframeSrc);xhr.error=e;s.error&&s.error.call(s.context,xhr,e,status);g&&$.event.trigger("ajaxError",[xhr,s,e]);s.complete&&s.complete.call(s.context,xhr,e);}};g=s.global;if(g&&!$.active++){$.event.trigger("ajaxStart");}
if(g){$.event.trigger("ajaxSend",[xhr,s]);}
if(s.beforeSend&&s.beforeSend.call(s.context,xhr,s)===false){if(s.global){$.active--;}
return;}
if(xhr.aborted){return;}
sub=form.clk;if(sub){n=sub.name;if(n&&!sub.disabled){s.extraData=s.extraData||{};s.extraData[n]=sub.value;if(sub.type=="image"){s.extraData[n+'.x']=form.clk_x;s.extraData[n+'.y']=form.clk_y;}}}
var CLIENT_TIMEOUT_ABORT=1;var SERVER_ABORT=2;function getDoc(frame){var doc=frame.contentWindow?frame.contentWindow.document:frame.contentDocument?frame.contentDocument:frame.document;return doc;}
function doSubmit(){var t=$form.attr('target'),a=$form.attr('action');form.setAttribute('target',id);if(!method){form.setAttribute('method','POST');}
if(a!=s.url){form.setAttribute('action',s.url);}
if(!s.skipEncodingOverride&&(!method||/post/i.test(method))){$form.attr({encoding:'multipart/form-data',enctype:'multipart/form-data'});}
if(s.timeout){timeoutHandle=setTimeout(function(){timedOut=true;cb(CLIENT_TIMEOUT_ABORT);},s.timeout);}
function checkState(){try{var state=getDoc(io).readyState;log('state = '+state);if(state.toLowerCase()=='uninitialized')
setTimeout(checkState,50);}
catch(e){log('Server abort: ',e,' (',e.name,')');cb(SERVER_ABORT);timeoutHandle&&clearTimeout(timeoutHandle);timeoutHandle=undefined;}}
var extraInputs=[];try{if(s.extraData){for(var n in s.extraData){extraInputs.push($('<input type="hidden" name="'+n+'" />').attr('value',s.extraData[n]).appendTo(form)[0]);}}
if(!s.iframeTarget){$io.appendTo('body');io.attachEvent?io.attachEvent('onload',cb):io.addEventListener('load',cb,false);}
setTimeout(checkState,15);form.submit();}
finally{form.setAttribute('action',a);if(t){form.setAttribute('target',t);}else{$form.removeAttr('target');}
$(extraInputs).remove();}}
if(s.forceSync){doSubmit();}
else{setTimeout(doSubmit,10);}
var data,doc,domCheckCount=50,callbackProcessed;function cb(e){if(xhr.aborted||callbackProcessed){return;}
try{doc=getDoc(io);}
catch(ex){log('cannot access response document: ',ex);e=SERVER_ABORT;}
if(e===CLIENT_TIMEOUT_ABORT&&xhr){xhr.abort('timeout');return;}
else if(e==SERVER_ABORT&&xhr){xhr.abort('server abort');return;}
if(!doc||doc.location.href==s.iframeSrc){if(!timedOut)
return;}
io.detachEvent?io.detachEvent('onload',cb):io.removeEventListener('load',cb,false);var status='success',errMsg;try{if(timedOut){throw'timeout';}
var isXml=s.dataType=='xml'||doc.XMLDocument||$.isXMLDoc(doc);log('isXml='+isXml);if(!isXml&&window.opera&&(doc.body==null||doc.body.innerHTML=='')){if(--domCheckCount){log('requeing onLoad callback, DOM not available');setTimeout(cb,250);return;}}
var docRoot=doc.body?doc.body:doc.documentElement;xhr.responseText=docRoot?docRoot.innerHTML:null;xhr.responseXML=doc.XMLDocument?doc.XMLDocument:doc;if(isXml)
s.dataType='xml';xhr.getResponseHeader=function(header){var headers={'content-type':s.dataType};return headers[header];};if(docRoot){xhr.status=Number(docRoot.getAttribute('status'))||xhr.status;xhr.statusText=docRoot.getAttribute('statusText')||xhr.statusText;}
var dt=(s.dataType||'').toLowerCase();var scr=/(json|script|text)/.test(dt);if(scr||s.textarea){var ta=doc.getElementsByTagName('textarea')[0];if(ta){xhr.responseText=ta.value;xhr.status=Number(ta.getAttribute('status'))||xhr.status;xhr.statusText=ta.getAttribute('statusText')||xhr.statusText;}
else if(scr){var pre=doc.getElementsByTagName('pre')[0];var b=doc.getElementsByTagName('body')[0];if(pre){xhr.responseText=pre.textContent?pre.textContent:pre.innerText;}
else if(b){xhr.responseText=b.textContent?b.textContent:b.innerText;}}}
else if(dt=='xml'&&!xhr.responseXML&&xhr.responseText!=null){xhr.responseXML=toXml(xhr.responseText);}
try{data=httpData(xhr,dt,s);}
catch(e){status='parsererror';xhr.error=errMsg=(e||status);}}
catch(e){log('error caught: ',e);status='error';xhr.error=errMsg=(e||status);}
if(xhr.aborted){log('upload aborted');status=null;}
if(xhr.status){status=(xhr.status>=200&&xhr.status<300||xhr.status===304)?'success':'error';}
if(status==='success'){s.success&&s.success.call(s.context,data,'success',xhr);g&&$.event.trigger("ajaxSuccess",[xhr,s]);}
else if(status){if(errMsg==undefined)
errMsg=xhr.statusText;s.error&&s.error.call(s.context,xhr,status,errMsg);g&&$.event.trigger("ajaxError",[xhr,s,errMsg]);}
g&&$.event.trigger("ajaxComplete",[xhr,s]);if(g&&!--$.active){$.event.trigger("ajaxStop");}
s.complete&&s.complete.call(s.context,xhr,status);callbackProcessed=true;if(s.timeout)
clearTimeout(timeoutHandle);setTimeout(function(){if(!s.iframeTarget)
$io.remove();xhr.responseXML=null;},100);}
var toXml=$.parseXML||function(s,doc){if(window.ActiveXObject){doc=new ActiveXObject('Microsoft.XMLDOM');doc.async='false';doc.loadXML(s);}
else{doc=(new DOMParser()).parseFromString(s,'text/xml');}
return(doc&&doc.documentElement&&doc.documentElement.nodeName!='parsererror')?doc:null;};var parseJSON=$.parseJSON||function(s){return window['eval']('('+s+')');};var httpData=function(xhr,type,s){var ct=xhr.getResponseHeader('content-type')||'',xml=type==='xml'||!type&&ct.indexOf('xml')>=0,data=xml?xhr.responseXML:xhr.responseText;if(xml&&data.documentElement.nodeName==='parsererror'){$.error&&$.error('parsererror');}
if(s&&s.dataFilter){data=s.dataFilter(data,type);}
if(typeof data==='string'){if(type==='json'||!type&&ct.indexOf('json')>=0){data=parseJSON(data);}else if(type==="script"||!type&&ct.indexOf("javascript")>=0){$.globalEval(data);}}
return data;};}};$.fn.ajaxForm=function(options){if(this.length===0){var o={s:this.selector,c:this.context};if(!$.isReady&&o.s){log('DOM not ready, queuing ajaxForm');$(function(){$(o.s,o.c).ajaxForm(options);});return this;}
log('terminating; zero elements found by selector'+($.isReady?'':' (DOM not ready)'));return this;}
return this.ajaxFormUnbind().bind('submit.form-plugin',function(e){if(!e.isDefaultPrevented()){e.preventDefault();$(this).ajaxSubmit(options);}}).bind('click.form-plugin',function(e){var target=e.target;var $el=$(target);if(!($el.is(":submit,input:image"))){var t=$el.closest(':submit');if(t.length==0){return;}
target=t[0];}
var form=this;form.clk=target;if(target.type=='image'){if(e.offsetX!=undefined){form.clk_x=e.offsetX;form.clk_y=e.offsetY;}else if(typeof $.fn.offset=='function'){var offset=$el.offset();form.clk_x=e.pageX-offset.left;form.clk_y=e.pageY-offset.top;}else{form.clk_x=e.pageX-target.offsetLeft;form.clk_y=e.pageY-target.offsetTop;}}
setTimeout(function(){form.clk=form.clk_x=form.clk_y=null;},100);});};$.fn.ajaxFormUnbind=function(){return this.unbind('submit.form-plugin click.form-plugin');};$.fn.formToArray=function(semantic){var a=[];if(this.length===0){return a;}
var form=this[0];var els=semantic?form.getElementsByTagName('*'):form.elements;if(!els){return a;}
var i,j,n,v,el,max,jmax;for(i=0,max=els.length;i<max;i++){el=els[i];n=el.name;if(!n){continue;}
if(semantic&&form.clk&&el.type=="image"){if(!el.disabled&&form.clk==el){a.push({name:n,value:$(el).val()});a.push({name:n+'.x',value:form.clk_x},{name:n+'.y',value:form.clk_y});}
continue;}
v=$.fieldValue(el,true);if(v&&v.constructor==Array){for(j=0,jmax=v.length;j<jmax;j++){a.push({name:n,value:v[j]});}}
else if(v!==null&&typeof v!='undefined'){a.push({name:n,value:v});}}
if(!semantic&&form.clk){var $input=$(form.clk),input=$input[0];n=input.name;if(n&&!input.disabled&&input.type=='image'){a.push({name:n,value:$input.val()});a.push({name:n+'.x',value:form.clk_x},{name:n+'.y',value:form.clk_y});}}
return a;};$.fn.formSerialize=function(semantic){return $.param(this.formToArray(semantic));};$.fn.fieldSerialize=function(successful){var a=[];this.each(function(){var n=this.name;if(!n){return;}
var v=$.fieldValue(this,successful);if(v&&v.constructor==Array){for(var i=0,max=v.length;i<max;i++){a.push({name:n,value:v[i]});}}
else if(v!==null&&typeof v!='undefined'){a.push({name:this.name,value:v});}});return $.param(a);};$.fn.fieldValue=function(successful){for(var val=[],i=0,max=this.length;i<max;i++){var el=this[i];var v=$.fieldValue(el,successful);if(v===null||typeof v=='undefined'||(v.constructor==Array&&!v.length)){continue;}
v.constructor==Array?$.merge(val,v):val.push(v);}
return val;};$.fieldValue=function(el,successful){var n=el.name,t=el.type,tag=el.tagName.toLowerCase();if(successful===undefined){successful=true;}
if(successful&&(!n||el.disabled||t=='reset'||t=='button'||(t=='checkbox'||t=='radio')&&!el.checked||(t=='submit'||t=='image')&&el.form&&el.form.clk!=el||tag=='select'&&el.selectedIndex==-1)){return null;}
if(tag=='select'){var index=el.selectedIndex;if(index<0){return null;}
var a=[],ops=el.options;var one=(t=='select-one');var max=(one?index+1:ops.length);for(var i=(one?index:0);i<max;i++){var op=ops[i];if(op.selected){var v=op.value;if(!v){v=(op.attributes&&op.attributes['value']&&!(op.attributes['value'].specified))?op.text:op.value;}
if(one){return v;}
a.push(v);}}
return a;}
return $(el).val();};$.fn.clearForm=function(includeHidden){return this.each(function(){$('input,select,textarea',this).clearFields(includeHidden);});};$.fn.clearFields=$.fn.clearInputs=function(includeHidden){var re=/^(?:color|date|datetime|email|month|number|password|range|search|tel|text|time|url|week)$/i;return this.each(function(){var t=this.type,tag=this.tagName.toLowerCase();if(re.test(t)||tag=='textarea'||(includeHidden&&/hidden/.test(t))){this.value='';}
else if(t=='checkbox'||t=='radio'){this.checked=false;}
else if(tag=='select'){this.selectedIndex=-1;}});};$.fn.resetForm=function(){return this.each(function(){if(typeof this.reset=='function'||(typeof this.reset=='object'&&!this.reset.nodeType)){this.reset();}});};$.fn.enable=function(b){if(b===undefined){b=true;}
return this.each(function(){this.disabled=!b;});};$.fn.selected=function(select){if(select===undefined){select=true;}
return this.each(function(){var t=this.type;if(t=='checkbox'||t=='radio'){this.checked=select;}
else if(this.tagName.toLowerCase()=='option'){var $sel=$(this).parent('select');if(select&&$sel[0]&&$sel[0].type=='select-one'){$sel.find('option').selected(false);}
this.selected=select;}});};$.fn.ajaxSubmit.debug=false;function log(){if(!$.fn.ajaxSubmit.debug)
return;var msg='[jquery.form] '+Array.prototype.join.call(arguments,'');if(window.console&&window.console.log){window.console.log(msg);}
else if(window.opera&&window.opera.postError){window.opera.postError(msg);}};})(jQuery);


/*!
 * jQuery blockUI plugin
 * Version 2.39 (23-MAY-2011)
 * //@requires jQuery v1.2.3 or later
 *
 * Examples at: http://malsup.com/jquery/block/
 * Copyright (c) 2007-2010 M. Alsup
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 * Thanks to Amir-Hossein Sobhi for some excellent contributions!
 */

;(function($){if(/1\.(0|1|2)\.(0|1|2)/.test($.fn.jquery)||/^1.1/.test($.fn.jquery)){alert('blockUI requires jQuery v1.2.3 or later!  You are using v'+$.fn.jquery);return}$.fn._fadeIn=$.fn.fadeIn;var noOp=function(){};var mode=document.documentMode||0;var setExpr=$.browser.msie&&(($.browser.version<8&&!mode)||mode<8);var ie6=$.browser.msie&&/MSIE 6.0/.test(navigator.userAgent)&&!mode;$.blockUI=function(opts){install(window,opts)};$.unblockUI=function(opts){remove(window,opts)};$.growlUI=function(title,message,timeout,onClose){var $m=$('<div class="growlUI"></div>');if(title)$m.append('<h1>'+title+'</h1>');if(message)$m.append('<h2>'+message+'</h2>');if(timeout==undefined)timeout=3000;$.blockUI({message:$m,fadeIn:700,fadeOut:1000,centerY:false,timeout:timeout,showOverlay:false,onUnblock:onClose,css:$.blockUI.defaults.growlCSS})};$.fn.block=function(opts){return this.unblock({fadeOut:0}).each(function(){if($.css(this,'position')=='static')this.style.position='relative';if($.browser.msie)this.style.zoom=1;install(this,opts)})};$.fn.unblock=function(opts){return this.each(function(){remove(this,opts)})};$.blockUI.version=2.39;$.blockUI.defaults={message:'<h1>Please wait...</h1>',title:null,draggable:true,theme:false,css:{padding:0,margin:0,width:'30%',top:'40%',left:'35%',textAlign:'center',color:'#000',border:'3px solid #aaa',backgroundColor:'#fff',cursor:'wait'},themedCSS:{width:'30%',top:'40%',left:'35%'},overlayCSS:{backgroundColor:'#000',opacity:0.6,cursor:'wait'},growlCSS:{width:'350px',top:'10px',left:'',right:'10px',border:'none',padding:'5px',opacity:0.6,cursor:'default',color:'#fff',backgroundColor:'#000','-webkit-border-radius':'10px','-moz-border-radius':'10px','border-radius':'10px'},iframeSrc:/^https/i.test(window.location.href||'')?'javascript:false':'about:blank',forceIframe:false,baseZ:1000,centerX:true,centerY:true,allowBodyStretch:true,bindEvents:true,constrainTabKey:true,fadeIn:200,fadeOut:400,timeout:0,showOverlay:true,focusInput:true,applyPlatformOpacityRules:true,onBlock:null,onUnblock:null,quirksmodeOffsetHack:4,blockMsgClass:'blockMsg'};var pageBlock=null;var pageBlockEls=[];function install(el,opts){var full=(el==window);var msg=opts&&opts.message!==undefined?opts.message:undefined;opts=$.extend({},$.blockUI.defaults,opts||{});opts.overlayCSS=$.extend({},$.blockUI.defaults.overlayCSS,opts.overlayCSS||{});var css=$.extend({},$.blockUI.defaults.css,opts.css||{});var themedCSS=$.extend({},$.blockUI.defaults.themedCSS,opts.themedCSS||{});msg=msg===undefined?opts.message:msg;if(full&&pageBlock)remove(window,{fadeOut:0});if(msg&&typeof msg!='string'&&(msg.parentNode||msg.jquery)){var node=msg.jquery?msg[0]:msg;var data={};$(el).data('blockUI.history',data);data.el=node;data.parent=node.parentNode;data.display=node.style.display;data.position=node.style.position;if(data.parent)data.parent.removeChild(node)}$(el).data('blockUI.onUnblock',opts.onUnblock);var z=opts.baseZ;var lyr1=($.browser.msie||opts.forceIframe)?$('<iframe class="blockUI" style="z-index:'+(z++)+';display:none;border:none;margin:0;padding:0;position:absolute;width:100%;height:100%;top:0;left:0" src="'+opts.iframeSrc+'"></iframe>'):$('<div class="blockUI" style="display:none"></div>');var lyr2=opts.theme?$('<div class="blockUI blockOverlay ui-widget-overlay" style="z-index:'+(z++)+';display:none"></div>'):$('<div class="blockUI blockOverlay" style="z-index:'+(z++)+';display:none;border:none;margin:0;padding:0;width:100%;height:100%;top:0;left:0"></div>');var lyr3,s;if(opts.theme&&full){s='<div class="blockUI '+opts.blockMsgClass+' blockPage ui-dialog ui-widget ui-corner-all" style="z-index:'+(z+10)+';display:none;position:fixed">'+'<div class="ui-widget-header ui-dialog-titlebar ui-corner-all blockTitle">'+(opts.title||'&nbsp;')+'</div>'+'<div class="ui-widget-content ui-dialog-content"></div>'+'</div>'}else if(opts.theme){s='<div class="blockUI '+opts.blockMsgClass+' blockElement ui-dialog ui-widget ui-corner-all" style="z-index:'+(z+10)+';display:none;position:absolute">'+'<div class="ui-widget-header ui-dialog-titlebar ui-corner-all blockTitle">'+(opts.title||'&nbsp;')+'</div>'+'<div class="ui-widget-content ui-dialog-content"></div>'+'</div>'}else if(full){s='<div class="blockUI '+opts.blockMsgClass+' blockPage" style="z-index:'+(z+10)+';display:none;position:fixed"></div>'}else{s='<div class="blockUI '+opts.blockMsgClass+' blockElement" style="z-index:'+(z+10)+';display:none;position:absolute"></div>'}lyr3=$(s);if(msg){if(opts.theme){lyr3.css(themedCSS);lyr3.addClass('ui-widget-content')}else lyr3.css(css)}if(!opts.theme&&(!opts.applyPlatformOpacityRules||!($.browser.mozilla&&/Linux/.test(navigator.platform))))lyr2.css(opts.overlayCSS);lyr2.css('position',full?'fixed':'absolute');if($.browser.msie||opts.forceIframe)lyr1.css('opacity',0.0);var layers=[lyr1,lyr2,lyr3],$par=full?$('body'):$(el);$.each(layers,function(){this.appendTo($par)});if(opts.theme&&opts.draggable&&$.fn.draggable){lyr3.draggable({handle:'.ui-dialog-titlebar',cancel:'li'})}var expr=setExpr&&(!$.boxModel||$('object,embed',full?null:el).length>0);if(ie6||expr){if(full&&opts.allowBodyStretch&&$.boxModel)$('html,body').css('height','100%');if((ie6||!$.boxModel)&&!full){var t=sz(el,'borderTopWidth'),l=sz(el,'borderLeftWidth');var fixT=t?'(0 - '+t+')':0;var fixL=l?'(0 - '+l+')':0}$.each([lyr1,lyr2,lyr3],function(i,o){var s=o[0].style;s.position='absolute';if(i<2){full?s.setExpression('height','Math.max(document.body.scrollHeight, document.body.offsetHeight) - (jQuery.boxModel?0:'+opts.quirksmodeOffsetHack+') + "px"'):s.setExpression('height','this.parentNode.offsetHeight + "px"');full?s.setExpression('width','jQuery.boxModel && document.documentElement.clientWidth || document.body.clientWidth + "px"'):s.setExpression('width','this.parentNode.offsetWidth + "px"');if(fixL)s.setExpression('left',fixL);if(fixT)s.setExpression('top',fixT)}else if(opts.centerY){if(full)s.setExpression('top','(document.documentElement.clientHeight || document.body.clientHeight) / 2 - (this.offsetHeight / 2) + (blah = document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop) + "px"');s.marginTop=0}else if(!opts.centerY&&full){var top=(opts.css&&opts.css.top)?parseInt(opts.css.top):0;var expression='((document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop) + '+top+') + "px"';s.setExpression('top',expression)}})}if(msg){if(opts.theme)lyr3.find('.ui-widget-content').append(msg);else lyr3.append(msg);if(msg.jquery||msg.nodeType)$(msg).show()}if(($.browser.msie||opts.forceIframe)&&opts.showOverlay)lyr1.show();if(opts.fadeIn){var cb=opts.onBlock?opts.onBlock:noOp;var cb1=(opts.showOverlay&&!msg)?cb:noOp;var cb2=msg?cb:noOp;if(opts.showOverlay)lyr2._fadeIn(opts.fadeIn,cb1);if(msg)lyr3._fadeIn(opts.fadeIn,cb2)}else{if(opts.showOverlay)lyr2.show();if(msg)lyr3.show();if(opts.onBlock)opts.onBlock()}bind(1,el,opts);if(full){pageBlock=lyr3[0];pageBlockEls=$(':input:enabled:visible',pageBlock);if(opts.focusInput)setTimeout(focus,20)}else center(lyr3[0],opts.centerX,opts.centerY);if(opts.timeout){var to=setTimeout(function(){full?$.unblockUI(opts):$(el).unblock(opts)},opts.timeout);$(el).data('blockUI.timeout',to)}};function remove(el,opts){var full=(el==window);var $el=$(el);var data=$el.data('blockUI.history');var to=$el.data('blockUI.timeout');if(to){clearTimeout(to);$el.removeData('blockUI.timeout')}opts=$.extend({},$.blockUI.defaults,opts||{});bind(0,el,opts);if(opts.onUnblock===null){opts.onUnblock=$el.data('blockUI.onUnblock');$el.removeData('blockUI.onUnblock')}var els;if(full)els=$('body').children().filter('.blockUI').add('body > .blockUI');else els=$('.blockUI',el);if(full)pageBlock=pageBlockEls=null;if(opts.fadeOut){els.fadeOut(opts.fadeOut);setTimeout(function(){reset(els,data,opts,el)},opts.fadeOut)}else reset(els,data,opts,el)};function reset(els,data,opts,el){els.each(function(i,o){if(this.parentNode)this.parentNode.removeChild(this)});if(data&&data.el){data.el.style.display=data.display;data.el.style.position=data.position;if(data.parent)data.parent.appendChild(data.el);$(el).removeData('blockUI.history')}if(typeof opts.onUnblock=='function')opts.onUnblock(el,opts)};function bind(b,el,opts){var full=el==window,$el=$(el);if(!b&&(full&&!pageBlock||!full&&!$el.data('blockUI.isBlocked')))return;if(!full)$el.data('blockUI.isBlocked',b);if(!opts.bindEvents||(b&&!opts.showOverlay))return;var events='mousedown mouseup keydown keypress';b?$(document).bind(events,opts,handler):$(document).unbind(events,handler)};function handler(e){if(e.keyCode&&e.keyCode==9){if(pageBlock&&e.data.constrainTabKey){var els=pageBlockEls;var fwd=!e.shiftKey&&e.target===els[els.length-1];var back=e.shiftKey&&e.target===els[0];if(fwd||back){setTimeout(function(){focus(back)},10);return false}}}var opts=e.data;if($(e.target).parents('div.'+opts.blockMsgClass).length>0)return true;return $(e.target).parents().children().filter('div.blockUI').length==0};function focus(back){if(!pageBlockEls)return;var e=pageBlockEls[back===true?pageBlockEls.length-1:0];if(e)e.focus()};function center(el,x,y){var p=el.parentNode,s=el.style;var l=((p.offsetWidth-el.offsetWidth)/2)-sz(p,'borderLeftWidth');var t=((p.offsetHeight-el.offsetHeight)/2)-sz(p,'borderTopWidth');if(x)s.left=l>0?(l+'px'):'0';if(y)s.top=t>0?(t+'px'):'0'};function sz(el,p){return parseInt($.css(el,p))||0}})(jQuery);


//修改blockUI默认样式
$.blockUI.defaults.css = {
		padding:	0,
		margin:		0,
		width:		"30%",
		top:		"50%",
		left:		"50%",
		color:		"#000",
		border:		"3px solid #2a78b4",
		borderRadius:"5px",
		cursor:		"default"
};
$.blockUI.defaults.overlayCSS = {
		backgroundColor: "#333",
		opacity:	  	 0.3,
		cursor:		  	 "default"
};
$.blockUI.defaults.fadeIn = 400;
$.blockUI.defaults.fadeOut= 600;

/*!
 * jQuery.mouseDelay.js v1.2
 * http://www.planeart.cn/?p=1073
 * Copyright 2011, TangBin
 * Dual licensed under the MIT or GPL Version 2 licenses.
 */
(function($,g){var h={},id=1,etid=g+'ETID';$.fn[g]=function(e,f){id++;f=f||this.data(etid)||id;e=e||150;if(f===id)this.data(etid,f);this._hover=this.hover;this.hover=function(c,d){c=c||$.noop;d=d||$.noop;this._hover(function(a){var b=this;clearTimeout(h[f]);h[f]=setTimeout(function(){c.call(b,a)},e)},function(a){var b=this;clearTimeout(h[f]);h[f]=setTimeout(function(){d.call(b,a)},e)});return this};return this};$.fn[g+'Pause']=function(){clearTimeout(this.data(etid));return this};$[g]={get:function(){return id++},pause:function(a){clearTimeout(h[a])}}})(jQuery,'mouseDelay');