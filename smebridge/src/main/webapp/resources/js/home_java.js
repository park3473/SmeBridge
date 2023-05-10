//탭소스
$(function() {
var $tabButtonItem = $('#tab-button li'),
$tabSelect = $('#tab-select'),
$tabContents = $('.tab-contents'),
activeClass = 'is-active';

$tabButtonItem.first().addClass(activeClass);
$tabContents.not(':first').hide();

$tabButtonItem.find('a').on('click', function(e) {
var target = $(this).attr('href');

$tabButtonItem.removeClass(activeClass);
$(this).parent().addClass(activeClass);
$tabSelect.val(target);
$tabContents.hide();
$(target).show();
e.preventDefault();
});

$tabSelect.on('change', function() {
var target = $(this).val(),
targetSelectNum = $(this).prop('selectedIndex');

$tabButtonItem.removeClass(activeClass);
$tabButtonItem.eq(targetSelectNum).addClass(activeClass);
$tabContents.hide();
$(target).show();
});
});

//두번째
$(function() {
var $tabButtonItem = $('#tab-button_02 li'),
$tabSelect = $('#tab-select_02'),
$tabContents = $('.tab-contents_02'),
activeClass = 'is-active';

$tabButtonItem.first().addClass(activeClass);
$tabContents.not(':first').hide();

$tabButtonItem.find('a').on('click', function(e) {
var target = $(this).attr('href');

$tabButtonItem.removeClass(activeClass);
$(this).parent().addClass(activeClass);
$tabSelect.val(target);
$tabContents.hide();
$(target).show();
e.preventDefault();
});

$tabSelect.on('change', function() {
var target = $(this).val(),
targetSelectNum = $(this).prop('selectedIndex');

$tabButtonItem.removeClass(activeClass);
$tabButtonItem.eq(targetSelectNum).addClass(activeClass);
$tabContents.hide();
$(target).show();
});
});



//슬라이드_01
$(document).ready(function() {
$('#owl_01').owlCarousel({
loop: true,
margin: 15,
nav: true,
responsiveClass:true,
autoplay:true,
autoplayTimeout:5000,
autoplayHoverPause:true,
navText: ["<i class='las la-angle-left'></i>","<i class='las la-angle-right'></i>"],
responsive: {
0: {
items: 1,
nav: false
},
600: {
items: 2,
nav: true
},
1000: {
items: 4,
nav: true,
margin: 30
}
}
})
})

//슬라이드_02
$(document).ready(function() {
$('#owl_02').owlCarousel({
loop: true,
margin: 15,
nav: true,
responsiveClass:true,
autoplay:true,
autoplayTimeout:5000,
autoplayHoverPause:true,
navText: ["<i class='las la-angle-left'></i>","<i class='las la-angle-right'></i>"],
responsive: {
0: {
items: 4,
nav: false
},
600: {
items: 4,
nav: true
},
1000: {
items: 7,
nav: true,
margin: 30
}
}
})
})

//슬라이드_03
$(document).ready(function() {
$('#owl_03').owlCarousel({
loop: true,
margin: 15,
nav: true,
responsiveClass:true,
autoplay:true,
autoplayTimeout:5000,
autoplayHoverPause:true,
navText: ["<i class='las la-angle-left'></i>","<i class='las la-angle-right'></i>"],
responsive: {
0: {
items: 1,
nav: false
},
600: {
items: 1,
nav: true
},
1000: {
items: 1,
nav: true,
margin: 0
}
}
})
})

