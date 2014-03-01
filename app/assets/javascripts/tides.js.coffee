# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#port-select-dialog').dialog({
    autoOpen: false,
    modal: true,
    height: 400,
    width: 400
  })
  $('#port-select-button').click -> 
    $('#port-select-dialog').dialog('open')

  $('#tide-date-select-target').datepicker({
    dateFormat: 'yy/mm/dd',
    onSelect: ->
      $('#tide-date-select-button > span').text(this.value)
  })
  $('#tide-date-select-button').click ->
    $('#tide-date-select-target').datepicker('show')
  $('#port-select-button').on 'ajax:success', (data,result,xhr) ->
    $('#port-select-dialog').html(result)
  $(document).on 'ajax:success', '#port-select-dialog > ol.breadcrumb > li > a', (data,result,xhr) ->
    $('#port-select-dialog').html(result)
  $(document).on 'ajax:success', '#port-select-dialog > ul.region > li > a', (data,result,xhr) ->
    $('#port-select-dialog').html(result)
  $(document).on 'ajax:success', '#port-select-dialog > ul.pref > li > a', (data,result,xhr) ->
    $('#port-select-dialog').html(result)
  $(document).on 'click', '#port-select-dialog > ul.port > li > a', ->
    port_name = $(this).data('name')
    $('#port-select-button > span').text(port_name)
    $('#port-select-dialog').dialog('close')
    false

