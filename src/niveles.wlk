import wollok.game.*
import paredes.*
import juego.*
import direcciones.*
import meta.*
import arma.*
import enemigos.*
import vidas.*

object nivel1 {
	var property position
	method iniciar() {
		
// Paredes
		const ancho = game.width() - 1
		const largo = game.height() - 1
		
		const posteParedes = []
		
		(0 .. ancho).forEach{ n => posteParedes.add(new Position(x=n, y=0)) } // bordeAbajo
		(0 .. ancho).forEach{ n => posteParedes.add(new Position(x=n, y=largo)) } // bordeArriba 
		(0 .. largo).forEach{ n => posteParedes.add(new Position(x=0, y=n)) } // bordeIzq 
		(0 .. largo).forEach{ n => posteParedes.add(new Position(x=ancho, y=n)) } // bordeDer
		
		posteParedes.remove(new Position(x=4,y=0))//bordeAbajo - la entrada
		posteParedes.remove(new Position(x=2,y=largo))//bordeArriba - la salida
		
		
		posteParedes.addAll([new Position(x=2,y=2), new Position(x=3,y=2), new Position(x=5,y=2),new Position(x=6,y=2)])
		posteParedes.addAll([new Position(x=1,y=3),new Position(x=5,y=3)])
		posteParedes.addAll([new Position(x=1,y=4), new Position(x=3,y=4), new Position(x=5,y=4),new Position(x=6,y=4),new Position(x=7,y=4)])
		posteParedes.addAll([new Position(x=7,y=5)])
		posteParedes.addAll([new Position(x=2,y=6), new Position(x=3,y=6),new Position(x=4,y=6),new Position(x=5,y=6)])
		posteParedes.addAll([new Position(x=7,y=7)])
		
	
		posteParedes.forEach { p => self.crear(new Pared(position = p)) }
		
		
//	player

		game.addVisualCharacter(player)
		game.say(player, player.mensaje())

// Llegadas
		var metas = [new Position(x=2, y=8)]
			.map{ p => self.crear(new Meta(position = p)) }		
	
//Arma
		var armas = [new Position(x=1, y=2)]
			.map{ p => self.crear(new Arma(position = p)) }	
			
//Vidas	
	   	var vida = [new Position(x=7, y=6)]
			.map{ p => self.crear(new Vida(position = p)) }	
		
//Barra vidas

       	var barraVida = [new Position(x=6, y=8)]
			.map{ p => self.crear(new BarraVida(position = p)) }	
 
//Enemigos	
	
		var enemigos = [new Position(x=4, y=2),new Position(x=2, y=5),new Position(x=3, y=7)]
			.map{ p => self.crear(new Enemigo(position = p, image = "monstruo.png")) } 
	
	
//Colisiones	

	     //game.whenCollideDo(player, { elemento => elemento.producirAccion()})  
	     
	     //game.whenCollideDo(player, { enemigos => player.chocarConObjeto(enemigos)})
	     
	     //game.sound("nivel1.mp3").play()
	     
	     game.whenCollideDo(player, { elemento => elemento.producirAccion()
	     										  player.chocarConObjeto(elemento)
	 		})
	}
	
	method crear(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
	
	method pasarNivel(){
		game.clear()
		nivel2.cargar()
	}
	
	method terminar(){
		game.clear()
	}
 
}


// Nivel 2 

object nivel2 {

    method nivel() = 1
	method cargar() {
		
// Paredes
		const ancho = game.width() - 1
		const largo = game.height() - 1
	
		var posteParedes = []
		
		(0 .. ancho).forEach{ n => posteParedes.add(new Position(x=n, y=0)) } // bordeAbajo
		(0 .. ancho).forEach{ n => posteParedes.add(new Position(x=n, y=largo)) } // bordeArriba 
		(0 .. largo).forEach{ n => posteParedes.add(new Position(x=0, y=n)) } // bordeIzq 
		(0 .. largo).forEach{ n => posteParedes.add(new Position(x=ancho, y=n)) } // bordeDer
		
		posteParedes.remove(new Position(x=4,y=0))//bordeAbajo - la entrada
		posteParedes.remove(new Position(x=2,y=largo))//bordeArriba - la salida
		
		posteParedes.addAll([new Position(x=1,y=2), new Position(x=3,y=2), new Position(x=4,y=2),new Position(x=5,y=2),new Position(x=6,y=2)])
		posteParedes.addAll([new Position(x=2,y=4), new Position(x=3,y=4), new Position(x=4,y=4),new Position(x=5,y=4),new Position(x=6,y=4),new Position(x=7,y=4)])
		posteParedes.addAll([new Position(x=1,y=6), new Position(x=2,y=6), new Position(x=3,y=6),new Position(x=4,y=6),new Position(x=5,y=6),new Position(x=6,y=6)])
	
		posteParedes.forEach { p => self.crear(new Pared(position = p)) }
		
// Player

		game.addVisualCharacter(player)
        player.estaArmado(false)
		game.say(player, player.mensaje())

// LLegadas
		var metas = [new Position(x=2, y=8)]
			.map{ p => self.crear(new Meta(position = p)) }		
	
// Arma 
		var armas = [new Position(x=2, y=2)]
			.map{ p => self.crear(new Arma(position = p)) }	
			
// Vidas	
	   	var vida = [new Position(x=7, y=3)]
			.map{ p => self.crear(new Vida(position = p)) }	
		
// Barra vidas

       	var barraVida = [new Position(x=6, y=8)]
			.map{ p => self.crear(new BarraVida(position = p)) }	
 
// Enemigos
	
		var enemigos = [new Position(x=7, y=1),new Position(x=4, y=3),new Position(x=1, y=4),new Position(x=7, y=5),new Position(x=4, y=7)]
			.map{ p => self.crear(new Enemigo(position = p, image="monstruoNivel2.png")) } 	

	
// Colisiones	

	     //game.whenCollideDo(player, { elemento => elemento.producirAccion()})  
	     
	     //game.whenCollideDo(player, { enemigos => player.chocarConObjeto(enemigos)})
	     
	     //game.sound("musicaGame.mp3").play()
	     game.whenCollideDo(player, { elemento => elemento.producirAccion()
	     										  player.chocarConObjeto(elemento)
	     })
	}
	
	method crear(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}	
}



