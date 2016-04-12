package ar.edu.unq.aplicacion.escritorio

import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorSistemaAppModel
import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearHabitacionAppModel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class NuevaHabitacionWindow extends Dialog<CrearHabitacionAppModel>{
	
	new(WindowOwner owner, AdministradorSistemaAppModel model) {
		super(owner, new CrearHabitacionAppModel(model))
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		title = "Nueva Habitacion"
		new Label(mainPanel).text = "Agregue un nombre a la habitación"
		new TextBox(mainPanel) => [
			value <=> "nombreHabitacion" 
			width = 200
		]
		
		val Panel panelDeBotonesNuevaHabitacion = new Panel(this)
		crearPanelDeBotonesNuevaHabitacion(panelDeBotonesNuevaHabitacion)
		
		
	}
	
	def crearPanelDeBotonesNuevaHabitacion(Panel owner) {
		val Panel panelDeBotonesNuevaHabitacion = new Panel(owner)
		
		panelDeBotonesNuevaHabitacion.layout = new HorizontalLayout
		
		new Button(panelDeBotonesNuevaHabitacion)=>[
			caption = "Aceptar"
			onClick [ |
				this.modelObject.agregarHabitacion
				this.close
			]
		]
		
		new Button(panelDeBotonesNuevaHabitacion)=>[
			caption = "Cancelar"
			onClick [ | this.close ]
		]		
	}
}