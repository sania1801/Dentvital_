
$(document).ready(function numberPatient(){
	let mask = "+000 (00) 000-00-00";
    $(".phone-number").css('font-size',30 + "px").css('margin',30 + "px").mask(mask);
});