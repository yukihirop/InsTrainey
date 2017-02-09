# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#参考URL
#http://irohacross.net/2015/02/jquery_tab.html#tab1

# ページ内部でのtabの動作
$(document).on 'ready turbolinks:load', ->
#クリックしたときのファンクションをまとめて指定
  $('ul.nav.nav-tabs.row li').click ->
#.index()を使いクリックされたタブが何番目かを調べ、
#		indexという変数に代入します。
    index = $('ul.nav.nav-tabs.row li').index(this)
    #コンテンツを一度すべて非表示にし、
    $('.tab-pane').css 'display', 'none'
    #クリックされたタブと同じ順番のコンテンツを表示します。
    $('.tab-pane').eq(index).show()
    #タブについているクラスselectを消し、
#    $('li#tab1').removeClass 'active'
#    $('li#tab2').removeClass 'active'
    $('ul.nav.nav-tabs.row li').removeClass 'active'
    #クリックされたタブのみにクラスselectをつけます。
    $(this).addClass 'active'
    return
  return


#ダイレクトリンク
$(document).on 'ready turbolinks:load', ->
#location.hashで#以下を取得 変数hashに格納
  hash = location.hash
  #hashの中に#tab～が存在するか調べる。
  hash = (hash.match(/^#sign_up|#login$/) or [])[0]
  #hashに要素が存在する場合、hashで取得した文字列（#tab2,#tab3等）から#より後を取得(tab2,tab3)
  if $(hash).length
    tabname = hash.slice(1)
  else
# 要素が存在しなければtabnameにtab1を代入する
    tabname = 'sign_up'
  #コンテンツを一度すべて非表示にし、
  $('.tab-pane').css 'display', 'none'
  #一度タブについているクラスselectを消し、
  $('.nav.nav-tabs.row li').removeClass 'active'
  tabno = $('ul.nav.nav-tabs.row li#' + tabname).index()
  #クリックされたタブと同じ順番のコンテンツを表示します。
  $('.tab-pane').eq(tabno).show()
  #クリックされたタブのみにクラスselectをつけます。
  $('ul.nav.nav-tabs.row li').eq(tabno).addClass 'active'
  return





