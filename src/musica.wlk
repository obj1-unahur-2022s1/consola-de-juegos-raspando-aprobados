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
	var property ost = game.sound("musicaGanar.mp3")

	method play(){
		ost.shouldLoop(true)
		game.schedule(100, { ost.play()} )
	}
}

object musicaPerder{
	var property ost = game.sound("musicaPerder.mp3")

	method play(){
		ost.shouldLoop(true)
		game.schedule(100, { ost.play()} )
	}
}

 //     keyboard.plusKey().onPressDo({sonido1.volume(1)})
//		keyboard.minusKey().onPressDo({sonido1.volume(0.5)})
//		keyboard.p().onPressDo({sonido1.volume(0)})
