class Jsonland.Views.Post extends Backbone.View
  initialize: ->
    @model.on 'change', @render, @

  render: ->
    @$el.html HandlebarsTemplates['post'](@model.toJSON())
    @