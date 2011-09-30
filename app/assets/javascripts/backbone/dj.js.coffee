#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Dj =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

  init: ->
    Dj.header = new Dj.Views.SearchView

    r = new Dj.Models.RequestCollection(requests)
    Dj.playlist = new Dj.Views.Playlists.IndexView(collection: r)

$ ->
  Dj.init()