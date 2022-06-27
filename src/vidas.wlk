import wollok.game.*
import juego.*

class Vida {

	const property position
	const property esArma = false
	const property esEnemigo = false
	const property esVida = true
	
	method image() = "vida.png"
	
	method tePuedePisar(unObjeto) = true
	
	method producirAccion(){
		game.removeVisual(self)
	}
}

class BarraVida {
	
	const property position
	
	method image() { 
		 if(player.vidasActuales() == 2){
	 	  return "barraVidas2.png" 
		} else if(player.vidasActuales() == 1){
	 	  return "barraVidas1.png" 
        } else if(player.vidasActuales() == 0){
	 	  return "barraVidas0.png" 
	 	} else return "barraVidasLlena.png"
    }
    
    method tePuedePisar(unObjeto) = false
}