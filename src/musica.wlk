import wollok.game.*
import juego.*

object musicaNivel{
	var property music = game.sound("nivel1.mp3")

	method play(){
		music.shouldLoop(true)
		game.schedule(100, { music.play()} ) // lo baje a 100
	}
	method stop(){
		music.stop()
	}
	method pause(){
		music.pause()
	}
}




 //     keyboard.plusKey().onPressDo({sonido1.volume(1)})
//		keyboard.minusKey().onPressDo({sonido1.volume(0.5)})
//		keyboard.p().onPressDo({sonido1.volume(0)})
