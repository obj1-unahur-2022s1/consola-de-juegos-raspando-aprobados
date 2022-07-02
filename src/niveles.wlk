import wollok.game.*
import paredes.*
import juego.*
import vidas.*
import enemigos.*
import meta.*
import arma.*
import direcciones.*
import musica.*
import arma.*

object pantallaDeInicio{
	var imagen = false
	method iniciarAnimacion(){
		game.onTick(800,"Pantalla menu",{self.cambiar()})
	}
	method terminarAnimacion(){
		game.removeTickEvent("Pantalla menu")
	}
	method cambiar(){
		if(imagen)
			imagen = false
		else
			imagen = true
	}
	method image() {
		if(imagen)
			return "menu principal2.png"
		else
			return "menu principal1.png"
	}
}

object pantallaDePerder{

	var imagen = false
	method iniciarAnimacion(){
		game.onTick(400,"Pantalla Derrota",{self.cambiar()})
	}
	method terminarAnimacion(){
		game.removeTickEvent("Pantalla Derrota")
	}
	
	method cambiar(){
		if(imagen)
			imagen = false
		else
			imagen = true
	}
	method image(){
		if(imagen)
			return "finalJuego.png"
		else
			return "finalJuego2.png"
	}

}

	
object pantallaDeVictoria{
	var imagen = false
	method iniciarAnimacion(){
		game.onTick(300, "Pantalla victoria",{self.cambiar()})
	}
	method terminarAnimacion(){
		game.removeTickEvent("Pantalla victoria")
	}
	method cambiar(){
		if(imagen)
			imagen = false
		else
			imagen = true
	}
	method image(){
		if(imagen)
			return "victoria1.png"
		else
			return "victoria2.png"
	}
}


class Nivel{

const property sonido1 = game.sound("nivel1.mp3")

	
	method configuracion() {
		
        keyboard.plusKey().onPressDo({sonido1.volume(1)})
		keyboard.minusKey().onPressDo({sonido1.volume(0.5)})
		keyboard.p().onPressDo({sonido1.volume(0)})
		game.clear()
		
//	PAREDES
		const ancho = game.width() - 1
		const largo = game.height() - 1
	
		var posteParedes = []
		
		(0 .. ancho).forEach{ n => posteParedes.add(new Position(x=n, y=0)) } // bordeAbajo
		(0 .. ancho).forEach{ n => posteParedes.add(new Position(x=n, y=largo)) } // bordeArriba 
		(0 .. largo).forEach{ n => posteParedes.add(new Position(x=0, y=n)) } // bordeIzq 
		(0 .. largo).forEach{ n => posteParedes.add(new Position(x=ancho, y=n)) } // bordeDer
		
		posteParedes.remove(new Position(x=0,y=11))//bordeAbajo - la entrada
		posteParedes.remove(new Position(x=23,y=2))//bordeArriba - la salida
		
		posteParedes.forEach{p=>game.addVisual(new Pared(position=p))}
		

		
		self.individuos()
		}
		
		method crear(dibujo) {
		game.addVisual(dibujo)
		return dibujo
		}
		
	   method individuos(){}
	
}



object nivel1 inherits Nivel{
			
