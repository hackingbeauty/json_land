class Jsonland.Routers.main extends Backbone.Router

  initialize: ->
    alert "backbone is started"

  routes:
    'posts'       : 'posts'
    '/'       : 'index'

  posts: ->
    @view = new Jsonland.Views.Posts
      el:"#content"

  index: ->
    alert "Going to posts, baby"
    @posts()