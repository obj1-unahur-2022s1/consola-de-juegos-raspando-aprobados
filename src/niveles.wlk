import wollok.game.*
import paredes.*
import juego.*
import direcciones.*
import meta.*
import arma.*
import enemigos.*
import vidas.*
import nivel.*

object nivel1 {
    const property nivelActual = 1
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
		
		
		posteParedes.addAll([new Position(x=1,y=1), new Position(x=2,y=1), new Position(x=6,y=1)])
		posteParedes.addAll([new Position(x=1,y=2), new Position(x=2,y=2), new Position(x=5,y=2),new Position(x=6,y=2)])
		posteParedes.addAll([new Position(x=3,y=3)])
		posteParedes.addAll([new Position(x=1,y=4), new Position(x=4,y=4), new Position(x=5,y=4),new Position(x=6,y=4)])
		posteParedes.addAll([new Position(x=1,y=5), new Position(x=6,y=5)])
		posteParedes.addAll([new Position(x=3,y=6), new Position(x=5,y=6),new Position(x=6,y=6)])
		posteParedes.addAll([new Position(x=3,y=7)])
		
	
		posteParedes.forEach { p => self.crear(new Pared(position = p)) }
		
		
//	player

		game.addVisualCharacter(player)
		game.say(player, player.mensaje())
//Nivel

      var numeroNivel = [new Position(x=0, y=8)].map{ p => self.crear(new TextoNivel(position = p, image= "nivel1Texto.png")) }	
      
// Llegadas
		var metas = [new Position(x=2, y=8)]
			.map{ p => self.crear(new Meta(position = p)) }		
	
//Arma
		var armas = [new Position(x=1, y=3)]
			.map{ p => self.crear(new Arma(position = p)) }	
			
//Vidas	
	   	var vida = [new Position(x=5, y=5)]
			.map{ p => self.crear(new Vida(position = p)) }	
		
//Barra vidas

       	var barraVida = [new Position(x=6, y=8)]
			.map{ p => self.crear(new BarraVida(position = p)) }	
 
//Enemigos	
	
		var enemigos = [new Position(x=4, y=2),new Position(x=7, y=2),new Position(x=3, y=5),new Position(x=7, y=7),new Position(x=2, y=7)]
			.map{ p => self.crear(new Enemigo(position = p, image = "monstruo.png")) } 
	
	
//Colisiones	

	    game.onCollideDo(player, { elemento => elemento.producirAccion()})
	    game.sound("nivel1.mp3").play()
	}
	
	method crear(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
	
	method pasarNivel(nivel){
		game.clear()
		nivel.cargar()
	}
	
	method terminar(){
		game.clear()	
    }
	
	method nivelJuego() = nivelActual
}

// Nivel 2 

object nivel2 {
    const property nivelActual = 2
	method cargar() {
		
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
		
		posteParedes.addAll([new Position(x=1,y=2), new Position(x=2,y=2), new Position(x=3,y=2),new Position(x=4,y=2),new Position(x=5,y=2),new Position(x=6,y=2)])
		posteParedes.addAll([new Position(x=1,y=4), new Position(x=2,y=4), new Position(x=3,y=4),new Position(x=5,y=4),new Position(x=6,y=4),new Position(x=7,y=4)])
		posteParedes.addAll([new Position(x=1,y=6), new Position(x=2,y=6), new Position(x=3,y=6),new Position(x=4,y=6),new Position(x=6,y=6)])
	    posteParedes.addAll([new Position(x=1,y=7), new Position(x=6,y=7)])
	    
		posteParedes.forEach { p => self.crear(new Pared(position = p)) }
		
// Player

		game.addVisualCharacter(player)
        player.estaArmado(false)
        player.resetPosition()
		game.say(player, player.mensaje())

//Nivel

       var numeroNivel = [new Position(x=0, y=8)].map{ p => self.crear(new TextoNivel(position = p, image= "nivel2Texto.png")) }	

// LLegadas
		var metas = [new Position(x=2, y=8)]
			.map{ p => self.crear(new Meta(position = p)) }		
	
// Arma 
		var armas = [new Position(x=7, y=7)]
			.map{ p => self.crear(new Arma(position = p)) }	
			
// Vidas	
	   	var vida = [new Position(x=4, y=4),new Position(x=1, y=1),new Position(x=7, y=1)]
			.map{ p => self.crear(new Vida(position = p)) }	
		
// Barra vidas

       	var barraVida = [new Position(x=6, y=8)]
			.map{ p => self.crear(new BarraVida(position = p)) }	
 
// Enemigos
	
		var enemigos = [new Position(x=7, y=2),new Position(x=4, y=3),new Position(x=1, y=4),new Position(x=6, y=5),new Position(x=4, y=7),new Position(x=3, y=7)]
			.map{ p => self.crear(new Enemigo(position = p, image="monstruoNivel2.png")) } 	

	
// Colisiones	

        game.onCollideDo(player, { elemento => elemento.producirAccion()})
	}
	
