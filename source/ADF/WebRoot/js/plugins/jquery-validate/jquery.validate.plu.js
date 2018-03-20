function showErrors() {
	var t = this;
	for (var i = 0; this.errorList[i]; i++) {
		var error = this.errorList[i];
		var elename = this.idOrName(error.element);
		
		$('img[for="success_' + elename + '"]').hide();
		
		this.settings.highlight
				&& this.settings.highlight.call(this, error.element,
						this.settings.errorClass, this.settings.validClass);
		
		var errimg = $('img[for=' + elename + ']');
		if (errimg.length == 0) {
			errimg = $('<img alt="' + error.message + '"'
						 + ' src="' + context + '/js/plugins/jquery-validate/images/unchecked.gif"'
						 + ' style="padding:1px;"'
						 + ' data-toggle="tooltip"'
						 + ' title="' + error.message + '">');
			errimg.attr({
				"for" : this.idOrName(error.element),
				generated : true
			});
			errimg.insertAfter(error.element);
		} else {
			errimg.attr("alt", error.message);
			errimg.attr("title", error.message);
		}
		
		errimg.show();
	}

	for (var i = 0; this.successList[i]; i++) {
		var success = this.successList[i];
		var elename = this.idOrName(success);
		
		$('img[for=' + this.idOrName(this.successList[i]) + ']').hide();
		
		var successimg = $('img[for="success_' + elename + '"]');
		if (successimg.length == 0) {
			successimg = $('<img style="padding:1px;" src="' + context + '/js/plugins/jquery-validate/images/checked.gif">');
			successimg.attr({
				"for" : 'success_' + this.idOrName(success),
				generated : true
			});
			successimg.insertAfter(success);
		}
		
		successimg.show();
	}

	// 自定义高亮
	if (this.settings.unhighlight) {
		for (var i = 0, elements = this.validElements(); elements[i]; i++) {
			this.settings.unhighlight.call(this, elements[i],
					this.settings.errorClass, this.settings.validClass);
		}
	}
}

$.extend({
	getLeft : function(object) {
		var go = object;
		var oParent, oLeft = go.offsetLeft;
		while (go.offsetParent != null) {
			oParent = go.offsetParent;
			oLeft += oParent.offsetLeft;
			go = oParent;
		}
		return oLeft;
	},
	getTop : function(object) {
		var go = object;
		var goHeight = go.height;
		var oParent, oTop = go.offsetTop;
		while (go.offsetParent != null) {
			oParent = go.offsetParent;
			oTop += oParent.offsetTop;
			go = oParent;
		}
		return oTop;// 之所以加22不加控件高度,为了兼容ie6.
	}
});

//用户名[字母、数字、下划线]
jQuery.validator.addMethod("isUserName", function(value, element) {
		return this.optional(element) || /^[a-zA-Z0-9_]+$/.test(value);
}, "只能包括字母、数字、点、下划线、横线");

//编码[字母、数字、点、下划线、横线]
jQuery.validator.addMethod("isCode", function(value, element) {
		return this.optional(element) || /^[a-zA-Z0-9._-]+$/.test(value);
}, "只能包括字母、数字、点、下划线、横线");

//URL[字母、数字、点、下划线、横线]
jQuery.validator.addMethod("isUrl", function(value, element) {
		return this.optional(element) || /^[a-zA-Z0-9./]+$/.test(value);
}, "只能包括字母、数字、点、斜线");