	override method configuracion() {
			
		super()
		
		var posicionParedes = []
				
		posicionParedes.addAll([new Position(x=6,y=1),new Position(x=10,y=1),new Position(x=21,y=1), new Position(x=22,y=1),
			                    new Position(x=11,y=1), new Position(x=18,y=1)])	
			
		posicionParedes.addAll([new Position(x=2,y=2), new Position(x=4,y=2), new Position(x=8,y=2), new Position(x=11,y=2),new Position(x=13,y=2),
		                        new Position(x=14,y=2), new Position(x=15,y=2), new Position(x=16,y=2), new Position(x=20,y=2)])
		
		posicionParedes.addAll([new Position(x=2,y=3),new Position(x=3,y=3),new Position(x=4,y=3),new Position(x=6,y=3),new Position(x=7,y=3),
			                    new Position(x=8,y=3),new Position(x=9,y=3),new Position(x=13,y=3),new Position(x=16,y=3),new Position(x=17,y=3),new Position(x=18,y=3),
			                    new Position(x=18,y=3),new Position(x=19,y=3),new Position(x=20,y=3), new Position(x=21,y=3)])
		
		posicionParedes.addAll([new Position(x=2,y=4), new Position(x=6,y=4), new Position(x=8,y=4),new Position(x=11,y=4),new Position(x=15,y=4)
			                   ,new Position(x=16,y=4),new Position(x=21,y=4)])
		
		posicionParedes.addAll([new Position(x=4,y=5), new Position(x=6,y=5),new Position(x=9,y=5), new Position(x=10,y=5),new Position(x=11,y=5),
			                    new Position(x=12,y=5),new Position(x=13,y=5), new Position(x=16,y=5),new Position(x=18,y=5), new Position(x=20,y=5),
			                    new Position(x=21,y=5)])
			                                    
		posicionParedes.addAll([new Position(x=1,y=6), new Position(x=4,y=6),new Position(x=2,y=6),new Position(x=13,y=6),new Position(x=16,y=6),new Position(x=18,y=6),
			                    new Position(x=21,y=6)])
		
		posicionParedes.addAll([new Position(x=4,y=7),new Position(x=5,y=7),new Position(x=6,y=7),new Position(x=8,y=7), new Position(x=9,y=7),
                                new Position(x=10,y=7),new Position(x=11,y=7),new Position(x=13,y=7),new Position(x=14,y=7), new Position(x=15,y=7),
                                new Position(x=16,y=7),new Position(x=19,y=7),new Position(x=21,y=7)])

			                                    
		posicionParedes.addAll([new Position(x=2,y=8), new Position(x=6,y=8),new Position(x=9,y=8),new Position(x=16,y=8),new Position(x=17,y=8),
			                    new Position(x=19,y=8)])
			              
	   posicionParedes.addAll([new Position(x=2,y=9),new Position(x=4,y=9),new Position(x=5,y=9),new Position(x=6,y=9), new Position(x=8,y=9),
                               new Position(x=9,y=9),new Position(x=10,y=9),new Position(x=12,y=9),new Position(x=13,y=9),new Position(x=14,y=9),
                               new Position(x=16,y=9),new Position(x=19,y=9),new Position(x=20,y=9),new Position(x=21,y=9)])
                                
       posicionParedes.addAll([new Position(x=1,y=10), new Position(x=2,y=10),new Position(x=8,y=10),new Position(x=12,y=10),new Position(x=16,y=10),
			                   new Position(x=18,y=10)])     
			                                    
       posicionParedes.addAll([new Position(x=4,y=11), new Position(x=5,y=11),new Position(x=6,y=11),new Position(x=8,y=11),new Position(x=10,y=11),
			                   new Position(x=14,y=11), new Position(x=18,y=11),new Position(x=20,y=11),new Position(x=22,y=11)])                      
		
	
		posicionParedes.forEach { p => self.crear(new Pared(position = p)) }
		
		
//Colisiones		
		game.whenCollideDo(player, { elemento => elemento.producirAccion(player)									 
	     }) 
	     
	}
		
	override method individuos(){
//	player

		game.addVisual(player)
		game.say(player, player.mensaje())

//	teclado

 		keyboard.up().onPressDo{ player.irArriba() }
		keyboard.down().onPressDo{ player.irAbajo() }
		keyboard.left().onPressDo{ player.irIzquierda() }
		keyboard.right().onPressDo{ player.irDerecha() }

//	LLEGADAS
		var metas = [new Position(x=23, y=2)]
			.map{ p => self.crear(new Meta(position = p)) }		
	
//ARMA
		var armas = [new Position(x=12, y=1)]
			.map{ p => self.crear(new Arma(position = p)) }	
		
//Barra vidas

       	//var barraVidas = [new Position(x=6, y=8)]
		//	.map{ p => self.crear(new BarraVida(position = p))}
		game.addVisual(barraVida)
		
//Vidas	
	   	var vida = [new Position(x=3, y=2),new Position(x=1, y=9)]
			.map{ p => self.crear(new Vida(position = p))}	
		
//Enemigos		
		var enemigos = [new Position(x=1, y=1),new Position(x=4, y=1),new Position(x=14, y=1),new Position(x=22, y=2),
			            new Position(x=2, y=5),new Position(x=1, y=7),new Position(x=12, y=7),new Position(x=21, y=8),
			            new Position(x=7, y=10),new Position(x=17, y=11)]
	    
	    enemigos.map{p => self.crear(new Enemigo(position=p))}
	}

}


object nivel2 inherits Nivel{
			
