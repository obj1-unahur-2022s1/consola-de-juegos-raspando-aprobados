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