package ar.edu.unq.aplicacion.escritorio;

import ar.edu.unq.acahaygatoencerrado.aplicacion.AdministradorSistemaAppModel;
import ar.edu.unq.acahaygatoencerrado.dominio.AdministradorSistema;
import ar.edu.unq.acahaygatoencerrado.dominio.Habitacion;
import ar.edu.unq.acahaygatoencerrado.dominio.Laberinto;
import ar.edu.unq.aplicacion.escritorio.AdministradorSistemaComponentizadoWindow;
import java.util.List;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.Application;
import org.uqbar.arena.windows.Window;

@SuppressWarnings("all")
public class AdministradorSistemaApplication extends Application {
  protected Window<?> createMainWindow() {
    AdministradorSistemaComponentizadoWindow _xblockexpression = null;
    {
      AdministradorSistemaAppModel _administradorSistemaAppModel = new AdministradorSistemaAppModel();
      final Procedure1<AdministradorSistemaAppModel> _function = new Procedure1<AdministradorSistemaAppModel>() {
        public void apply(final AdministradorSistemaAppModel it) {
          AdministradorSistema _administradorSistema = new AdministradorSistema();
          final Procedure1<AdministradorSistema> _function = new Procedure1<AdministradorSistema>() {
            public void apply(final AdministradorSistema it) {
              Laberinto laberinto1 = new Laberinto("laberinto");
              List<Laberinto> _laberintos = it.getLaberintos();
              _laberintos.add(laberinto1);
              Habitacion hab1 = new Habitacion("hab");
              List<Laberinto> _laberintos_1 = it.getLaberintos();
              Laberinto _get = _laberintos_1.get(0);
              _get.habitaciones.add(hab1);
            }
          };
          AdministradorSistema _doubleArrow = ObjectExtensions.<AdministradorSistema>operator_doubleArrow(_administradorSistema, _function);
          it.setAdministrador(_doubleArrow);
        }
      };
      final AdministradorSistemaAppModel model = ObjectExtensions.<AdministradorSistemaAppModel>operator_doubleArrow(_administradorSistemaAppModel, _function);
      _xblockexpression = new AdministradorSistemaComponentizadoWindow(this, model);
    }
    return _xblockexpression;
  }
  
  public static void main(final String[] args) {
    AdministradorSistemaApplication _administradorSistemaApplication = new AdministradorSistemaApplication();
    _administradorSistemaApplication.start();
  }
}
