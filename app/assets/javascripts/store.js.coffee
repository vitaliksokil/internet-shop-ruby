$(document).on "ready page:change", ->
$('.card .img > img').click ->
$(this).parent().find(':submit').click()