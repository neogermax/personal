function initProgress() {
    var activeDist = jQuery(".slide a.active").position();
    activeDist = activeDist.left;
    jQuery(".after").stop().animate({ width: activeDist + "px" });
}
initProgress();
jQuery("a").click(function (e) {
    e.preventDefault();
    jQuery(".slide a").removeClass("active");
    jQuery(this).addClass("active");
    initProgress();
});
jQuery(window).resize(function () {
    initProgress();
});