/**
 * @todo ICNet 型号查询 (陆续完善中...)
 * @author Guo.F 2013.11.1
 */

var pageFlag = 1; // 0-IC型号查询, 1-元器件型号查询

$(function(){
	
	// 右下角自动报价窗口互动展开关闭变化
	$('.close_foldDiv_btn').click(function(){
		$('.fixedRB_shrinkDiv').show(200);
		$('.fixedRB_foldDiv').hide();
	});
	$('.open_detailDiv_btn').click(function(){
		$('.fixedRB_detailDiv_box').show(200);
		$('.fixedRB_foldDiv').hide();
	});
	$('.open_foldDiv_btn').click(function(){
//		$('.fixedRB_foldDiv').show(200);
		$('.fixedRB_detailDiv_box').show(200);
		$('.fixedRB_shrinkDiv').hide();
	});
	$('.close_detailDiv_btn').click(function(){
//		$('.fixedRB_foldDiv').show(200);
		$('.fixedRB_shrinkDiv').show(200);
		$('.fixedRB_detailDiv_box').hide();
	});
	
	
	// 选择城市弹出办公地点列表
	var selectCity = $.trim($('#selectCity').val());
	var selectMarket = $.trim($('#selectMarket').val());
	$(".city_option").bind("click",function(){ 
		$("#address_options").show(1,function(){ 
			selectedDX.openstate = 1; 
			selectedDX.selectvalue = $(".sift_local"); 
			selectedDX.selectul = $("#address_options"); 
			selectedDX.selectli = $(".address_option"); 
		}); 
		$('#selectMarket').val(selectMarket);
	});
	
	// 输入框提示[查询页专用]
	$(".shortinput").each(function(index, element) {
		if ( $.trim($(this).val()) == '' ) {
			var helpword = $(this).attr("title");
			$(this).val(helpword).css("color","#aaa");
		}
		$(this).bind("focus",function(){
			if($(this).val()== $(this).attr("title")) {
				$(this).val("").css("color","#333");
			}
		});
		$(this).bind("blur",function(){
			if($(this).val()=="") {
				var helpword = $(this).attr("title");
				$(this).val(helpword).css("color","#aaa");
			}
		});
	});
	
	
	/**
	 * @todo [元器件页] 点击IC相关数量进入IC型号页
	 * @author Guo.F
	 */
	$('#icCountSrc').click(function(){
		var icCount = $.trim($('#icCount').html());
		if ( icCount == 0 ) return;
		var partNo = $.trim($('input[name="partNo"]').val());
		if ( partNo == '' ) return;
		var isExact = $('#isExact').val();
		if ( $.trim(isExact) == '' ) isExact = 0;
		var mfg = $.trim($('input[name="mfg"]').val()).replace('厂家','');
		var qty = $.trim($('input[name="qty"]').val()).replace('数量','');
		var searchArea = $.trim($('#searchAreaCode').val());
		var searchAreaCode = getSearchAreaCode(searchArea);
		var stockDate = $.trim($('#stockDate').val());
		if ( $.trim(stockDate) == '' || stockDate == 0 ) stockDate = 90;
		
		partNo = encodeURIComponent(partNo);
		mfg = encodeURIComponent(mfg);
		qty = encodeURIComponent(qty);
		searchAreaCode = encodeURIComponent(searchAreaCode);
		
		var urlParam = 'IC_Method=icsearch&key='+partNo+
						'&isExact='+isExact+
						'&mfg='+mfg+
						'&qty='+qty+
						'&searchAreaCode='+searchAreaCode+
						'&stockDate='+stockDate;
		location.href = 'search.php?'+urlParam;
	});
	
	
	/**
	 * @todo [IC型号页] 点击元器件相关数量进入元器件页
	 * @author Guo.F
	 */
	$('#nicCountSrc').click(function(){
		var nicCount = $.trim($('#nicCount').html());
		if ( nicCount == 0 ) return;
		var partNo = $.trim($('#key').val());
		partNo = partNo.replace('找IC  搜一下', '');
		if ( partNo == '' ) return;
		var isExact = $('#isExact').val();
		if ( $.trim(isExact) == '' ) isExact = 0;
		var mfg = $.trim($('input[name="mfg"]').val()).replace('厂家','');
		var qty = $.trim($('input[name="qty"]').val()).replace('数量','');
		var searchArea = $.trim($('input[name="searchAreaCode"]').val());
		var searchAreaCode = getSearchAreaCode(searchArea);
		var stockDate = $.trim($('#stockDate').val());
		if ( $.trim(stockDate) == '' || stockDate == 0 ) stockDate = 90;
		
		partNo = encodeURIComponent(partNo);
		mfg = encodeURIComponent(mfg);
		qty = encodeURIComponent(qty);
		searchAreaCode = encodeURIComponent(searchAreaCode);
		
		var icCount = $.trim($('#icCount').html());
		
		var urlParam = 'IC_Method=nicsearch&key='+partNo+
						'&isExact='+isExact+
						'&mfg='+mfg+
						'&productName=&category=&subCategory='+
						'&qty='+qty+
						'&searchAreaCode='+searchAreaCode+
						'&stockDate='+stockDate+'&icCount='+icCount;
		location.href = 'searchNic.php?'+urlParam;
	});
	
	/**
	 * @todo 筛选层搜索
	 * @author Guo.F
	 */
	$('#btn_filtrateSearch').click(function(){ 
		var partNo = $.trim($('#key').val());
		partNo = partNo.replace('找IC  搜一下', '');
		if ( partNo == '' ) return;
		var mfg = $.trim($('input[name="mfg"]').val()).replace('厂家', '');
		var pack = $.trim($('input[name="pack"]').val()).replace('封装', '');
		var dc = $.trim($('input[name="dc"]').val()).replace('批号', '');
		var qty = $.trim($('input[name="qty"]').val()).replace('数量', 0);
		var searchArea = $.trim($('#selectCity').val());
		var searchAreaCode = getSearchAreaCode(searchArea);
		var searchMarket = $.trim($('#selectMarket').val()).replace('办公地点','');
		var stockType = $.trim($('#stockTypeSelect').val());
		stockType = getStockTypeCode(stockType); // 0-全部, 1-现货库存, 2-订货库存
		var stockDate = $.trim($('#stockDate').val());
		if ( $.trim(stockDate) == '' || stockDate == 0 ) stockDate = 90;
		
		partNo = encodeURIComponent(partNo);
		mfg = encodeURIComponent(mfg);
		pack = encodeURIComponent(pack);
		dc = encodeURIComponent(dc);
		qty = encodeURIComponent(qty);
		searchAreaCode = encodeURIComponent(searchAreaCode);
		searchMarket = encodeURIComponent(searchMarket);
		stockDate = encodeURIComponent(stockDate);
		stockType = encodeURIComponent(stockType);
		
		var urlParam = 'IC_Method=icsearch&key='+partNo+
						'&isExact=0'+
						'&mfg='+mfg+
						'&pack='+pack+
						'&dc='+dc+
						'&qty='+qty+
						'&searchAreaCode='+searchAreaCode+
						'&searchMarket='+searchMarket+
						'&stockDate='+stockDate+
						'&stockType='+stockType;
		location.href = 'search.php?'+urlParam;
	});
	
	/**
	 * @todo 添加商友
	 * @author Guo.F
	 */
	$('.addFriendBtn').click(function(){ 
		var CoIdList = getCoList();
		if ( $.trim(CoIdList) == '' ) {
			alert('请选择您要加为商友的企业');
		} else {
			if ( GetCookie('CompanyId') == null ) {
				$('#login_content').css('display', 'block');
				showlayer("login_content", "用户登陆");
			} else {
				addFriend(CoIdList);
			}
		}
	});
	
	
	
	/**
	 * @todo 删除页面右下角弹出层节点
	 * @author Guo.F
	 */
	$('.tinyClose').click(function(){ 
		if ( $(this).parents('ul').attr('id') == 'rb_searchList' ) { // [历史搜索记录] 删除Cookie
			var partNo = $(this).siblings('a').html();
			var cookieIndex = GetCookieIndex('SearchLog', partNo);
			DelCookieForArgs('SearchLog', cookieIndex, '');
		} else if ( $(this).parents('ul').attr('id') == 'rb_homePageList' ) { // [查看过的企业] 删除Cookie
			var companyId = $(this).siblings('input').val();
			var companyName = $(this).siblings('a').html();
			var args_index = [['CompanyId', companyId], ['CompanyName', companyName]];
			var cookieIndex = GetCookieIndexForArgs('HomePage', args_index);
			var args_param = ['CompanyId', 'CompanyName'];
			DelCookieForArgs('HomePage', cookieIndex, args_param);
		} else if ( $(this).parents('ul').attr('id') == 'rb_rfqList' ) { // [询价记录] 删除Cookie
			var companyId = $(this).siblings('input').val();
			var companyName = $(this).siblings('a').find('span:eq(1)').html();
			var partNo = $(this).siblings('a').find('.rb_product').html();
			var args_index = [['CompanyId', companyId], ['CompanyName', companyName], ['PartNo', partNo]];
			var cookieIndex = GetCookieIndexForArgs('Rfq', args_index);
			var args_param = ['CompanyId', 'CompanyName', 'PartNo'];
			DelCookieForArgs('Rfq', cookieIndex, args_param);
		}
		$(this).parent('li').remove();
	});
});


