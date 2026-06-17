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
  String get brandWordmark => 'KeenPocket';

  @override
  String get mascotName => 'Mr K';

  @override
  String get authFooter => 'KeenPocket lleva el registro';

  @override
  String get loginIdentifierLabel => 'Correo, teléfono o usuario';

  @override
  String get loginIdentifierHint => 'Introduce tus datos';

  @override
  String get loginRememberMe => 'Recuérdame';

  @override
  String get authHelp => 'Ayuda';

  @override
  String get splashTagline =>
      'Ahorrar de forma sencilla, divertida y gratificante.';

  @override
  String get splashGetStarted => 'Empezar';

  @override
  String get splashHaveAccount => 'Ya tengo una cuenta';

  @override
  String get onboardingSkip => 'Saltar';

  @override
  String get onboardingNext => 'Siguiente';

  @override
  String get onboardingStart => 'Empezar';

  @override
  String get onboard1Title => 'Ahorren juntos';

  @override
  String get onboard1Body =>
      'Crea Pockets compartidos para las metas de tu grupo.';

  @override
  String get onboard2Title => 'Manténganse al día';

  @override
  String get onboard2Body => 'Sigue las aportaciones y nunca pierdas tu turno.';

  @override
  String get onboard3Title => 'Genera confianza';

  @override
  String get onboard3Body => 'Gana reputación mientras ahorras con otros.';

  @override
  String get loginWelcomeBack => '¡Bienvenido de nuevo!';

  @override
  String get loginSubtitle => 'Inicia sesión para seguir tus pockets.';

  @override
  String get loginForgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get loginOr => 'O';

  @override
  String get loginGoogle => 'Google';

  @override
  String get loginFacebook => 'Facebook';

  @override
  String get loginNoAccount => '¿No tienes una cuenta?';

  @override
  String get loginCreateAccount => 'Crear cuenta';

  @override
  String get registerTitle => '¡Únete al club!';

  @override
  String get registerSubtitle => 'Crea tu pocket de sabiduría';

  @override
  String get registerFullName => 'Nombre completo';

  @override
  String get registerPhone => 'Número de teléfono';

  @override
  String get registerConfirmPassword => 'Confirmar contraseña';

  @override
  String get registerAgree =>
      'Acepto los Términos del servicio y la Política de privacidad';

  @override
  String get registerSubmit => 'Crear cuenta';

  @override
  String get registerHaveAccount => '¿Ya tienes una cuenta?';

  @override
  String get otpTitle => 'Verifica tu identidad';

  @override
  String get otpSubtitle => 'Enviamos un código de 6 dígitos a';

  @override
  String get otpMaintenance =>
      'La verificación por SMS está en mantenimiento. Usa el correo electrónico.';

  @override
  String get otpResend => 'Reenviar código';

  @override
  String get otpVerify => 'Verificar';

  @override
  String get otpTryAnother => 'Probar otra forma';

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
  String get pocketsMyTitle => 'Mis Pockets';

  @override
  String get pocketsTip =>
      'Ahorrar con amigos hace 3 veces más probable alcanzar la meta. ¡Choca esos cinco! 🤚';

  @override
  String get pocketBrowsePublic => 'Explorar pockets públicos';

  @override
  String get pocketsInsuredNote =>
      'Todos los pockets están asegurados por NDIC y verificados.';

  @override
  String get pocketStatusActive => 'Activo';

  @override
  String get pocketStatusFull => 'Lleno';

  @override
  String get pocketNextHand => 'Tu próxima mano';

  @override
  String get pocketStartSaving => 'Empieza a ahorrar juntos';

  @override
  String get createPocketTitle => 'Crear pocket';

  @override
  String get createPocketIntroTitle => '¿Listo para un nuevo Pocket?';

  @override
  String get createPocketIntroBody =>
      'Completa los detalles para empezar tu viaje de ahorro con amigos.';

  @override
  String get createPocketTitleLabel => 'Título del pocket';

  @override
  String get createPocketTitleHint => 'ej. Vacaciones soñadas 2026';

  @override
  String get createPocketDescLabel => 'Descripción';

  @override
  String get createPocketDescHint => '¿Para qué ahorramos?';

  @override
  String get createPocketYear => 'Año';

  @override
  String get createPocketCost => 'Cuesta 1 Keen';

  @override
  String get createPocketStartMonth => 'Mes de inicio';

  @override
  String get createPocketDuration => 'Duración (meses)';

  @override
  String get createPocketPerHand => '₦ Por mano';

  @override
  String get createPocketCapacity => 'Capacidad de miembros';

  @override
  String get createPocketCapacityHint => '0 = ilimitado';

  @override
  String get createPocketYourHands => 'Tus manos (tu parte)';

  @override
  String get createPocketTermsTitle => 'Aviso de términos';

  @override
  String get createPocketTermsBody =>
      'Al crear este Pocket, aceptas facilitar aportaciones justas. Los Pockets no se pueden eliminar una vez que los miembros han aportado. Asegúrate de que la duración y los montos por mano sean definitivos.';

  @override
  String get createPocketTermsAgree => 'Entiendo y acepto los términos';

  @override
  String get createPocketSubmit => 'Crear pocket';

  @override
  String get pocketStatusOpen => 'Abierto';

  @override
  String get pocketDetailRateAdmin => 'Valorar admin';

  @override
  String get pocketDetailShare => 'Compartir';

  @override
  String pocketDetailHandDuration(String amount) {
    return '$amount / mano · 6 meses de duración';
  }

  @override
  String pocketDetailMonthsCompleted(int done, int total) {
    return '$done de $total meses completados';
  }

  @override
  String get pocketDetailPaid => 'Pagado';

  @override
  String get pocketDetailNotPaid => 'No pagado';

  @override
  String get pocketDetailPendingApprovals => 'Aprobaciones pendientes';

  @override
  String get pocketDetailMarkPaid => 'Marcar pagado';

  @override
  String get pocketDetailMyProgress => 'Mi progreso';

  @override
  String pocketDetailProgressDesc(String raised, String target) {
    return 'Has aportado $raised de tu meta de $target.';
  }

  @override
  String get pocketDetailMyContributions => 'Mis aportaciones';

  @override
  String get pocketDetailViewAll => 'Ver todo';

  @override
  String get pocketDetailPayoutAccount => 'Cuenta de cobro';

  @override
  String get pocketDetailMembers => 'Miembros';

  @override
  String pocketMemberHands(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count manos',
      one: '1 mano',
    );
    return '$_temp0';
  }

  @override
  String get pocketDetailTopContributors => 'Principales aportantes';

  @override
  String get pocketDetailGroupRules => 'Reglas del grupo';

  @override
  String get pocketDetailRule1 => 'Aportaciones antes del día 5 de cada mes.';

  @override
  String get pocketDetailRule2 => 'Tarifa de admin: ₦200 por mano al mes.';

  @override
  String get pocketDetailRule3 =>
      'El impago durante 2 meses conlleva la expulsión.';

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
  String get payConfirmTitle => 'Confirmar pago';

  @override
  String get payWalletBalance => 'Saldo de la billetera';

  @override
  String get payInvoiceAmount => 'Monto de la factura';

  @override
  String get payNewBalance => 'Nuevo saldo';

  @override
  String payFromWallet(String amount) {
    return 'Pagar $amount desde la billetera';
  }

  @override
  String get payInsufficientTitle => 'Saldo insuficiente';

  @override
  String get payRequiredAmount => 'Monto requerido';

  @override
  String payShortfall(String amount) {
    return 'Necesitas $amount más para completar esta transacción.';
  }

  @override
  String get payTopUp => 'Recargar billetera';

  @override
  String get paySecure =>
      'KeenPocket usa cifrado de nivel bancario para proteger cada transacción.';

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
  String get moneyPayoutAccount => 'Cuenta de cobro';

  @override
  String get moneyBankLabel => 'Banco';

  @override
  String get moneyNubanLabel => 'NUBAN';

  @override
  String get moneyEditAccount => 'Editar cuenta';

  @override
  String get moneyNoAccounts => 'Aún no hay cuenta de cobro.';

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
  String get trustScoreCaption => 'Puntuación de confianza';

  @override
  String trustMemberSince(String date) {
    return 'Miembro desde $date';
  }

  @override
  String get trustReliability => 'Fiabilidad de pago';

  @override
  String get trustPocketsJoined => 'Pockets unidos';

  @override
  String get trustAdashisCompleted => 'Adashis completados';

  @override
  String trustAvgRating(int count) {
    return 'Valoración media ($count)';
  }

  @override
  String trustRateTitle(String name) {
    return 'Valorar a $name';
  }

  @override
  String get trustRateCommentHint => 'Añade un comentario (opcional)';

  @override
  String get trustRateSubmit => 'Enviar valoración';

  @override
  String get trustVouch => 'Avalar';

  @override
  String get trustInviteToPocket => 'Invitar al pocket';

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
  String get dashboardAdashiGroups => 'Grupos adashi';

  @override
  String get dashboardReputation => 'Reputación';

  @override
  String get dashboardWalletBalance => 'Saldo de la billetera';

  @override
  String get dashboardComplete => 'Completa';

  @override
  String get dashboardWeekStreak => 'Racha semanal';

  @override
  String get dashboardFreezesLeft => 'Congelaciones restantes';

  @override
  String get dashboardResetsMonday => 'Se reinicia el lunes';

  @override
  String get dashboardClaimReward => 'Reclamar recompensa';

  @override
  String get dashboardContributionTrend => 'Tendencia de aportaciones';

  @override
  String get dashboardMyPockets => 'Mis Pockets';

  @override
  String get dashboardMyAdashi => 'Mis Adashi';

  @override
  String get dashboardViewAll => 'Ver todo';

  @override
  String dashboardPerHand(String amount) {
    return '$amount / mano';
  }

  @override
  String dashboardPerCycle(String amount) {
    return '$amount / ciclo';
  }

  @override
  String dashboardMembersParticipating(int count) {
    return '$count miembros participando';
  }

  @override
  String get dashboardJoinGroup => 'Unirse al grupo';

  @override
  String get dashboardPoints => 'PTS';

  @override
  String get dashboardFooter =>
      'KeenPocket lleva el registro — nunca retiene tu dinero.';

  @override
  String get dashboardCopyright => '© KeenPocket Nigeria';

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
  String charityRaised(String amount) {
    return '$amount recaudado';
  }

  @override
  String charityGoal(String amount) {
    return 'meta de $amount';
  }

  @override
  String charityReached(int percent) {
    return '$percent% alcanzado';
  }

  @override
  String get charityEnterAmount => 'Introduce el monto de la donación';

  @override
  String get charityDonateNow => 'Donar ahora';

  @override
  String get charitySecure => 'Tu contribución es segura y transparente.';

  @override
  String get plansTitle => 'Planes';

  @override
  String plansItemsCount(int count) {
    return '$count artículos';
  }

  @override
  String get shoppingListTitle => 'Lista de compras';

  @override
  String shoppingUnitPrice(String price) {
    return '$price / unidad';
  }

  @override
  String shoppingSharing(int count) {
    return '× $count compartiendo';
  }

  @override
  String get shoppingTotalCost => 'Costo total';

  @override
  String get shoppingEstimatedTotal => 'Total estimado del grupo';

  @override
  String get shoppingSuggestItem => 'Sugerir artículo';

  @override
  String get shoppingSuggestionsClosed => 'Sugerencias cerradas';

  @override
  String get shoppingEmpty => 'Aún no hay artículos — sugiere el primero.';

  @override
  String get groupChatTitle => 'Chat del grupo';

  @override
  String get groupChatHint => 'Mensaje';

  @override
  String get groupChatSend => 'Enviar';

  @override
  String groupChatMembersOnline(int count) {
    return '$count miembros en línea';
  }

  @override
  String get groupChatEmptyTitle => 'Aún no hay mensajes — saluda 👋';

  @override
  String get groupChatEmptyMessage =>
      'Sé el primero en iniciar la conversación.';

  @override
  String get disputesTitle => 'Disputas';

  @override
  String get disputesRaise => 'Plantear una disputa';

  @override
  String get disputesActiveCases => 'Casos activos';

  @override
  String disputesOpenCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count abiertos',
      one: '1 abierto',
      zero: 'Sin casos abiertos',
    );
    return '$_temp0';
  }

  @override
  String get disputesResolvedThisMonth => 'Resueltas este mes';

  @override
  String get disputesAvgResolution => 'Tiempo medio de resolución';

  @override
  String get disputesResolutionNote => 'Nota de resolución';

  @override
  String get disputesEmpty => 'Sin disputas — todo en orden.';

  @override
  String get disputeStatusOpen => 'Abierta';

  @override
  String get disputeStatusResolved => 'Resuelta';

  @override
  String get disputeStatusDismissed => 'Desestimada';

  @override
  String get profileSchool => 'Escuela';

  @override
  String get profileAdmin => 'Administración';

  @override
  String get schoolTitle => 'Escuela';

  @override
  String get schoolClasses => 'Clases';

  @override
  String get schoolStudents => 'Estudiantes';

  @override
  String get schoolFeesCollected => 'Cuotas recaudadas';

  @override
  String get adminTitle => 'Administración';

  @override
  String get adminHealthScore => 'Salud de cobro';

  @override
  String get adminActiveAdmins => 'Administradores activos';

  @override
  String get adminKeensInCirculation => 'Keens en circulación';

  @override
  String get adminPermissionDenied => 'No tienes acceso a esta área.';
}
