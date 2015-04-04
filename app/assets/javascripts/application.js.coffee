# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require_tree .

$(document).on 'click', '.js_background', (e) ->
  e.preventDefault()
  $('.selected_background').removeClass('selected_background')
  src = $(e.currentTarget).data('img')
  id = $(e.currentTarget).data('id')
  $(e.currentTarget).addClass('selected_background')
  $('.js_big_background').attr('src', src)
  url = $('.js_next_step_link').attr('href').split('=')[0] + "=#{id}"
  $('.js_next_step_link').attr('href', url)

$(document).on 'click', '.js_make_aphorism', (e) ->
  e.preventDefault()
  txt = $('#aphorism_input').val()
  color = '#' + $('#picture').val()
  align = $("input[type='radio']:checked").val()
  id = $(e.currentTarget).data('bkg')
  $.ajax(
    type: 'POST'
    dataType: 'json'
    url: '/make_aphorism'
    data:
      image: id
      description: txt
      color: color
      align: align
  ).done (msg) ->
    window.location = msg.url
