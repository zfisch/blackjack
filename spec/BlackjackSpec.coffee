assert = chai.assert
expect = chai.expect

describe 'blackjack', ->
  deck = null
  hand = null
  game = null
  playerHand = null
  dealerHand = null
  blackjack = null
  bust = null

  beforeEach ->
    game = new Blackjack()
    playerHand = game.get 'playerHand'
    dealerHand = game.get 'dealerHand'
    blackjack = game.get 'blackjack'
    bust = game.get 'bust'

  describe 'on new game', ->
    it 'player should have two starting cards', ->
      assert.strictEqual playerHand.length, 2

    it 'dealer should have two starting cards', ->
      assert.strictEqual dealerHand.length, 2

    it 'there is a blackjack method', ->
      expect('blackjack').to.exist

    it 'there is a bust method', ->
      expect('bust').to.exist

  describe 'on blackjack', ->
    it 'player score should be 21', ->
      # playerHand =
      expect(playerHand.bjScores().indexOf(21) > -1).to.be.true