/**
 * @todo 最多一次可选择10家公司进行询价
 * @author Guo.F
 */
function checkOne(e) {
	var selectCount = 0;
	$('input:checkbox').each(function(){ 
		if ( $(this).attr('checked') == 'checked' ) {
			selectCount = selectCount + 1;
		}
	});
	if ( selectCount > 10 ) {
		$(e).attr("checked", false);
		alert('候选询价信息不能超过10条');
		return;
	}
}

/**
 * @todo 获取库存类型对应的编号
 * @author Guo.F
 * @param stockType 库存类型
 * @returns int : 0-全部, 1-现货库存, 2-订库存
 */
function getStockTypeCode(stockType) {
	stockTypeCode = 0;
	switch (stockType) {
		case '现货库存':
			stockTypeCode = 1;
			break;
		case '订货库存':
			stockTypeCode = 2;
			break;
		default:
			stockTypeCode = 0;
	}
	return stockTypeCode;
}

/**
 * @todo 获取选中的商友
 * @author Guo.F
 * @returns {Array}
 */
function getCoList(){
	var coIdList = [];
	var checkCount = 0;
	$('#resultList').find('input:checkbox').each(function(){
		 if($(this).attr('checked')=='checked'){
			 coIdList[checkCount] = $(this).val();
			 checkCount += 1;
		 }
	});
	return coIdList;
}

