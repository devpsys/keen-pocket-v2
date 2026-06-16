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

  @override
  String get contributionsTitle => 'Aportaciones';

  @override
  String get contributeTitle => 'Aportar';

  @override
  String get contributeAmountLabel => 'Monto (₦)';

  @override
  String get contributeAmountHint => 'ej. 5000';

  @override
  String get contributeSubmit => 'Enviar aportación';

  @override
  String get contributeAmountInvalid => 'Introduce un monto mayor que cero.';

  @override
  String get contributionSubmitted => 'Aportación enviada.';

  @override
  String get invoicesEmptyTitle => 'Aún no hay aportaciones';

  @override
  String get invoicesEmptyMessage =>
      'Las aportaciones de este grupo aparecerán aquí.';

  @override
  String get invoiceStatusPending => 'Pendiente';

  @override
  String get invoiceStatusVerified => 'Verificada';

  @override
  String get invoiceStatusDeclined => 'Rechazada';

  @override
  String get invoiceVerify => 'Verificar';

  @override
  String get invoiceDecline => 'Rechazar';

  @override
  String get offlineBanner =>
      'Sin conexión: los cambios se sincronizarán al reconectar.';

  @override
  String get adashiTitle => 'Adashi';

  @override
  String get adashiEmptyTitle => 'Aún no hay círculos';

  @override
  String get adashiEmptyMessage =>
      'Los círculos de ahorro rotativo a los que te unas aparecerán aquí.';

  @override
  String get adashiPerCycle => 'Por ciclo';

  @override
  String adashiCycleProgress(int current, int total) {
    return 'Ciclo $current de $total';
  }

  @override
  String get adashiModeAuto => 'Rotación automática';

  @override
  String get adashiModeManual => 'Rotación manual';

  @override
  String adashiCurrentReceiver(String name) {
    return 'Receptor actual: $name';
  }

  @override
  String get adashiRotationTitle => 'Rotación';

  @override
  String get rotationReceived => 'Recibido';

  @override
  String get rotationCurrent => 'Recibiendo';

  @override
  String get rotationUpcoming => 'Próximo';

  @override
  String get profileWallet => 'Billetera';

  @override
  String get profileNotifications => 'Notificaciones';

  @override
  String get profileAchievements => 'Logros';

  @override
  String get profileSettings => 'Ajustes';

  @override
  String get profileReputation => 'Reputación';

  @override
  String profileKeens(int count) {
    return '$count Keens';
  }

  @override
  String get profileKycVerified => 'KYC verificado';

  @override
  String get walletTitle => 'Billetera';

  @override
  String get walletBalance => 'Saldo disponible';

  @override
  String get walletTransactions => 'Movimientos recientes';

  @override
  String get notificationsTitle => 'Notificaciones';

  @override
  String get notificationsEmptyTitle => 'Estás al día';

  @override
  String get notificationsEmptyMessage =>
      'Las nuevas notificaciones aparecerán aquí.';

  @override
  String get notificationsMarkAllRead => 'Marcar todo como leído';

  @override
  String get achievementsTitle => 'Logros';

  @override
  String get badgesTitle => 'Insignias';

  @override
  String get leaderboardTitle => 'Clasificación';

  @override
  String get profileTrust => 'Confianza y reputación';

  @override
  String get profileFriends => 'Amigos e invitaciones';

  @override
  String get profileLegal => 'Legal';

  @override
  String get trustTitle => 'Confianza y reputación';

  @override
  String get trustReputationScore => 'Puntuación de reputación';

  @override
  String get trustRatingsTitle => 'Valoraciones';

  @override
  String get trustRatingsEmpty => 'Aún no hay valoraciones';

  @override
  String get discoverTitle => 'Descubrir';

  @override
  String get discoverSearchHint => 'Buscar pockets y círculos';

  @override
  String get discoverEmptyTitle => 'Sin resultados';

  @override
  String get discoverEmptyMessage => 'Prueba con otro término de búsqueda.';

  @override
  String get friendsTitle => 'Amigos e invitaciones';

  @override
  String get friendsInviteTitle => 'Invitar amigos';

  @override
  String friendsInviteCode(String code) {
    return 'Tu código de invitación: $code';
  }

  @override
  String get friendsShare => 'Compartir invitación';

  @override
  String get friendsRequests => 'Solicitudes';

  @override
  String get friendsList => 'Amigos';

  @override
  String get friendsPending => 'Pendientes';

  @override
  String get friendsEmptyTitle => 'Aún no hay conexiones';

  @override
  String get friendsEmptyMessage => 'Invita a personas para ahorrar juntos.';

  @override
  String get friendAccept => 'Aceptar';

  @override
  String get friendDecline => 'Rechazar';

  @override
  String get legalTitle => 'Legal';

  @override
  String get legalTerms => 'Términos del servicio';

  @override
  String get legalPrivacy => 'Política de privacidad';

  @override
  String get legalDeleteAccount => 'Eliminar cuenta';

  @override
  String get legalDeleteWarning =>
      'La eliminación de la cuenta es permanente e irreversible.';

  @override
  String get legalPlaceholderBody => 'El documento completo se incluirá aquí.';

  @override
  String dashboardGreeting(String name) {
    return 'Hola, $name';
  }

  @override
  String get dashboardTotalSaved => 'Total ahorrado';

  @override
  String get dashboardActivePockets => 'Pockets activos';

  @override
  String dashboardStreak(int days) {
    return 'Racha de $days días';
  }

  @override
  String get dashboardWeeklyGoal => 'Meta semanal';

  @override
  String get dashboardShortcutPlans => 'Planes de compra';

  @override
  String get charityTitle => 'Caridad';

  @override
  String charityRaisedOfGoal(String raised, String goal) {
    return '$raised de $goal recaudado';
  }

  @override
  String charityDonors(int count) {
    return '$count donantes';
  }

  @override
  String get charityDonate => 'Donar';

  @override
  String get plansTitle => 'Planes';

  @override
  String plansItemsCount(int count) {
    return '$count artículos';
  }

  @override
  String get groupChatTitle => 'Chat del grupo';

  @override
  String get groupChatHint => 'Mensaje';

  @override
  String get groupChatSend => 'Enviar';
}
