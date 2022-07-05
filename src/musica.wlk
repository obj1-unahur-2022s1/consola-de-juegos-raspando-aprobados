import wollok.game.*
import juego.*

object musicaNivel{
	var property music = game.sound("nivel1.mp3")

	method play(){
		music.shouldLoop(true)
		game.schedule(100, { music.play()} ) 
	}
	method stop(){
		music.stop()
		
	}
	method pause(){
		music.pause()
	}
}




