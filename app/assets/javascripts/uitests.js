
document.ontouchmove = function(e) {e.preventDefault()};
function goToTraining() {
    swiperParent.swipeTo( 2 );
    swiperNested1.swipeTo( 0 );
}
function goToLogin() {
    swiperParent.swipeTo( 1 );
}
function goToStats() {
    swiperParent.swipeTo( 3 );
}
