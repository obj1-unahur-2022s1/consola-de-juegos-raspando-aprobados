import wollok.game.*
import niveles.*

class Meta {
	const property position
	method tePuedePisar(unObjeto) = true
	
	method image() = "metafinal.png"
	method producirAccion(){
		if ((nivel1.nivelActual()) == 1){
		 nivel1.pasarNivel(nivel2)
		}
		else if((nivel2.nivelActual()) == 2){
		 nivel2.pasarNivel(nivel3)	
		} 
	}
	
	method pasarNivel(nivel){
        game.sound("meta.mp3").play()
		nivel.pasarNivel() 
	} 
}
