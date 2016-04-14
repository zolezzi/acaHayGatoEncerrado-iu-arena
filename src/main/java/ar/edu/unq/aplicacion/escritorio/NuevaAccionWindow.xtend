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
	
	AdministradorSistemaAppModel administrador
	
	new(WindowOwner owner, AdministradorSistemaAppModel model) {
		super(owner, new CrearAccionAppModel(model))
		administrador = model
	}
	
	override protected createFormPanel(Panel mainPanel) {
		title = "Agregar accion"
		
		new Label(mainPanel).text = "Selecciona una accion a agregar"
		
		val Panel panelDeBotonesNuevaAccion = new Panel(this)
		crearPanelDeBotonesNuevaAccion(panelDeBotonesNuevaAccion)
	}
	
	def crearPanelDeBotonesNuevaAccion(Panel owner) {
		val Panel nuevaAccionPanel = new Panel(owner)
		nuevaAccionPanel.layout = new HorizontalLayout
		
		new Button(nuevaAccionPanel)=>[
			caption = "Agregar accion de ir a otra habitacion"
			onClick [ | new NuevaAccionDeIrHabitacionWindow(this, this.modelObject, administrador).open]
		]
			
		new Button(nuevaAccionPanel)=>[
			caption = "Agregar accion de agarrar un elemento"
			onClick [ | new NuevaAccionDeAgarrarUnItemWindow(this, this.modelObject).open]
		]
			
		new Button(nuevaAccionPanel)=>[
			caption = "Agregar accion de usar un elemento"
			onClick [ | new NuevaAccionDeUsarUnItemWindow(this, this.modelObject).open]
		]
	}
}