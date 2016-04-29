package ar.edu.unq.aplicacion.escritorio

import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorLaberintosAppModel

class NuevoLaberintoWindow extends Dialog<AdministradorLaberintosAppModel>{
	
	new(WindowOwner owner, AdministradorLaberintosAppModel model) {
		super(owner, model)
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
	