/**
 * @todo 获取元器件查询到的型号数量
 * @author Guo.F
 * @since 2013.12.2
 */
function getNicSearchCount() {
	var partNo = $.trim($('#key').val());
	partNo = partNo.replace('找IC  搜一下', '');
	if ( partNo == '' ) return;
	var mfg = $.trim($('input[name="mfg"]').val()).replace('厂家','');
	var pack = $.trim($('input[name="pack"]').val()).replace('封装','');
	var dc = $.trim($('input[name="dc"]').val()).replace('批号', '');
	var qty = $.trim($('input[name="qty"]').val()).replace('数量','');
	var searchAreaCode = $('#searchAreaCode').val();
	var isExact = $('#isExact').val();
	if ( $.trim(isExact) == '' ) isExact = 0;
	var stockDate = $('#stockDate').val();
	if ( $.trim(stockDate) == '' || stockDate == 0 ) stockDate = 90;
	
	partNo = encodeURIComponent(partNo);
	mfg = encodeURIComponent(mfg);
	pack = encodeURIComponent(pack);
	dc = encodeURIComponent(dc);
	qty = encodeURIComponent(qty);
	searchAreaCode = encodeURIComponent(searchAreaCode);
	
	var urlParam = 'IC_Method=getcomponentcount&IsExact='+isExact+
					'&PartNo='+partNo+
					'&Mfg='+mfg+
					'&Pack='+pack+
					'&Dc='+dc+
					'&Qty='+qty+
					'&Day='+stockDate+
					'&SearchAreaCode='+searchAreaCode;
					
	$.ajax({
		type:'get', 
		url: Public_Path+'/asyncCall/ui.asy.php',
		data: urlParam, 
		dataType: 'jsonp',
		jsonp: 'callback',
		timeout: 5000, 
		error: function(XMLHttpRequest, textStatus, errorThrown) { 
			$('#nicCount').html(0); // PageError1300
		},
		success: function(msg) {
			var error = msg.error;
			var componentCount = msg.componentCount;
			if ( error == '' ) {
				$('#nicCount').html(componentCount);
			} else {
				$('#nicCount').html(0); // PageError1301
			}
		}
	});
}


