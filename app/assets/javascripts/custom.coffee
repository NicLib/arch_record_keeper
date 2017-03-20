$(document).on 'turbolinks:load', ->
    $('tr[data-link]').click ->
        window.location = $(this).data('link')
