class Jsonland.Models.Post extends Backbone.Model
  urlRoot: "/api/posts"

  initialize: ->
    comments_json = (@get 'comments') || []
    @comments = new Jsonland.Collections.Comments(comments_json)
    @comments.url = "/api/posts/#{@id}/comments"

