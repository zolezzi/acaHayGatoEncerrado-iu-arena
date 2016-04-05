package ar.edu.unq.aplicacion.escritorio

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorSistemaAppModel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.aplicacion.componentes.Titulo
import org.uqbar.arena.layout.HorizontalLayout
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Button
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion

class AdministradorSistemaComponentizadoWindow extends SimpleWindow<AdministradorSistemaAppModel>{
	
	AdministradorSistemaAppModel model
	
	new(AdministradorSistemaApplication application, AdministradorSistemaAppModel model) {
		super(application, model)
		this.model = model
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
		
		//agregamos el contenido
		val Panel contentPanel = new Panel(mainPanel)
		contentPanel.layout = new HorizontalLayout
		this.crearAdministradorLaberintos(contentPanel)
		this.crearAdministradorHabitaciones(contentPanel)
	//	this.crearAdministradorCaracteristicasYAcciones(contentPanel)
		
	}
	
	def crearAdministradorLaberintos(Panel owner) {
		val Panel panelDeListadoDeLaberintos = new Panel(owner)
			new Titulo(panelDeListadoDeLaberintos, "Tus Laberintos")
		new List<Laberinto>(panelDeListadoDeLaberintos) => [
				(items <=> "model.laberintos").adapter = new PropertyAdapter(Laberinto, "nombre")
				height = 270
				width = 210
				value <=> "laberintoSeleccionado"
			]
		val Panel panelDeBotonesAdministradorLaberintos = new Panel(this)
		this.crearPanelDeBotonesHorizontal(panelDeBotonesAdministradorLaberintos)	
		
		new Button(panelDeBotonesAdministradorLaberintos) =>[
			caption = "Habilitar Laberinto"
		//	onClick [ | new NuevaMateriaWindow(this, this.modelObject.carrera).open ]
		]
	}
	
	def crearPanelDeBotonesHorizontal(Panel owner) {
		val Panel panelDeBotonesAdministradorLaberintos = new Panel(owner)
		panelDeBotonesAdministradorLaberintos.layout = new HorizontalLayout
		
		new Button(panelDeBotonesAdministradorLaberintos) =>[
			caption = "Crear Laberinto"
		//	onClick [ | new NuevaMateriaWindow(this, this.modelObject.carrera).open ]
		] 
		
		new Button(panelDeBotonesAdministradorLaberintos) =>[
			caption = "Eliminar Laberinto"
		//	onClick [ | new NuevaMateriaWindow(this, this.modelObject.carrera).open ]
		] 
	}
	
	def crearAdministradorHabitaciones(Panel owner) {
		val Panel panelDeListadoDeHabitaciones = new Panel(owner)
			new Titulo(panelDeListadoDeHabitaciones, "Habitaciones")
		new List<Habitacion>(panelDeListadoDeHabitaciones) => [
				(items <=> "administrador.laberintos").adapter = new PropertyAdapter(Laberinto, "nombre")
				height = 270
				width = 210
				value <=> "laberintoSeleccionado"
			]
		val Panel panelDeBotonesAdministradorLaberintos = new Panel(this)
		this.crearPanelDeBotonesHorizontal(panelDeBotonesAdministradorLaberintos)
	}
	
	def crearAdministradorCaracteristicasYAcciones(Panel panel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	

}