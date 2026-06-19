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
  String get navCollapseRail => 'Contraer menú';

  @override
  String get navExpandRail => 'Expandir menú';

  @override
  String get mascotName => 'Mr K';

  @override
  String get authFooter => 'KeenPocket lleva el registro';

  @override
  String get authCopyright => '© KeenPocket. Únete a la bandada.';

  @override
  String get authSupport => 'Soporte';

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
  String get onboardingContinue => 'Continuar';

  @override
  String get onboardingStart => 'Empezar';

  @override
  String get onboardingJoined => 'Más de 2M de ahorradores se unieron';

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
  String get pocketsSubtitle =>
      'Gestiona tus aportaciones y metas comunitarias.';

  @override
  String get pocketsCreateNew => 'Crear nuevo Pocket';

  @override
  String get pocketsSearchHint => 'Busca tus pockets…';

  @override
  String get pocketsSectionOrganise => 'Pockets que organizo';

  @override
  String get pocketsSectionIn => 'Pockets en los que estoy';

  @override
  String get pocketsStartNewGroup => 'Iniciar nuevo grupo';

  @override
  String get pocketsMonthlyContribution => 'Aportación mensual';

  @override
  String get pocketsYourShare => 'Tu parte';

  @override
  String pocketsHandsJoined(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count manos unidas',
      one: '1 mano unida',
    );
    return '$_temp0';
  }

  @override
  String get pocketsGoalProgress => 'Progreso de la meta';

  @override
  String get pocketsCycleProgress => 'Progreso del ciclo';

  @override
  String pocketsTipTitle(String name) {
    return '¡Buen trabajo, $name!';
  }

  @override
  String get pocketsTipBody =>
      'Has hecho todas tus aportaciones este mes. ¡Vas camino a tu próximo pago!';

  @override
  String get pocketsViewHistory => 'Ver historial';

  @override
  String get pocketsPocketStats => 'Estadísticas';

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
  String get createPocketSectionGeneral => 'Detalles generales';

  @override
  String get createPocketSectionTimeline => 'Cronograma';

  @override
  String get createPocketSectionContribution => 'Aportación';

  @override
  String get createPocketYourHandsSubtitle => '¿Cuántos cupos vas a tomar?';

  @override
  String get createPocketVerified => 'Verificado';

  @override
  String get createPocketCollaborative => 'Colaborativo';

  @override
  String createPocketMonthsAbbrev(int count) {
    return '$count m';
  }

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
  String get pocketStatusClosed => 'Cerrado';

  @override
  String pocketsPerHand(String amount) {
    return '$amount / mano';
  }

  @override
  String pocketsHandsCount(int count) {
    return '$count manos';
  }

  @override
  String pocketsScheduleLabel(int months, int year) {
    return '$months meses · $year';
  }

  @override
  String pocketsActiveCount(int count) {
    return '$count activos';
  }

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
  String get pocketDetailVerified => 'Verificado';

  @override
  String get pocketDetailContributionType => 'Aportación';

  @override
  String get pocketDetailUpcomingType => 'Próxima';

  @override
  String get pocketDetailGroupShopping => 'Compra grupal';

  @override
  String pocketDetailGroupPrice(String amount) {
    return '$amount precio grupal';
  }

  @override
  String pocketDetailSharedBy(String name) {
    return 'Compartido por $name';
  }

  @override
  String get pocketDetailTitle => 'Detalles del pocket';

  @override
  String get pocketDetailSearchMembers => 'Buscar miembros…';

  @override
  String get pocketDetailTarget => 'Meta';

  @override
  String get pocketDetailPerHandShort => '₦ / mano';

  @override
  String get pocketDetailDuration => 'Duración';

  @override
  String pocketDetailMonths(int count) {
    return '$count meses';
  }

  @override
  String get pocketDetailSharePocket => 'Compartir pocket';

  @override
  String get pocketDetailMrKTitle => 'El Sr. K dice:';

  @override
  String get pocketDetailMrKMessage =>
      '¡Estás a solo 3 aportaciones de tu próxima insignia!';

  @override
  String get pocketDetailGoal => 'Meta';

  @override
  String get pocketDetailContributed => 'Aportado';

  @override
  String get pocketDetailFrequency => 'Frecuencia';

  @override
  String get pocketDetailFrequencyMonthly => 'Mensual';

  @override
  String get pocketDetailContributeNow => 'Aportar ahora';

  @override
  String get pocketDetailViewHistory => 'Ver historial';

  @override
  String get pocketDetailGroupShoppingSuggestions =>
      'Sugerencias de compra grupal';

  @override
  String get pocketDetailBeta => 'BETA';

  @override
  String get pocketDetailVoteForItem => 'Votar artículo';

  @override
  String pocketDetailGroupPriceShort(String amount) {
    return 'Precio grupal: $amount';
  }

  @override
  String get pocketDetailNewJoinRequest => 'Nueva solicitud';

  @override
  String pocketDetailMembersWithCount(int count) {
    return 'Miembros ($count)';
  }

  @override
  String get pocketDetailRoleOrganizer => 'ORGANIZADOR';

  @override
  String get pocketDetailRoleMember => 'MIEMBRO';

  @override
  String get pocketDetailTabletRule1 =>
      'Todas las aportaciones deben hacerse antes del día 15 de cada mes para evitar recargos.';

  @override
  String get pocketDetailTabletRule2 =>
      'El retiro anticipado solo se permite en emergencias votadas por el grupo con una comisión del 5%.';

  @override
  String get pocketDetailTabletRule3 =>
      'Las sugerencias de compra requieren al menos un 60% de aprobación de los miembros para finalizarse.';

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
  String profileLevel(int level) {
    return 'NVL $level';
  }

  @override
  String get profileTrustScore => 'Puntuación de confianza';

  @override
  String get profileKycCheckTitle => 'Verificación de identidad KYC';

  @override
  String get profileKycCheckBody =>
      'Verifica tu identidad para desbloquear límites más altos.';

  @override
  String get profileVerify => 'Verificar';

  @override
  String get profileStatPaymentReliability => 'Fiabilidad de pago';

  @override
  String get profileStatPocketsJoined => 'Pockets unidos';

  @override
  String get profileStatAdashisCompleted => 'Adashis completados';

  @override
  String get profileStatAvgRating => 'Calificación media';

  @override
  String get profileViewAll => 'Ver todo';

  @override
  String get profileRecentReviews => 'Reseñas recientes';

  @override
  String profileSeeAllReviews(int count) {
    return 'Ver las $count reseñas';
  }

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsProfilePhoto => 'Foto de perfil';

  @override
  String get settingsPhotoBlurb =>
      'Actualiza tu foto para destacar tu perfil ante tus contactos.';

  @override
  String get settingsUploadPhoto => 'Subir nueva foto';

  @override
  String get settingsAccountInfo => 'Información de la cuenta';

  @override
  String get settingsName => 'Nombre';

  @override
  String get settingsEmail => 'Correo electrónico';

  @override
  String get settingsPhone => 'Número de teléfono';

  @override
  String get settingsContactSupport =>
      'Contacta con soporte para cambiar tu correo o teléfono.';

  @override
  String get settingsNotifPrefs => 'Preferencias de notificaciones';

  @override
  String get settingsPushNotif => 'Notificaciones push';

  @override
  String get settingsPushNotifSub => 'Alertas en tiempo real en tu dispositivo';

  @override
  String get settingsSmsNotif => 'Notificaciones SMS';

  @override
  String get settingsSmsNotifSub => 'Actualizaciones críticas por mensaje';

  @override
  String get settingsWhatsappNotif => 'Novedades por WhatsApp';

  @override
  String get settingsWhatsappNotifSub => 'Resúmenes semanales y recompensas';

  @override
  String get settingsChangePassword => 'Cambiar contraseña';

  @override
  String get settingsCurrentPassword => 'Contraseña actual';

  @override
  String get settingsNewPassword => 'Nueva contraseña';

  @override
  String get settingsConfirmPassword => 'Confirmar nueva contraseña';

  @override
  String get settingsUpdatePassword => 'Actualizar contraseña';

  @override
  String get settingsBankAccounts => 'Cuentas bancarias';

  @override
  String get settingsManage => 'Gestionar';

  @override
  String get settingsPrimaryAccount => 'Cuenta principal vinculada';

  @override
  String get settingsAppSettings => 'Ajustes de la app';

  @override
  String get settingsDarkMode => 'Modo oscuro';

  @override
  String get settingsMore => 'Más';

  @override
  String settingsVersion(String version) {
    return 'Versión $version';
  }

  @override
  String get publicProfileYou => '(tú)';

  @override
  String get publicProfileVerified => 'Verificado';

  @override
  String get publicProfileRating => 'Calificación';

  @override
  String get publicProfileGroups => 'Grupos';

  @override
  String get publicProfileTrust => 'Confianza';

  @override
  String publicProfileGroupsBy(String name) {
    return 'Grupos de $name';
  }

  @override
  String get publicProfileOpenPocket => 'Pocket abierto';

  @override
  String get publicProfileAdashiCircle => 'Círculo Adashi';

  @override
  String publicProfileFunded(int percent) {
    return '$percent% financiado';
  }

  @override
  String get publicProfileRatingsReceived => 'Valoraciones recibidas';

  @override
  String get publicProfileAddRecommendation => 'Añadir recomendación';

  @override
  String publicProfileLegendTitle(String name) {
    return '¡Eres una leyenda, $name!';
  }

  @override
  String get publicProfileLegendBody =>
      'Tu puntuación de reputación está en el 5% superior de contribuyentes de Lagos este mes. ¡Sigue así!';

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
  String get discoverSearchPlaceholder => 'Buscar pockets y adashi…';

  @override
  String get discoverFilterTrending => 'Tendencia';

  @override
  String get discoverFilterSchoolFees => 'Matrícula';

  @override
  String get discoverFilterGroceries => 'Comestibles';

  @override
  String get discoverFilterTravel => 'Viajes';

  @override
  String get discoverPopularPockets => 'Pockets populares';

  @override
  String get discoverViewAll => 'Ver todo';

  @override
  String get discoverContribution => 'Aportación';

  @override
  String get discoverMembers => 'Miembros';

  @override
  String get discoverStartDate => 'Fecha de inicio';

  @override
  String discoverAdmin(String name) {
    return 'Admin: $name';
  }

  @override
  String get discoverBadgeKyc => 'KYC verificado';

  @override
  String get discoverBadgeOfficial => 'Oficial';

  @override
  String get discoverBadgeAdashi => 'Adashi';

  @override
  String get discoverJoin => 'Unirse';

  @override
  String discoverRating(String rating) {
    return '($rating)';
  }

  @override
  String discoverPerUnit(String unit) {
    return '/$unit';
  }

  @override
  String get discoverTipTitle => '¡Consejo del Sr. K!';

  @override
  String get discoverTip =>
      '¡Siempre verifica la insignia de verificación al unirte a pockets públicos!';

  @override
  String exploreManagedBy(String name) {
    return 'Gestionado por $name';
  }

  @override
  String exploreRep(String rating) {
    return '$rating Rep';
  }

  @override
  String exploreMembersCount(int count) {
    return '$count miembros';
  }

  @override
  String explorePerCycle(String amount) {
    return '$amount / ciclo';
  }

  @override
  String exploreCycleLength(int days) {
    return 'ciclo de $days días';
  }

  @override
  String get exploreAdminManaged =>
      'Gestionado por admin — pide que te agreguen';

  @override
  String get exploreCircleRules => 'Reglas del círculo';

  @override
  String get exploreJoinCircle => 'Unirse al círculo';

  @override
  String get exploreMrKSays => 'El Sr. K dice:';

  @override
  String get exploreVitalStats => 'Estadísticas del círculo';

  @override
  String get exploreMembersLabel => 'Miembros';

  @override
  String get explorePerCycleLabel => 'Por ciclo';

  @override
  String get exploreCycleLengthLabel => 'Duración del ciclo';

  @override
  String exploreMembersOfCapacity(int filled, int total) {
    return '$filled/$total';
  }

  @override
  String exploreDaysValue(int days) {
    return '$days días';
  }

  @override
  String get exploreNextPayout => 'Progreso del próximo pago';

  @override
  String get exploreRatingLabel => 'Calificación';

  @override
  String get exploreCirclesLabel => 'Círculos';

  @override
  String get exploreCompletionLabel => 'Completado';

  @override
  String exploreCircleOrganiser(String circle) {
    return 'Organizador de $circle';
  }

  @override
  String get exploreLimitedSpots => 'Plazas limitadas disponibles.';

  @override
  String get insightsTitle => 'Análisis e informes';

  @override
  String get insightsYearInReview => 'Año en resumen';

  @override
  String get insightsHeroBody =>
      '¡Vaya! Has tenido un año increíble de ahorro inteligente y generosidad. ¡El Sr. K está orgulloso!';

  @override
  String get insightsTotalSaved => 'Total ahorrado ₦';

  @override
  String get insightsTotalSavedCaption => 'aportaciones verificadas';

  @override
  String get insightsSavedThisYear => 'Ahorrado este año ₦';

  @override
  String get insightsSavedThisYearCaption => '24% más que en 2023';

  @override
  String get insightsDonated => 'Donado (Sadaqah) ₦';

  @override
  String get insightsDonatedCaption => 'marcando la diferencia';

  @override
  String get insightsContributions => 'Aportaciones';

  @override
  String get insightsContributionsCaption => 'transacciones verificadas';

  @override
  String get insightsPockets => 'Pockets';

  @override
  String get insightsPocketsCaption => 'metas activas';

  @override
  String get insightsAdashi => 'Adashi';

  @override
  String get insightsAdashiCaption => 'círculos comunitarios';

  @override
  String get insightsFootnote =>
      'KeenPocket guarda los registros — nunca retiene tu dinero.';

  @override
  String get insightsShareMyYear => 'Compartir mi año';

  @override
  String get insightsMrKAdvice => 'Consejo del Sr. K';

  @override
  String get insightsMrKAdviceBody =>
      'Crear riqueza es un maratón, no un sprint. Tu constancia este año es realmente inspiradora. ¿Por qué no apuntar a un 5% más en tu Sadaqah el próximo mes?';

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
  String get dashboardTabOverview => 'Resumen';

  @override
  String get dashboardTabHistory => 'Historial';

  @override
  String get dashboardTabAnalytics => 'Analíticas';

  @override
  String get dashboardSearchHint => 'Buscar…';

  @override
  String dashboardSavedThisMonth(String amount) {
    return 'Has ahorrado $amount este mes. ¡Sigue así!';
  }

  @override
  String dashboardStreakTitle(int count) {
    return '¡Racha de $count semanas!';
  }

  @override
  String dashboardStreakSubtitle(int count) {
    return '¡Estás en racha! Te quedan $count congelaciones 🧊';
  }

  @override
  String get dashboardLast7Days => 'Últimos 7 días';

  @override
  String get dashboardTrendCaption => 'Visualizando tu progreso…';

  @override
  String get dashboardInProgress => 'En progreso';

  @override
  String get dashboardActiveCycle => 'Ciclo activo';

  @override
  String dashboardGoalReached(int percent) {
    return '$percent% de la meta alcanzado';
  }

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
  String get plansWelcomeTitle => '¡Bienvenido a tus Planes!';

  @override
  String get plansWelcomeBody =>
      'Soy el Sr. K, tu compañero de compras. Asegurémonos de que nunca olvides un artículo ni excedas tu presupuesto. ¿Listo para organizar tus compras de junio?';

  @override
  String get plansCadenceMonthly => 'Mensual';

  @override
  String get plansCadenceWeekly => 'Semanal';

  @override
  String plansBoughtCount(int count) {
    return 'Comprado $count';
  }

  @override
  String plansPendingCount(int count) {
    return 'Pendiente $count';
  }

  @override
  String plansDeferredCount(int count) {
    return 'Diferido $count';
  }

  @override
  String get plansBudgetProgress => 'Progreso del presupuesto';

  @override
  String get plansCreatePlan => 'Crear plan';

  @override
  String get plansCockpitTitle => 'Panel de ahorro';

  @override
  String get plansCockpitSubtitle => 'Tu estrategia de compras del mes';

  @override
  String get plansMonthlyGoal => 'Meta mensual';

  @override
  String plansGoalReached(int percent) {
    return '$percent% alcanzado';
  }

  @override
  String get plansStatBought => 'Comprado';

  @override
  String get plansStatPending => 'Pendiente';

  @override
  String get plansStatDeferred => 'Diferido';

  @override
  String get plansDoingGreatTitle => '¡Vas genial!';

  @override
  String plansDoingGreatBody(String amount) {
    return 'Has ahorrado más de $amount esta semana al elegir artículos diferidos con sabiduría. ¡El Sr. K está orgulloso de tu disciplina!';
  }

  @override
  String get plansViewAnalytics => 'Ver análisis';

  @override
  String get plansHighPriorityItems => 'Artículos prioritarios';

  @override
  String get plansSavingsHack => 'Truco de ahorro';

  @override
  String get plansSavingsHackBody =>
      'Comprar los martes en FreshMarket puede ahorrarte un 5% en lácteos y granos. ¡Sincroniza tu plan \'Family Groceries\' para el martes!';

  @override
  String get plansAiNudge => 'Sugerencia de IA';

  @override
  String get planCreateTitle => 'Nuevo plan';

  @override
  String get planCreateSubtitle => '¡Tracemos tu próximo recorrido financiero!';

  @override
  String get planCreateMascotTip =>
      '\"¡Planificar es el primer paso para ganar, campeón!\" — Sr. K';

  @override
  String get planTitleLabel => 'Título del plan';

  @override
  String get planTitleHint => 'p. ej. Vacaciones soñadas 2024';

  @override
  String get planPeriodType => 'Tipo de período';

  @override
  String get planPeriodMonth => 'Mes';

  @override
  String get planPeriodYear => 'Año';

  @override
  String get planSelectMonthYear => 'Selecciona mes y año';

  @override
  String get planTargetBudget => 'Presupuesto objetivo (opcional)';

  @override
  String get planBudgetHint => '0.00';

  @override
  String get planSmartTip =>
      'Consejo: ¡Cualquier artículo que traslades de planes anteriores obtendrá automáticamente el estado ⭐ PRIORIDAD ESTRELLA!';

  @override
  String get planCarryOver => 'Trasladar artículos diferidos';

  @override
  String get planCarryOverSubtitle =>
      'Incluir artículos pendientes del último plan';

  @override
  String get planCreateSubmit => 'Crear plan';

  @override
  String get planPoweredBy => 'Con tecnología de KeenPocket Intelligence';

  @override
  String get planSaveDraft => 'Guardar borrador';

  @override
  String get planCreateMyPlan => 'Crear mi plan';

  @override
  String get planReadyToSave => '¿Listo para ahorrar, chef?';

  @override
  String get planReadyToSaveBody =>
      'Definir un período y un presupuesto claros me ayuda a encontrar las mejores ofertas para tu hogar esta temporada.';

  @override
  String get planTabletTitle => 'Plan de compras';

  @override
  String get planTabletSubtitle =>
      'Panel de ahorro • Diseña tu flujo de presupuesto';

  @override
  String get planStarPriorityTip => 'Consejo: Prioridad estrella';

  @override
  String get planStarPriorityTipBody =>
      'Marca artículos con Prioridad Estrella para asegurar que se financien primero en tu Panel de ahorro.';

  @override
  String get planStatDuration => 'Duración del plan';

  @override
  String get planStatDurationValue => '31 días';

  @override
  String get planStatAvgItems => 'Artículos prom.';

  @override
  String get planStatAvgItemsValue => '42 unidades';

  @override
  String get planStatEstSavings => 'Ahorro est.';

  @override
  String get planStatEstSavingsValue => '12% más';

  @override
  String planDetailPlanningPeriod(String period) {
    return 'Período de planificación: $period';
  }

  @override
  String get planDetailPersonalPlan => 'Plan personal';

  @override
  String get planDetailDraft => 'Borrador';

  @override
  String get planDetailTotalItems => 'Total de artículos';

  @override
  String get planDetailBought => 'Comprados';

  @override
  String get planDetailDeferred => 'Diferidos';

  @override
  String get planDetailEstimated => 'Estimado';

  @override
  String get planDetailBudgetHealth => 'Salud del presupuesto';

  @override
  String planDetailSpentOf(String spent, String budget) {
    return 'Gastado: $spent / $budget';
  }

  @override
  String get planDetailItemChecklist => 'Lista de artículos';

  @override
  String planItemQtyPrice(int qty, String price) {
    return '$qty × $price';
  }

  @override
  String get planItemPurchased => 'Comprado';

  @override
  String get planItemPending => 'Pendiente';

  @override
  String get planItemDeferred => 'Diferido';

  @override
  String get planItemBuyIt => 'Yo lo compro';

  @override
  String get planItemReactivate => 'Reactivar';

  @override
  String get planAddNewItem => 'Agregar artículo';

  @override
  String get planItemNameHint => 'Nombre del artículo (p. ej. Leche)';

  @override
  String get planItemQtyHint => 'Cant.';

  @override
  String get planAddItem => 'Agregar';

  @override
  String get planSharedWith => 'Compartido con';

  @override
  String planCollaboratorsCount(int count) {
    return '$count colaboradores';
  }

  @override
  String get planRoleOwner => 'Propietario';

  @override
  String get planRoleCollaborator => 'Colaborador';

  @override
  String get planInviteLabel => 'Invitar por correo o teléfono';

  @override
  String get planInviteHint => 'ejemplo@email.com';

  @override
  String get planInviteSend => 'Enviar';

  @override
  String get planQuickAdd => 'Agregar rápido';

  @override
  String get planColStatus => 'Estado';

  @override
  String get planColItem => 'Descripción';

  @override
  String get planColCategory => 'Categoría';

  @override
  String get planColPrice => 'Precio';

  @override
  String get planColActions => 'Acciones';

  @override
  String get planGreatList => '¡Buena lista!';

  @override
  String get planGreatListBody =>
      '¡Estás cumpliendo tu meta de ahorro esta semana!';

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
