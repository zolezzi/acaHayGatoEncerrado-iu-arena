package ar.edu.unq.aplicacion.componentes

import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorSistemaAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.RadioSelector
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.widgets.List
import ar.edu.unq.acahaygatoencerrado.dominio.Accion
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import ar.edu.unq.aplicacion.escritorio.NuevaAccionWindow

class AdministradorCaracteristicasYAccionesPanel {
	
	new(WindowOwner window, AdministradorSistemaAppModel appModel, Panel owner) {
		
		val Panel panelDeListadoDeAcciones = new Panel(owner)

		new RadioSelector(panelDeListadoDeAcciones) => [
			bindItems(new ObservableProperty(appModel, "caracteristicasPosibles"))
            bindValueToProperty("habitacionSeleccionada.caracteristica")
		]

		new Titulo(panelDeListadoDeAcciones, "Acciones")
		
		new List<Accion>(panelDeListadoDeAcciones) => [
				(items <=> "habitacionSeleccionada.acciones").adapter = new PropertyAdapter(Accion, "nombre")
				height = 180 
				width = 185
				value <=> "accionSeleccionada" 
			]

		val Panel panelDeBotonesAdministradorDeAcciones = new Panel(panelDeListadoDeAcciones)
		crearPanelDeBotonesHorizontalParaAdministradorDeAcciones(window, appModel, panelDeBotonesAdministradorDeAcciones)
	}
	
	def crearPanelDeBotonesHorizontalParaAdministradorDeAcciones(WindowOwner window, AdministradorSistemaAppModel appModel, Panel owner) {
		
		val Panel panelDeBotonesAdministradorHabitaciones = new Panel(owner)
		panelDeBotonesAdministradorHabitaciones.layout = new HorizontalLayout
		
		new Button(panelDeBotonesAdministradorHabitaciones) =>[
			caption = "Agregar Acción"
			onClick [ | new NuevaAccionWindow(window, appModel).open ]
		] 
		
		new Button(panelDeBotonesAdministradorHabitaciones) =>[
			caption = "Quitar Acción"
			if(appModel.habitacionSeleccionada != null){
				onClick [ | appModel.quitarAccion ]
			}
		] 
	}
}