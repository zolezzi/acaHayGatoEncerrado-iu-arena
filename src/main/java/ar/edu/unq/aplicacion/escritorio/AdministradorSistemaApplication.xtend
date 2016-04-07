package ar.edu.unq.aplicacion.escritorio

import org.uqbar.arena.Application
import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorSistemaAppModel
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion

class AdministradorSistemaApplication extends Application {
	
	override protected createMainWindow() {
			val model = new AdministradorSistemaAppModel =>[
				
				administrador = new AdministradorSistema => [
					
					var laberinto1 = new Laberinto("laberinto")
					
					laberintos.add(laberinto1)
					
					var hab1 = new Habitacion("hab")
					
					laberintos.get(0).habitaciones.add(hab1)
				] 
			]
			
			new AdministradorSistemaComponentizadoWindow(this, model) 
	
	}
	
	def static void main(String[] args){
		new AdministradorSistemaApplication().start()
	}
}