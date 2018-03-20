//获取YYYY-MM-DD格式的当前系统日期
function getCurrentDate() {
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();

	if (month.toString().length == 1) {
		month = "0" + month;
	}

	if (day.toString().length == 1) {
		day = "0" + day;
	}

	return year + "-" + month + "-" + day;
}

// 获取hh:mm:ss格式的当前系统时间
function getCurrentTime() {
	var date = new Date();
	var hour = date.getHours();
	var minute = date.getMinutes();
	var seconds = date.getSeconds();

	if (hour.toString().length == 1) {
		hour = "0" + hour;
	}

	if (minute.toString().length == 1) {
		minute = "0" + minute;
	}

	if (seconds.toString().length == 1) {
		seconds = "0" + seconds;
	}

	return hour + ":" + minute + ":" + seconds;
}

// 获取YYYY-MM-DD hh:mm:ss格式的当前系统时间
function getCurrentDateTime() {
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	var hour = date.getHours();
	var minute = date.getMinutes();
	var seconds = date.getSeconds();

	if (month.toString().length == 1) {
		month = "0" + month;
	}

	if (day.toString().length == 1) {
		day = "0" + day;
	}

	if (hour.toString().length == 1) {
		hour = "0" + hour;
	}

	if (minute.toString().length == 1) {
		minute = "0" + minute;
	}

	if (seconds.toString().length == 1) {
		seconds = "0" + seconds;
	}

	return year + "-" + month + "-" + day + " " + hour + ":" + minute + ":"
			+ seconds;
}

// 获取YYYY-MM-DD hh:mm:ss格式的字符串
function getDateTimeStr(date) {
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	var hour = date.getHours();
	var minute = date.getMinutes();
	var seconds = date.getSeconds();

	if (month.toString().length == 1) {
		month = "0" + month;
	}

	if (day.toString().length == 1) {
		day = "0" + day;
	}

	if (hour.toString().length == 1) {
		hour = "0" + hour;
	}

	if (minute.toString().length == 1) {
		minute = "0" + minute;
	}

	if (seconds.toString().length == 1) {
		seconds = "0" + seconds;
	}

	return year + "-" + month + "-" + day + " " + hour + ":" + minute + ":"
			+ seconds;
}

//获取当前日期一周以前的日期
function getOneWeekInFrontOfCurrentDate() {
	var date = new Date();
    date.setTime(date.getTime() - (7*24*60*60*1000));
	
	var year = date.getFullYear();       
    var month = date.getMonth() + 1;       
    var day = date.getDate();

    if (month.toString().length == 1) {
    	month = "0" + month;
    }
    
    if (day.toString().length == 1) {
    	day = "0" + day;
    }
    
    return year + "-" + month + "-" + day;
}

//在SELECT元素中创建option
function createOptions(id, data) {
	var obj = document.getElementById(id);
	for (i = 0; i < data.length; i++) {
		var option = document.createElement("OPTION");
		obj.options.add(option);

		var arr = data[i].split(",");
		option.value = arr[0];
		option.innerText = arr[1];
	}
}

// 在SELECT元素中创建option
function createOptionsContainNullItem(id, data) {
	var obj = document.getElementById(id);

	var option = document.createElement("OPTION");
	obj.options.add(option);
	option.value = "";
	option.innerText = "";

	for (i = 0; i < data.length; i++) {
		var option = document.createElement("OPTION");
		obj.options.add(option);

		var arr = data[i].split(",");
		option.value = arr[0];
		option.innerText = arr[1];
	}
}

// 在SELECT元素中更新option
function updateOptions(id, data) {
	var obj = document.getElementById(id);

	obj.options.length = 0;

	for (i = 0; i < data.length; i++) {
		var option = document.createElement("OPTION");
		obj.options.add(option);
		var arr = data[i].split(",");
		option.value = arr[0];
		option.innerText = arr[1];
	}
}

// 在SELECT元素中更新option
function updateOptionsContainNullItem(id, data) {
	var obj = document.getElementById(id);
	obj.options.length = 0;
	createOptionsContainNullItem(id, data);
}

// 在SELECT元素中清空option
function clearOptions(id) {
	var obj = document.getElementById(id);
	obj.options.length = 0;
}

// 在SELECT元素中获取被选中项目的值
function getSelectedItemValue(id) {
	var obj = document.getElementById(id);
	return obj.options[obj.selectedIndex].value;
}

// 在SELECT元素中获取被选中项目的显示文本
function getSelectedItemText(id) {
	var obj = document.getElementById(id);
	return obj.options[obj.selectedIndex].innerText;
}

// 在SELECT元素中设置被选中的项目
function setSelectedItem(id, value) {
	var obj = document.getElementById(id);
	for (i = 0; i < obj.options.length; i++) {
		if (value == obj.options[i].value) {
			obj.selectedIndex = i;
			break;
		}
	}
}

// 去除前后空格（包括全角）
String.prototype.trim = function() {
	var t = this.replace(/(^\s*)|(\s*$)/g, "");
	return t.replace(/(^　*)|(　*$)/g, "");
}

// 转换url中的特殊字符：#+/"'
function converSpecialCharOfUrl(url) {
	return url.replace(/\#/g, '%23').replace(/\//g, '%2F').replace(/\+/g, '%2B')
	.replace(/\"/g, '%22').replace(/\'/g, '%27').replace(/\%/g, '%25');
}

// 打开模式窗口，并指定宽度和高度
function openModalWindow(url, width, height) {
	var subfix;
	if (url.indexOf("?") == -1) {
		subfix = "?r=" + new Date();
	} else {
		subfix = "&r=" + new Date();
	}
	var features = "dialogWidth:" + width + "px; dialogHeight:" + height + "px;resizable:yes;"
	return window.showModalDialog(url + subfix, window, features);
}

// 获取根窗口
function getRootWindow() {
	var win = window;
    while ((win.dialogArguments) && (win != win.dialogArguments)) {
    	win = win.dialogArguments;
    }
    return win;
}

// 关闭所有模式窗口
function closeAllModalWindows() {
	var win = window;
	while ((win.dialogArguments) && (win != win.dialogArguments)) {
    	var temp = win;
    	win = win.dialogArguments;
    	temp.close();
    }
}