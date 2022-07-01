import wollok.game.* 
import juego.*


class Meta {
	const property position
	
	method tePuedePisar(unObjeto) = true
	
	method image() = "metafinal.png"
	
	method producirAccion(unPlayer){
		game.sound("meta.mp3").play()
	  	unPlayer.pasarDeNivel()
	  	unPlayer.resetPosition()
	}
	

}
