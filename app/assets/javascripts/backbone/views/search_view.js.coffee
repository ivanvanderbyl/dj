class Dj.Views.SearchView extends Backbone.View
  el: '#search'
  template: JST["backbone/templates/search/input_box"]

  initialize: ->
    @render()

  render: ->
    $(@el).append(@template())

    input = @$('input[type="search"]')

    input.autocomplete
      source: '/playlists/search'
      minLength: 0
      focus: (event, ui) ->
          input.val ui.item.label
          false

      select: (event, ui) ->
          console.log(ui.item)
          # $("#project").val ui.item.label
          # $("#project-id").val ui.item.value
          # $("#project-description").html ui.item.desc
          # $("#project-icon").attr "src", "images/" + ui.item.icon
          false

    input.data("autocomplete")._renderItem = (ul, item) ->
      result_template = JST["backbone/templates/search/result_item"](item)
      $("<li></li>").data("item.autocomplete", item).append(result_template).appendTo ul
