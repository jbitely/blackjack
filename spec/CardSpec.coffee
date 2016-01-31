assert = chai.assert
card = null

describe "card", ->
  describe "flip", ->
    it "should flip a card", ->
      card = new Card
        rank: card % 13
        suit: Math.floor(card / 13)
      assert.notStrictEqual card.get('revealed'), card.flip().get('revealed')
