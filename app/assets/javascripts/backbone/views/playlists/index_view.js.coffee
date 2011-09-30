Dj.Views.Playlists ||= {}
class Dj.Views.Playlists.IndexView extends Backbone.View
  el: '#stage'
  template: JST["backbone/templates/playlists/index"]

  initialize: ->
    @collection = @options.collection
    @collection.bind 'add', =>
      @render()

    @render()

  render: ->
    $(@el).html(@template(requests: @collection.toJSON()))