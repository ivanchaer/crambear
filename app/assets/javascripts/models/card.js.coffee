App.Card = DS.Model.extend
  cardSet: DS.belongsTo 'App.CardSet'

  front: DS.attr 'string'
  back: DS.attr 'string'
  labelIds: DS.attr 'array'
