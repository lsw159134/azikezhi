/**
 * 
 */
		jQuery(document).ready(function() {
						Main.init();
						Index.init();
					});
		
		function zxj_hidden(){
			var aa = document.getElementById("zxj_hidden");
			var bb = document.getElementById("kuaisuSearch");
			if(aa.style.display == '' ){
				aa.style.display = 'none';
				bb.style.display = 'none';
			}else{
				aa.style.display = '';
				bb.style.display = '';
			}
		}
		
		function sjCpSearch(){
			var cpSearch = document.getElementById("cpSearch").value;
			window.location.href='sj_searchProduct?product='+cpSearch+"&supplieruuid=${sessionScope.sj_id}";
		}
		
		function sjCpSearch1(){
			var cpSearch = document.getElementById("cpSearch1").value;
			window.location.href='sj_searchProduct?product='+cpSearch+"&supplieruuid=${sessionScope.sj_id}";
		}
		
		function id1() {
			var min1 = document.getElementById("min1").value;
			var pid= document.getElementById("max1").value;
			if(parseInt(min1) >= parseInt(pid)){
				alert("请输入大于"+min1+"的数量");
				return false;
			}else{
				$("#min2").val(parseInt(pid)+1);
			}
		}
		function id2() {
			var max1= document.getElementById("max1").value;
			var pid=document.getElementById("max2").value;
			var min2=document.getElementById("min2").value;
			if(max1 == "" || max1 == " "){
				alert("请先输入上面数量");
				return false;
			}else if(parseInt(min2) >= parseInt(pid)){
				alert("请输入大于"+min2+"的数量");
				document.getElementById("min3").value = "";
				return false;
			}else{
				$("#min3").val(parseInt(pid)+1);
			}
		}
		
		$("#anniu").click(function(){
			var aa = document.getElementById("aa").value;
			var bb = document.getElementById("bb").value;
			var cc = document.getElementById("cc").value;
			var dd = document.getElementById("dd").value;
			var ee = document.getElementById("ee").value;
			var ff = document.getElementById("ff").value;
			var min1 = document.getElementById("min1").value;
			var max1 = document.getElementById("max1").value;
			var min2 = document.getElementById("min2").value;
			var max2 = document.getElementById("max2").value;
			var min3 = document.getElementById("min3").value;
			var price1 = document.getElementById("price1").value;
			var price2 = document.getElementById("price2").value;
			var price3 = document.getElementById("price3").value;
			var discount_unit=document.getElementById("discount_unit").value;
			 if (aa == "" || aa == " " ||
		    	  bb == "" || bb == " " ||
		    	  cc == "" || cc == " " ||
		    	  dd == "" || dd == " " ||
		    	  ee == "" || ee == " " ||
		    	  ff == "" || ff == " " ||
		    	  min1 == "" || min1 == " " ||
		    	  max1 == "" || max1 == " " ||
		    	  min2 == "" || min2 == " " ||
		    	  max2 == "" || max2 == " " ||
		    	  min3 == "" || min3 == " " ||
		    	  price1 == "" || price1 == " " ||
		    	  price2 == "" || price2 == " " ||
		    	  price3 == "" || price3 == " " ) {
		    	  alert("不允许空值");
		      }else if(parseFloat(price1) > parseFloat(price2) && parseFloat(price2) >  parseFloat(price3)){
		    	  		document.getElementById("zh_form").submit();
		    	  }else{
		    		  alert("请设置合理的价格,价格阶梯从上到下递减");
		    	  }
		})
		
		function deleCp(e){
			if(confirm("你确定要删除吗?")){
				window.location.href="supplier_deleCp?productuuid="+e;
			}else{
				return false;
			}
		}
		function updateCp(e){
			window.location.href="supplier_searchCP?productuuid="+e;
		}
		
		$("#update_anniu").click(function(){
			var aa = document.getElementById("aa").value;
			var bb = document.getElementById("bb").value;
			var cc = document.getElementById("cc").value;
			var dd = document.getElementById("dd").value;
			var ee = document.getElementById("ee").value;
			var ff = document.getElementById("ff").value;
			var min1 = document.getElementById("min1").value;
			var max1 = document.getElementById("max1").value;
			var min2 = document.getElementById("min2").value;
			var max2 = document.getElementById("max2").value;
			var min3 = document.getElementById("min3").value;
			var price1 = document.getElementById("price1").value;
			var price2 = document.getElementById("price2").value;
			var price3 = document.getElementById("price3").value;
			var discount_unit=document.getElementById("discount_unit").value;
			 if (aa == "" || aa == " " ||
		    	  bb == "" || bb == " " ||
		    	  cc == "" || cc == " " ||
		    	  dd == "" || dd == " " ||
		    	  ee == "" || ee == " " ||
		    	  ff == "" || ff == " " ||
		    	  min1 == "" || min1 == " " ||
		    	  max1 == "" || max1 == " " ||
		    	  min2 == "" || min2 == " " ||
		    	  max2 == "" || max2 == " " ||
		    	  min3 == "" || min3 == " " ||
		    	  price1 == "" || price1 == " " ||
		    	  price2 == "" || price2 == " " ||
		    	  price3 == "" || price3 == " " ) {
		    	  alert("不允许空值");
			 }else if(parseFloat(price1) > parseFloat(price2) && parseFloat(price2) >  parseFloat(price3)){
	    		  document.getElementById("update_form").submit();
	    	  }else{
	    		  alert("请设置合理的价格,价格阶梯从上到下递减");
	    	  }
			
		})
		
			
			
		
		
				
		
	
				