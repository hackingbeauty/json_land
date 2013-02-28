class Jsonland.Collections.Comments extends Backbone.Collection
  model: Jsonland.Models.Comment
  url: '/api/comments'

  parse: (response) ->
    response.comments