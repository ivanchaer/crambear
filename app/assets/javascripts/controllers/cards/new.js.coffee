App.CardsNewController = Em.ObjectController.extend
  needs: ["cardSet","cardSetCards"]
  showCloseButton: Em.computed.alias("controllers.cardSetCards.hasCards")
  closeButtonLabel: "Close"
  startEditing: ->
    log.log "CardsNewController:startEditing"
    @transaction = @get('store').transaction()
    @set 'content', @transaction.createRecord(App.Card, {})

  stopEditing: ->
    if @transaction
      @transaction.rollback()

  actions:
    save: ->
      cardSet = @get("controllers.cardSet.content")
      @content.set("cardSet", cardSet)
      @transaction.commit();
      @startEditing()    #w/out this line, create card will remain target of editor

    cancel: ->
      log.log "cancel CardsNewCont"
      @stopEditing()
      @set "controllers.cardSet.isAddingNew", false

