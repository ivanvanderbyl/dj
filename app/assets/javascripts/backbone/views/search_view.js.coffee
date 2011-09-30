class Dj.Views.SearchView extends Backbone.View
  el: '#search'
  template: JST["backbone/templates/search/input_box"]

  initialize: ->
    @render()

  render: ->
    self = @
    $(@el).append(@template())

    input = @$('input[type="search"]')

    input.autocomplete
      source: '/playlists/search'
      minLength: 0
      focus: (event, ui) ->
        input.val ui.item.label
        false

      select: (event, ui) ->
        self.makeRequest(ui.item)
        false

    input.data("autocomplete")._renderItem = (ul, item) ->
      result_template = JST["backbone/templates/search/result_item"](item)
      $("<li></li>").data("item.autocomplete", item).append(result_template).appendTo ul

  makeRequest: (item) ->
    model = new Dj.Models.Request(item)
    console.log model.attributes

    c = new Dj.Models.RequestCollection
    c.create request: model
