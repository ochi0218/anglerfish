# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# 港選択ダイアログを設定する。
setup_port_select = ->
  $port_select_dialog = $('#port-select-dialog')
  $port_select_button = $('#port-select-button')

  $port_select_dialog.dialog({
    autoOpen: false,
    modal: true,
    height: 400,
    width: 400,
    open: (event, ui) ->
      $(this).parent().find('.ui-dialog-titlebar-close').text('x')

  })
  $port_select_button.click -> 
    $port_select_dialog.dialog('open')
  $port_select_button.on 'ajax:success', (data,result,xhr) ->
    $port_select_dialog.html(result)
  $doc = $(document)
  $doc.on 'ajax:success', '#port-select-dialog > ol.breadcrumb > li > a', (data,result,xhr) ->
    $port_select_dialog.html(result)
  $doc.on 'ajax:success', '#port-select-dialog > ul.region > li > a', (data,result,xhr) ->
    $port_select_dialog.html(result)
  $doc.on 'ajax:success', '#port-select-dialog > ul.pref > li > a', (data,result,xhr) ->
    $port_select_dialog.html(result)
  $(document).on 'click', '#port-select-dialog > ul.port > li > a', ->
    port_name = $(this).data('name')
    $port_select_button.find('span').text(port_name)
    $port_select_dialog.dialog('close')

    $tide_search_form = $('#tide-search-form')
    $tide_search_form.find('input.port_name').val(port_name)
    $tide_search_form.submit()

    false

# 潮汐日選択ピッカーを設定する。
setup_tide_date_select = ->
  $tide_date_select = $('#tide-date-select-target')
  $tide_date_select_alt = $('#tide-date-select-target-alt')
  $tide_date_select_button = $('#tide-date-select-button')

  $tide_date_select.datepicker({
    altField: '#tide-date-select-target-alt',
    altFormat: 'yy-mm-dd',
    dateFormat: 'yy年mm月dd日(D)',
    onSelect: ->
      $tide_date_select_button.find('span').text(this.value)
      date = $.datepicker.formatDate('yy-mm-dd', $tide_date_select.datepicker('getDate'))
      $tide_search_form = $('#tide-search-form')
      $tide_search_form.find('input.date').val(date)
      $tide_search_form.submit()
  })
  $tide_date_select_button.click ->
    $tide_date_select.datepicker('setDate', $.datepicker.parseDate('yy-mm-dd', $tide_date_select_alt.val()))
    $tide_date_select.datepicker('show')

# 釣果入力ボタンを設定する。
setup_new_fishing_log = ->
  $new_fishing_log_link = $('#new-fishing-log-link')
  $new_fishing_log_form = $('#new-fishing-log-form')
  $new_fishing_log_link.click ->
    $tide_search_form = $('#tide-search-form')

    $new_fishing_log_form.find('input.date').val($tide_search_form.find('input.date').val());
    $new_fishing_log_form.find('input.port_name').val($tide_search_form.find('input.port_name').val());
    $new_fishing_log_form.submit()
    false

$ ->
  setup_port_select()
  setup_tide_date_select()
  setup_new_fishing_log()

  true
