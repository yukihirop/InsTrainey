# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



# validationのエラーメッセージを表示する(edit_email)
$(document).on 'ajax:error', '#new_customer_profile_form.new_customer_profile_form', (event, xhr, status, error) ->
  form = $('#new_customer_profile_form.new_customer_profile_form')
  div = $('<div id="emailValidateErrors" class="alert alert-danger"></div>')
  ul = $('<ul></ul>')
  #alert xhr.responseText
  res = $.parseJSON(xhr.responseText)

  $.each res.messages, (index, message) ->
    li = $('<li></li>').text(message)
    ul.append(li)

  if $("#emailValidateErrors")[0]
    $('#emailValidateErrors').html(ul)
  else
    div.append(ul)
    form.prepend(div)
    return

# validationのエラーメッセージを表示する(edit_name)
$(document).on 'ajax:error', 'form[id^=edit_customer_].name', (event, xhr, status, error) ->
  form = $('form[id^=edit_customer_].name')
  div = $('<div id="nameValidateErrors" class="alert alert-danger"></div>')
  ul = $('<ul></ul>')

#  alert xhr.responseText

  res = $.parseJSON(xhr.responseText)

  $.each res.messages, (index, message) ->
    li = $('<li></li>').text(message)
    ul.append(li)

  if $("#nameValidateErrors")[0]
    $('#nameValidateErrors').html(ul)
  else
    div.append(ul)
    form.prepend(div)



# validationのエラーメッセージを表示する(edit_password)
$(document).on 'ajax:error', 'form#new_customer_profile_form.password', (event, xhr, status, error) ->
  form = $('form#new_customer_profile_form.password')
  div = $('<div id="passwordValidateErrors" class="alert alert-danger"></div>')
  ul = $('<ul></ul>')

#  alert xhr.responseText

  res = $.parseJSON(xhr.responseText)

  $.each res.messages, (index, message) ->
    li = $('<li></li>').text(message)
    ul.append(li)

  if $("#passwordValidateErrors")[0]
    $('#passwordValidateErrors').html(ul)
  else
    div.append(ul)
    form.prepend(div)
