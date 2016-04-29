package ar.edu.unq.aplicacion.escritorio

import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorSistemaAppModel
import ar.edu.unq.aplicacion.componentes.Titulo
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.aplicacion.componentes.ConfiguradorAdministradorLaberintosPanel
import ar.edu.unq.aplicacion.componentes.ConfiguradorAdministradorHabitacionesPanel
import ar.edu.unq.aplicacion.componentes.ConfiguradorAdministradorCaracteristicasYAccionesPanel

class AdministradorSistemaWindow extends SimpleWindow<AdministradorSistemaAppModel>{

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

		new ConfiguradorAdministradorLaberintosPanel(this, this.modelObject, contentPanel)
		new ConfiguradorAdministradorHabitacionesPanel(this, this.modelObject, contentPanel)
		new ConfiguradorAdministradorCaracteristicasYAccionesPanel(this,
															this.modelObject, contentPanel)
	}
}