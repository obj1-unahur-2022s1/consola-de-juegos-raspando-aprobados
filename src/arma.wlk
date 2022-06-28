import wollok.game.*
import juego.*

class Arma {

	var property armaTomada = false
	const property position

	method image() = "arma2.png"
	
	method tePuedePisar(unObjeto) = true
	
	method producirAccion(){
		game.sound("armaduraequipar.mp3").play()
		game.removeVisual(self)
		player.estaArmado(true)
	}
}

/*class Escudo inherits Arma {
   override method image() = "escudo.png" */
