class Dj.Models.Request extends Backbone.Model
  urlRoot: '/playlists'
  
class Dj.Models.RequestCollection extends Backbone.Collection
  url: '/playlists'