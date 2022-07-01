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
		game.onTick(900,"Animacion del menu",{self.cambiar()})
	}
	method terminarAnimacion(){
		game.removeTickEvent("Animacion del menu")
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

	var imagen = true
	method iniciarAnimacion(){
		game.onTick(250,"Animacion del derrota",{self.image()})
	}

	method image(){return "gameOver2.jpg"}

}

	
object pantallaDeVictoria{
	var imagen = false
	method iniciarAnimacion(){
		game.onTick(250,"Animacion del victoria",{self.cambiar()})
	}
	method terminarAnimacion(){
		game.removeTickEvent("Animacion del victoria")
	}
	method cambiar(){
		if(imagen)
			imagen = false
		else
			imagen = true
	}
	method image(){
		if(imagen)
			return "victoria.png"
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
		
		posteParedes.remove(new Position(x=4,y=0))//bordeAbajo - la entrada
		posteParedes.remove(new Position(x=2,y=largo))//bordeArriba - la salida
		
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
				
		posicionParedes.addAll([new Position(x=2,y=2), new Position(x=3,y=2), new Position(x=5,y=2),new Position(x=6,y=2)])
		posicionParedes.addAll([new Position(x=1,y=3),new Position(x=5,y=3)])
		posicionParedes.addAll([new Position(x=1,y=4), new Position(x=3,y=4), new Position(x=5,y=4),new Position(x=6,y=4),new Position(x=7,y=4)])
		posicionParedes.addAll([new Position(x=7,y=5)])
		posicionParedes.addAll([new Position(x=2,y=6), new Position(x=3,y=6),new Position(x=4,y=6),new Position(x=5,y=6)])
		posicionParedes.addAll([new Position(x=7,y=7)])
		
	
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
		var metas = [new Position(x=2, y=8)]
			.map{ p => self.crear(new Meta(position = p)) }		
	
//ARMA
		var armas = [new Position(x=1, y=2)]
			.map{ p => self.crear(new Arma(position = p)) }	
		
//Barra vidas

       	//var barraVidas = [new Position(x=6, y=8)]
		//	.map{ p => self.crear(new BarraVida(position = p))}
		game.addVisual(barraVida)
		
//Vidas	
	   	var vida = [new Position(x=7, y=3)]
			.map{ p => self.crear(new Vida(position = p))}	
		
//Enemigos		
		var enemigos = [new Position(x=4, y=2),new Position(x=2, y=5),new Position(x=3, y=7)]
			enemigos.map{p => self.crear(new Enemigo(position=p))}
	}

}