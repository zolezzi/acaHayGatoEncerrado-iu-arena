package ar.edu.unq.aplicacion.escritorio

import org.uqbar.arena.Application
import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorSistemaAppModel
import ar.edu.unq.acahaygatoencerrado.dominio.CreadorDeLaberintos

class AdministradorSistemaApplication extends Application {
	
	override protected createMainWindow() {
			val model = new AdministradorSistemaAppModel =>[
				administrador = new CreadorDeLaberintos 			 
			]
			new AdministradorSistemaWindow(this, model) 
	}
	
	def static void main(String[] args){ 
		new AdministradorSistemaApplication().start()
	}
}