/**
 * @todo 获取一条自动报价
 * @author Guo.F
 * @since 2013.11.29
 * @update 2016.6.14
 */
function getOnePublicQuote() {
	var partNo = $.trim($('#key').val());
	partNo = partNo.replace('找IC', '');
	partNo = partNo.replace('搜一下', '');
	partNo = $.trim(partNo);
	if ( partNo == '' ) {
		$('#publicQuoteWait').show();
		$('#publicQuoteNone').hide();
		$('#publicQuoteList').hide();
		return;
	}
	var partNo_new = encodeURIComponent(partNo);
	$.ajax({
		type:'get', 
		url: Main_Path+'/asyncCall/autoQuote.asy.php', 
		data: 'IC_Method=getautoquotedatanew&PartNo='+partNo_new, 
		dataType: 'jsonp',
		jsonp: 'callback',
		timeout: 10000, 
		error: function(XMLHttpRequest, textStatus, errorThrown) { // PageError1302
			$('#publicQuoteWait').hide();
			$('#publicQuoteNone').show();
			$('#publicQuoteList').hide();
			$('#publicQuoteNone').find('b.orangenumber').html(partNo.substr(0, 15));
			$('#publicQuoteNone').find('a.goto_quote').attr('href', Main_Path+'/member/autoQuote/autoQuote_addQuote.php?addPartno='+partNo_new);
		},
		success: function(msg) {
			var error = msg.error;
			if ( $.trim(error) == '' ) {
				$('#publicQuoteWait').hide();
				var quoteCount = msg.qty;
				var quotePrice = msg.price;
				if ( quoteCount == 0 ) {
					$('#publicQuoteNone').show();
					$('#publicQuoteList').hide();
					$('#publicQuoteNone').find('b.orangenumber').html(partNo.substr(0, 15));
					$('#publicQuoteNone').find('a.goto_quote').attr('href', Main_Path+'/member/autoQuote/autoQuote_addQuote.php?addPartno='+partNo_new);
				} else {
					$('#publicQuoteNone').hide();
					$('#publicQuoteList').show();
					$('#publicQuoteList').find('b.orangenumber:eq(0)').html(partNo.substr(0, 10));
					$('#publicQuoteList').find('b.orangenumber:eq(1)').html(quoteCount);
					$('#publicQuoteList').find('b.rednumber').html('￥'+quotePrice);
					$('#publicQuoteList').find('a.goto_look').attr('href', AutoQuote_Path+'/autoQuote/autoQuote_resultList.php?partno='+partNo_new);
				}
			} else {
				$('#publicQuote').hide(); // PageError1303
			}
		}
	});
}