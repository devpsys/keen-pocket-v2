// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'KeenPockets';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get submit => 'Enviar';

  @override
  String get welcome => 'Bienvenido';

  @override
  String welcomeBack(String name) {
    return '¡Bienvenido de nuevo, $name!';
  }

  @override
  String get emailLabel => 'Correo electrónico';

  @override
  String get emailHint => 'tu@ejemplo.com';

  @override
  String get passwordLabel => 'Contraseña';

  @override
  String get passwordHint => 'Introduce tu contraseña';

  @override
  String get validationEmailRequired => 'El correo es obligatorio.';

  @override
  String get validationEmailInvalid =>
      'Introduce un correo electrónico válido.';

  @override
  String get validationPasswordRequired => 'La contraseña es obligatoria.';

  @override
  String get validationPasswordTooShort =>
      'La contraseña debe tener al menos 8 caracteres.';

  @override
  String get errorGeneric => 'Algo salió mal. Inténtalo de nuevo.';

  @override
  String get errorNetwork =>
      'Sin conexión a internet. Revisa tu red e inténtalo de nuevo.';

  @override
  String get errorServer =>
      'Nuestros servidores tuvieron un problema. Inténtalo en breve.';

  @override
  String get errorUnauthorized => 'Tu sesión expiró. Inicia sesión de nuevo.';

  @override
  String get errorPermission => 'No tienes permiso para hacer eso.';

  @override
  String get errorFeatureDisabled => 'Esta función estará disponible pronto.';

  @override
  String get errorCache => 'No se pudieron leer los datos guardados.';

  @override
  String get errorValidation => 'Corrige los campos resaltados.';

  @override
  String get comingSoonTitle => 'Próximamente';

  @override
  String get comingSoonMessage =>
      'Todavía lo estamos construyendo. Vuelve pronto.';

  @override
  String get retry => 'Reintentar';

  @override
  String get emptyTitle => 'Aún no hay nada';

  @override
  String get emptyMessage => 'Cuando haya datos para mostrar, aparecerán aquí.';

  @override
  String get loading => 'Cargando…';

  @override
  String get dashboardTitle => 'Panel';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get pocketsTitle => 'Pockets';

  @override
  String get pocketsEmptyTitle => 'Aún no hay pockets';

  @override
  String get pocketsEmptyMessage =>
      'Los pockets que crees o a los que te unas aparecerán aquí.';

  @override
  String pocketMembersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count miembros',
      one: '1 miembro',
      zero: 'Sin miembros',
    );
    return '$_temp0';
  }

  @override
  String pocketHandsFilled(int filled, int total) {
    return '$filled/$total manos ocupadas';
  }

  @override
  String get pocketHandPrice => 'Precio por mano';

  @override
  String get pocketOrganiser => 'Organizador';

  @override
  String get roleOrganiser => 'Organizador';

  @override
  String get roleMember => 'Miembro';

  @override
  String get roleGuest => 'Invitado';
}
