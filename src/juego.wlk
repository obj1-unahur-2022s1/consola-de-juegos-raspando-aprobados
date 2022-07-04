import wollok.game.*
import direcciones.*
import arma.*
import vidas.*
import musica.*
import niveles.*


object player {
	
	var property position = game.at(0,11)
	var property direccion = abajo
	var property estaArmado = false
	var property nivel = 1
	var  property vidas = 3
	const property esPared = false
	
	method image() {
		if (self.estaArmado())
		  return "guerrero.png"
		 else 
		  return "guerreroSinArma.png"
	}
	   
	
	method mensaje() = "Necesito poder defenderme"
	
//Intento de collide----------------------------------
    
    method vidasActuales() = vidas
    
   method pierdeVida(){
   		vidas = vidas - 1
		game.removeVisual(self)
		self.resetPosition()
		if(vidas == 2){
			barraVida.dosCorazones()	
		}
		else if(vidas == 1){
			barraVida.unCorazon()
			
		}
		else{
			game.clear()
			musicaNivel.stop()
//			musicaPerder.play()
			game.addVisualIn(pantallaDePerder,game.at(0,0))
			pantallaDePerder.iniciarAnimacion()
		}
   }
   

   method agregarVida(){
   		vidas = vidas + 1
   		if(vidas >= 3){
   			barraVida.image("barraVidasLlena.png")
   		}
   		else if(vidas == 2){barraVida.dosCorazones()}
   		else{barraVida.unCorazon()}
   }

	method resetPosition() {
		position = game.at(0, 11)
		game.addVisual(self)
	}
	
	method pasarDeNivel(){
		if(nivel==1){
			nivel=2
			nivel2.configuracion()}
		else if(nivel==2){
			nivel=3
			nivel3.configuracion()}
		else if(nivel==3){
			game.clear()
			musicaNivel.stop()
//			musicaFinal.play()
			game.addVisualIn(pantallaDeVictoria,game.at(0,0))
			pantallaDeVictoria.iniciarAnimacion()	
		}
	}
	

	method retrocede() {
		position = direccion.opuesto().siguiente(position)
	}
	
	method irArriba() {
		direccion = arriba
		self.validarLugarLibre(direccion)
		self.avanzar()
	}
	

	method irAbajo() {
		direccion = abajo
		self.validarLugarLibre(direccion)
		self.avanzar()
	}

	method irIzquierda() {
		direccion = izquierda
		self.validarLugarLibre(direccion)
		self.avanzar()
	}

	method irDerecha() {
		direccion = derecha
		self.validarLugarLibre(direccion)
		self.avanzar()
	}
	
	method avanzar() {
		position = direccion.siguiente(position)
	}
	
	method validarLugarLibre(unaDireccion) {
		const posicionAlLado = unaDireccion.siguiente(position) 
		const lugarLibre = game.getObjectsIn(posicionAlLado).all{ obj => obj.tePuedePisar(self) } //obtengo objetos de la posicion de al lado 
																								  //y pregunta si lo puede pisar el jugador
		if (!lugarLibre) 																		  //si no hay lugar se lanza la excepcion con el mensaje
			throw new Exception(message = "NO PUEDES MOVERTE AHI.")
	
	}

}
