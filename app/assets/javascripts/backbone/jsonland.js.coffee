#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./routers

window.Jsonland =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: ->
    @router = new Jsonland.Routers.main()
    Backbone.history.start({pushState: true})

$ ->
  Jsonland.init()

App = window.Jsonland

App.jsonize = (obj) ->
  result = {}
  $.each obj.serializeArray(), (_, kv) ->
    rails_field = kv.name.match(/[^[\]]+(?=])/g)
    if rails_field
      name = rails_field[0]
    else
      name = kv.name
    result[name] = kv.value
  result