	override method configuracion() {
			
		super()
		
		var posicionParedes = []
				
		posicionParedes.addAll([new Position(x=1,y=2), new Position(x=2,y=2), new Position(x=3,y=2),new Position(x=4,y=2),new Position(x=5,y=2),new Position(x=6,y=2)])
		posicionParedes.addAll([new Position(x=1,y=4), new Position(x=2,y=4), new Position(x=3,y=4),new Position(x=5,y=4),new Position(x=6,y=4),new Position(x=7,y=4)])
		posicionParedes.addAll([new Position(x=1,y=6), new Position(x=2,y=6), new Position(x=3,y=6),new Position(x=4,y=6),new Position(x=6,y=6)])
	    posicionParedes.addAll([new Position(x=1,y=7), new Position(x=6,y=7)])
		
	
		posicionParedes.forEach { p => self.crear(new Pared(position = p)) }
		
		
//Colisiones		
		game.whenCollideDo(player, { elemento => elemento.producirAccion(player)									 
	     }) 
	     
	}
		
	override method individuos(){
//	player

		game.addVisual(player)
		player.estaArmado(false)
		game.say(player, player.mensaje())

//	teclado

 		keyboard.up().onPressDo{ player.irArriba() }
		keyboard.down().onPressDo{ player.irAbajo() }
		keyboard.left().onPressDo{ player.irIzquierda() }
		keyboard.right().onPressDo{ player.irDerecha() }

//	LLEGADAS
		var metas = [new Position(x=2, y=8)]
			.map{ p => self.crear(new Meta(position = p)) }		
	
//ARMA
		var armas = [new Position(x=2, y=1)]
			.map{ p => self.crear(new Arma(position = p)) }	
		
//Barra vidas

       	//var barraVidas = [new Position(x=6, y=8)]
		//	.map{ p => self.crear(new BarraVida(position = p))}
		game.addVisual(barraVida)
		
//Vidas	
	   	var vida = [new Position(x=4, y=4),new Position(x=1, y=1),new Position(x=7, y=1)]
			.map{ p => self.crear(new Vida(position = p)) }	
		
//Enemigos		
		var enemigos = [new Position(x=7, y=2),new Position(x=4, y=3),new Position(x=1, y=4),new Position(x=6, y=5),new Position(x=4, y=7),new Position(x=3, y=7)]
			.map{ p => self.crear(new Enemigo(position = p)) } 	
	}

}

object nivel3 inherits Nivel{
			
	override method configuracion() {
			
		super()
		
		var posicionParedes = []
				
		posicionParedes.addAll([new Position(x=7,y=1)])
		posicionParedes.addAll([new Position(x=2,y=2), new Position(x=3,y=2), new Position(x=6,y=2),new Position(x=7,y=2)])
		posicionParedes.addAll([new Position(x=4,y=3),new Position(x=3,y=3)])
		posicionParedes.addAll([new Position(x=1,y=4), new Position(x=4,y=4),new Position(x=7,y=4)])
		posicionParedes.addAll([new Position(x=3,y=5),new Position(x=5,y=5)])
		posicionParedes.addAll([new Position(x=6,y=6)])
		posicionParedes.addAll([new Position(x=1,y=7), new Position(x=4,y=7)])
	
		posicionParedes.forEach { p => self.crear(new Pared(position = p)) }
		
		
//Colisiones		
		game.whenCollideDo(player, { elemento => elemento.producirAccion(player)									 
	     }) 
	     
	}
		
	override method individuos(){
//	player

		game.addVisual(player)
		player.estaArmado(false)
		game.say(player, player.mensaje())

//	teclado

 		keyboard.up().onPressDo{ player.irArriba() }
		keyboard.down().onPressDo{ player.irAbajo() }
		keyboard.left().onPressDo{ player.irIzquierda() }
		keyboard.right().onPressDo{ player.irDerecha() }

//	LLEGADAS
		var metas = [new Position(x=2, y=8)]
			.map{ p => self.crear(new Meta(position = p)) }		
	
//ARMA
		var armas = [new Position(x=3, y=1)]
			.map{ p => self.crear(new Arma(position = p)) }	
		
//Barra vidas

       	//var barraVidas = [new Position(x=6, y=8)]
		//	.map{ p => self.crear(new BarraVida(position = p))}
		game.addVisual(barraVida)
		
//Vidas	
	   	var vida = [new Position(x=1, y=5)]
			.map{ p => self.crear(new Vida(position = p)) }	
		
//Enemigos		

        var enemigos = [new Position(x=4, y=2),new Position(x=6, y=3),new Position(x=2, y=6),new Position(x=3, y=4),
        	new Position(x=4, y=5),new Position(x=7, y=7),new Position(x=5, y=2), new Position(x=6, y=7), new Position(x=1, y=6),
        	new Position(x=2, y=7)].map{ p => self.crear(new Enemigo(position = p)) } 
	}

}