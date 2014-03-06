# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $fishing_date = $('#fishing_log_fishing_date')
  $fishing_date.prop('name', '')
  $fishing_date.datepicker
    altFormat: "yy-mm-dd",
    dateFormat: "yy年mm月dd日(D)",
    altField: '#fishing_date-alt'
  selected_val = $('#fishing_date-alt').val()
  if (selected_val)
    $fishing_date.val($.datepicker.formatDate('yy年mm月dd日(D)', new Date(selected_val)))
