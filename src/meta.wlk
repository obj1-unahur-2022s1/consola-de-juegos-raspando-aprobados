import wollok.game.*
import niveles.*

class Meta {
	const property position
	
	method tePuedePisar(unObjeto) = true
	method image() = "metafinal.png"
	method producirAccion(){
		if ((nivel1.nivelJuego()) == 1){
		 nivel1.pasarNivel(nivel2)
		}
		else if((nivel2.nivelJuego()) == 2){
		 nivel2.pasarNivel(nivel3)	
		} 
		else if((nivel3.nivelJuego()) == 3) {
		 nivel3.pasarNivel(nivel4)
		} 
	}
	
	method pasarNivel(nivel){
        game.sound("meta.mp3").play()
		nivel.pasarNivel() 
	} 
}