// 中文或英文验证
jQuery.validator.addMethod("en_zh", function(value, element) {
		return this.optional(element) || /^[a-zA-Z\u4e00-\u9fa5]+$/.test(value);
}, "只能包括中文、英文、空格");
// 中文或英文或空格验证
jQuery.validator.addMethod("en_zh_space", function(value, element) {
		return this.optional(element) || /^[a-zA-Z\u4e00-\u9fa5\s]+$/.test(value);
}, "只能包括中文、英文、空格");
// 中文或英文验证
jQuery.validator.addMethod("en_zh_num", function(value, element) {
		return this.optional(element) || /^[a-zA-Z0-9\u4e00-\u9fa5]+$/.test(value);
}, "只能包括中文、英文或数字");
// 中文或英文验证
jQuery.validator.addMethod("en_zh_num_s", function(value, element) {
		return this.optional(element) || /^[a-zA-Z0-9\u4e00-\u9fa5\s]+$/.test(value);
}, "只能包括中文、英文或数字");
// 字符验证
jQuery.validator.addMethod("stringCheck", function(value, element) {
		return this.optional(element) || /^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$/.test(value);
}, "只能包括中文字、英文字母、数字和下划线");
// 字符验证
jQuery.validator.addMethod("eng_num", function(value, element) {
		return this.optional(element) || /^[A-Za-z0-9]+$/.test(value);
}, "只能为英文字母或数字");
// 英文验证
jQuery.validator.addMethod("english", function(value, element) {
		return this.optional(element) || /^[A-Za-z]+$/.test(value);
}, "只能为英文字母");
		
// 中文验证
jQuery.validator.addMethod("chinese", function(value, element) {
		return this.optional(element) || /^[\u4e00-\u9fa5]+$/.test(value);
}, "只能包括中文字");
// 身份证验证
jQuery.validator.addMethod("idcard", function(value, element) {
		return this.optional(element) || /(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(value);
}, "身份证号码为15位或者18位,15位时全为数字,18位前17位为数字,最后一位是校验位,可能为数字或字符X");
		
 // 字符最小长度验证（一个中文字符长度为2）
   jQuery.validator.addMethod("stringMinLength", function(value, element, param) {
    var length = value.length;
    for ( var i = 0; i < value.length; i++) {
     if (value.charCodeAt(i) > 127) {
      length++;
     }
    }
    return this.optional(element) || (length >= param);
   }, $.validator.format("长度不能小于{0}!"));
  
   // 字符最大长度验证（一个中文字符长度为2）
   jQuery.validator.addMethod("stringMaxLength", function(value, element, param) {
    var length = value.length;
    for ( var i = 0; i < value.length; i++) {
     if (value.charCodeAt(i) > 127) {
      length++;
     }
    }
    return this.optional(element) || (length <= param);
   }, $.validator.format("长度不能大于{0}!"));

   // 字符验证
   jQuery.validator.addMethod("string", function(value, element) {
    return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value);
   }, "不允许包含特殊符号!");
   
   // 电话号码-手机号码验证
   jQuery.validator.addMethod("mobile_phone", function(value, element) {
	    var length = value.length;
	    return this.optional(element) || (length == 11 && /(^(\d{2,4}[-_－—]?)?\d{3,8}([-_－—]?\d{3,8})?([-_－—]?\d{1,7})?$)|(^0?1[35]\d{9}$)/.test(value));
   }, "电话号码格式错误!");

   // 手机号码验证
   jQuery.validator.addMethod("mobile", function(value, element) {
	    var length = value.length;
	    return this.optional(element) || (length == 11 && /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/.test(value));
   }, "手机号码格式错误!");

   // 电话号码验证
   jQuery.validator.addMethod("phone", function(value, element) {
    var tel = /^(\d{3,4}-?)?\d{7,9}$/g;
    return this.optional(element) || (tel.test(value));
   }, "电话号码格式错误!");

   // 邮政编码验证
   jQuery.validator.addMethod("zipCode", function(value, element) {
    var tel = /^[0-9]{6}$/;
    return this.optional(element) || (tel.test(value));
   }, "邮政编码格式错误!");
  
   // 必须以特定字符串开头验证
   jQuery.validator.addMethod("begin", function(value, element, param) {
    var begin = new RegExp("^" + param);
    return this.optional(element) || (begin.test(value));
   }, $.validator.format("必须以 {0} 开头!"));
  
   // 验证两次输入值是否不相同
   jQuery.validator.addMethod("notEqualTo", function(value, element, param) {
    return value != $(param).val();
   }, $.validator.format("两次输入不能相同!"));
  
   // 验证值不允许与特定值等于
   jQuery.validator.addMethod("notEqual", function(value, element, param) {
    return value != param;
   }, $.validator.format("输入值不允许为{0}!"));
  
   // 验证值必须大于特定值(不能等于)
   jQuery.validator.addMethod("gt", function(value, element, param) {
    return value > param;
   }, $.validator.format("输入值必须大于{0}!"));
  
   // 验证值小数位数不能超过两位
   jQuery.validator.addMethod("decimal", function(value, element) {
    var decimal = /^-?\d+(\.\d{1,2})?$/;
    return this.optional(element) || (decimal.test(value));
   }, $.validator.format("小数位数不能超过两位!"));

