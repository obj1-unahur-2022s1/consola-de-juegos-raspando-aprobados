import wollok.game.*



class Arma {
	
	var property armaTomada = false
	const property position
	const property esArma = true
	const property esEnemigo = false
	const property esVida = false
	
	method image() = "arma2.png"
	
	method tePuedePisar(unObjeto) = true
	
	method producirAccion(){
		game.removeVisual(self)
		
	}
}