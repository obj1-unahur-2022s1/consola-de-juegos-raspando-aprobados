import wollok.game.*
import juego.*

class Vida {

	const property position
	
	method image() = "vida.png"
	
	method tePuedePisar(unObjeto) = true
	
	method producirAccion(){
		game.removeVisual(self)
		player.agregarVida()
	}
}
