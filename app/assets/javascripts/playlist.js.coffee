
$ ->
  $('#request_song').autocomplete
    source: '/playlists/search'
    minLength: 0
    focus: (event, ui) ->
        $("#request_song").val ui.item.name
        false

    select: (event, ui) ->
        console.log(ui.item)
        # $("#project").val ui.item.label
        # $("#project-id").val ui.item.value
        # $("#project-description").html ui.item.desc
        # $("#project-icon").attr "src", "images/" + ui.item.icon
        false

  $('#request_song').data("autocomplete")._renderItem = (ul, item) ->
    $("<li></li>").data("item.autocomplete", item).append("<a>" + item.label + "<br>" + item.artist + "</a>").appendTo ul
