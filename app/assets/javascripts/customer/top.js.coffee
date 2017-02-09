# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



## class btn btn-default btn-smに設定されたvalueを取得

# turbolinks 5から ready page:loadじゃなくなった。
#$(document).on "ready turbolinks:load", ->
#  $('.btn.btn-default.btn-sm').on 'click', ->
#    selectNo = $(this).attr('value')
#    #alert selectNo
#    #ajaxリクエストを送信
#    $.ajax
#      url: 'profile/change' #送信先
#      type: 'GET'          #送信するリクエスト
#      data: value: selectNo #送信するパラメータ params[:value]でurlで指定されたcontrollerで取得できる
#      success: (data) ->
##        alert 'success'
#        return
#      error: (data) ->
#        alert 'error'
#        return
#    return
#  return


#$ ->
#  $('.form-group').validate
#    rules:
#      'customer_profile_form[email]':
#        required: true
#        email: true
#    messages:
#      required: 'メールアドレスを入力してください。'
#      email: '正しいメールアドレスを入力してください'
#  return

#$(document).on "ready turbolinks:load", ->
#  $('form').validate
#    rules:
#      name: required: true
#      mail:
#        required: true
#        email: true
#      url: required: true
#    messages:
#      name: required: 'お名前を入力してください'
#      mail:
#        required: 'メールアドレスを入力してください'
#        email: '正しいメールアドレスを入力してください'
#      url: required: 'URLを入力してください'
#  return

#$(document).on 'ready turbolinks:load', ->
#  $('#new_customer_profile_form.new_customer_profile_form').on( 'ajax:success', (event, data, status, xhr) ->
#  #フラッシュメッセージ付きでリダイレクトするだけなので、success時は何もしない
#  alert '呼ばれませんでした！'
#  ).on 'ajax:error', (event, xhr, status, error) ->
#    alert '呼ばれました！'
#    message = xhr.responseText
#    $('.js-error-container').html(message)
#  return

#$(document).on 'ready turbolinks:load', ->
#  $('#new_customer_profile_form.new_customer_profile_form').on 'ajax:error', (event, xhr) ->
#    alert 'ajaxエラー'
#    $('#image-new-error-message').removeClass('hide').show()
#    errors = JSON.parse(xhr.responseText).errors
#    $.each errors, (k, v) ->
#      $('#errors ul').append '<li>' + v + '</li>'
#      $('#image_' + k).closest('.form-group').addClass('has-error')
#
#$(document).on 'ready turbolinks:load', ->
#  $('#new_customer_profile_form.new_customer_profile_form').on 'ajax:success', ->
#    alert 'ajax_success'
#    $('#image-new-error-message').hide()
#    $('#errors ul').empty()
#    $('#new_customer_profile_form.new_customer_profile_form').find('.form-group').removeClass('has-error')
#
#$(document).on 'ready turbolinks:load', ->
#  $('#new_customer_profile_form.new_customer_profile_form').on 'ajax:before', ->
#    alert 'ajax_before'
#    $('#image-new-error-message').hide()
#    $('#errors ul').empty()
#    $('#new_customer_profile_form.new_customer_profile_form').find('.form-group').removeClass ('has-error')

#$(document).on 'ajax:success','#col', (xhr, data, status) ->
#  location.relaod()
