$.fn.addtabs = function(options) {
	obj = $(this);
	Addtabs.options = $.extend({
		content : '', // 直接指定所有页面TABS内容
		close : true, // 是否可以关闭
		iframeUse : true, // 使用iframe还是ajax
		iframeHeight : $(document).height() - 112, // 固定TAB中IFRAME高度,根据需要自己修改
		method : 'init',
		callback : function() { // 关闭后回调函数
		}
	}, options || {});

	obj.on('click', '.close-tab', function() {
		var id = $(this).prev("a").attr("aria-controls");
		Addtabs.close(id);
	});

	obj.on('mouseover', '.close-tab', function() {
		$(this).removeClass('fa-times').addClass('fa-times-circle');
	});

	obj.on('mouseout', '.close-tab', function() {
		$(this).removeClass('fa-times-circle').addClass('fa-times');
	});

	obj.on('click', '.close-item', function() {
		var id = $(this).prev("a").attr("aria-controls");
		Addtabs.close(id);
	});

	obj.on('mouseover', '.close-item', function() {
		$(this).removeClass('fa-times').addClass('fa-times-circle');
	});

	obj.on('mouseout', '.close-item', function() {
		$(this).removeClass('fa-times-circle').addClass('fa-times');
	});

	$(window).resize(function() {
		$('.iframeClass').css('height', ($(window).height() - 112) + 'px');
		Addtabs.drop();
	});
};

window.Addtabs = {
	options : {},
	add : function(opts) {
		var id = 'tab_' + opts.id;
		obj.find('.active').removeClass('active');
		// 如果TAB不存在，创建一个新的TAB
		if (!$("#" + id)[0]) {
			// 创建新TAB的title
			var title = $('<li>', {
				'role' : 'presentation',
				'id' : 'tab_' + id
			}).append($('<a>', {
				'href' : '#' + id,
				'aria-controls' : id,
				'role' : 'tab',
				'data-toggle' : 'tab'
			}).html(opts.title));
			// 是否允许关闭
			if (Addtabs.options.close) {
				title.append($('<i>', {
					class : 'close-tab fa fa-times'
				}));
			}
			// 创建新TAB的内容
			var content = $('<div>', {
				'class' : 'tab-pane',
				'id' : id,
				'role' : 'tabpanel'
			});

			// 是否指定TAB内容
			if (opts.content) {
				content.append(opts.content);
			} else if (Addtabs.options.iframeUse && !opts.ajax) {// 没有内容，使用IFRAME打开链接
				content.append($('<iframe>', {
					'class' : 'iframeClass',
					'height' : Addtabs.options.iframeHeight,
					'src' : opts.url
				}));
			} else {
				$.get(opts.url, function(data) {
					content.append(data);
				});
			}
			// 加入TABS
			obj.children('.nav-tabs').append(title);
			obj.children(".tab-content").append(content);
		}

		// 激活TAB
		$("#tab_" + id).addClass('active');
		$("#" + id).addClass("active");

		Addtabs.drop();
	},
	close : function(id) {
		// 如果关闭的是当前激活的TAB，激活他的前一个TAB
		if (obj.find("li.active").attr('id') == "tab_" + id) {
			$("#tab_" + id).prev().addClass('active');
			$("#" + id).prev().addClass('active');
		}
		// 关闭TAB
		$("#tab_" + id).remove();
		$("#" + id).remove();

		Addtabs.drop();

		Addtabs.options.callback();
	},
	drop : function() {
		element = obj.find('.nav-tabs');

		// 创建下拉标签
		var dropdown = $('<li>', {
			'class' : 'dropdown pull-right hide tabdrop'
		}).append($('<a>', {
			'class' : 'dropdown-toggle',
			'data-toggle' : 'dropdown',
			'href' : '#'
		}).append($('<i>', {
			'class' : "fa fa-list"
		})).append($('<b>', {
			'class' : 'caret'
		}))).append($('<ul>', {
			'class' : "dropdown-menu"
		}))

		// 检测是否已增加
		if (!$('.tabdrop').html()) {
			dropdown.prependTo(element);
		} else {
			dropdown = element.find('.tabdrop');
		}

		// 检测是否有下拉样式
		if (element.parent().is('.tabs-below')) {
			dropdown.addClass('dropup');
		}

		var collection = 0;

		// 检查超过一行的标签页
		var sumWidth = 0;
		element.append(dropdown.find('li')).find('>li').not('.tabdrop').each(
				function() {
					sumWidth += $(this).width();
					if (element.width() - sumWidth < 100) {
						dropdown.find('ul').append($(this));
						$(this).attr('role', 'menuitem');

						$(this).find('a').css('display', 'inline-block');
						$(this).find('a').css('vertical-align', 'middle');
						$(this).find('a').css('text-decoration', 'none');
						$(this).find('a').css('white-space', 'nowrap');
						$(this).find('a').css('overflow', 'hidden');
						// $(this).find('a').css('width','200px');

						$(this).find('i').attr('class',
								'close-item fa fa-times');

						collection++;
					}
				});

		// 如果有超出的，显示下拉标签
		if (collection > 0) {
			dropdown.removeClass('hide');
			if (dropdown.find('.active').length == 1) {
				dropdown.addClass('active');
			} else {
				dropdown.removeClass('active');
			}
		} else {
			dropdown.addClass('hide');
		}
	}
}