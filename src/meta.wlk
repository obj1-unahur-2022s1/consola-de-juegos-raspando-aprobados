import wollok.game.*
import niveles.*

class Meta {
	const property position
	
	method movete(direccion) { /* No pasa naranja */ }
	method tePuedePisar(unObjeto) = true
	method image() = "metafinal.png"
	method producirAccion(){nivel1.pasarNivel()}
}
