import wollok.game.*
import niveldejuego.*
import playerdeljuego.*



class Meta {
	const property position
	
	method movete(direccion) { /* No pasa naranja */ }
	method tePuedePisar(unObjeto) = true
	method image() = "metafinal.png"
	method producirAccion(){
		nivel1.terminar()
		game.say(player, "juego terminado")
	}

}