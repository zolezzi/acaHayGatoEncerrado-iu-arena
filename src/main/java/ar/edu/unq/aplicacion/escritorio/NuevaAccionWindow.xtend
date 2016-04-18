package ar.edu.unq.aplicacion.escritorio

import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorSistemaAppModel
import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearAccionAppModel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

class NuevaAccionWindow extends Dialog<CrearAccionAppModel> {
	
	new(WindowOwner owner, AdministradorSistemaAppModel model) {
		super(owner, new CrearAccionAppModel(model))
	}
	
	override protected createFormPanel(Panel mainPanel) {
		if(modelObject.habitacionSeleccionada != null){
			title = "Agregar accion"
		
			new Label(mainPanel).text = "Selecciona una accion a agregar"
		
			val Panel panelDeBotonesNuevaAccion = new Panel(this)
			crearPanelDeBotonesNuevaAccion(panelDeBotonesNuevaAccion)
		}else{
				this.crearVentanaException(mainPanel){	
			 }
		}	
	}
	
	def crearVentanaException(Panel owner){
		new Label(owner) => [
			text = "Tiene que seleccionar una habitacion para agregar una accion"
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
	
	def crearPanelDeBotonesNuevaAccion(Panel owner) {
		val Panel nuevaAccionPanel = new Panel(owner)
		
		new Button(nuevaAccionPanel)=>[
			caption = "Agregar accion de IR A OTRA HABITACIÓN"
			onClick [ | new NuevaAccionDeIrHabitacionWindow(this, this.modelObject).open]
		]
			
		new Button(nuevaAccionPanel)=>[
			caption = "Agregar accion de AGARRAR UN OBJETO"
			onClick [ | new NuevaAccionDeAgarrarUnItemWindow(this, this.modelObject).open]
		]
			
		new Button(nuevaAccionPanel)=>[
			caption = "Agregar accion de USAR UN OBJETO"
			onClick [ | new NuevaAccionDeUsarUnItemWindow(this, this.modelObject).open]
		]
	}
}