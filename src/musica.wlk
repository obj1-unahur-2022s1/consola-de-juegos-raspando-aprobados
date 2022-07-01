import wollok.game.*
import juego.*

object musicaNivel{
	var property ost = game.sound("musicaGame.mp3")

	method play(){
		ost.shouldLoop(true)
		game.schedule(100, { ost.play()} ) // lo baje a 100
	}
	method stop(){
		ost.stop()
	}
}

object musicaFinal{
	var property ost = game.sound("victheme.mp3")

	method play(){
		ost.shouldLoop(true)
		game.schedule(500, { ost.play()} )
	}
}

object musicaPerder{
	var property ost = game.sound("loseTheme.mp3")

	method play(){
		ost.shouldLoop(true)
		game.schedule(500, { ost.play()} )
	}
}