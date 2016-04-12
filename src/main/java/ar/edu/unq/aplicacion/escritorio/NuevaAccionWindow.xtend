package ar.edu.unq.aplicacion.escritorio

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearAccionAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorSistemaAppModel

class NuevaAccionWindow extends Dialog<CrearAccionAppModel> {
	
	new(WindowOwner owner, AdministradorSistemaAppModel model) {
		super(owner, new CrearAccionAppModel(model))
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
			//onClick [ | new NuevaHabitacionWindow(this, this).open
			]
			
		new Button(nuevaAccionPanel)=>[
			caption = "Agregar accion de agarrar un elemento"
			//onClick [ | new NuevaHabitacionWindow(this, this).open
			]
			
		new Button(nuevaAccionPanel)=>[
			caption = "Agregar accion de usar un elemento"
			//onClick [ | new NuevaHabitacionWindow(this, this).open
			]
	}
	
}