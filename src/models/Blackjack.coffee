class window.Blackjack extends Backbone.Model

  dealerScore = []
  playerScore = []

  initialize: ->
    #add game logic here
    @set 'deck', new Deck()
    @set 'playerHand', @.get('deck').dealPlayer([@.get('deck').pop(), @.get('deck').pop()])
    @set 'dealerHand', @.get('deck').dealDealer([@.get('deck').pop().flip(), @.get('deck').pop()])

    @checkScores()

    @get('playerHand').on("add", @checkScores, @)
    @get('dealerHand').on("add", @checkScores, @)
    @get('playerHand').on("endTurn", @dealerTurn, @)

  dealerTurn: ->
    if dealerScore[1] < 17 && dealerScore[0] < 17
      @.get('dealerHand').draw()
      @dealerTurn()
    else
      @endGame()

  endGame: ->
    
    #choose best score for player
    if playerScore[1] > 21
      playerScore = playerScore[0]
    else
      playerScore = playerScore[1]
    
    #choose best score for dealer
    if dealerScore[1] > 21
      dealerScore = dealerScore[0]
    else
      dealerScore = dealerScore[1]

    #decide winner
    if playerScore > 21 and dealerScore > 21
      @tie()
    else if playerScore > 21
      @lose()
    else if dealerScore > 21
      @win()
    else if playerScore > dealerScore 
      @win()
    else if playerScore == dealerScore
      @tie()
    else
      @lose()

  checkScores: ->
    #retrieve scores from all players
    playerScore = @.get('playerHand').bjScores()
    dealerScore = @.get('dealerHand').bjScores()

    if playerScore.indexOf(21) > -1
      @endGame()

    else if playerScore[0] > 21 or dealerScore[0] > 21
      @endGame()

  win: ->
    alert('you win!')
    debugger
  tie: ->
    alert('tie!')
    debugger
  lose: ->
    alert('you lose!')
    debugger