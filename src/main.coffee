#this line has been refactored to allow game selection in the new App instance. Currently, only blackjack.coffee exists :)
new AppView(model: new App(game: new Blackjack())).$el.appendTo 'body'