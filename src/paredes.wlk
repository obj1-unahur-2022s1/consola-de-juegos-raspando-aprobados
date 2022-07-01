import wollok.game.*
import juego.*

class Pared {
	var property position
	const property esEnemigo = false
	const property esPared = true
	const property esArma = false
	const property esVida = false
	

	method tePuedePisar(unObjeto) = false
	method image() ="muro.png"


	method producirAccion(unPlayer){
		unPlayer.validarLugarLibre(unPlayer.direccion())
		}

}
