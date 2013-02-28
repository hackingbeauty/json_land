class Jsonland.Views.Posts extends Backbone.View
  initialize: ->
    @collection = new Jsonland.Collections.Posts()
    @collection.fetch()
    @collection.on 'reset', @render, @
    @collection.on 'add', @render, @
    @form = ""

  events:
    'click .create-new':'create'

  addOne: (post) ->
    view = new Jsonland.Views.Post(model: post)
    ($ "#posts-table").prepend view.render().el

  render: ->
    @$el.html HandlebarsTemplates['posts']({})
    ($ "#create_new").prepend HandlebarsTemplates['new_post']({})

    @collection.each(@addOne, @)
    @

  create: (e) ->
    title = $("#new-post input").val()
    body = $("#new-post textarea").val()
    e.preventDefault()
    @collection.create
      title:title
      body:body
    $(@form).find("input").val("")
    $(@form).find("textarea").val("")