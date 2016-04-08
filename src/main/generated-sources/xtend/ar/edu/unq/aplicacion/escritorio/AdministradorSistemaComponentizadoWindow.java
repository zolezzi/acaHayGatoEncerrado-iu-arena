package ar.edu.unq.aplicacion.escritorio;

import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorSistemaAppModel;
import ar.edu.unq.acahaygatoencerrado.dominio.Accion;
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema;
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion;
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto;
import ar.edu.unq.aplicacion.componentes.Titulo;
import ar.edu.unq.aplicacion.escritorio.NuevoLaberintoWindow;
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
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.ListBuilder;
import org.uqbar.lacar.ui.model.bindings.Binding;

@SuppressWarnings("all")
public class AdministradorSistemaComponentizadoWindow extends SimpleWindow<AdministradorSistemaAppModel> {
  public AdministradorSistemaComponentizadoWindow(final WindowOwner owner, final AdministradorSistemaAppModel model) {
    super(owner, model);
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
    this.crearAdministradorCaracteristicasYAcciones(contentPanel);
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
          Binding _spaceship = ArenaXtendExtensions.operator_spaceship(_items, "laberintos");
          PropertyAdapter _propertyAdapter = new PropertyAdapter(Laberinto.class, "nombre");
          _spaceship.setAdapter(_propertyAdapter);
          it.setHeight(270);
          it.setWidth(185);
          ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
          ArenaXtendExtensions.operator_spaceship(_value, "laberintoSeleccionado");
        }
      };
      ObjectExtensions.<List<Laberinto>>operator_doubleArrow(_list, _function);
      final Panel panelDeBotonesAdministradorLaberintos = new Panel(panelDeListadoDeLaberintos);
      this.crearPanelDeBotonesHorizontalParaAdministradorLaberintos(panelDeBotonesAdministradorLaberintos);
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
  
  public Button crearPanelDeBotonesHorizontalParaAdministradorLaberintos(final Panel owner) {
    Button _xblockexpression = null;
    {
      final Panel panelDeBotonesAdministradorLaberintos = new Panel(owner);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      panelDeBotonesAdministradorLaberintos.setLayout(_horizontalLayout);
      Button _button = new Button(panelDeBotonesAdministradorLaberintos);
      final Procedure1<Button> _function = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Crear Laberinto");
          final Action _function = new Action() {
            public void execute() {
              AdministradorSistemaAppModel _modelObject = AdministradorSistemaComponentizadoWindow.this.getModelObject();
              AdministradorSistema _administrador = _modelObject.getAdministrador();
              NuevoLaberintoWindow _nuevoLaberintoWindow = new NuevoLaberintoWindow(AdministradorSistemaComponentizadoWindow.this, _administrador);
              _nuevoLaberintoWindow.open();
            }
          };
          it.onClick(_function);
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
          Binding _spaceship = ArenaXtendExtensions.operator_spaceship(_items, "laberintoSeleccionado.habitaciones");
          PropertyAdapter _propertyAdapter = new PropertyAdapter(Habitacion.class, "nombre");
          _spaceship.setAdapter(_propertyAdapter);
          it.setHeight(270);
          it.setWidth(185);
          ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
          ArenaXtendExtensions.operator_spaceship(_value, "habitacionSeleccionada");
        }
      };
      ObjectExtensions.<List<Habitacion>>operator_doubleArrow(_list, _function);
      final Panel panelDeBotonesAdministradorLaberintos = new Panel(panelDeListadoDeHabitaciones);
      _xblockexpression = this.crearPanelDeBotonesHorizontalParaAdministradorHabitaciones(panelDeBotonesAdministradorLaberintos);
    }
    return _xblockexpression;
  }
  
  public Button crearPanelDeBotonesHorizontalParaAdministradorHabitaciones(final Panel owner) {
    Button _xblockexpression = null;
    {
      final Panel panelDeBotonesAdministradorHabitaciones = new Panel(owner);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      panelDeBotonesAdministradorHabitaciones.setLayout(_horizontalLayout);
      Button _button = new Button(panelDeBotonesAdministradorHabitaciones);
      final Procedure1<Button> _function = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Agregar Habitación");
        }
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
      Button _button_1 = new Button(panelDeBotonesAdministradorHabitaciones);
      final Procedure1<Button> _function_1 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Quitar Habitación");
        }
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
    }
    return _xblockexpression;
  }
  
  public Button crearAdministradorCaracteristicasYAcciones(final Panel owner) {
    Button _xblockexpression = null;
    {
      final Panel panelDeListadoDeAcciones = new Panel(owner);
      new Titulo(panelDeListadoDeAcciones, "Acciones");
      List<Habitacion> _list = new List<Habitacion>(panelDeListadoDeAcciones);
      final Procedure1<List<Habitacion>> _function = new Procedure1<List<Habitacion>>() {
        public void apply(final List<Habitacion> it) {
          ObservableItems<Selector<Habitacion>, Habitacion, ListBuilder<Habitacion>> _items = it.items();
          Binding _spaceship = ArenaXtendExtensions.operator_spaceship(_items, "habitacionSeleccionada.acciones");
          PropertyAdapter _propertyAdapter = new PropertyAdapter(Accion.class, "nombre");
          _spaceship.setAdapter(_propertyAdapter);
          it.setHeight(180);
          it.setWidth(185);
          ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
          ArenaXtendExtensions.operator_spaceship(_value, "accionSeleccionada");
        }
      };
      ObjectExtensions.<List<Habitacion>>operator_doubleArrow(_list, _function);
      final Panel panelDeBotonesAdministradorDeAcciones = new Panel(panelDeListadoDeAcciones);
      _xblockexpression = this.crearPanelDeBotonesHorizontalParaAdministradorDeAcciones(panelDeBotonesAdministradorDeAcciones);
    }
    return _xblockexpression;
  }
  
  public Button crearPanelDeBotonesHorizontalParaAdministradorDeAcciones(final Panel owner) {
    Button _xblockexpression = null;
    {
      final Panel panelDeBotonesAdministradorHabitaciones = new Panel(owner);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      panelDeBotonesAdministradorHabitaciones.setLayout(_horizontalLayout);
      Button _button = new Button(panelDeBotonesAdministradorHabitaciones);
      final Procedure1<Button> _function = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Agregar Acción");
        }
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
      Button _button_1 = new Button(panelDeBotonesAdministradorHabitaciones);
      final Procedure1<Button> _function_1 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Quitar Acción");
        }
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
    }
    return _xblockexpression;
  }
}
