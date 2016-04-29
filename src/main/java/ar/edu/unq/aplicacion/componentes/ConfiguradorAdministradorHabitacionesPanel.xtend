package ar.edu.unq.aplicacion.componentes

import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorSistemaAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.List
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import ar.edu.unq.aplicacion.escritorio.NuevaHabitacionWindow
import ar.edu.unq.aplicacion.escritorio.AdministradorSistemaWindow
import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorHabitacionesAppModel

class ConfiguradorAdministradorHabitacionesPanel {
	
	new(AdministradorSistemaWindow window, AdministradorSistemaAppModel appModel, Panel owner) {
		val Panel panelDeListadoDeHabitaciones = new Panel(owner)
		
		new Titulo(panelDeListadoDeHabitaciones, "Habitaciones")
		
		new List<Habitacion>(panelDeListadoDeHabitaciones) => [
				(items <=> "laberintoSeleccionado.habitaciones").adapter = new PropertyAdapter(Habitacion, "nombre")
				height = 270
				width = 185
				value <=> "habitacionSeleccionada"
			]

		val Panel panelDeBotonesAdministradorLaberintos = new Panel(panelDeListadoDeHabitaciones)
		crearPanelDeBotonesHorizontalParaAdministradorHabitaciones(window, appModel, panelDeBotonesAdministradorLaberintos)
	}
	
	def crearPanelDeBotonesHorizontalParaAdministradorHabitaciones(AdministradorSistemaWindow window, AdministradorSistemaAppModel appModel, Panel owner) {
		
		val Panel panelDeBotonesAdministradorHabitaciones = new Panel(owner)
		panelDeBotonesAdministradorHabitaciones.layout = new HorizontalLayout
		
		new Button(panelDeBotonesAdministradorHabitaciones) =>[
			caption = "Agregar Habitación"
			onClick [ | new NuevaHabitacionWindow(window, new AdministradorHabitacionesAppModel(appModel)).open ]
		]

		new Button(panelDeBotonesAdministradorHabitaciones) =>[
			caption = "Quitar Habitación"
				onClick [ | appModel.quitarHabitacion ]
		] 
	}
}