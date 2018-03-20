/*
SQLyog Ultimate v12.09 (32 bit)
MySQL - 5.7.10-log : Database - adfdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`adfdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `adfdb`;

/*Table structure for table `sys_data_dict_item` */

DROP TABLE IF EXISTS `sys_data_dict_item`;

CREATE TABLE `sys_data_dict_item` (
  `item_code` varchar(50) NOT NULL COMMENT '数据字典项编码',
  `type_code` varchar(50) NOT NULL COMMENT '数据字典类型编码',
  `item_name` varchar(100) NOT NULL COMMENT '数据字典项名称',
  `display_order` varchar(10) DEFAULT NULL COMMENT '显示顺序',
  `enabled_flag` char(1) NOT NULL COMMENT '启用标识[Y:启用;N:禁用]',
  PRIMARY KEY (`item_code`,`type_code`),
  KEY `SYS_DATA_DICTI_ITEM_N1` (`enabled_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典项';

/*Data for the table `sys_data_dict_item` */

insert  into `sys_data_dict_item`(`item_code`,`type_code`,`item_name`,`display_order`,`enabled_flag`) values ('abc','bank','中国农业银行','30','Y'),('auto','code_rule','自动','10','Y'),('boc','bank','中国银行','10','Y'),('ccb','bank','中国建设银行','40','Y'),('checkbox','element_type','复选框','40','Y'),('comm','bank','中国交通银行','50','Y'),('fa-adjust','font_icon','fa-adjust',NULL,'Y'),('fa-anchor','font_icon','fa-anchor',NULL,'Y'),('fa-archive','font_icon','fa-archive',NULL,'Y'),('fa-area-chart','font_icon','fa-area-chart',NULL,'Y'),('fa-arrows','font_icon','fa-arrows',NULL,'Y'),('fa-arrows-h','font_icon','fa-arrows-h',NULL,'Y'),('fa-arrows-v','font_icon','fa-arrows-v',NULL,'Y'),('fa-asterisk','font_icon','fa-asterisk',NULL,'Y'),('fa-at','font_icon','fa-at',NULL,'Y'),('fa-automobile','font_icon','fa-automobile',NULL,'Y'),('fa-balance-scale','font_icon','fa-balance-scale',NULL,'Y'),('fa-ban','font_icon','fa-ban',NULL,'Y'),('fa-bank','font_icon','fa-bank',NULL,'Y'),('fa-bar-chart','font_icon','fa-bar-chart',NULL,'Y'),('fa-bar-chart-o','font_icon','fa-bar-chart-o',NULL,'Y'),('fa-barcode','font_icon','fa-barcode',NULL,'Y'),('fa-bars','font_icon','fa-bars',NULL,'Y'),('fa-battery-0','font_icon','fa-battery-0',NULL,'Y'),('fa-battery-1','font_icon','fa-battery-1',NULL,'Y'),('fa-battery-2','font_icon','fa-battery-2',NULL,'Y'),('fa-battery-3','font_icon','fa-battery-3',NULL,'Y'),('fa-battery-4','font_icon','fa-battery-4',NULL,'Y'),('fa-battery-empty','font_icon','fa-battery-empty',NULL,'Y'),('fa-battery-full','font_icon','fa-battery-full',NULL,'Y'),('fa-battery-half','font_icon','fa-battery-half',NULL,'Y'),('fa-battery-quarter','font_icon','fa-battery-quarter',NULL,'Y'),('fa-battery-three-quarters','font_icon','fa-battery-three-quarters',NULL,'Y'),('fa-bed','font_icon','fa-bed',NULL,'Y'),('fa-beer','font_icon','fa-beer',NULL,'Y'),('fa-bell','font_icon','fa-bell',NULL,'Y'),('fa-bell-o','font_icon','fa-bell-o',NULL,'Y'),('fa-bell-slash','font_icon','fa-bell-slash',NULL,'Y'),('fa-bell-slash-o','font_icon','fa-bell-slash-o',NULL,'Y'),('fa-bicycle','font_icon','fa-bicycle',NULL,'Y'),('fa-binoculars','font_icon','fa-binoculars',NULL,'Y'),('fa-birthday-cake','font_icon','fa-birthday-cake',NULL,'Y'),('fa-bolt','font_icon','fa-bolt',NULL,'Y'),('fa-bomb','font_icon','fa-bomb',NULL,'Y'),('fa-book','font_icon','fa-book',NULL,'Y'),('fa-bookmark','font_icon','fa-bookmark',NULL,'Y'),('fa-bookmark-o','font_icon','fa-bookmark-o',NULL,'Y'),('fa-briefcase','font_icon','fa-briefcase',NULL,'Y'),('fa-bug','font_icon','fa-bug',NULL,'Y'),('fa-building','font_icon','fa-building',NULL,'Y'),('fa-building-o','font_icon','fa-building-o',NULL,'Y'),('fa-bullhorn','font_icon','fa-bullhorn',NULL,'Y'),('fa-bullseye','font_icon','fa-bullseye',NULL,'Y'),('fa-bus','font_icon','fa-bus',NULL,'Y'),('fa-cab','font_icon','fa-cab',NULL,'Y'),('fa-calculator','font_icon','fa-calculator',NULL,'Y'),('fa-calendar','font_icon','fa-calendar',NULL,'Y'),('fa-calendar-check-o','font_icon','fa-calendar-check-o',NULL,'Y'),('fa-calendar-minus-o','font_icon','fa-calendar-minus-o',NULL,'Y'),('fa-calendar-o','font_icon','fa-calendar-o',NULL,'Y'),('fa-calendar-plus-o','font_icon','fa-calendar-plus-o',NULL,'Y'),('fa-calendar-times-o','font_icon','fa-calendar-times-o',NULL,'Y'),('fa-camera','font_icon','fa-camera',NULL,'Y'),('fa-camera-retro','font_icon','fa-camera-retro',NULL,'Y'),('fa-car','font_icon','fa-car',NULL,'Y'),('fa-caret-square-o-down','font_icon','fa-caret-square-o-down',NULL,'Y'),('fa-caret-square-o-left','font_icon','fa-caret-square-o-left',NULL,'Y'),('fa-caret-square-o-right','font_icon','fa-caret-square-o-right',NULL,'Y'),('fa-caret-square-o-up','font_icon','fa-caret-square-o-up',NULL,'Y'),('fa-cart-arrow-down','font_icon','fa-cart-arrow-down',NULL,'Y'),('fa-cart-plus','font_icon','fa-cart-plus',NULL,'Y'),('fa-cc\"','font_icon','fa-cc\"',NULL,'Y'),('fa-certificate','font_icon','fa-certificate',NULL,'Y'),('fa-check','font_icon','fa-check',NULL,'Y'),('fa-check-circle','font_icon','fa-check-circle',NULL,'Y'),('fa-check-circle-o','font_icon','fa-check-circle-o',NULL,'Y'),('fa-check-square','font_icon','fa-check-square',NULL,'Y'),('fa-check-square-o','font_icon','fa-check-square-o',NULL,'Y'),('fa-child','font_icon','fa-child',NULL,'Y'),('fa-circle','font_icon','fa-circle',NULL,'Y'),('fa-circle-o','font_icon','fa-circle-o',NULL,'Y'),('fa-circle-o-notch','font_icon','fa-circle-o-notch',NULL,'Y'),('fa-circle-thin','font_icon','fa-circle-thin',NULL,'Y'),('fa-clock-o','font_icon','fa-clock-o',NULL,'Y'),('fa-clone','font_icon','fa-clone',NULL,'Y'),('fa-close','font_icon','fa-close',NULL,'Y'),('fa-cloud','font_icon','fa-cloud',NULL,'Y'),('fa-cloud-download','font_icon','fa-cloud-download',NULL,'Y'),('fa-cloud-upload','font_icon','fa-cloud-upload',NULL,'Y'),('fa-code','font_icon','fa-code',NULL,'Y'),('fa-code-fork','font_icon','fa-code-fork',NULL,'Y'),('fa-coffee','font_icon','fa-coffee',NULL,'Y'),('fa-cog','font_icon','fa-cog',NULL,'Y'),('fa-cogs','font_icon','fa-cogs',NULL,'Y'),('fa-comment','font_icon','fa-comment',NULL,'Y'),('fa-comment-o','font_icon','fa-comment-o',NULL,'Y'),('fa-commenting','font_icon','fa-commenting',NULL,'Y'),('fa-commenting-o','font_icon','fa-commenting-o',NULL,'Y'),('fa-comments','font_icon','fa-comments',NULL,'Y'),('fa-comments-o','font_icon','fa-comments-o',NULL,'Y'),('fa-compass','font_icon','fa-compass',NULL,'Y'),('fa-copyright','font_icon','fa-copyright',NULL,'Y'),('fa-creative-commons','font_icon','fa-creative-commons',NULL,'Y'),('fa-credit-card','font_icon','fa-credit-card',NULL,'Y'),('fa-crop','font_icon','fa-crop',NULL,'Y'),('fa-crosshairs','font_icon','fa-crosshairs',NULL,'Y'),('fa-cube','font_icon','fa-cube',NULL,'Y'),('fa-cubes','font_icon','fa-cubes',NULL,'Y'),('fa-cutlery','font_icon','fa-cutlery',NULL,'Y'),('fa-dashboard','font_icon','fa-dashboard',NULL,'Y'),('fa-database','font_icon','fa-database',NULL,'Y'),('fa-desktop','font_icon','fa-desktop',NULL,'Y'),('fa-diamond','font_icon','fa-diamond',NULL,'Y'),('fa-dot-circle-o','font_icon','fa-dot-circle-o',NULL,'Y'),('fa-download','font_icon','fa-download',NULL,'Y'),('fa-edit','font_icon','fa-edit',NULL,'Y'),('fa-ellipsis-h','font_icon','fa-ellipsis-h',NULL,'Y'),('fa-ellipsis-v','font_icon','fa-ellipsis-v',NULL,'Y'),('fa-envelope','font_icon','fa-envelope',NULL,'Y'),('fa-envelope-o','font_icon','fa-envelope-o',NULL,'Y'),('fa-envelope-square','font_icon','fa-envelope-square',NULL,'Y'),('fa-eraser','font_icon','fa-eraser',NULL,'Y'),('fa-exchange','font_icon','fa-exchange',NULL,'Y'),('fa-exclamation','font_icon','fa-exclamation',NULL,'Y'),('fa-exclamation-circle','font_icon','fa-exclamation-circle',NULL,'Y'),('fa-exclamation-triangle','font_icon','fa-exclamation-triangle',NULL,'Y'),('fa-external-link','font_icon','fa-external-link',NULL,'Y'),('fa-external-link-square','font_icon','fa-external-link-square',NULL,'Y'),('fa-eye','font_icon','fa-eye',NULL,'Y'),('fa-eye-slash','font_icon','fa-eye-slash',NULL,'Y'),('fa-eyedropper','font_icon','fa-eyedropper',NULL,'Y'),('fa-fax','font_icon','fa-fax',NULL,'Y'),('fa-feed','font_icon','fa-feed',NULL,'Y'),('fa-female','font_icon','fa-female',NULL,'Y'),('fa-fighter-jet','font_icon','fa-fighter-jet',NULL,'Y'),('fa-file-archive-o','font_icon','fa-file-archive-o',NULL,'Y'),('fa-file-audio-o','font_icon','fa-file-audio-o',NULL,'Y'),('fa-file-code-o','font_icon','fa-file-code-o',NULL,'Y'),('fa-file-excel-o','font_icon','fa-file-excel-o',NULL,'Y'),('fa-file-image-o','font_icon','fa-file-image-o',NULL,'Y'),('fa-file-movie-o','font_icon','fa-file-movie-o',NULL,'Y'),('fa-file-pdf-o','font_icon','fa-file-pdf-o',NULL,'Y'),('fa-file-photo-o','font_icon','fa-file-photo-o',NULL,'Y'),('fa-file-picture-o','font_icon','fa-file-picture-o',NULL,'Y'),('fa-file-powerpoint-o','font_icon','fa-file-powerpoint-o',NULL,'Y'),('fa-file-sound-o','font_icon','fa-file-sound-o',NULL,'Y'),('fa-file-video-o','font_icon','fa-file-video-o',NULL,'Y'),('fa-file-word-o','font_icon','fa-file-word-o',NULL,'Y'),('fa-file-zip-o','font_icon','fa-file-zip-o',NULL,'Y'),('fa-film','font_icon','fa-film',NULL,'Y'),('fa-filter','font_icon','fa-filter',NULL,'Y'),('fa-fire','font_icon','fa-fire',NULL,'Y'),('fa-fire-extinguisher','font_icon','fa-fire-extinguisher',NULL,'Y'),('fa-flag','font_icon','fa-flag',NULL,'Y'),('fa-flag-checkered','font_icon','fa-flag-checkered',NULL,'Y'),('fa-flag-o','font_icon','fa-flag-o',NULL,'Y'),('fa-flash','font_icon','fa-flash',NULL,'Y'),('fa-flask','font_icon','fa-flask',NULL,'Y'),('fa-folder','font_icon','fa-folder',NULL,'Y'),('fa-folder-o','font_icon','fa-folder-o',NULL,'Y'),('fa-folder-open','font_icon','fa-folder-open',NULL,'Y'),('fa-folder-open-o','font_icon','fa-folder-open-o',NULL,'Y'),('fa-frown-o','font_icon','fa-frown-o',NULL,'Y'),('fa-futbol-o','font_icon','fa-futbol-o',NULL,'Y'),('fa-gamepad','font_icon','fa-gamepad',NULL,'Y'),('fa-gavel','font_icon','fa-gavel',NULL,'Y'),('fa-gear','font_icon','fa-gear',NULL,'Y'),('fa-gears','font_icon','fa-gears',NULL,'Y'),('fa-gift','font_icon','fa-gift',NULL,'Y'),('fa-glass','font_icon','fa-glass',NULL,'Y'),('fa-globe','font_icon','fa-globe',NULL,'Y'),('fa-graduation-cap','font_icon','fa-graduation-cap',NULL,'Y'),('fa-group','font_icon','fa-group',NULL,'Y'),('fa-hand-grab-o','font_icon','fa-hand-grab-o',NULL,'Y'),('fa-hand-lizard-o','font_icon','fa-hand-lizard-o',NULL,'Y'),('fa-hand-paper-o','font_icon','fa-hand-paper-o',NULL,'Y'),('fa-hand-peace-o','font_icon','fa-hand-peace-o',NULL,'Y'),('fa-hand-pointer-o','font_icon','fa-hand-pointer-o',NULL,'Y'),('fa-hand-rock-o','font_icon','fa-hand-rock-o',NULL,'Y'),('fa-hand-scissors-o','font_icon','fa-hand-scissors-o',NULL,'Y'),('fa-hand-spock-o','font_icon','fa-hand-spock-o',NULL,'Y'),('fa-hand-stop-o','font_icon','fa-hand-stop-o',NULL,'Y'),('fa-hdd-o','font_icon','fa-hdd-o',NULL,'Y'),('fa-headphones','font_icon','fa-headphones',NULL,'Y'),('fa-heart','font_icon','fa-heart',NULL,'Y'),('fa-heart-o','font_icon','fa-heart-o',NULL,'Y'),('fa-heartbeat','font_icon','fa-heartbeat',NULL,'Y'),('fa-history','font_icon','fa-history',NULL,'Y'),('fa-home','font_icon','fa-home',NULL,'Y'),('fa-hotel','font_icon','fa-hotel',NULL,'Y'),('fa-hourglass','font_icon','fa-hourglass',NULL,'Y'),('fa-hourglass-1','font_icon','fa-hourglass-1',NULL,'Y'),('fa-hourglass-2','font_icon','fa-hourglass-2',NULL,'Y'),('fa-hourglass-3','font_icon','fa-hourglass-3',NULL,'Y'),('fa-hourglass-end','font_icon','fa-hourglass-end',NULL,'Y'),('fa-hourglass-half','font_icon','fa-hourglass-half',NULL,'Y'),('fa-hourglass-o','font_icon','fa-hourglass-o',NULL,'Y'),('fa-hourglass-start','font_icon','fa-hourglass-start',NULL,'Y'),('fa-i-cursor','font_icon','fa-i-cursor',NULL,'Y'),('fa-image','font_icon','fa-image',NULL,'Y'),('fa-inbox','font_icon','fa-inbox',NULL,'Y'),('fa-industry','font_icon','fa-industry',NULL,'Y'),('fa-info','font_icon','fa-info',NULL,'Y'),('fa-info-circle','font_icon','fa-info-circle',NULL,'Y'),('fa-institution','font_icon','fa-institution',NULL,'Y'),('fa-key','font_icon','fa-key',NULL,'Y'),('fa-keyboard-o','font_icon','fa-keyboard-o',NULL,'Y'),('fa-language','font_icon','fa-language',NULL,'Y'),('fa-laptop','font_icon','fa-laptop',NULL,'Y'),('fa-leaf','font_icon','fa-leaf',NULL,'Y'),('fa-legal','font_icon','fa-legal',NULL,'Y'),('fa-lemon-o','font_icon','fa-lemon-o',NULL,'Y'),('fa-level-down','font_icon','fa-level-down',NULL,'Y'),('fa-level-up','font_icon','fa-level-up',NULL,'Y'),('fa-life-bouy','font_icon','fa-life-bouy',NULL,'Y'),('fa-life-buoy','font_icon','fa-life-buoy',NULL,'Y'),('fa-life-ring','font_icon','fa-life-ring',NULL,'Y'),('fa-life-saver','font_icon','fa-life-saver',NULL,'Y'),('fa-lightbulb-o','font_icon','fa-lightbulb-o',NULL,'Y'),('fa-line-chart','font_icon','fa-line-chart',NULL,'Y'),('fa-location-arrow','font_icon','fa-location-arrow',NULL,'Y'),('fa-lock','font_icon','fa-lock',NULL,'Y'),('fa-magic','font_icon','fa-magic',NULL,'Y'),('fa-magnet','font_icon','fa-magnet',NULL,'Y'),('fa-mail-forward','font_icon','fa-mail-forward',NULL,'Y'),('fa-mail-reply','font_icon','fa-mail-reply',NULL,'Y'),('fa-mail-reply-all','font_icon','fa-mail-reply-all',NULL,'Y'),('fa-male','font_icon','fa-male',NULL,'Y'),('fa-map','font_icon','fa-map',NULL,'Y'),('fa-map-marker','font_icon','fa-map-marker',NULL,'Y'),('fa-map-o','font_icon','fa-map-o',NULL,'Y'),('fa-map-pin','font_icon','fa-map-pin',NULL,'Y'),('fa-map-signs','font_icon','fa-map-signs',NULL,'Y'),('fa-meh-o','font_icon','fa-meh-o',NULL,'Y'),('fa-microphone','font_icon','fa-microphone',NULL,'Y'),('fa-microphone-slash','font_icon','fa-microphone-slash',NULL,'Y'),('fa-minus','font_icon','fa-minus',NULL,'Y'),('fa-minus-circle','font_icon','fa-minus-circle',NULL,'Y'),('fa-minus-square','font_icon','fa-minus-square',NULL,'Y'),('fa-minus-square-o','font_icon','fa-minus-square-o',NULL,'Y'),('fa-mobile','font_icon','fa-mobile',NULL,'Y'),('fa-mobile-phone','font_icon','fa-mobile-phone',NULL,'Y'),('fa-money','font_icon','fa-money',NULL,'Y'),('fa-moon-o','font_icon','fa-moon-o',NULL,'Y'),('fa-mortar-board','font_icon','fa-mortar-board',NULL,'Y'),('fa-motorcycle','font_icon','fa-motorcycle',NULL,'Y'),('fa-mouse-pointer','font_icon','fa-mouse-pointer',NULL,'Y'),('fa-music','font_icon','fa-music',NULL,'Y'),('fa-navicon','font_icon','fa-navicon',NULL,'Y'),('fa-newspaper-o','font_icon','fa-newspaper-o',NULL,'Y'),('fa-object-group','font_icon','fa-object-group',NULL,'Y'),('fa-object-ungroup','font_icon','fa-object-ungroup',NULL,'Y'),('fa-paint-brush','font_icon','fa-paint-brush',NULL,'Y'),('fa-paper-plane','font_icon','fa-paper-plane',NULL,'Y'),('fa-paper-plane-o','font_icon','fa-paper-plane-o',NULL,'Y'),('fa-paw','font_icon','fa-paw',NULL,'Y'),('fa-pencil','font_icon','fa-pencil',NULL,'Y'),('fa-pencil-square','font_icon','fa-pencil-square',NULL,'Y'),('fa-pencil-square-o','font_icon','fa-pencil-square-o',NULL,'Y'),('fa-phone','font_icon','fa-phone',NULL,'Y'),('fa-phone-square','font_icon','fa-phone-square',NULL,'Y'),('fa-photo','font_icon','fa-photo',NULL,'Y'),('fa-picture-o','font_icon','fa-picture-o',NULL,'Y'),('fa-pie-chart','font_icon','fa-pie-chart',NULL,'Y'),('fa-plane','font_icon','fa-plane',NULL,'Y'),('fa-plug','font_icon','fa-plug',NULL,'Y'),('fa-plus','font_icon','fa-plus',NULL,'Y'),('fa-plus-circle','font_icon','fa-plus-circle',NULL,'Y'),('fa-plus-square','font_icon','fa-plus-square',NULL,'Y'),('fa-plus-square-o','font_icon','fa-plus-square-o',NULL,'Y'),('fa-power-off','font_icon','fa-power-off',NULL,'Y'),('fa-print','font_icon','fa-print',NULL,'Y'),('fa-puzzle-piece','font_icon','fa-puzzle-piece',NULL,'Y'),('fa-qrcode','font_icon','fa-qrcode',NULL,'Y'),('fa-question','font_icon','fa-question',NULL,'Y'),('fa-question-circle','font_icon','fa-question-circle',NULL,'Y'),('fa-quote-left','font_icon','fa-quote-left',NULL,'Y'),('fa-quote-right','font_icon','fa-quote-right',NULL,'Y'),('fa-random','font_icon','fa-random',NULL,'Y'),('fa-recycle','font_icon','fa-recycle',NULL,'Y'),('fa-refresh','font_icon','fa-refresh',NULL,'Y'),('fa-registered','font_icon','fa-registered',NULL,'Y'),('fa-remove','font_icon','fa-remove',NULL,'Y'),('fa-reorder','font_icon','fa-reorder',NULL,'Y'),('fa-reply','font_icon','fa-reply',NULL,'Y'),('fa-reply-all','font_icon','fa-reply-all',NULL,'Y'),('fa-retweet','font_icon','fa-retweet',NULL,'Y'),('fa-road','font_icon','fa-road',NULL,'Y'),('fa-rocket','font_icon','fa-rocket',NULL,'Y'),('fa-rss','font_icon','fa-rss',NULL,'Y'),('fa-rss-square','font_icon','fa-rss-square',NULL,'Y'),('fa-search','font_icon','fa-search',NULL,'Y'),('fa-search-minus','font_icon','fa-search-minus',NULL,'Y'),('fa-search-plus','font_icon','fa-search-plus',NULL,'Y'),('fa-send','font_icon','fa-send',NULL,'Y'),('fa-send-o','font_icon','fa-send-o',NULL,'Y'),('fa-server','font_icon','fa-server',NULL,'Y'),('fa-share','font_icon','fa-share',NULL,'Y'),('fa-share-alt','font_icon','fa-share-alt',NULL,'Y'),('fa-share-alt-square','font_icon','fa-share-alt-square',NULL,'Y'),('fa-share-square','font_icon','fa-share-square',NULL,'Y'),('fa-share-square-o','font_icon','fa-share-square-o',NULL,'Y'),('fa-shield','font_icon','fa-shield',NULL,'Y'),('fa-ship','font_icon','fa-ship',NULL,'Y'),('fa-shopping-cart','font_icon','fa-shopping-cart',NULL,'Y'),('fa-sign-in','font_icon','fa-sign-in',NULL,'Y'),('fa-sign-out','font_icon','fa-sign-out',NULL,'Y'),('fa-signal','font_icon','fa-signal',NULL,'Y'),('fa-sitemap','font_icon','fa-sitemap',NULL,'Y'),('fa-sliders','font_icon','fa-sliders',NULL,'Y'),('fa-smile-o','font_icon','fa-smile-o',NULL,'Y'),('fa-soccer-ball-o','font_icon','fa-soccer-ball-o',NULL,'Y'),('fa-sort','font_icon','fa-sort',NULL,'Y'),('fa-sort-alpha-asc','font_icon','fa-sort-alpha-asc',NULL,'Y'),('fa-sort-alpha-desc','font_icon','fa-sort-alpha-desc',NULL,'Y'),('fa-sort-amount-asc','font_icon','fa-sort-amount-asc',NULL,'Y'),('fa-sort-amount-desc','font_icon','fa-sort-amount-desc',NULL,'Y'),('fa-sort-asc','font_icon','fa-sort-asc',NULL,'Y'),('fa-sort-desc','font_icon','fa-sort-desc',NULL,'Y'),('fa-sort-down','font_icon','fa-sort-down',NULL,'Y'),('fa-sort-numeric-asc','font_icon','fa-sort-numeric-asc',NULL,'Y'),('fa-sort-numeric-desc','font_icon','fa-sort-numeric-desc',NULL,'Y'),('fa-sort-up','font_icon','fa-sort-up',NULL,'Y'),('fa-space-shuttle','font_icon','fa-space-shuttle',NULL,'Y'),('fa-spinner','font_icon','fa-spinner',NULL,'Y'),('fa-spoon','font_icon','fa-spoon',NULL,'Y'),('fa-square','font_icon','fa-square',NULL,'Y'),('fa-square-o','font_icon','fa-square-o',NULL,'Y'),('fa-star','font_icon','fa-star',NULL,'Y'),('fa-star-half','font_icon','fa-star-half',NULL,'Y'),('fa-star-half-empty','font_icon','fa-star-half-empty',NULL,'Y'),('fa-star-half-full','font_icon','fa-star-half-full',NULL,'Y'),('fa-star-half-o','font_icon','fa-star-half-o',NULL,'Y'),('fa-star-o','font_icon','fa-star-o',NULL,'Y'),('fa-sticky-note','font_icon','fa-sticky-note',NULL,'Y'),('fa-sticky-note-o','font_icon','fa-sticky-note-o',NULL,'Y'),('fa-street-view','font_icon','fa-street-view',NULL,'Y'),('fa-suitcase','font_icon','fa-suitcase',NULL,'Y'),('fa-sun-o','font_icon','fa-sun-o',NULL,'Y'),('fa-support','font_icon','fa-support',NULL,'Y'),('fa-tablet','font_icon','fa-tablet',NULL,'Y'),('fa-tachometer','font_icon','fa-tachometer',NULL,'Y'),('fa-tag','font_icon','fa-tag',NULL,'Y'),('fa-tags','font_icon','fa-tags',NULL,'Y'),('fa-tasks','font_icon','fa-tasks',NULL,'Y'),('fa-taxi','font_icon','fa-taxi',NULL,'Y'),('fa-television','font_icon','fa-television',NULL,'Y'),('fa-terminal','font_icon','fa-terminal',NULL,'Y'),('fa-thumb-tack','font_icon','fa-thumb-tack',NULL,'Y'),('fa-thumbs-down','font_icon','fa-thumbs-down',NULL,'Y'),('fa-thumbs-o-down','font_icon','fa-thumbs-o-down',NULL,'Y'),('fa-thumbs-o-up','font_icon','fa-thumbs-o-up',NULL,'Y'),('fa-thumbs-up','font_icon','fa-thumbs-up',NULL,'Y'),('fa-ticket','font_icon','fa-ticket',NULL,'Y'),('fa-times','font_icon','fa-times',NULL,'Y'),('fa-times-circle','font_icon','fa-times-circle',NULL,'Y'),('fa-times-circle-o','font_icon','fa-times-circle-o',NULL,'Y'),('fa-tint','font_icon','fa-tint',NULL,'Y'),('fa-toggle-down','font_icon','fa-toggle-down',NULL,'Y'),('fa-toggle-left','font_icon','fa-toggle-left',NULL,'Y'),('fa-toggle-off','font_icon','fa-toggle-off',NULL,'Y'),('fa-toggle-on','font_icon','fa-toggle-on',NULL,'Y'),('fa-toggle-right','font_icon','fa-toggle-right',NULL,'Y'),('fa-toggle-up','font_icon','fa-toggle-up',NULL,'Y'),('fa-trademark','font_icon','fa-trademark',NULL,'Y'),('fa-trash','font_icon','fa-trash',NULL,'Y'),('fa-trash-o','font_icon','fa-trash-o',NULL,'Y'),('fa-tree','font_icon','fa-tree',NULL,'Y'),('fa-trophy','font_icon','fa-trophy',NULL,'Y'),('fa-truck','font_icon','fa-truck',NULL,'Y'),('fa-tty','font_icon','fa-tty',NULL,'Y'),('fa-tv\"','font_icon','fa-tv\"',NULL,'Y'),('fa-umbrella','font_icon','fa-umbrella',NULL,'Y'),('fa-university','font_icon','fa-university',NULL,'Y'),('fa-unlock','font_icon','fa-unlock',NULL,'Y'),('fa-unlock-alt','font_icon','fa-unlock-alt',NULL,'Y'),('fa-unsorted','font_icon','fa-unsorted',NULL,'Y'),('fa-upload','font_icon','fa-upload',NULL,'Y'),('fa-user','font_icon','fa-user',NULL,'Y'),('fa-user-plus','font_icon','fa-user-plus',NULL,'Y'),('fa-user-secret','font_icon','fa-user-secret',NULL,'Y'),('fa-user-times','font_icon','fa-user-times',NULL,'Y'),('fa-users','font_icon','fa-users',NULL,'Y'),('fa-video-camera','font_icon','fa-video-camera',NULL,'Y'),('fa-volume-down','font_icon','fa-volume-down',NULL,'Y'),('fa-volume-off','font_icon','fa-volume-off',NULL,'Y'),('fa-volume-up','font_icon','fa-volume-up',NULL,'Y'),('fa-warning','font_icon','fa-warning',NULL,'Y'),('fa-wheelchair','font_icon','fa-wheelchair',NULL,'Y'),('fa-wifi','font_icon','fa-wifi',NULL,'Y'),('fa-wrench','font_icon','fa-wrench',NULL,'Y'),('female','sex','女','20','Y'),('icbc','bank','中国工商银行','20','Y'),('lov','element_type','值列表','50','Y'),('male','sex','男','10','Y'),('manual','code_rule','手动','20','Y'),('N','yes_or_no','否','20','Y'),('psbc','bank','中国邮政储蓄银行','60','Y'),('radio','element_type','单选按钮','30','Y'),('select','element_type','下拉列表框','20','Y'),('text','element_type','文本框','10','Y'),('tree','element_type','树列表','60','Y'),('Y','yes_or_no','是','10','Y');

/*Table structure for table `sys_data_dict_item_attribute` */

DROP TABLE IF EXISTS `sys_data_dict_item_attribute`;

CREATE TABLE `sys_data_dict_item_attribute` (
  `type_code` varchar(50) NOT NULL COMMENT '数据字典类型编码',
  `item_code` varchar(50) NOT NULL COMMENT '数据字典项编码',
  `attribute_code` varchar(50) NOT NULL COMMENT '数据字典属性编码',
  `attribute_value` varchar(1000) NOT NULL COMMENT '数据字典项属性值',
  PRIMARY KEY (`type_code`,`item_code`,`attribute_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典项属性';

/*Data for the table `sys_data_dict_item_attribute` */

/*Table structure for table `sys_data_dict_type` */

DROP TABLE IF EXISTS `sys_data_dict_type`;

CREATE TABLE `sys_data_dict_type` (
  `type_code` varchar(50) NOT NULL COMMENT '数据字典类型编码',
  `type_name` varchar(100) NOT NULL COMMENT '数据字典类型名称',
  `description` varchar(200) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典类型';

/*Data for the table `sys_data_dict_type` */

insert  into `sys_data_dict_type`(`type_code`,`type_name`,`description`) values ('bank','银行','银行'),('code_rule','编码规则','编码规则'),('element_type','元素类型','元素类型'),('sex','性别','性别'),('yes_or_no','是否','是否');

/*Table structure for table `sys_data_dict_type_attribute` */

DROP TABLE IF EXISTS `sys_data_dict_type_attribute`;

CREATE TABLE `sys_data_dict_type_attribute` (
  `attribute_code` varchar(50) NOT NULL COMMENT '数据字典属性编码',
  `type_code` varchar(50) NOT NULL COMMENT '数据字典类型编码',
  `attribute_name` varchar(100) NOT NULL COMMENT '数据字典属性名称',
  `element_type` varchar(50) NOT NULL COMMENT '元素类型',
  `ddt_code` varchar(50) DEFAULT NULL COMMENT '数据字典类型编码',
  `ds_code` varchar(50) DEFAULT NULL COMMENT '数据结构编码',
  `lov_code` varchar(50) DEFAULT NULL COMMENT '值列表编码',
  `description` varchar(200) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`type_code`,`attribute_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典属性';

/*Data for the table `sys_data_dict_type_attribute` */

/*Table structure for table `sys_data_struct_attribute` */

DROP TABLE IF EXISTS `sys_data_struct_attribute`;

CREATE TABLE `sys_data_struct_attribute` (
  `attribute_code` varchar(50) NOT NULL COMMENT '数据结构属性编码',
  `struct_code` varchar(50) NOT NULL COMMENT '数据结构编码',
  `attribute_name` varchar(100) NOT NULL COMMENT '数据结构属性名称',
  `element_type` varchar(50) NOT NULL COMMENT '元素类型',
  `ddt_code` varchar(50) DEFAULT NULL COMMENT '数据字典类型编码',
  `ds_code` varchar(50) DEFAULT NULL COMMENT '数据结构编码',
  `lov_code` varchar(50) DEFAULT NULL COMMENT '值列表编码',
  `description` varchar(200) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`attribute_code`,`struct_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据结构属性';

/*Data for the table `sys_data_struct_attribute` */

insert  into `sys_data_struct_attribute`(`attribute_code`,`struct_code`,`attribute_name`,`element_type`,`ddt_code`,`ds_code`,`lov_code`,`description`) values ('font_icon_code','menu_resource','字体图标','lov','','','lov_font_icon','字体图标'),('function_code','menu_resource','功能','lov','','','lov_function','功能');

/*Table structure for table `sys_data_struct_define` */

DROP TABLE IF EXISTS `sys_data_struct_define`;

CREATE TABLE `sys_data_struct_define` (
  `struct_code` varchar(50) NOT NULL COMMENT '数据结构编码',
  `struct_name` varchar(100) NOT NULL COMMENT '数据结构名称',
  `node_code_rule` varchar(50) NOT NULL COMMENT '节点编码规则',
  `rule_prefix` varchar(10) DEFAULT NULL COMMENT '节点编码规则-前缀',
  `rule_length` varchar(10) DEFAULT NULL COMMENT '节点编码规则-长度',
  `description` varchar(200) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`struct_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据结构定义';

/*Data for the table `sys_data_struct_define` */

insert  into `sys_data_struct_define`(`struct_code`,`struct_name`,`node_code_rule`,`rule_prefix`,`rule_length`,`description`) values ('hr_organization','组织结构','manual','','','组织结构'),('menu_resource','菜单资源','auto','M','2','菜单资源');

/*Table structure for table `sys_data_struct_node` */

DROP TABLE IF EXISTS `sys_data_struct_node`;

CREATE TABLE `sys_data_struct_node` (
  `node_code` varchar(50) NOT NULL COMMENT '数据结构节点编码',
  `parent_node_code` varchar(50) NOT NULL COMMENT '数据结构父节点编码',
  `struct_code` varchar(50) NOT NULL COMMENT '数据结构编码',
  `node_name` varchar(100) NOT NULL COMMENT '数据结构节点名称',
  `display_order` int(11) DEFAULT NULL COMMENT '显示顺序',
  `enabled_flag` char(1) NOT NULL COMMENT '启用标识[Y:启用;N:禁用]',
  `description` varchar(200) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`node_code`,`struct_code`),
  KEY `SYS_DATA_STRUCT_NODE_N1` (`parent_node_code`),
  KEY `SYS_DATA_STRUCT_NODE_N2` (`enabled_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据结构节点';

/*Data for the table `sys_data_struct_node` */

insert  into `sys_data_struct_node`(`node_code`,`parent_node_code`,`struct_code`,`node_name`,`display_order`,`enabled_flag`,`description`) values ('100','ROOT','hr_organization','红领集团',1,'Y','红领集团'),('10001','100','hr_organization','青岛酷特智能股份有限公司',1,'Y','青岛酷特智能股份有限公司'),('10002','100','hr_organization','青岛凯瑞创智股份有限公司',2,'Y','青岛凯瑞创智股份有限公司'),('10003','100','hr_organization','青岛源点科技股份有限公司',3,'Y','青岛源点科技股份有限公司'),('M01','M','menu_resource','系统管理',10,'Y','系统管理'),('M0101','M01','menu_resource','系统设置',10,'Y','系统设置'),('M0102','M01','menu_resource','系统参数',20,'Y','系统参数'),('M0103','M01','menu_resource','数据字典',30,'Y','数据字典'),('M0104','M01','menu_resource','数据结构',40,'Y','数据结构'),('M0105','M01','menu_resource','值列表',50,'Y','值列表'),('M0106','M01','menu_resource','弹性域',60,'Y','弹性域'),('M0107','M01','menu_resource','功能管理',70,'Y','功能管理'),('M0111','M01','menu_resource','角色管理',100,'Y','角色管理'),('M0112','M01','menu_resource','用户管理',110,'Y','用户管理');

/*Table structure for table `sys_data_struct_node_attribute` */

DROP TABLE IF EXISTS `sys_data_struct_node_attribute`;

CREATE TABLE `sys_data_struct_node_attribute` (
  `struct_code` varchar(50) NOT NULL COMMENT '数据结构编码',
  `node_code` varchar(50) NOT NULL COMMENT '数据结构节点编码',
  `attribute_code` varchar(50) NOT NULL COMMENT '数据结构属性编码',
  `attribute_value` varchar(500) NOT NULL COMMENT '数据结构节点属性值',
  PRIMARY KEY (`node_code`,`struct_code`,`attribute_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据结构节点属性';

/*Data for the table `sys_data_struct_node_attribute` */

insert  into `sys_data_struct_node_attribute`(`struct_code`,`node_code`,`attribute_code`,`attribute_value`) values ('menu_resource','M01','font_icon_code','fa-cogs'),('menu_resource','M01','function_code',''),('menu_resource','M0101','font_icon_code','fa-cog'),('menu_resource','M0101','function_code','sys_config'),('menu_resource','M0102','font_icon_code','fa-asterisk'),('menu_resource','M0102','function_code','sys_parameter'),('menu_resource','M0103','font_icon_code','fa-book'),('menu_resource','M0103','function_code','sys_data_dict'),('menu_resource','M0104','font_icon_code','fa-tree'),('menu_resource','M0104','function_code','sys_data_struct'),('menu_resource','M0105','font_icon_code','fa-bars'),('menu_resource','M0105','function_code','sys_lov'),('menu_resource','M0106','font_icon_code','fa-building'),('menu_resource','M0106','function_code','sys_flex_field'),('menu_resource','M0107','font_icon_code','fa-leaf'),('menu_resource','M0107','function_code','sys_function'),('menu_resource','M0111','font_icon_code','fa-users'),('menu_resource','M0111','function_code',''),('menu_resource','M0112','font_icon_code','fa-user'),('menu_resource','M0112','function_code','');

/*Table structure for table `sys_flex_field_column` */

DROP TABLE IF EXISTS `sys_flex_field_column`;

CREATE TABLE `sys_flex_field_column` (
  `column_name` varchar(50) NOT NULL COMMENT '字段名称',
  `flex_code` varchar(50) NOT NULL COMMENT '弹性域编码',
  `column_title` varchar(50) NOT NULL COMMENT '字段标题',
  `element_type` varchar(50) NOT NULL COMMENT '元素类型',
  `ddt_code` varchar(50) DEFAULT NULL COMMENT '数据字典类型',
  `lov_code` varchar(50) DEFAULT NULL COMMENT '值列表编码',
  `ds_code` varchar(50) DEFAULT NULL COMMENT '数据结构编码',
  `description` varchar(200) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`column_name`,`flex_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='弹性域属性';

/*Data for the table `sys_flex_field_column` */

insert  into `sys_flex_field_column`(`column_name`,`flex_code`,`column_title`,`element_type`,`ddt_code`,`lov_code`,`ds_code`,`description`) values ('attribute1','user','所属部门','text','','','','所属部门');

/*Table structure for table `sys_flex_field_define` */

DROP TABLE IF EXISTS `sys_flex_field_define`;

CREATE TABLE `sys_flex_field_define` (
  `flex_code` varchar(50) NOT NULL COMMENT '弹性域编码',
  `flex_name` varchar(100) NOT NULL COMMENT '弹性域名称',
  `table_name` varchar(50) NOT NULL COMMENT '表名',
  `enabled_flag` char(1) NOT NULL COMMENT '启用标识[Y:启用;N:禁用]',
  `description` varchar(200) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`flex_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='弹性域定义';

/*Data for the table `sys_flex_field_define` */

insert  into `sys_flex_field_define`(`flex_code`,`flex_name`,`table_name`,`enabled_flag`,`description`) values ('user','用户弹性域','sys_user','Y','用户弹性域');

/*Table structure for table `sys_function` */

DROP TABLE IF EXISTS `sys_function`;

CREATE TABLE `sys_function` (
  `function_code` varchar(50) NOT NULL COMMENT '功能编码',
  `function_name` varchar(100) NOT NULL COMMENT '功能名称',
  `function_url` varchar(500) NOT NULL COMMENT '功能URL',
  `description` varchar(200) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`function_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统功能';

/*Data for the table `sys_function` */

insert  into `sys_function`(`function_code`,`function_name`,`function_url`,`description`) values ('sys_config','系统设置','/app/sys/parameter/ParameterConfig','系统设置'),('sys_data_dict','数据字典','/app/sys/datadict/DataDictMgr','数据字典'),('sys_data_struct','数据结构','/app/sys/datastruct/DataStructMgr','数据结构'),('sys_flex_field','弹性域','/app/sys/flexfield/FlexFieldMgr','弹性域'),('sys_function','功能管理','/app/sys/function/FunctionMgr','功能管理'),('sys_lov','值列表','/app/sys/lov/LovMgr','值列表'),('sys_parameter','系统参数','/app/sys/parameter/ParameterMgr','系统参数');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `log_id` int(11) NOT NULL COMMENT '日志ID',
  `log_source` varchar(50) NOT NULL COMMENT '日志来源',
  `log_type` varchar(50) NOT NULL COMMENT '日志类型',
  `log_time` datetime NOT NULL COMMENT '日志时间',
  `log_content` varchar(4000) NOT NULL COMMENT '日志内容',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `attrbute1` varchar(500) DEFAULT NULL,
  `attrbute2` varchar(500) DEFAULT NULL,
  `attrbute3` varchar(500) DEFAULT NULL,
  `attrbute4` varchar(500) DEFAULT NULL,
  `attrbute5` varchar(500) DEFAULT NULL,
  `attrbute6` varchar(500) DEFAULT NULL,
  `attrbute7` varchar(500) DEFAULT NULL,
  `attrbute8` varchar(500) DEFAULT NULL,
  `attrbute9` varchar(500) DEFAULT NULL,
  `attrbute10` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `SYS_LOG_N1` (`log_source`),
  KEY `SYS_LOG_N2` (`log_type`),
  KEY `SYS_LOG_N3` (`log_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志';

/*Data for the table `sys_log` */

/*Table structure for table `sys_lov_column` */

DROP TABLE IF EXISTS `sys_lov_column`;

CREATE TABLE `sys_lov_column` (
  `lov_code` varchar(50) NOT NULL COMMENT '值列表编码',
  `column_name` varchar(100) NOT NULL COMMENT '列名称',
  `column_title` varchar(100) NOT NULL COMMENT '列标题',
  `display_flag` char(1) NOT NULL COMMENT '显示标识[Y:显示;N:隐藏]',
  `return_value_flag` char(1) NOT NULL COMMENT '返回值列标识[Y:显示;N:隐藏]',
  `return_text_flag` char(1) NOT NULL COMMENT '返回文本列标识[Y:显示;N:隐藏]',
  PRIMARY KEY (`lov_code`,`column_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='值列表列';

/*Data for the table `sys_lov_column` */

insert  into `sys_lov_column`(`lov_code`,`column_name`,`column_title`,`display_flag`,`return_value_flag`,`return_text_flag`) values ('lov_data_dict','description','说明','Y','N','N'),('lov_data_dict','type_code','数据字典类型编码','Y','Y','N'),('lov_data_dict','type_name','数据字典类型名称','Y','N','Y'),('lov_data_struct','description','说明','Y','N','N'),('lov_data_struct','struct_code','数据结构编码','Y','Y','N'),('lov_data_struct','struct_name','数据结构名称','Y','N','Y'),('lov_font_icon','display','预览','Y','N','N'),('lov_font_icon','item_code','字体图标编码','Y','Y','Y'),('lov_function','description','说明','Y','N','N'),('lov_function','function_code','功能编码','Y','Y','N'),('lov_function','function_name','功能名称','Y','N','Y'),('lov_function','function_url','功能URL','N','N','N'),('lov_list_of_value','description','说明','Y','N','N'),('lov_list_of_value','lov_code','值列表编码','Y','Y','N'),('lov_list_of_value','lov_name','值列表名称','Y','N','Y'),('lov_list_of_value','view_name','视图名称','N','N','N');

/*Table structure for table `sys_lov_define` */

DROP TABLE IF EXISTS `sys_lov_define`;

CREATE TABLE `sys_lov_define` (
  `lov_code` varchar(50) NOT NULL COMMENT '值列表编码',
  `lov_name` varchar(100) NOT NULL COMMENT '值列表名称',
  `view_name` varchar(50) NOT NULL COMMENT '视图名称',
  `description` varchar(200) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`lov_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='值列表定义';

/*Data for the table `sys_lov_define` */

insert  into `sys_lov_define`(`lov_code`,`lov_name`,`view_name`,`description`) values ('lov_data_dict','数据字典值列表','lov_data_dict_v','数据字典值列表'),('lov_data_struct','数据结构值列表','lov_data_struct_v','数据结构值列表'),('lov_font_icon','字体图标值列表','lov_font_icon_v','字体图标值列表'),('lov_function','功能值列表','lov_function_v','功能值列表'),('lov_list_of_value','值列表','lov_list_of_value_v','值列表');

/*Table structure for table `sys_operation` */

DROP TABLE IF EXISTS `sys_operation`;

CREATE TABLE `sys_operation` (
  `operation_code` varchar(50) NOT NULL COMMENT '操作编码',
  `function_code` varchar(50) NOT NULL COMMENT '功能编码',
  `operation_name` varchar(100) NOT NULL COMMENT '操作名称',
  `description` varchar(200) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`operation_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统操作表';

/*Data for the table `sys_operation` */

insert  into `sys_operation`(`operation_code`,`function_code`,`operation_name`,`description`) values ('sys_data_dict_item_add','sys_data_dict','数据字典项-新建','数据字典项-新建'),('sys_data_dict_item_attribute','sys_data_dict','数据字典项-扩展属性','数据字典项-扩展属性'),('sys_data_dict_item_edit','sys_data_dict','数据字典项-编辑','数据字典项-编辑'),('sys_data_dict_item_refresh','sys_data_dict','数据字典项-刷新','数据字典项-刷新'),('sys_data_dict_type_add','sys_data_dict','数据字典类型-新建','数据字典类型-新建'),('sys_data_dict_type_attribute','sys_data_dict','数据字典类型-扩展属性','数据字典类型-扩展属性'),('sys_data_dict_type_edit','sys_data_dict','数据字典类型-编辑','数据字典类型-编辑'),('sys_data_dict_type_refresh','sys_data_dict','数据字典类型-刷新','数据字典类型-刷新'),('sys_data_struct_add','sys_data_struct','数据结构-新建','数据结构-新建'),('sys_data_struct_attribute','sys_data_struct','数据结构-扩展属性','数据结构-扩展属性'),('sys_data_struct_edit','sys_data_struct','数据结构-编辑','数据结构-编辑'),('sys_data_struct_node_add','sys_data_struct','数据结构节点-新建','数据结构节点-新建'),('sys_data_struct_node_attribute','sys_data_struct','数据结构节点-扩展属性','数据结构节点-扩展属性'),('sys_data_struct_node_edit','sys_data_struct','数据结构节点-编辑','数据结构节点-编辑'),('sys_data_struct_node_refresh','sys_data_struct','数据结构节点-刷新','数据结构节点-刷新'),('sys_data_struct_refresh','sys_data_struct','数据结构-刷新','数据结构-刷新'),('sys_flex_field_column_add','sys_flex_field','弹性域字段-新建','弹性域字段-新建'),('sys_flex_field_column_edit','sys_flex_field','弹性域字段-编辑','弹性域字段-编辑'),('sys_flex_field_column_refresh','sys_flex_field','弹性域字段-刷新','弹性域字段-刷新'),('sys_flex_field_define_add','sys_flex_field','弹性域-新建','弹性域-新建'),('sys_flex_field_define_edit','sys_flex_field','弹性域-编辑','弹性域-编辑'),('sys_flex_field_define_refresh','sys_flex_field','弹性域-刷新','弹性域-刷新'),('sys_function_add','sys_function','功能-新建','功能-新建'),('sys_function_edit','sys_function','功能-编辑','功能-编辑'),('sys_function_refresh','sys_function','功能-刷新','功能-刷新'),('sys_lov_add','sys_lov','新建','新建'),('sys_lov_edit','sys_lov','编辑','编辑'),('sys_lov_refresh','sys_lov','刷新','刷新'),('sys_operation_add','sys_function','操作-新建','操作-新建'),('sys_operation_edit','sys_function','操作-编辑','操作-编辑'),('sys_operation_refresh','sys_function','操作-刷新','操作-刷新'),('sys_parameter_add','sys_parameter','参数-新建','参数-新建'),('sys_parameter_edit','sys_parameter','参数-编辑','参数-编辑'),('sys_parameter_refresh','sys_parameter','参数-刷新','参数-刷新'),('sys_parameter_type_add','sys_parameter','参数类型-新建','参数类型-新建'),('sys_parameter_type_edit','sys_parameter','参数类型-编辑','参数类型-编辑'),('sys_parameter_type_refresh','sys_parameter','参数类型-刷新','参数类型-刷新');

/*Table structure for table `sys_parameter_config` */

DROP TABLE IF EXISTS `sys_parameter_config`;

CREATE TABLE `sys_parameter_config` (
  `parameter_code` varchar(50) NOT NULL COMMENT '参数编码',
  `parameter_value` varchar(1000) NOT NULL COMMENT '参数值',
  PRIMARY KEY (`parameter_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统参数配置';

/*Data for the table `sys_parameter_config` */

insert  into `sys_parameter_config`(`parameter_code`,`parameter_value`) values ('account_bank','boc'),('account_bank_number','fdsa'),('company_address','方式'),('company_name','123213'),('telephone','21343564432');

/*Table structure for table `sys_parameter_define` */

DROP TABLE IF EXISTS `sys_parameter_define`;

CREATE TABLE `sys_parameter_define` (
  `parameter_code` varchar(50) NOT NULL COMMENT '参数编码',
  `parameter_name` varchar(100) NOT NULL COMMENT '参数名称',
  `parameter_type` varchar(50) NOT NULL COMMENT '参数类型',
  `element_type` varchar(50) NOT NULL COMMENT '元素类型',
  `ddt_code` varchar(50) DEFAULT NULL COMMENT '数据字典类型编码',
  `lov_code` varchar(50) DEFAULT NULL COMMENT '值列表编码',
  `ds_code` varchar(50) DEFAULT NULL COMMENT '数据结构编码',
  `display_order` int(11) NOT NULL COMMENT '显示顺序',
  `description` varchar(100) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`parameter_code`),
  KEY `SYS_PARAMETER_DEFINE_N1` (`parameter_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统参数定义';

/*Data for the table `sys_parameter_define` */

insert  into `sys_parameter_define`(`parameter_code`,`parameter_name`,`parameter_type`,`element_type`,`ddt_code`,`lov_code`,`ds_code`,`display_order`,`description`) values ('account_bank','开户行','company_info','select','bank','','',20,'开户行'),('account_bank_number','开户行账号','company_info','text','','','',30,'开户行账号'),('company_address','公司地址','company_info','text','','','',40,'公司地址'),('company_name','公司名称','company_info','text','','','',10,'公司名称'),('telephone','固定电话','company_info','text','','','',50,'固定电话');

/*Table structure for table `sys_parameter_type` */

DROP TABLE IF EXISTS `sys_parameter_type`;

CREATE TABLE `sys_parameter_type` (
  `type_code` varchar(50) NOT NULL COMMENT '参数类型编码',
  `type_name` varchar(100) NOT NULL COMMENT '参数类型名称',
  `display_order` int(11) NOT NULL COMMENT '显示顺序',
  `description` varchar(200) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统参数类型';

/*Data for the table `sys_parameter_type` */

insert  into `sys_parameter_type`(`type_code`,`type_name`,`display_order`,`description`) values ('company_info','公司信息',20,'公司信息'),('system_setup','系统设置',10,'系统设置');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `role_name` varchar(100) NOT NULL COMMENT '角色名称',
  `description` varchar(200) DEFAULT NULL COMMENT '说明',
  `owner` varchar(20) NOT NULL COMMENT '所有者[system:系统;user:用户]',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `SYS_ROLE_U1` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`description`,`owner`) values (0,'超级管理员','超级管理员','');

/*Table structure for table `sys_role_resource` */

DROP TABLE IF EXISTS `sys_role_resource`;

CREATE TABLE `sys_role_resource` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `resource_id` varchar(50) NOT NULL COMMENT '资源ID',
  `resource_type` varchar(50) NOT NULL COMMENT '资源类型',
  PRIMARY KEY (`role_id`,`resource_id`,`resource_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单关系表';

/*Data for the table `sys_role_resource` */

/*Table structure for table `sys_role_user` */

DROP TABLE IF EXISTS `sys_role_user`;

CREATE TABLE `sys_role_user` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色用户关系';

/*Data for the table `sys_role_user` */

insert  into `sys_role_user`(`role_id`,`user_id`) values (0,0);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `display_name` varchar(100) NOT NULL COMMENT '显示名称',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `mobilephone` varchar(20) DEFAULT NULL COMMENT '手机',
  `qq` varchar(20) DEFAULT NULL COMMENT 'QQ',
  `weixin` varchar(50) DEFAULT NULL COMMENT '微信',
  `head_portrait` blob COMMENT '头像',
  `skin` varchar(50) DEFAULT NULL COMMENT '皮肤',
  `employee_number` varchar(10) DEFAULT NULL COMMENT '工号',
  `description` varchar(100) DEFAULT NULL COMMENT '说明',
  `user_status` char(1) NOT NULL COMMENT '用户状态',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `last_update_date` datetime NOT NULL COMMENT '最后更新日期',
  `start_date` datetime DEFAULT NULL COMMENT '启用日期',
  `expiry_date` datetime DEFAULT NULL COMMENT '失效日期',
  `password_date` datetime NOT NULL COMMENT '密码修改时间',
  `attribute1` varchar(100) DEFAULT NULL,
  `attribute2` varchar(100) DEFAULT NULL,
  `attribute3` varchar(100) DEFAULT NULL,
  `attribute4` varchar(100) DEFAULT NULL,
  `attribute5` varchar(100) DEFAULT NULL,
  `attribute6` varchar(100) DEFAULT NULL,
  `attribute7` varchar(100) DEFAULT NULL,
  `attribute8` varchar(100) DEFAULT NULL,
  `attribute9` varchar(100) DEFAULT NULL,
  `attribute10` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `SYS_USER_U1` (`username`),
  KEY `SYS_USER_N1` (`user_status`),
  KEY `SYS_USER_N2` (`start_date`),
  KEY `SYS_USER_N3` (`expiry_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`username`,`password`,`display_name`,`email`,`telephone`,`mobilephone`,`qq`,`weixin`,`head_portrait`,`skin`,`employee_number`,`description`,`user_status`,`create_date`,`last_update_date`,`start_date`,`expiry_date`,`password_date`,`attribute1`,`attribute2`,`attribute3`,`attribute4`,`attribute5`,`attribute6`,`attribute7`,`attribute8`,`attribute9`,`attribute10`) values (1,'sysadmin','welcome','超级管理员',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'超级管理员','Y','2016-11-15 11:21:59','2016-11-15 11:22:02','2016-11-15 00:00:00',NULL,'2016-11-15 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `lov_data_dict_v` */

DROP TABLE IF EXISTS `lov_data_dict_v`;

/*!50001 DROP VIEW IF EXISTS `lov_data_dict_v` */;
/*!50001 DROP TABLE IF EXISTS `lov_data_dict_v` */;

/*!50001 CREATE TABLE  `lov_data_dict_v`(
 `type_code` varchar(50) ,
 `type_name` varchar(100) ,
 `description` varchar(200) 
)*/;

/*Table structure for table `lov_data_struct_v` */

DROP TABLE IF EXISTS `lov_data_struct_v`;

/*!50001 DROP VIEW IF EXISTS `lov_data_struct_v` */;
/*!50001 DROP TABLE IF EXISTS `lov_data_struct_v` */;

/*!50001 CREATE TABLE  `lov_data_struct_v`(
 `struct_code` varchar(50) ,
 `struct_name` varchar(100) ,
 `description` varchar(200) 
)*/;

/*Table structure for table `lov_font_icon_v` */

DROP TABLE IF EXISTS `lov_font_icon_v`;

/*!50001 DROP VIEW IF EXISTS `lov_font_icon_v` */;
/*!50001 DROP TABLE IF EXISTS `lov_font_icon_v` */;

/*!50001 CREATE TABLE  `lov_font_icon_v`(
 `item_code` varchar(50) ,
 `display` varchar(156) 
)*/;

/*Table structure for table `lov_function_v` */

DROP TABLE IF EXISTS `lov_function_v`;

/*!50001 DROP VIEW IF EXISTS `lov_function_v` */;
/*!50001 DROP TABLE IF EXISTS `lov_function_v` */;

/*!50001 CREATE TABLE  `lov_function_v`(
 `function_code` varchar(50) ,
 `function_name` varchar(100) ,
 `function_url` varchar(500) ,
 `description` varchar(200) 
)*/;

/*Table structure for table `lov_list_of_value_v` */

DROP TABLE IF EXISTS `lov_list_of_value_v`;

/*!50001 DROP VIEW IF EXISTS `lov_list_of_value_v` */;
/*!50001 DROP TABLE IF EXISTS `lov_list_of_value_v` */;

/*!50001 CREATE TABLE  `lov_list_of_value_v`(
 `lov_code` varchar(50) ,
 `lov_name` varchar(100) ,
 `view_name` varchar(50) ,
 `description` varchar(200) 
)*/;

/*View structure for view lov_data_dict_v */

/*!50001 DROP TABLE IF EXISTS `lov_data_dict_v` */;
/*!50001 DROP VIEW IF EXISTS `lov_data_dict_v` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`adf`@`localhost` SQL SECURITY DEFINER VIEW `lov_data_dict_v` AS (select `sys_data_dict_type`.`type_code` AS `type_code`,`sys_data_dict_type`.`type_name` AS `type_name`,`sys_data_dict_type`.`description` AS `description` from `sys_data_dict_type` order by `sys_data_dict_type`.`type_code`) */;

/*View structure for view lov_data_struct_v */

/*!50001 DROP TABLE IF EXISTS `lov_data_struct_v` */;
/*!50001 DROP VIEW IF EXISTS `lov_data_struct_v` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`adf`@`localhost` SQL SECURITY DEFINER VIEW `lov_data_struct_v` AS (select `dsd`.`struct_code` AS `struct_code`,`dsd`.`struct_name` AS `struct_name`,`dsd`.`description` AS `description` from `sys_data_struct_define` `dsd` order by `dsd`.`struct_code`) */;

/*View structure for view lov_font_icon_v */

/*!50001 DROP TABLE IF EXISTS `lov_font_icon_v` */;
/*!50001 DROP VIEW IF EXISTS `lov_font_icon_v` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`adf`@`localhost` SQL SECURITY DEFINER VIEW `lov_font_icon_v` AS (select `ddi`.`item_code` AS `item_code`,concat('<i class="fa ',`ddi`.`item_code`,'"></i><span>&nbsp;&nbsp;',`ddi`.`item_code`,'&nbsp;&nbsp;</span>') AS `display` from `sys_data_dict_item` `ddi` where (`ddi`.`type_code` = 'font_icon') order by `ddi`.`item_code`) */;

/*View structure for view lov_function_v */

/*!50001 DROP TABLE IF EXISTS `lov_function_v` */;
/*!50001 DROP VIEW IF EXISTS `lov_function_v` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`adf`@`localhost` SQL SECURITY DEFINER VIEW `lov_function_v` AS (select `sf`.`function_code` AS `function_code`,`sf`.`function_name` AS `function_name`,`sf`.`function_url` AS `function_url`,`sf`.`description` AS `description` from `sys_function` `sf` order by `sf`.`function_code`) */;

/*View structure for view lov_list_of_value_v */

/*!50001 DROP TABLE IF EXISTS `lov_list_of_value_v` */;
/*!50001 DROP VIEW IF EXISTS `lov_list_of_value_v` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`adf`@`localhost` SQL SECURITY DEFINER VIEW `lov_list_of_value_v` AS (select `sys_lov_define`.`lov_code` AS `lov_code`,`sys_lov_define`.`lov_name` AS `lov_name`,`sys_lov_define`.`view_name` AS `view_name`,`sys_lov_define`.`description` AS `description` from `sys_lov_define` order by `sys_lov_define`.`lov_code`) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
