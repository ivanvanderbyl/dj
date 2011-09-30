class Dj.Views.SearchView extends Backbone.View
  el: '#search'
  template: JST["backbone/templates/search/input_box"]

  initialize: ->
    @render()

  render: ->
