package ar.edu.unq.aplicacion.escritorio


import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearAccionDeIrHabitacionAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import ar.edu.unq.aplicacion.componentes.LabeledSelector
import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorSistemaAppModel
import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearAccionAppModel

class NuevaAccionDeIrHabitacionWindow extends Dialog<CrearAccionDeIrHabitacionAppModel>{
	
	new(NuevaAccionWindow owner, CrearAccionAppModel model) {
		super(owner, new CrearAccionDeIrHabitacionAppModel(model))
	}
	
	override protected createFormPanel(Panel mainPanel) {
		title = "Agregar accion de ir a otra habitacion"
		
		new Label(mainPanel).text = "Selecciona la habitacion"
		
		val Panel panelDeBotonDeIrAOtraHabitacion = new Panel(this)
		crearPanelDeBotonDeIrAOtraHabitacion(panelDeBotonDeIrAOtraHabitacion)
	}
	
	def crearPanelDeBotonDeIrAOtraHabitacion(Panel owner) {
		val Panel nuevaAccionDeIrAOtraHabitacion = new Panel(owner)
		nuevaAccionDeIrAOtraHabitacion.layout = new HorizontalLayout
		
		new LabeledSelector(nuevaAccionDeIrAOtraHabitacion)=>[
			text = "Habitaciones:"
			bindItemsToProperty("laberintoSeleccionado.habitaciones")
			bindValueToProperty("habitacionSeleccionada")
		]
		
		new Button(nuevaAccionDeIrAOtraHabitacion)=>[
			caption = "Agregar"
			//onClick [ | ]
		]
	}
}