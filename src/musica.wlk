import wollok.game.*
import juego.*

object musicaNivel{
	var property ost = game.sound("nivel1.mp3")

	method play(){
		ost.shouldLoop(true)
		game.schedule(100, { ost.play()} ) // lo baje a 100
	}
	method stop(){
		ost.stop()
	}
	method pause(){
		ost.pause()
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