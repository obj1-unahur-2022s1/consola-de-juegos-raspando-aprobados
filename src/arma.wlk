import wollok.game.*
import juego.*

class Arma {
	
	var property armaTomada = false
	const property position
	const property esArma = true
	const property esEnemigo = false
	const property esVida = false
	
	method image() = "arma2.png"
	
	method tePuedePisar(unObjeto) = true
	
	method producirAccion(unPlayer){
		game.sound("armaduraequipar.mp3").play()
		game.removeVisual(self)
		unPlayer.estaArmado(true)
	}
}
