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
    

$ ->
  Dj.init()