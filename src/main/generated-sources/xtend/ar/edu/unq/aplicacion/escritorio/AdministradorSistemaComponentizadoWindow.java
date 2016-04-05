package ar.edu.unq.aplicacion.escritorio;

import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorSistemaAppModel;
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion;
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto;
import ar.edu.unq.aplicacion.componentes.Titulo;
import ar.edu.unq.aplicacion.escritorio.AdministradorSistemaApplication;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.ObservableItems;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.bindings.PropertyAdapter;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.List;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.Selector;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.ListBuilder;
import org.uqbar.lacar.ui.model.bindings.Binding;

@SuppressWarnings("all")
public class AdministradorSistemaComponentizadoWindow extends SimpleWindow<AdministradorSistemaAppModel> {
  private AdministradorSistemaAppModel model;
  
  public AdministradorSistemaComponentizadoWindow(final AdministradorSistemaApplication application, final AdministradorSistemaAppModel model) {
    super(application, model);
    this.model = model;
  }
  
  protected void addActions(final Panel actionsPanel) {
  }
  
  protected void createFormPanel(final Panel mainPanel) {
  }
  
  public void createMainTemplate(final Panel mainPanel) {
    this.setTitle("Aca hay gato encerrado...");
    new Titulo(mainPanel, "Aca hay gato encerrado", Integer.valueOf(20));
    final Panel contentPanel = new Panel(mainPanel);
    HorizontalLayout _horizontalLayout = new HorizontalLayout();
    contentPanel.setLayout(_horizontalLayout);
    this.crearAdministradorLaberintos(contentPanel);
    this.crearAdministradorHabitaciones(contentPanel);
  }
  
  public Button crearAdministradorLaberintos(final Panel owner) {
    Button _xblockexpression = null;
    {
      final Panel panelDeListadoDeLaberintos = new Panel(owner);
      new Titulo(panelDeListadoDeLaberintos, "Tus Laberintos");
      List<Laberinto> _list = new List<Laberinto>(panelDeListadoDeLaberintos);
      final Procedure1<List<Laberinto>> _function = new Procedure1<List<Laberinto>>() {
        public void apply(final List<Laberinto> it) {
          ObservableItems<Selector<Laberinto>, Laberinto, ListBuilder<Laberinto>> _items = it.items();
          Binding _spaceship = ArenaXtendExtensions.operator_spaceship(_items, "model.laberintos");
          PropertyAdapter _propertyAdapter = new PropertyAdapter(Laberinto.class, "nombre");
          _spaceship.setAdapter(_propertyAdapter);
          it.setHeight(270);
          it.setWidth(210);
          ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
          ArenaXtendExtensions.operator_spaceship(_value, "laberintoSeleccionado");
        }
      };
      ObjectExtensions.<List<Laberinto>>operator_doubleArrow(_list, _function);
      final Panel panelDeBotonesAdministradorLaberintos = new Panel(this);
      this.crearPanelDeBotonesHorizontal(panelDeBotonesAdministradorLaberintos);
      Button _button = new Button(panelDeBotonesAdministradorLaberintos);
      final Procedure1<Button> _function_1 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Habilitar Laberinto");
        }
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button, _function_1);
    }
    return _xblockexpression;
  }
  
  public Button crearPanelDeBotonesHorizontal(final Panel owner) {
    Button _xblockexpression = null;
    {
      final Panel panelDeBotonesAdministradorLaberintos = new Panel(owner);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      panelDeBotonesAdministradorLaberintos.setLayout(_horizontalLayout);
      Button _button = new Button(panelDeBotonesAdministradorLaberintos);
      final Procedure1<Button> _function = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Crear Laberinto");
        }
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
      Button _button_1 = new Button(panelDeBotonesAdministradorLaberintos);
      final Procedure1<Button> _function_1 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Eliminar Laberinto");
        }
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
    }
    return _xblockexpression;
  }
  
  public Button crearAdministradorHabitaciones(final Panel owner) {
    Button _xblockexpression = null;
    {
      final Panel panelDeListadoDeHabitaciones = new Panel(owner);
      new Titulo(panelDeListadoDeHabitaciones, "Habitaciones");
      List<Habitacion> _list = new List<Habitacion>(panelDeListadoDeHabitaciones);
      final Procedure1<List<Habitacion>> _function = new Procedure1<List<Habitacion>>() {
        public void apply(final List<Habitacion> it) {
          ObservableItems<Selector<Habitacion>, Habitacion, ListBuilder<Habitacion>> _items = it.items();
          Binding _spaceship = ArenaXtendExtensions.operator_spaceship(_items, "administrador.laberintos");
          PropertyAdapter _propertyAdapter = new PropertyAdapter(Laberinto.class, "nombre");
          _spaceship.setAdapter(_propertyAdapter);
          it.setHeight(270);
          it.setWidth(210);
          ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
          ArenaXtendExtensions.operator_spaceship(_value, "laberintoSeleccionado");
        }
      };
      ObjectExtensions.<List<Habitacion>>operator_doubleArrow(_list, _function);
      final Panel panelDeBotonesAdministradorLaberintos = new Panel(this);
      _xblockexpression = this.crearPanelDeBotonesHorizontal(panelDeBotonesAdministradorLaberintos);
    }
    return _xblockexpression;
  }
  
  public void crearAdministradorCaracteristicasYAcciones(final Panel panel) {
    throw new UnsupportedOperationException("TODO: auto-generated method stub");
  }
}
