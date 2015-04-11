class window.Blackjack extends Backbone.Model

  initialize: ->
    #add game logic here
    @set 'deck', new Deck()
    @set 'playerHand', @.get('deck').dealPlayer([@.get('deck').pop(), @.get('deck').pop()])
    @set 'dealerHand', @.get('deck').dealDealer([@.get('deck').pop().flip(), @.get('deck').pop()])

    @checkScores()

  checkScores: ->
    #retrieve scores from all players
    playerScore = @.get('playerHand').bjScores()
    dealerScore = @.get('dealerHand').bjScores()

    if playerScore.indexOf(21) > -1
      @blackjack()

    else if playerScore[0] > 21 or dealerScore[0] > 21
      @bust()
