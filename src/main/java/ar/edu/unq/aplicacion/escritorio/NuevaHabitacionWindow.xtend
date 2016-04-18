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
		if(modelObject.laberintoSeleccionado != null){
			title = "Nueva Habitacion"
			new Label(mainPanel).text = "Agregue un nombre a la habitación"
			new TextBox(mainPanel) => [
				value <=> "nombreHabitacion" 
				width = 200
			]
		
			val Panel panelDeBotonesNuevaHabitacion = new Panel(this)
			crearPanelDeBotonesNuevaHabitacion(panelDeBotonesNuevaHabitacion)
		
		}else{
			this.crearVentanaException(mainPanel){	
			}
		}	
	}
	
	def crearVentanaException(Panel owner){
		new Label(owner) => [
			text = "Tiene que seleccionar un laberinto para agregar una habitación"
			fontSize = 10
			width = 300
			height = 50	
		]
		val Panel panelDeBotonesException = new Panel(owner)
		panelDeBotonesException.layout = new HorizontalLayout
		
		new Button(panelDeBotonesException)=>[
			fontSize = 10
			caption = "Aceptar"
			width = 300
			onClick [ | this.close ]
		]		
		
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