package ar.edu.unq.aplicacion.escritorio

import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorSistemaAppModel
import ar.edu.unq.acahaygatoencerrado.dominio.Accion
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import ar.edu.unq.aplicacion.componentes.LabeledCheckBox
import ar.edu.unq.aplicacion.componentes.Titulo
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class AdministradorSistemaComponentizadoWindow extends SimpleWindow<AdministradorSistemaAppModel>{

	new(WindowOwner owner, AdministradorSistemaAppModel model) {
		super(owner, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		//no queremos usar este template default
	}
	override protected createFormPanel(Panel mainPanel) {
		//no queremos usar este template default
	}


	override createMainTemplate(Panel mainPanel){
		this.title = "Aca hay gato encerrado..."
		
		new Titulo(mainPanel, "Aca hay gato encerrado", 20)
		
		val Panel contentPanel = new Panel(mainPanel)
		contentPanel.layout = new HorizontalLayout

		this.crearAdministradorLaberintos(contentPanel)
		this.crearAdministradorHabitaciones(contentPanel)
		this.crearAdministradorCaracteristicasYAcciones(contentPanel)
	}
	
	def crearAdministradorLaberintos(Panel owner) {
		
		val Panel panelDeListadoDeLaberintos = new Panel(owner)
		
		new Titulo(panelDeListadoDeLaberintos, "Tus Laberintos")
		
		new List<Laberinto>(panelDeListadoDeLaberintos) => [
				(items <=> "administrador.laberintos").adapter = new PropertyAdapter(Laberinto, "nombre")
				height = 270
				width = 185
				value <=> "laberintoSeleccionado"
			]
		
		val Panel panelDeBotonesAdministradorLaberintos = new Panel(panelDeListadoDeLaberintos)
		crearPanelDeBotonesHorizontalParaAdministradorLaberintos(panelDeBotonesAdministradorLaberintos)	
		
		new Button(panelDeBotonesAdministradorLaberintos) =>[
			caption = "Habilitar Laberinto"
		//	onClick [ | new HabilitarLaberintoWindow(this, this.modelObject.administrador).open ]
		]
	}
	
	def crearPanelDeBotonesHorizontalParaAdministradorLaberintos(Panel owner) {
		
		val Panel panelDeBotonesAdministradorLaberintos = new Panel(owner)
		panelDeBotonesAdministradorLaberintos.layout = new HorizontalLayout
		
		new Button(panelDeBotonesAdministradorLaberintos) =>[
			caption = "Crear Laberinto"
			onClick [ | new NuevoLaberintoWindow(this, this.modelObject.administrador).open ]
		] 
		
		new Button(panelDeBotonesAdministradorLaberintos) =>[
			caption = "Eliminar Laberinto"
			onClick [ | this.modelObject.quitarLaberinto ]
		] 
	}
	
	def crearAdministradorHabitaciones(Panel owner) {
		
		val Panel panelDeListadoDeHabitaciones = new Panel(owner)
		
		new Titulo(panelDeListadoDeHabitaciones, "Habitaciones")
		
		new List<Habitacion>(panelDeListadoDeHabitaciones) => [
				(items <=> "laberintoSeleccionado.habitaciones").adapter = new PropertyAdapter(Habitacion, "nombre")
				height = 270
				width = 185
				value <=> "habitacionSeleccionada"
			]

		val Panel panelDeBotonesAdministradorLaberintos = new Panel(panelDeListadoDeHabitaciones)
		crearPanelDeBotonesHorizontalParaAdministradorHabitaciones(panelDeBotonesAdministradorLaberintos)
	}
	
	def crearPanelDeBotonesHorizontalParaAdministradorHabitaciones(Panel owner) {
		
		val Panel panelDeBotonesAdministradorHabitaciones = new Panel(owner)
		panelDeBotonesAdministradorHabitaciones.layout = new HorizontalLayout
		
		new Button(panelDeBotonesAdministradorHabitaciones) =>[
			caption = "Agregar Habitación"
			onClick [ | new NuevaHabitacionWindow(this, this.modelObject).open ]
		] 
		
		new Button(panelDeBotonesAdministradorHabitaciones) =>[
			caption = "Quitar Habitación"
			onClick [ | this.modelObject.quitarHabitacion ]
		] 
	}
	
	def crearAdministradorCaracteristicasYAcciones(Panel owner) {
		
		val Panel panelDeListadoDeAcciones = new Panel(owner)

		new LabeledCheckBox(panelDeListadoDeAcciones)
			.setText("Es inicial?:")
			.bindValueToProperty("habitacionSeleccionada.esInicial")
			
		new LabeledCheckBox(panelDeListadoDeAcciones)
			.setText("Es final?:")
			.bindValueToProperty("habitacionSeleccionada.esFinal")
		
		new Titulo(panelDeListadoDeAcciones, "Acciones")
		
		new List<Accion>(panelDeListadoDeAcciones) => [
				(items <=> "habitacionSeleccionada.acciones").adapter = new PropertyAdapter(Accion, "nombre")
				height = 180 
				width = 185
				value <=> "accionSeleccionada" 
			]

		val Panel panelDeBotonesAdministradorDeAcciones = new Panel(panelDeListadoDeAcciones)
		crearPanelDeBotonesHorizontalParaAdministradorDeAcciones(panelDeBotonesAdministradorDeAcciones)
	}
	
	def crearPanelDeBotonesHorizontalParaAdministradorDeAcciones(Panel owner) {
		
		val Panel panelDeBotonesAdministradorHabitaciones = new Panel(owner)
		panelDeBotonesAdministradorHabitaciones.layout = new HorizontalLayout
		
		new Button(panelDeBotonesAdministradorHabitaciones) =>[
			caption = "Agregar Acción"
			onClick [ | new NuevaAccionWindow(this, this.modelObject).open ]
		] 
		
		new Button(panelDeBotonesAdministradorHabitaciones) =>[
			caption = "Quitar Acción"
			onClick [ | this.modelObject.quitarAccion ]
		] 
	}
}