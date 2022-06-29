import wollok.game.*
import paredes.*
import juego.*
import meta.*
import arma.*
import enemigos.*
import direcciones.*

object barraCorazones{	
	var property position = game.at(7,3)
	var property image = "barraVidasLlena.png"
	
	method cambiarACorazones2(){
		image="barraVidas2.png"
	}
	
	method cambiarACorazones1(){
		image="barraVidas1.png"
	}
	method agregarCorazones(){
		game.addVisual(self)
	}
	
	
}

object vida {
	var property position = game.at(7,3)
	var property image
	method agregarCorazon(){image = "vida.png"}
}


/*class Vida {

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
*/






















/*import wollok.game.*
import juego.*

class Vida {

	const property position
	
	method image() = "vida.png"
	
	method tePuedePisar(unObjeto) = true
	
	method producirAccion(){
		player.agregarVida()
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
        } else if (player.vidasActuales() == 3){
	 	  return "barraVidasLlena.png"
	 	}
	 	else {
	 		return ""
	 	}
    }
    
    method tePuedePisar(unObjeto) = false
}*/