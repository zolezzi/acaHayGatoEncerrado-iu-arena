package ar.edu.unq.aplicacion.escritorio

import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearLaberintoAppModel
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button

class NuevoLaberintoWindow extends Dialog<CrearLaberintoAppModel>{
	
	new(WindowOwner owner, AdministradorSistema model) {
		super(owner, new CrearLaberintoAppModel(model))
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		title = "Nuevo Laberinto"
		new Label(mainPanel).text = "Agregue un nombre al laberinto"
		new TextBox(mainPanel) => [
			value <=> "nombreLaberinto" 
			width = 200
		]
		
		val Panel panelDeBotonesNuevoLaberinto = new Panel(this)
		crearPanelDeBotonesNuevoLaberinto(panelDeBotonesNuevoLaberinto)
		
		
	}
	
	def crearPanelDeBotonesNuevoLaberinto(Panel owner) {
		val Panel panelDeBotonesNuevoLaberinto = new Panel(owner)
		
		panelDeBotonesNuevoLaberinto.layout = new HorizontalLayout
		
		new Button(panelDeBotonesNuevoLaberinto)=>[
			caption = "Aceptar"
			onClick [ |
				this.modelObject.agregarLaberinto
				this.close
			]
		]
		
		new Button(panelDeBotonesNuevoLaberinto)=>[
			caption = "Cancelar"
			onClick [ | this.close ]
		]		
	}	
}
	