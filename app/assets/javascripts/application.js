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
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .
$(function() {
  $(document).on('turbolinks:load', () => {
    $('#user_postcode').jpostal({
      postcode : [
        '#postcode'
      ],
      address: {
        "#address"           : "%3%4%5", // # 市区町村と町域が入力される
      }
    });

    $("#theTarget").skippr({
	    // スライドショーの変化 ("fade" or "slide")
	    transition : 'fade',
	    // 変化に係る時間(ミリ秒)
	    speed : 500,
	    // easingの種類
	    easing : 'linear',
	    // ナビゲーションの形("block" or "bubble")
	    navType : false,
	    // 子要素の種類("div" or "img")
	    childrenElementType : 'div',
	    // ナビゲーション矢印の表示(trueで表示)
	    arrows : false,
	    // スライドショーの自動再生(falseで自動再生なし)
	    autoPlay : true,
	    // 自動再生時のスライド切替間隔(ミリ秒)
	    autoPlayDuration : 2000,
	    // キーボードの矢印キーによるスライド送りの設定(trueで有効)
	    keyboardOnAlways : false,
	    // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
	    hidePrevious : false,
	  });
  	});

  $(function(){
    // inputのidから情報の取得
    $('#image').on('change', function (e) {
// ここから既存の画像のurlの取得
    var reader = new FileReader();
    reader.onload = function (e) {
        $(".img-square").attr('src', e.target.result);
    }
// ここまで
    reader.readAsDataURL(e.target.files[0]); //取得したurlにアップロード画像のurlを挿入
});
});


  	$('#back a').on('click',function(event){
	    $('body, html').animate({
	      scrollTop:0
	    }, 1000);
	    event.preventDefault();
	});
})

$(function(){

    var effect_btm = 300; // 画面下からどの位置でフェードさせるか(px)
    var effect_move = 50; // どのぐらい要素を動かすか(px)
    var effect_time = 1000; // エフェクトの時間(ms) 1秒なら1000

    //親要素と子要素のcssを定義
    $('.scroll-fade-row').css({
        opacity: 0
    });
    $('.scroll-fade-row').children().each(function(){
        $(this).css({
            opacity: 0,
            transform: 'translateY('+ effect_move +'px)',
            transition: effect_time + 'ms'
        });
    });

    // スクロールまたはロードするたびに実行
    $(window).on('scroll load', function(){
        var scroll_top = $(this).scrollTop();
        var scroll_btm = scroll_top + $(this).height();
        var effect_pos = scroll_btm - effect_btm;

        //エフェクトが発動したとき、子要素をずらしてフェードさせる
        $('.scroll-fade-row').each( function() {
            var this_pos = $(this).offset().top;
            if ( effect_pos > this_pos ) {
                $(this).css({
                    opacity: 1,
                    transform: 'translateY(0)'
                });
                $(this).children().each(function(i){
                    $(this).delay(100 + i*200).queue(function(){
                        $(this).css({
                            opacity: 1,
                            transform: 'translateY(0)'
                        }).dequeue();
                    });
                });
            }
        });
    });

});