// 这个可以验证15位和18位的身份证，并且包含生日和校验位的验证。
// 如果有兴趣，还可以加上身份证所在地的验证，就是前6位有些数字合法有些数字不合法。
function isIdCardNo(num) {             
	num = num.toUpperCase();           
	// 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X。
	if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num))){                
		alert('输入的身份证号长度不对，或者号码不符合规定！\n15位号码应全为数字，18位号码末位可以为数字或X。');               
 		return false;          
 	} 
 	// 校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
 	// 下面分别分析出生日期和校验位
 	var len, re; len = num.length; 
 	if (len == 15) { 
 		re = new RegExp(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/); 
 		var arrSplit = num.match(re);  
 		// 检查生日日期是否正确
 		var dtmBirth = new Date('19' + arrSplit[2] + '/' + arrSplit[3] + '/' + arrSplit[4]); 
 		var bGoodDay; 
 		bGoodDay = (dtmBirth.getYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4])); 
 		if (!bGoodDay) {           
 			alert('输入的身份证号里出生日期不对！');              
 			return false; 
 		} else { 
	 		// 将15位身份证转成18位 //校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
	 		var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);            
	 		var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');            
	 		var nTemp = 0, i;               
	 		num = num.substr(0, 6) + '19' + num.substr(6, num.length - 6);            
	 		for(i = 0; i < 17; i ++){                 
	 			nTemp += num.substr(i, 1) * arrInt[i];            
			}           
			num += arrCh[nTemp % 11];               
			return num;   
		}   
	} 
	if (len == 18) { 
		re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/); 
		var arrSplit = num.match(re);  
		// 检查生日日期是否正确
		var dtmBirth = new Date(arrSplit[2] + "/" + arrSplit[3] + "/" + arrSplit[4]); 
		var bGoodDay; 
		bGoodDay = (dtmBirth.getFullYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4])); 
		if (!bGoodDay) { 
			alert(dtmBirth.getYear()); 
			alert(arrSplit[2]); 
			alert('输入的身份证号里出生日期不对！'); 
			return false; 
		} else { 
			// 检验18位身份证的校验码是否正确。
			// 校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
			var valnum; 
			var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2); 
			var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'); 
			var nTemp = 0, i; 
			for(i = 0; i < 17; i ++) { 
				nTemp += num.substr(i, 1) * arrInt[i]; 
			} 
			valnum = arrCh[nTemp % 11]; 
			if (valnum != num.substr(17, 1)) { 
				alert('18位身份证的校验码不正确！应该为：' + valnum); 
				return false; 
			} 
			return num; 
		} 
	} 
	return false; 
}   
		
function Rule(nameArg, rulesArg, messageArg) {
	this.name = nameArg;
	this.rules = rulesArg;
	this.message = messageArg;
	this.getRules = function() {
		return eval_r("({" + nameArg + ":" + rulesArg + "})");
	};
	this.getMessages = function() {
		return eval_r("({" + nameArg + ":" + messageArg + "})");
	};
}

function addRules(validator, rule) {
	var empty = {}
	var rules = $.extend(empty, validator.settings.rules, rule.getRules());
	validator.settings.rules = rules;
	var empty = {}
	var messages = $.extend(empty, validator.settings.messages, rule
					.getMessages());
	validator.settings.messages = messages;
}