package ar.edu.unq.aplicacion.escritorio;

import ar.edu.unq.acahaygatoencerrado.aplicacion.CrearLaberintoAppModel;
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.Dialog;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class NuevoLaberintoWindow extends Dialog<CrearLaberintoAppModel> {
  public NuevoLaberintoWindow(final WindowOwner owner, final AdministradorSistema model) {
    super(owner, new CrearLaberintoAppModel(model));
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    this.setTitle("Nuevo Laberinto");
    Label _label = new Label(mainPanel);
    _label.setText("Agregue un nombre al laberinto");
    TextBox _textBox = new TextBox(mainPanel);
    final Procedure1<TextBox> _function = new Procedure1<TextBox>() {
      public void apply(final TextBox it) {
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "nombreLaberinto");
        it.setWidth(200);
      }
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function);
    final Panel panelDeBotonesNuevoLaberinto = new Panel(this);
    this.crearPanelDeBotonesNuevoLaberinto(panelDeBotonesNuevoLaberinto);
  }
  
  public Button crearPanelDeBotonesNuevoLaberinto(final Panel owner) {
    Button _xblockexpression = null;
    {
      final Panel panelDeBotonesNuevoLaberinto = new Panel(owner);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      panelDeBotonesNuevoLaberinto.setLayout(_horizontalLayout);
      Button _button = new Button(panelDeBotonesNuevoLaberinto);
      final Procedure1<Button> _function = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Aceptar");
          final Action _function = new Action() {
            public void execute() {
              CrearLaberintoAppModel _modelObject = NuevoLaberintoWindow.this.getModelObject();
              _modelObject.agregarLaberinto();
              NuevoLaberintoWindow.this.close();
            }
          };
          it.onClick(_function);
        }
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
      Button _button_1 = new Button(panelDeBotonesNuevoLaberinto);
      final Procedure1<Button> _function_1 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Cancelar");
          final Action _function = new Action() {
            public void execute() {
              NuevoLaberintoWindow.this.close();
            }
          };
          it.onClick(_function);
        }
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
    }
    return _xblockexpression;
  }
}