	method crear(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
	method pasarNivel(nivel){
		game.clear()
		nivel.cargar()
	}
	
	method nivelJuego() = nivelActual
	
	method terminar(){
		game.clear()	
    }

}

// Nivel 3

object nivel3 {
    const nivelActual = 3
	method cargar() {
		
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
		
		posteParedes.addAll([new Position(x=7,y=1)])
		posteParedes.addAll([new Position(x=2,y=2), new Position(x=3,y=2), new Position(x=6,y=2),new Position(x=7,y=2)])
		posteParedes.addAll([new Position(x=4,y=3),new Position(x=3,y=3)])
		posteParedes.addAll([new Position(x=1,y=4), new Position(x=4,y=4),new Position(x=7,y=4)])
		posteParedes.addAll([new Position(x=3,y=5),new Position(x=5,y=5)])
		posteParedes.addAll([new Position(x=6,y=6)])
		posteParedes.addAll([new Position(x=1,y=7), new Position(x=4,y=7)])
	
		posteParedes.forEach { p => self.crear(new Pared(position = p)) }
		
// Player

		game.addVisualCharacter(player)
        player.estaArmado(false)
        player.resetPosition()
		game.say(player, player.mensaje())

//Nivel

       var numeroNivel = [new Position(x=0, y=8)].map{ p => self.crear(new TextoNivel(position = p, image= "nivel3Texto.png")) }	

// LLegadas
		var metas = [new Position(x=2, y=8)]
			.map{ p => self.crear(new Meta(position = p)) }		
	
// Arma 
		var armas = [new Position(x=4, y=6)]
			.map{ p => self.crear(new Arma(position = p)) }	
			
// Vidas	
	   	var vida = [new Position(x=1, y=5)]
			.map{ p => self.crear(new Vida(position = p)) }	
		
// Barra vidas

       	var barraVida = [new Position(x=6, y=8)]
			.map{ p => self.crear(new BarraVida(position = p)) }	
 
// Enemigos
	
		var enemigos = [new Position(x=4, y=2),new Position(x=6, y=3),new Position(x=2, y=6),new Position(x=3, y=4),new Position(x=4, y=5),
			new Position(x=7, y=7),new Position(x=5, y=2), new Position(x=6, y=7), new Position(x=1, y=6),new Position(x=2, y=7)].map{ p => self.crear(new Enemigo(position = p, image="monstruoNivel2.png")) } 	

	
// Colisiones	

        game.onCollideDo(player, { elemento => elemento.producirAccion()})
	     
	 	game.sound("musicaGame.mp3").play()
	}
	
	method crear(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
	method pasarNivel(nivel){
		game.clear()
		nivel.cargar()
	}
	
	method nivelJuego() = nivelActual
	
	method terminar(){
		game.clear()	
    }

}


