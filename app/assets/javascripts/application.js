// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
// require turbolinks
//= require_tree .

// カードをホバーしたときに文字を拡大する機能
$(function mouseover(){
    var mouse_on = {

      paddingTop: 10,
      paddingLeft: 10,
      paddingRight: 10,
  }
  //mouseout時の値
  var mouse_off = {
    paddingTop: 0,
    paddingBottom: 0,
    paddingLeft: 0,
    paddingRight: 0,
  }

  $(".card").hover(function(){
    $(this).animate(mouse_on, 200);
  } ,function(){
    $(this).animate(mouse_off, 200);
  });
});

// noticeの表示に動きを作る
$(function(){
  $('.notice').delay(500).slideDown();
});
$(function(){
  $('.notice').delay(5000).slideUp();
});


$('#rippleria').rippleria({
  // aniamtion speed
  duration: 750,
  // custom easing effect
  easing: 'ease-in'
});

// rippleria　＝　要素に波紋を表示させる
$('#rippleria').click(function(e) {
  e.preventDefault();

  var randInt = function (min, max) {
  var rand = min + Math.random() * (max - min)
  rand = Math.round(rand);
  return rand;
};

$(this).rippleria('changeColor',
  'rgba('+randInt(0,100)+','+randInt(0,100)+','+randInt(0,100)+',0.'+randInt(3,5));
});

$(document).ready(function () {
  $(".slider").skippr({
    // スライドショーの変化 ("fade" or "slide")
    transition : 'slide',
    // 変化に係る時間(ミリ秒)
    speed : 1000,
    // easingの種類
    easing : 'easeOutQuart',
    // ナビゲーションの形("block" or "bubble")
    navType : 'block',
    // 子要素の種類('div' or 'img')
    childrenElementType : 'div',
    // ナビゲーション矢印の表示(trueで表示)
    arrows : true,
    // スライドショーの自動再生(falseで自動再生なし)
    autoPlay : true,
    // 自動再生時のスライド切替間隔(ミリ秒)
    autoPlayDuration : 6000,
    // キーボードの矢印キーによるスライド送りの設定(trueで有効)
    keyboardOnAlways : true,
    // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
    hidePrevious : false
  });
});