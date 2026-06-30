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
  String get pocketCharityTitle => 'Campaña benéfica';

  @override
  String get pocketCharitySubtitle =>
      'Reúne a tu grupo en torno a una causa y devuelve algo juntos.';

  @override
  String get pocketCharityStart => 'Iniciar campaña';

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
  String get contributeToPocket => 'Aportar al pocket';

  @override
  String get contributeTargetGoal => 'Meta';

  @override
  String contributeTargetAmount(String amount) {
    return 'Meta: $amount';
  }

  @override
  String contributeOutstanding(String amount) {
    return '$amount pendiente';
  }

  @override
  String contributePercentComplete(int percent) {
    return '$percent% completado';
  }

  @override
  String contributeMoreToGoal(String amount) {
    return '¡Solo $amount más para alcanzar tu meta!';
  }

  @override
  String get contributeEnterAmount => 'Introduce el monto';

  @override
  String get contributeEnterContribution => 'Introduce la aportación';

  @override
  String get contributeEnterSubtitle => '¿Cuánto añadimos al pocket hoy?';

  @override
  String contributeQuickAdd(String amount) {
    return '+$amount';
  }

  @override
  String get contributeTip => '¡Cada aportación suma a tu racha de ahorro!';

  @override
  String get contributeCharity => 'Añadir donación benéfica';

  @override
  String contributeCharitySubtitle(String amount, String cause) {
    return 'Dona $amount a $cause';
  }

  @override
  String get contributeContinue => 'Continuar';

  @override
  String get contributeConfirm => 'Confirmar aportación';

  @override
  String get contributeSecureFooter =>
      'Transacción segura con tecnología de KeenPocket';

  @override
  String get contributeFundsDebited =>
      'Los fondos se debitarán de tu billetera principal';

  @override
  String allocateAllocatedOf(String allocated, String total) {
    return 'Asignado $allocated de $total';
  }

  @override
  String get allocateGreatProgress => '¡Gran progreso!';

  @override
  String allocateAllocatedSub(String allocated, String total) {
    return 'Has asignado $allocated de $total';
  }

  @override
  String get allocatePendingNote =>
      'Esta aportación quedará pendiente de verificación hasta que el organizador la confirme.';

  @override
  String get allocateConfirmationTitle => 'Confirmación requerida';

  @override
  String get allocateConfirmationBody =>
      'Una vez enviada, el organizador del pocket deberá confirmar la transacción antes de que se finalice en tu historial.';

  @override
  String get allocateMonthsPending => 'Meses pendientes';

  @override
  String allocateMonthsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count meses',
      one: '1 mes',
    );
    return '$_temp0';
  }

  @override
  String allocateMonthSubtitle(String target, int paid) {
    return '$target / $paid pagado';
  }

  @override
  String get allocateTargetLabel => 'Meta:';

  @override
  String get allocateMonthReady => 'Listo';

  @override
  String get allocateMonthPendingStatus => 'Pendiente';

  @override
  String get allocateMonthEdit => 'Editar';

  @override
  String get allocateSubmit => 'Enviar aportación';

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
  String get payPageTitle => 'Confirmar pago';

  @override
  String get payTip => '¡Todo bien! Tienes de sobra en tu bolsillo para esto.';

  @override
  String get paySafeTitle => 'Seguro y protegido';

  @override
  String get payMonthlyLimit => 'Límite de gasto mensual';

  @override
  String payLimitUsage(String spent, String limit) {
    return '$spent / $limit';
  }

  @override
  String get payConfirmSecurely => 'Confirmar y pagar de forma segura';

  @override
  String get payTabletTipTitle => '¡Buen trabajo!';

  @override
  String get payTabletTipBody =>
      'Tu gasto está perfectamente alineado con tus metas de presupuesto mensual.';

  @override
  String get invoiceLedgerTitle => 'Libro de facturas';

  @override
  String get invoiceLedgerSubtitle =>
      'Mantén tus finanzas en orden. Aquí puedes gestionar las contribuciones de tu grupo, verificar comprobantes y ver a dónde va tu dinero.';

  @override
  String get invoiceTopSaver => 'MEJOR AHORRADOR';

  @override
  String get invoicePendingApprovals => 'Aprobaciones pendientes';

  @override
  String invoiceMemberLabel(String name) {
    return 'Miembro: $name';
  }

  @override
  String get invoiceViewProof => 'Ver comprobante';

  @override
  String get invoiceUrgent => 'URGENTE';

  @override
  String get invoiceMarkInvoicePaid => 'Marcar factura como pagada';

  @override
  String get invoiceMarkPaid => 'Marcar pagada';

  @override
  String get invoiceBalanceDue => 'Saldo pendiente';

  @override
  String get invoiceDueToday => 'Vence hoy';

  @override
  String invoiceUrgentSubtitle(String ref, String name) {
    return 'Factura $ref por $name.';
  }

  @override
  String get invoicePaymentHistory => 'Historial de pagos';

  @override
  String get invoiceFilterAll => 'Todas';

  @override
  String get invoiceFilterPaid => 'Pagadas';

  @override
  String get invoiceFilterPending => 'Pendientes';

  @override
  String get invoiceViaWallet => 'Desde billetera';

  @override
  String get invoiceManual => 'Manual';

  @override
  String get invoicePaid => 'PAGADA';

  @override
  String get invoiceNotPaid => 'NO PAGADA';

  @override
  String get invoiceDownloadReport => 'Descargar informe completo';

  @override
  String get invoiceTip => '¡Ahorrar es un deporte de equipo! ¡Sigue así!';

  @override
  String get invoiceTotalSent => 'Total enviado';

  @override
  String get invoiceAwaiting => 'En espera';

  @override
  String get invoiceColInvoice => 'Factura n.º';

  @override
  String get invoiceColDate => 'Fecha';

  @override
  String get invoiceColMethod => 'Método';

  @override
  String get invoiceColAmount => 'Importe';

  @override
  String get invoiceColStatus => 'Estado';

  @override
  String get invoiceMethodDirectTransfer => 'Transferencia directa';

  @override
  String get invoiceMethodKeenWallet => 'KeenWallet';

  @override
  String get invoiceMethodCardPayment => 'Pago con tarjeta';

  @override
  String get invoiceStatusPaid => 'Pagada';

  @override
  String get invoiceStatusOverdue => 'Vencida';

  @override
  String get invoiceUrgentAction => 'Acción urgente';

  @override
  String get invoiceDueIn24h => 'VENCE EN 24 H';

  @override
  String invoiceSentBy(String name) {
    return 'ENVIADO POR: $name';
  }

  @override
  String get invoiceTipTitle => 'Consejo financiero de Mr. K';

  @override
  String get invoiceTipTabletBody =>
      '¡Pagar tus facturas 2 días antes te da 50 \'puntos ahorradores\' extra! Sigue subiendo de nivel tu riqueza.';

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
  String get adashiMyGroupsTitle => 'Mis grupos Adashi';

  @override
  String adashiActiveCount(int count) {
    return '$count activos';
  }

  @override
  String adashiActiveInCircles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Participas en $count círculos de ahorro',
      one: 'Participas en 1 círculo de ahorro',
      zero: 'Aún no estás en ningún círculo de ahorro',
    );
    return '$_temp0';
  }

  @override
  String get adashiStatusActive => 'Activo';

  @override
  String get adashiStatusCompleted => 'Completado';

  @override
  String get adashiFrequencyWeekly => 'Semanal';

  @override
  String get adashiFrequencyMonthly => 'Mensual';

  @override
  String get adashiPerCycleSuffix => '/ ciclo';

  @override
  String adashiPerCycleLine(String amount) {
    return '$amount por ciclo';
  }

  @override
  String adashiMembersParticipating(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count miembros participando',
      one: '1 miembro participando',
      zero: 'Sin miembros aún',
    );
    return '$_temp0';
  }

  @override
  String get adashiNextPayout => 'Próximo pago';

  @override
  String adashiPayoutInDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'En $days días',
      one: 'En 1 día',
      zero: 'Hoy',
    );
    return '$_temp0';
  }

  @override
  String adashiNextPayoutDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days días',
      one: '1 día',
      zero: 'hoy',
    );
    return 'Próximo pago: $_temp0';
  }

  @override
  String get adashiCycleProgressTitle => 'Progreso del ciclo';

  @override
  String adashiCycleCount(int current, int total) {
    return '$current de $total';
  }

  @override
  String get adashiCreate => 'Crear adashi';

  @override
  String get adashiNewGroup => 'Nuevo grupo';

  @override
  String get adashiSearchHint => 'Buscar un grupo...';

  @override
  String get adashiJoinTitle => 'Unirse a un círculo';

  @override
  String get adashiJoinBody =>
      '¿Buscas algo nuevo? Explora grupos Adashi de la comunidad.';

  @override
  String get adashiBrowseExplore => 'Explorar';

  @override
  String get adashiDidYouKnowTitle => '¿Sabías que?';

  @override
  String get adashiDidYouKnowBody =>
      'Los grupos Adashi te ayudan a alcanzar tus metas 3 veces más rápido que ahorrando solo. ¡Mr K mantiene a todos al día!';

  @override
  String adashiHubAdminName(String name) {
    return '$name (Admin)';
  }

  @override
  String get adashiHubRateAdmin => 'Valorar admin';

  @override
  String adashiHubReputation(String score) {
    return '$score de reputación';
  }

  @override
  String adashiHubCycle(int number) {
    return 'Ciclo $number';
  }

  @override
  String get adashiHubCollecting => 'Recaudando';

  @override
  String get adashiHubActive => 'Activo';

  @override
  String adashiHubPaidMembers(int paid, int total) {
    return 'Pagaron $paid de $total miembros';
  }

  @override
  String adashiHubPercent(int percent) {
    return '$percent %';
  }

  @override
  String get adashiHubTotalCollected => 'Total recaudado';

  @override
  String adashiHubCollectedOf(String collected, String target) {
    return '$collected / $target';
  }

  @override
  String get adashiHubThisCycle => 'Este ciclo:';

  @override
  String adashiHubReceives(String name, String amount) {
    return '$name recibe $amount';
  }

  @override
  String adashiHubContribute(String amount) {
    return 'Aportar $amount';
  }

  @override
  String get adashiHubRotationTitle => 'Cronología de rotación';

  @override
  String get adashiHubReceivingNow => 'Recibiendo ahora';

  @override
  String adashiHubReceivedOn(String date) {
    return 'Recibido: $date';
  }

  @override
  String adashiHubProjectedOn(String date) {
    return 'Previsto: $date';
  }

  @override
  String get adashiHubYouUpcoming => 'Tú (Próximo)';

  @override
  String get adashiHubYourTurn => 'Tu turno';

  @override
  String get adashiHubPayoutAccount => 'Cuenta de cobro';

  @override
  String get adashiHubEdit => 'Editar';

  @override
  String get adashiHubCyclesHistory => 'Historial de ciclos';

  @override
  String get adashiHubSeeAll => 'Ver todo';

  @override
  String get adashiHubColCycle => 'Ciclo';

  @override
  String get adashiHubColTotal => 'Total';

  @override
  String get adashiHubColStatus => 'Estado';

  @override
  String get adashiHubClosed => 'Cerrado';

  @override
  String get adashiHubDisputesTitle => 'Disputas';

  @override
  String get adashiHubDisputesEmpty =>
      'No hay disputas activas en este grupo Adashi. ¡Sigue aportando a tiempo!';

  @override
  String get adashiHubTitle => 'Centro Adashi';

  @override
  String adashiHubWelcome(String name) {
    return '¡Bienvenido de nuevo, $name! Tu grupo va viento en popa.';
  }

  @override
  String get adashiHubMasterOrganiser => 'Organizador maestro';

  @override
  String get adashiHubProductDetails => 'Detalles del producto';

  @override
  String get adashiHubReputationLabel => 'Reputación';

  @override
  String get adashiHubPayoutDetails => 'Detalles de cobro';

  @override
  String get adashiHubTarget => 'Objetivo';

  @override
  String get adashiHubCollectedSuffix => 'recaudado';

  @override
  String adashiHubNextPayoutLine(String date) {
    return 'Próximo pago: $date';
  }

  @override
  String get adashiHubMascotTip =>
      '¡Mantén la energía! 6 miembros ya han aportado hoy.';

  @override
  String get adashiHubResolveNow => 'Resolver ahora';

  @override
  String get adashiHubClosedCases => 'Casos cerrados';

  @override
  String get adashiHubAvgResolve => 'Tiempo medio de resolución';

  @override
  String get adashiHubGroupHealth => 'Salud del grupo';

  @override
  String get adashiHubTotalSaved => 'Total ahorrado (año)';

  @override
  String get adashiHubSecurity => 'Estado de seguridad';

  @override
  String get adashiCreateCost => 'Cuesta 1 Keen';

  @override
  String get adashiCreateCostNote => 'Cuesta 1 nota Keen';

  @override
  String get adashiCreateIntroTitle => '¡Configuremos tu círculo!';

  @override
  String get adashiCreateIntroBody =>
      'Completa los detalles para empezar a ahorrar juntos.';

  @override
  String get adashiCreateName => 'Nombre del Adashi';

  @override
  String get adashiCreateNameHint => 'ej. Fondo de vacaciones soñadas';

  @override
  String get adashiCreatePerCycle => '₦ por ciclo';

  @override
  String get adashiCreatePerCycleHint => '5.000';

  @override
  String get adashiCreateCycleDays => 'Ciclo (días)';

  @override
  String get adashiCreateCycleDuration => 'Duración del ciclo (días)';

  @override
  String adashiCreateDaysOption(int days) {
    return '$days días';
  }

  @override
  String get adashiCreateStartDate => 'Fecha de inicio';

  @override
  String get adashiCreateStartDateHint => 'dd/mm/aaaa';

  @override
  String get adashiCreateRotationMode => 'Modo de rotación';

  @override
  String get adashiCreateAuto => 'Automático';

  @override
  String get adashiCreateManual => 'Manual';

  @override
  String get adashiCreateAutoHint =>
      'El modo automático elige al siguiente receptor automáticamente.';

  @override
  String get adashiCreateMakePublic => 'Hacer público';

  @override
  String get adashiCreateMakePublicHint => 'Visible para otros en Explorar';

  @override
  String get adashiCreateCollectionBank => 'Banco de recaudación';

  @override
  String get adashiCreatePayoutDetails => 'Detalles de cobro';

  @override
  String get adashiCreateBank => 'Banco';

  @override
  String get adashiCreateSelectBank => 'Selecciona un banco';

  @override
  String get adashiCreateNuban => 'NUBAN';

  @override
  String get adashiCreateNubanHint => '0123456789';

  @override
  String get adashiCreateAccountName => 'Nombre de la cuenta';

  @override
  String get adashiCreateAccountNameHint => 'Titular verificado';

  @override
  String get adashiCreateTerms =>
      'Acepto los Términos del servicio de KeenPocket y reconozco las reglas de gestión del círculo.';

  @override
  String get adashiCreateSubmit => 'Crear Adashi';

  @override
  String get adashiCreateTabletTitle => 'Crea tu Adashi';

  @override
  String get adashiCreateTabletBody =>
      'Reúne a tus amigos, define tu ciclo y empieza a ahorrar juntos. ¡Es fácil y transparente!';

  @override
  String get adashiCreateAddMembersNote =>
      'Puedes añadir miembros en el siguiente paso.';

  @override
  String adashiRotationScreenTitle(String name) {
    return 'Adashi: $name';
  }

  @override
  String get adashiRotationCurrentPot => 'Bote actual';

  @override
  String adashiRotationCollected(int percent) {
    return '$percent% recaudado';
  }

  @override
  String adashiRotationTarget(String amount) {
    return 'Objetivo: $amount';
  }

  @override
  String adashiRotationNextPayout(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'quedan $days días',
      one: 'queda 1 día',
    );
    return 'Próximo pago: $_temp0';
  }

  @override
  String get adashiRotationTipTitle => 'Consejo de Mr K';

  @override
  String get adashiRotationOrder => 'Orden de rotación';

  @override
  String adashiRotationCycle(int n) {
    return 'Ciclo $n';
  }

  @override
  String adashiRotationCycleActive(int n) {
    return 'Ciclo $n (Activo)';
  }

  @override
  String adashiRotationCycleNext(int n) {
    return 'Ciclo $n (Siguiente)';
  }

  @override
  String adashiRotationPaid(String amount) {
    return '$amount pagado';
  }

  @override
  String adashiRotationPayout(String amount) {
    return 'Pago: $amount';
  }

  @override
  String adashiRotationDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'quedan $days días',
      one: 'queda 1 día',
    );
    return '$_temp0';
  }

  @override
  String adashiRotationExpected(String date) {
    return 'Previsto $date';
  }

  @override
  String get adashiRotationTransactionLog => 'Registro de transacciones';

  @override
  String get adashiRotationGroupChat => 'Chat del grupo';

  @override
  String get adashiRotationInvite => 'Invitar';

  @override
  String get adashiRotationMembers => 'Miembros';

  @override
  String adashiRotationActiveCount(int count) {
    return '$count activos';
  }

  @override
  String get adashiRotationContributed => 'Aportado';

  @override
  String get adashiRotationStatus => 'Estado';

  @override
  String get adashiRotationPending => 'Pendiente';

  @override
  String get adashiRotationPayNow => 'Pagar ahora';

  @override
  String get adashiRotationScheduled => 'Programado';

  @override
  String get adashiRotationYouBadge => 'Tú';

  @override
  String get adashiRotationInviteMember => 'Invitar nuevo miembro';

  @override
  String adashiRotationKycLevel(int level) {
    return 'KYC Nivel $level';
  }

  @override
  String get adashiManageTitle => 'Gestionar Adashi';

  @override
  String adashiManageCircleSubtitle(String name) {
    return 'Círculo: $name';
  }

  @override
  String get adashiManageMembersTitle => 'Miembros del círculo';

  @override
  String adashiManageMembersCount(int count) {
    return '$count miembros';
  }

  @override
  String get adashiManageColPos => 'Pos';

  @override
  String get adashiManageColMember => 'Miembro';

  @override
  String get adashiManageColStatus => 'Estado';

  @override
  String get adashiManageReceiver => 'Receptor';

  @override
  String get adashiManageStatusReceived => 'Recibido';

  @override
  String get adashiManageStatusActive => 'Activo';

  @override
  String get adashiManageAddMember => 'Añadir miembro';

  @override
  String get adashiManagePhoneLabel => 'Número de teléfono';

  @override
  String get adashiManagePhoneHint => '+1 (555) 000-0000';

  @override
  String get adashiManageInvite => 'Invitar al círculo';

  @override
  String get adashiManageVerifyPayments => 'Verificar pagos';

  @override
  String get adashiManageReconcile => 'Conciliar y rotar';

  @override
  String adashiManageReconcileCaption(String position) {
    return 'Calcula los saldos y mueve el pago a la posición #$position';
  }

  @override
  String get adashiManageOverrides => 'Controles de admin';

  @override
  String get adashiManageSetReceiver => 'Fijar receptor';

  @override
  String get adashiManageDeactivate => 'Desactivar';

  @override
  String get adashiManageAdjContrib => 'Ajustar aporte';

  @override
  String get adashiManageSetPosition => 'Fijar posición';

  @override
  String get adashiManagePauseCircle => 'Pausar círculo';

  @override
  String get adashiManageMarkPayout => 'Marcar pago';

  @override
  String get adashiManageMarkDispute => 'Marcar disputa';

  @override
  String get adashiManagePublicVisibility => 'Visibilidad pública';

  @override
  String get adashiManageShowPayoutNames => 'Mostrar nombres de pago';

  @override
  String get adashiManageBankDetails => 'Datos bancarios';

  @override
  String get adashiManageCircleRules => 'Reglas del círculo';

  @override
  String get adashiManageClone => 'Clonar';

  @override
  String get adashiManageExport => 'Exportar';

  @override
  String adashiManageSlot(int current, int total) {
    return 'Turno $current de $total';
  }

  @override
  String get adashiManageCurrentRotation => 'Rotación actual';

  @override
  String get adashiManageMascotTip =>
      'Mr K dice: \"¡Verifica todos los recibos antes de rotar!\"';

  @override
  String adashiManageMembersFraction(int active, int total) {
    return '$active / $total miembros';
  }

  @override
  String adashiManagePaymentSubtitle(String amount) {
    return '$amount • Aportación';
  }

  @override
  String get adashiManageEmailLabel => 'Correo o usuario del miembro';

  @override
  String get adashiManageEmailHint => 'ej. mr.k@keenpocket.com';

  @override
  String get adashiManageRotationSlot => 'Turno de rotación';

  @override
  String adashiManageNextAvailable(String slot) {
    return 'Próximo disponible ($slot)';
  }

  @override
  String get adashiManageSendInvite => 'Enviar invitación';

  @override
  String get adashiManageReschedule => 'Reprogramar';

  @override
  String get adashiManageCycleLength => 'Duración del ciclo';

  @override
  String get adashiManageAuditLog => 'Registro de auditoría';

  @override
  String get adashiManageDissolve => 'Disolver círculo';

  @override
  String get adashiManageExportLedger => 'Exportar libro (CSV)';

  @override
  String get adashiManageCloneSettings => 'Clonar ajustes';

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
  String get walletCockpit => 'Centro de billetera';

  @override
  String get walletBalance => 'Saldo disponible';

  @override
  String get walletTransactions => 'Movimientos recientes';

  @override
  String get walletSend => 'Enviar';

  @override
  String get walletWithdraw => 'Retirar';

  @override
  String get walletTopUp => 'Recargar';

  @override
  String get walletQuickTopUp => 'Recarga rápida';

  @override
  String get walletAddFunds => 'Agregar fondos';

  @override
  String get walletSafetyNote =>
      'Sr. K: \"¡Tus transacciones siempre están seguras con nosotros!\"';

  @override
  String get walletRecentActivity => 'Actividad reciente';

  @override
  String get walletViewAll => 'Ver todo';

  @override
  String walletBalanceAfter(String amount) {
    return 'Saldo: $amount';
  }

  @override
  String get walletSpendingLimit => 'Límite de gasto';

  @override
  String get walletUsed => 'Usado';

  @override
  String get walletLimit => 'Límite';

  @override
  String walletPercentUsed(int percent) {
    return '$percent% usado';
  }

  @override
  String get walletSafetyTitle => 'Seguridad';

  @override
  String get walletSafetyBody =>
      'Protegido con cifrado AES-256 y bóveda biométrica.';

  @override
  String get walletMrKSays => 'El Sr. K dice';

  @override
  String get walletStatusSuccess => 'Completado';

  @override
  String get walletStatusSettled => 'Liquidado';

  @override
  String get walletStatusRefunded => 'Reembolsado';

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
  String get payoutsTitle => 'Pagos y banco';

  @override
  String get payoutsMyAccount => 'Mi cuenta de retiro';

  @override
  String get payoutsBankName => 'Nombre del banco';

  @override
  String get payoutsSelectBank => 'Selecciona el banco';

  @override
  String get payoutsSelectReceivingBank => 'Selecciona el banco receptor';

  @override
  String get payoutsBankCode => 'Código del banco';

  @override
  String get payoutsBankCodeHint => '000';

  @override
  String get payoutsAccountNumber => 'Número de cuenta';

  @override
  String get payoutsNubanLabel => 'Número de cuenta NUBAN';

  @override
  String get payoutsNubanHint => 'Ingresa el NUBAN de 10 dígitos';

  @override
  String get payoutsNubanHintTablet => 'p. ej. 2093847562';

  @override
  String get payoutsSaveAccount => 'Guardar cuenta';

  @override
  String get payoutsUpdateDetails => 'Actualizar datos de pago';

  @override
  String get payoutsCollectionDetails => 'Datos de cobro del pocket';

  @override
  String get payoutsPocketCollections => 'Cobros del pocket';

  @override
  String get payoutsReceived => 'Pagos recibidos';

  @override
  String get payoutsViewAllHistory => 'Ver todo el historial';

  @override
  String get payoutsViewAll => 'Ver todo';

  @override
  String payoutsRef(String ref) {
    return 'REF: $ref';
  }

  @override
  String get payoutsStatusSuccess => 'Completado';

  @override
  String get payoutsStatusPending => 'Pendiente';

  @override
  String get payoutsStatusFailed => 'Fallido';

  @override
  String get payoutsCollectionProgress => 'Progreso del cobro';

  @override
  String get payoutsTotalCollected => 'Total cobrado este mes';

  @override
  String get notificationsTitle => 'Notificaciones';

  @override
  String get notificationsInboxTitle => 'Bandeja';

  @override
  String get notificationsInboxSubtitle =>
      'Mantente al día con la actividad de tus pockets.';

  @override
  String get notificationsEmptyTitle => '¡Todo al día!';

  @override
  String get notificationsEmptyMessage =>
      'El Sr. K se ha encargado de todo. ¡Disfruta de tu experiencia tranquila!';

  @override
  String get notificationsMarkAllRead => 'Marcar todo como leído';

  @override
  String get notificationsFilterAll => 'Todas';

  @override
  String get notificationsFilterUnreadShort => 'No leídas';

  @override
  String notificationsFilterUnread(int count) {
    return 'No leídas ($count)';
  }

  @override
  String get notificationsGoalProgress => 'Progreso de la meta';

  @override
  String get notificationsRelatedPocket => 'Pocket relacionado';

  @override
  String get notificationsViewDetails => 'Ver detalles →';

  @override
  String get notificationsSourceAccount => 'Cuenta de origen';

  @override
  String get notificationsAutoDebit => 'Domiciliación activa';

  @override
  String get notificationsViewReceipt => 'Ver recibo';

  @override
  String get notificationsMarkAsRead => 'Marcar como leída';

  @override
  String get notificationsMrKTip => 'Consejo del Sr. K:';

  @override
  String get notificationsRefresh => 'Actualizar';

  @override
  String get achievementsTitle => 'Logros';

  @override
  String get achievementsMyTitle => 'Mis logros';

  @override
  String get achievementsCurrentMomentum => 'Impulso actual';

  @override
  String get achievementsMomentumSubtitle => '¡Te mantienes constante!';

  @override
  String achievementsStreakValue(int weeks) {
    return '$weeks semanas';
  }

  @override
  String get achievementsStreakWord => 'de racha';

  @override
  String achievementsStreakHeading(int weeks) {
    return '🔥 $weeks semanas de racha';
  }

  @override
  String achievementsFreezesHeading(int count) {
    return '🧊 congelaciones: $count';
  }

  @override
  String achievementsDaysShort(int done, int total) {
    return '$done/$total días';
  }

  @override
  String achievementsDaysProgress(int done, int total) {
    return '$done / $total días esta semana';
  }

  @override
  String get achievementsSafetyNet => 'Red de seguridad';

  @override
  String achievementsFreezesCount(int count) {
    return 'congelaciones: $count';
  }

  @override
  String get achievementsFreezesAvailable => 'Congelaciones disponibles';

  @override
  String get achievementsFreezesHint =>
      'Mantén viva tu racha incluso en tus días libres. ¡Recarga en la tienda de recompensas!';

  @override
  String get achievementsBuyMoreFreezes => 'Comprar más congelaciones';

  @override
  String get achievementsBuyMore => 'Comprar más';

  @override
  String get achievementsYourBadges => 'Tus insignias';

  @override
  String achievementsEarnedCount(int done, int total) {
    return '$done / $total obtenidas';
  }

  @override
  String get achievementsOnARoll => '¡Vas muy bien!';

  @override
  String get achievementsMotivationBody =>
      'Sigue aportando a tus pockets durante 2 semanas más para desbloquear la insignia diamante \'Elite Saver\'.';

  @override
  String get achievementsViewPockets => 'Ver pockets';

  @override
  String achievementsEliteGoal(int done, int total) {
    return 'Meta Elite: $done/$total días';
  }

  @override
  String get achievementsUpcomingMilestones => 'Próximos hitos';

  @override
  String get achievementsProTip => 'Consejo';

  @override
  String get achievementsProTipBody =>
      '¡Configurar el ahorro automático mejora la fiabilidad de tu racha en un 40%!';

  @override
  String get badgesTitle => 'Insignias';

  @override
  String get leaderboardTitle => 'Clasificación';

  @override
  String get leaderboardSubtitle =>
      'Clasificado por aportes — los montos son privados · Reinicia el lunes';

  @override
  String get leaderboardScopeWeek => 'Esta semana';

  @override
  String get leaderboardScopeAllTime => 'Histórico';

  @override
  String leaderboardPoints(int count) {
    return '$count pts';
  }

  @override
  String leaderboardYourRank(int rank) {
    return 'Tu posición #$rank';
  }

  @override
  String leaderboardContributionsCount(int count) {
    return '$count aportes';
  }

  @override
  String get leaderboardFocusMode => 'Modo enfoque';

  @override
  String get leaderboardFocusModeDesc =>
      'El modo enfoque multiplica tus puntos x1.2 durante las sesiones de ahorro grupal.';

  @override
  String get leaderboardYourStanding => 'Tu posición';

  @override
  String get leaderboardPointsEarned => 'Puntos ganados';

  @override
  String get leaderboardContributions => 'Aportes';

  @override
  String get leaderboardRecentlyClimbed => 'Escaló recientemente';

  @override
  String get leaderboardReferKeens => '¡Invita a un amigo y gana 500 Keens! 🪙';

  @override
  String get leaderboardKeensCoin => 'K';

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
  String get rateOrganiserTitle => 'Valora al organizador';

  @override
  String get rateOrganiserSubtitle =>
      '¿Qué tan útil ha sido este pocket para tu flujo?';

  @override
  String get rateOrganiserCommentLabel => 'Deja un comentario (opcional)';

  @override
  String get rateOrganiserCommentHint => '¿Qué te encanta de este organizador?';

  @override
  String rateOrganiserCounter(int count) {
    return '$count / 500';
  }

  @override
  String get rateOrganiserSubmit => 'Enviar reseña';

  @override
  String get rateOrganiserCancel => 'Cancelar';

  @override
  String get trustVouch => 'Avalar';

  @override
  String get trustInviteToPocket => 'Invitar al pocket';

  @override
  String get trustRecentRatings => 'Valoraciones recientes';

  @override
  String get trustViewAll => 'Ver todas';

  @override
  String get trustTopContributor => 'Top 5% de colaboradores';

  @override
  String trustMemberLine(String date, String rank) {
    return 'Miembro desde $date • $rank';
  }

  @override
  String get trustMascotSays => 'Mr. K dice:';

  @override
  String trustMascotInsight(String name) {
    return '¡$name es uno de nuestros pioneros más confiables! Los miembros con puntajes superiores a 80 suelen alcanzar sus metas 2 veces más rápido.';
  }

  @override
  String trustVouchFor(String name) {
    return 'Avalar a $name';
  }

  @override
  String get trustHubTitle => 'Centro de reputación';

  @override
  String get trustHubTabOverview => 'Resumen';

  @override
  String get trustHubTabHistory => 'Historial';

  @override
  String get trustHubTabAnalytics => 'Analíticas';

  @override
  String get trustHubSearch => 'Buscar miembros…';

  @override
  String get trustExcellentStanding => 'Excelente reputación';

  @override
  String trustStandingBody(String name) {
    return '$name ha mantenido una reputación impecable durante 18 meses, sin aportes perdidos y con un 100% de finalización de grupos.';
  }

  @override
  String get trustTopReliablePayer => 'Top 1% en pagos confiables';

  @override
  String get trustInviteToGroup => 'Invitar al grupo';

  @override
  String get trustReliabilityStats => 'Estadísticas de fiabilidad';

  @override
  String get trustPaymentConsistency => 'Constancia de pagos';

  @override
  String get trustGroupsJoined => 'Grupos unidos';

  @override
  String get trustCompleted => 'Completados';

  @override
  String trustHubMascotBody(String name) {
    return '\"¡Eres una estrella financiera, $name! Sigue así.\"';
  }

  @override
  String get trustTopFactors => 'Principales factores de confianza';

  @override
  String get trustFactorEarlyPayer => 'Paga antes';

  @override
  String get trustFactorVouches => 'Más de 10 avales';

  @override
  String get trustFactorKyc => 'KYC verificado';

  @override
  String get trustFactorTenure => 'Larga trayectoria';

  @override
  String get kycTitle => '¡Verificación de identidad!';

  @override
  String get kycWelcomeBody =>
      'Ayúdanos a mantener KeenPocket seguro. ¡Solo toma un minuto!';

  @override
  String get kycPendingTitle => 'Verificación pendiente';

  @override
  String get kycPendingBody => '¡Un momento! Estamos comprobando tus datos.';

  @override
  String get kycVerifiedTitle => 'Identidad verificada';

  @override
  String get kycFailedTitle => 'Verificación fallida';

  @override
  String get kycSelectIdType => 'Selecciona el tipo de ID';

  @override
  String get kycSelectIdTypeFull => 'Selecciona el tipo de identificación';

  @override
  String get kycIdNumber => 'Número de ID';

  @override
  String get kycEnterDigits => 'Introduce 11 dígitos';

  @override
  String get kycLast4 =>
      'Solo guardamos los últimos 4 dígitos por tu seguridad.';

  @override
  String get kycVerify => 'Verificar identidad';

  @override
  String get kycRetry => 'Reintentar';

  @override
  String get kycPrivacy =>
      'Tus datos se cifran con protocolos AES de 256 bits. Nunca compartimos tu información privada con terceros.';

  @override
  String get kycTabletTitle => 'Verificación de identidad';

  @override
  String get kycTabletBody =>
      '¡Ayúdanos a proteger tus pockets! Verifica tu identidad para desbloquear límites más altos y funciones de grupo.';

  @override
  String get kycStep => 'Paso 2 de 3: Detalles del documento';

  @override
  String get kycEnterNumber => 'Introduce el número de 11 dígitos';

  @override
  String get kycEnterNumberHint => '000 000 000 00';

  @override
  String get kycLegalUse =>
      'Solo lo usaremos para confirmar tu identidad legal.';

  @override
  String get kycAesEncrypted => 'Cifrado AES-256';

  @override
  String get kycCbnRegulated => 'Regulado por el CBN';

  @override
  String get vouchTitle => 'Solicitudes de aval';

  @override
  String get vouchSubtitle =>
      'Revisa las solicitudes de miembros que quieren unirse a tus pockets.';

  @override
  String vouchRep(int score) {
    return 'Rep $score';
  }

  @override
  String get vouchPending => 'Pendiente';

  @override
  String get vouchRecommended => 'Recomendado';

  @override
  String get vouchJoining => 'se une a';

  @override
  String get vouchRecommend => 'Recomendar';

  @override
  String get vouchDecline => 'Rechazar';

  @override
  String get vouchVouched => 'Avalado';

  @override
  String get vouchEmptyTitle => 'Aún no hay solicitudes de aval.';

  @override
  String get vouchEmptyBody =>
      '¡Estás al día! Tómate un descanso, Mr K lo tiene todo bajo control.';

  @override
  String get vouchRefresh => 'Actualizar panel';

  @override
  String vouchPendingCount(int count) {
    return 'Avales pendientes ($count)';
  }

  @override
  String get vouchNewActivity => 'Nueva actividad';

  @override
  String get vouchReputationScore => 'Puntaje de reputación';

  @override
  String get vouchTrustNetwork => 'Red de confianza';

  @override
  String vouchVouchedStat(int count) {
    return '$count avalados';
  }

  @override
  String vouchMutual(int count) {
    return '$count conexiones en común';
  }

  @override
  String get vouchSavingConsistency => 'Constancia de ahorro';

  @override
  String get vouchCommunityActivity => 'Actividad comunitaria';

  @override
  String get vouchRequestNote => 'Nota de la solicitud';

  @override
  String vouchMemberSince(String year) {
    return 'Miembro desde $year';
  }

  @override
  String vouchMemberLine(String location, String year) {
    return '$location • Miembro desde $year';
  }

  @override
  String vouchReputation(int score) {
    return 'Reputación: $score';
  }

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
  String get referEarnTitle => 'Invita y gana';

  @override
  String get referEarnHeroTitle => 'Trae a tu círculo 🎁';

  @override
  String get referEarnHeroBody =>
      '¡Gana recompensas juntos! Invita a tus amigos y recibe ₦500 por cada referido que empiece a ahorrar.';

  @override
  String get referEarnLimitedOffer => 'Oferta por tiempo limitado';

  @override
  String get referEarnInviteLink => 'Tu enlace de invitación';

  @override
  String get referEarnCopy => 'Copiar';

  @override
  String get referEarnReferralCode => 'Código de referido';

  @override
  String get referEarnShareWhatsApp => 'Compartir por WhatsApp';

  @override
  String get referEarnInvited => 'Invitados';

  @override
  String get referEarnQualified => 'Calificados';

  @override
  String get referEarnRewarded => 'Recompensados';

  @override
  String get referEarnYourCircle => 'Tu círculo';

  @override
  String get referEarnInviteMore => '¡Invita a más amigos!';

  @override
  String get referEarnInviteMoreFriends => 'Invitar a más amigos';

  @override
  String get referEarnStatusPending => 'Pendiente';

  @override
  String get referEarnStatusQualified => 'Calificado';

  @override
  String get referEarnStatusRewarded => 'Recompensado';

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
  String get charityFinancialGoal => 'Meta financiera';

  @override
  String get charityResourceGoal => 'Meta de recursos';

  @override
  String charityItemsProgress(int current, int total) {
    return '$current / $total';
  }

  @override
  String get charityDonateItems => 'Donar artículos';

  @override
  String get charitySelectItem => 'Selecciona un artículo';

  @override
  String get charityQty => 'Cant.';

  @override
  String get charityPledgeItems => 'Aportar artículos';

  @override
  String get charityRecentContributions => 'Contribuciones recientes';

  @override
  String get charityViewAll => 'Ver todas';

  @override
  String get charityMascotTitle => 'Mr. K dice: \"¡Eres un héroe!\"';

  @override
  String get charityMascotBody =>
      'Los pequeños actos, multiplicados por millones de personas, pueden transformar el mundo. ¡Gracias por tu generosidad!';

  @override
  String get charityHeroSubtitle =>
      'Ayúdanos a brindar suministros esenciales a quienes los necesitan. Cada contribución nos acerca a la meta.';

  @override
  String get charityMakeContribution => 'Haz una contribución';

  @override
  String get charityTabMoney => 'Dinero';

  @override
  String get charityTabResources => 'Recursos';

  @override
  String get charityAddNote => 'Añadir una nota (opcional)';

  @override
  String get charityAddNoteHint => 'Escribe algo inspirador…';

  @override
  String get charitySecuredPay =>
      'Protegido con KeenPocket Pay. Sin comisiones.';

  @override
  String get charityRecentHeroes => 'Héroes recientes';

  @override
  String get charitySetupTitle => 'Configurar campaña benéfica';

  @override
  String get charitySetupGreetingTitle => '¡Hola! Soy Mr. K';

  @override
  String get charitySetupGreetingBody =>
      'Configuremos algo increíble juntos. ¡Cada aporte cuenta!';

  @override
  String get charityDriveTitleLabel => 'Título de la campaña';

  @override
  String get charityDriveTitleHint => 'p. ej., Iniciativa Calor de Invierno';

  @override
  String get charityDescriptionLabel => 'Descripción';

  @override
  String get charityDescriptionHint =>
      'Cuéntales a tus donantes de qué trata esta campaña…';

  @override
  String get charityGoalTypeLabel => 'Tipo de meta';

  @override
  String get charityGoalTypeAmount => 'Monto';

  @override
  String get charityGoalTypeItems => 'Artículos';

  @override
  String get charityTargetAmountLabel => 'Monto objetivo (₦)';

  @override
  String get charityTargetAmountHint => '50,000';

  @override
  String get charityItemNameLabel => 'Nombre del artículo';

  @override
  String get charityUnitLabel => 'Unidad';

  @override
  String get charityAddAnotherItem => 'Añadir otro artículo';

  @override
  String get charityShowBreakdown => 'Mostrar desglose de donantes';

  @override
  String get charityShowBreakdownSub => 'Deja que la gente vea quién donó qué';

  @override
  String get charityProTipLabel => 'Consejo:';

  @override
  String get charityProTipBody =>
      'Las campañas con descripciones claras y listas visuales de artículos suelen recibir un 40 % más de participación.';

  @override
  String get charitySaveDrive => 'Guardar campaña';

  @override
  String get charityDonateTitle => 'Donación';

  @override
  String get charityActiveRelief => 'Ayuda activa';

  @override
  String get charityDonateTabletDescription =>
      'Únete a nuestro bolsillo comunitario para brindar ayuda médica urgente y apoyo logístico a las familias desplazadas por los recientes eventos climáticos. Cada contribución suma para nuestra meta colectiva.';

  @override
  String get charityMascotImpact =>
      '¡Estás teniendo un gran impacto! Este bolsillo ha crecido un 15 % desde ayer. ¡Sigamos con el impulso!';

  @override
  String get charityEnterAmountTablet => 'Introduce el monto';

  @override
  String get charityResourceLabel => 'Recurso';

  @override
  String get charityCreateDriveTitle => 'Crea tu campaña';

  @override
  String get charityCreateDriveSubtitle =>
      'Ayuda a otros configurando una meta de ahorro específica.';

  @override
  String get charityGoalTypeAmountFull => 'Monto (₦)';

  @override
  String get charityGoalTypeItemsFull => 'Meta de artículos';

  @override
  String get charitySetupTabletTip =>
      '¡Definir una meta clara y realista ayuda a que los donantes confíen más! Las campañas con descripciones detalladas recaudan un 40 % más en KeenPocket.';

  @override
  String get charityLivePreview => 'Vista previa';

  @override
  String get charityTrending => 'Tendencia';

  @override
  String get charitySupportDrive => 'Apoyar campaña';

  @override
  String get charityLaunchDrive => 'Lanzar campaña benéfica';

  @override
  String get charitySaveDraft => 'Guardar borrador';

  @override
  String charityTargetLabel(String amount) {
    return 'Meta: $amount';
  }

  @override
  String get charityPreviewTitleFallback => 'El título de tu campaña';

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
      '¡Sé el primero en iniciar la conversación y mantener viva la energía del ahorro!';

  @override
  String get groupChatStartChatting => 'Empezar a chatear';

  @override
  String get groupChatTypeMessage => 'Escribe un mensaje…';

  @override
  String get groupChatToday => 'Hoy';

  @override
  String get groupChatMessages => 'Mensajes';

  @override
  String get groupChatFindGroup => 'Buscar un grupo…';

  @override
  String get groupChatCircleVitalStats => 'Estadísticas del círculo';

  @override
  String get groupChatPayoutProgress => 'Progreso del pago';

  @override
  String get groupChatNext => 'SIGUIENTE';

  @override
  String get groupChatMembers => 'Miembros';

  @override
  String get groupChatViewAll => 'Ver todo';

  @override
  String get groupChatSharedMedia => 'Multimedia compartida';

  @override
  String get groupChatMascotTyping => 'El Sr. K te está animando…';

  @override
  String get groupChatMascotTitle => '¡Mantén alta la energía del ahorro!';

  @override
  String get groupChatMascotBody =>
      'Estás a solo ₦50 de la insignia de la meta de este mes.';

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
  String get disputeStatusActive => 'Activa';

  @override
  String disputesOpenLabel(int count) {
    return '$count abiertas';
  }

  @override
  String get disputesAdminView => 'Vista de administrador';

  @override
  String get disputesResolveCase => 'Resolver caso';

  @override
  String get disputesDismissAction => 'Desestimar';

  @override
  String get disputesResolutionNoteLabel => 'Nota de resolución';

  @override
  String get disputesResolutionPlaceholder => 'Explica la resolución…';

  @override
  String get disputesEmptyTitle => 'Sin disputas 🤝';

  @override
  String get disputesEmptyMessage => 'Todo marcha bien en este grupo.';

  @override
  String get disputesSubject => 'Asunto';

  @override
  String get disputesSubjectHint => 'p. ej. Pago tardío';

  @override
  String get disputesDescription => 'Descripción';

  @override
  String get disputesDescriptionHint => 'Cuéntanos qué está pasando…';

  @override
  String get disputesRaiseInfo =>
      'Las disputas son revisadas por los administradores del grupo. Asegúrate de que todos los datos sean correctos antes de enviar.';

  @override
  String get disputesSubmit => 'Enviar disputa';

  @override
  String get disputesHubTitle => 'Centro de disputas';

  @override
  String disputesAllCases(int count) {
    return 'Todos los casos ($count)';
  }

  @override
  String get disputesFilterActive => 'Activas';

  @override
  String disputesRaisedBy(String name) {
    return 'Planteada por $name';
  }

  @override
  String disputesCaseNumber(String id) {
    return 'CASO #$id';
  }

  @override
  String get disputesActiveInvestigation => 'Investigación activa';

  @override
  String get disputesResolutionDraft => 'Nota de resolución (borrador)';

  @override
  String get disputesCaseTimeline => 'Cronología del caso';

  @override
  String get disputesMrKSays => 'EL SR. K DICE:';

  @override
  String get profileSchool => 'Escuela';

  @override
  String get profileAdmin => 'Administración';

  @override
  String get schoolTitle => 'Escuela';

  @override
  String get schoolFeesTitle => 'Cuotas escolares';

  @override
  String get schoolClasses => 'Clases';

  @override
  String get schoolStudents => 'Estudiantes';

  @override
  String get schoolFeesCollected => 'Cuotas recaudadas';

  @override
  String schoolExpected(String amount) {
    return 'Esperado: $amount';
  }

  @override
  String get schoolRecordFees => 'Registrar pago';

  @override
  String get schoolNewPaymentEntry => 'Nuevo registro de pago';

  @override
  String get schoolQuickEntry => 'Registro rápido';

  @override
  String get schoolCollectionTrend => 'Tendencia de cobro';

  @override
  String get schoolGreatWork => '¡Buen trabajo!';

  @override
  String schoolOwnerProgress(int percent) {
    return 'Has recaudado el $percent% de todas las cuotas proyectadas de la sesión académica actual. ¡Sigue así!';
  }

  @override
  String get schoolHeroBody =>
      'Tu ciclo de recaudación avanza de maravilla. ¡Estás a mitad de camino de la meta de financiación de este año!';

  @override
  String get schoolYearlyProgress => 'Progreso anual';

  @override
  String get schoolRecordFeesBody =>
      'Actualiza los registros de pago de los estudiantes al instante para un seguimiento en tiempo real.';

  @override
  String get schoolActiveCycle => 'Ciclo activo';

  @override
  String get schoolUpcomingCycle => 'Próximo ciclo';

  @override
  String schoolPercentComplete(int percent) {
    return '$percent% COMPLETO';
  }

  @override
  String get schoolCollected => 'RECAUDADO';

  @override
  String get schoolTarget => 'META';

  @override
  String get schoolViewReport => 'Ver informe detallado';

  @override
  String get schoolManageEnrollments => 'Gestionar matrículas';

  @override
  String get schoolAcademicYear => 'Año académico 2023/24';

  @override
  String get schoolNetSurplus => 'Superávit neto';

  @override
  String get schoolUnpaidFees => 'Cuotas pendientes';

  @override
  String get schoolAdminProfile => 'Perfil de administrador';

  @override
  String get schoolOwnerRole => 'Propietario de la escuela';

  @override
  String get schoolIntegratedView => 'Vista escolar integrada';

  @override
  String get schoolIntegratedViewBody =>
      'Gestiona la salud financiera de tu escuela en un solo lugar.';

  @override
  String get myChildrenHeading => 'Mis hijos';

  @override
  String get myChildrenSubtitle =>
      'Gestiona las cuotas escolares y los planes de pago de tus dependientes.';

  @override
  String get myChildrenAddDependent => 'Añadir dependiente';

  @override
  String myChildrenFeeDetail(String fee, String paid, String balance) {
    return 'Cuota $fee · Pagado $paid · Saldo $balance';
  }

  @override
  String myChildrenPlan(String plan) {
    return 'Plan: $plan';
  }

  @override
  String get myChildrenPayFees => 'Pagar cuotas';

  @override
  String get myChildrenPayFeesNow => 'Pagar cuotas ahora';

  @override
  String get myChildrenPaidUp => 'Al día';

  @override
  String get myChildrenFeeProgress => 'Progreso de cuotas';

  @override
  String get myChildrenCurrentTermBalance => 'Saldo del trimestre actual';

  @override
  String get myChildrenStatusPaid => 'PAGADO';

  @override
  String get myChildrenStatusPartial => 'PARCIAL';

  @override
  String get myChildrenStatusUnpaid => 'PENDIENTE';

  @override
  String get myChildrenLockInTitle => 'Nunca pierdas un trimestre';

  @override
  String get myChildrenLockInMessage =>
      'Nuestra función \'Lock-In\' te permite apartar dinero para la matrícula a diario para que nunca te tome por sorpresa.';

  @override
  String myChildrenPaidUpStatus(String term) {
    return '$term pagado';
  }

  @override
  String myChildrenNextInvoice(int days) {
    return 'Próxima factura en $days días';
  }

  @override
  String get myChildrenViewReceipts => 'Ver recibos';

  @override
  String myChildrenDocumentsFound(int count) {
    return '$count documentos encontrados';
  }

  @override
  String get myChildrenAccountStatement => 'Estado de cuenta';

  @override
  String get myChildrenRegisterChild => 'Registrar hijo';

  @override
  String get myChildrenRegisterChildBody =>
      'Vincula un nuevo perfil escolar a tu cuenta';

  @override
  String get myChildrenSmartSavings => 'Ahorro inteligente';

  @override
  String get myChildrenSmartSavingsTitle =>
      'Ahorra con anticipación para el próximo trimestre y obtén 5% de reembolso';

  @override
  String get myChildrenStartSaving => 'Empezar a ahorrar';

  @override
  String get myChildrenEmptyTitle => '¡No hay hijos vinculados!';

  @override
  String get myChildrenEmptyMessage =>
      'El Sr. K no encuentra a tus pequeños. Vincula a tus hijos para seguir sus cuotas escolares sin esfuerzo.';

  @override
  String get myChildrenLinkChild => 'Vincular un hijo';

  @override
  String get createSchoolTitle => 'Cuotas escolares';

  @override
  String get createSchoolHeroTitle => '¡Crea tu escuela!';

  @override
  String get createSchoolHeroBody =>
      'Completa los datos para registrar tu institución en KeenPocket. ¡Es rápido y fácil!';

  @override
  String get createSchoolIdentity => 'Identidad de la escuela';

  @override
  String get createSchoolName => 'Nombre de la escuela';

  @override
  String get createSchoolNameHint => 'p. ej. Academia San Pedro';

  @override
  String get createSchoolContact => 'Número de contacto';

  @override
  String get createSchoolContactHint => '+234 800 000 0000';

  @override
  String get createSchoolAddress => 'Dirección';

  @override
  String get createSchoolAddressHint => 'Calle, ciudad, estado';

  @override
  String get createSchoolLogo => 'Logo de la escuela';

  @override
  String get createSchoolLogoHint => 'Toca para subir SVG o PNG';

  @override
  String get createSchoolLogoSize => 'Recomendado: 512x512px';

  @override
  String get createSchoolBackground => 'Imagen de fondo';

  @override
  String get createSchoolBackgroundHint => 'Toca para subir el banner';

  @override
  String get createSchoolBackgroundSize => 'Recomendado: 1200x400px';

  @override
  String get createSchoolPayoutDetails => 'Datos de pago';

  @override
  String get createSchoolBankName => 'Nombre del banco';

  @override
  String get createSchoolSelectBank => 'Selecciona el banco';

  @override
  String get createSchoolNuban => 'NUBAN (número de cuenta)';

  @override
  String get createSchoolNubanHint => 'Número de 10 dígitos';

  @override
  String get createSchoolAccountName => 'Nombre de la cuenta';

  @override
  String get createSchoolAccountNameHint =>
      'Como aparece en el estado de cuenta';

  @override
  String get createSchoolCost => 'Crear una escuela cuesta 50 Keens';

  @override
  String get createSchoolCostLead => 'Crear una escuela cuesta';

  @override
  String get createSchoolCostAmount => '50 Keens';

  @override
  String get createSchoolCta => 'Crear escuela';

  @override
  String get createSchoolLivePreview => 'Vista previa';

  @override
  String get createSchoolPreviewSubtitle => 'Así ven los padres tu escuela';

  @override
  String get createSchoolRating => 'Valoración';

  @override
  String get createSchoolTerms =>
      'Al crear, aceptas nuestros Términos de servicio.';

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

  @override
  String get adminConsoleTitle => 'Consola de superadministrador';

  @override
  String get adminConsoleSubtitle =>
      'Gestiona usuarios, escuelas y la economía global.';

  @override
  String get adminCreateAdmin => 'Crear administrador';

  @override
  String get adminUserManagement => 'Gestión de usuarios';

  @override
  String get adminSearchHint => 'Buscar nombre, correo, teléfono...';

  @override
  String get adminCanCreateSchool => 'Puede crear escuela';

  @override
  String get adminGrant => 'Conceder';

  @override
  String get adminRevoke => 'Revocar';

  @override
  String get adminRoleStandardUser => 'Usuario estándar';

  @override
  String get adminRoleEducator => 'Educador';

  @override
  String get adminSchools => 'Escuelas';

  @override
  String get adminViewAll => 'Ver todo';

  @override
  String get adminSchoolOpen => 'Abierta';

  @override
  String get adminSchoolClosed => 'Cerrada';

  @override
  String get adminKeensEconomy => 'Economía de Keens';

  @override
  String get adminCoinsEnabled => 'Monedas activadas';

  @override
  String get adminCoinsToggle => 'Interruptor global de transacciones';

  @override
  String get adminPocketCost => 'Costo de bolsillo';

  @override
  String get adminAdashisCost => 'Costo de adashis';

  @override
  String get adminSchoolsCost => 'Costo de escuelas';

  @override
  String get adminKeensUnit => 'KEENS';

  @override
  String get adminSaveEconomy => 'Guardar configuración de economía';

  @override
  String get adminDailyUsers => 'Usuarios diarios';

  @override
  String get adminSchoolsStat => 'Escuelas';

  @override
  String get organiserTitle => 'Panel del organizador';

  @override
  String get organiserGreeting => '¡Buenos días, organizador! 👋';

  @override
  String organiserGreetingNote(int count) {
    return 'El Sr. K ha analizado tus $count bolsillos activos. Todo se ve bien, aunque algunos puntos podrían necesitar tu toque mágico.';
  }

  @override
  String get organiserCreatePocket => 'Crear nuevo bolsillo';

  @override
  String get organiserDownloadCsv => 'Descargar CSV';

  @override
  String get organiserTotalManaged => 'Total gestionado';

  @override
  String organiserManagedDelta(int pct) {
    return '$pct% vs el mes pasado';
  }

  @override
  String get organiserActiveMembers => 'Miembros activos';

  @override
  String organiserNewToday(int count) {
    return '$count nuevos hoy';
  }

  @override
  String get organiserUrgentActions => 'Acciones urgentes';

  @override
  String organiserUrgentItems(int count) {
    return '$count elementos';
  }

  @override
  String get organiserRequiresVerification => 'Requiere verificación';

  @override
  String get organiserPocketHealth => 'Panel de salud de bolsillos';

  @override
  String get organiserTypeAdashi => 'Adashi';

  @override
  String get organiserTypeSavings => 'Bolsillo de ahorro';

  @override
  String organiserMembers(int count) {
    return '$count miembros';
  }

  @override
  String get organiserCollected => 'Recaudado';

  @override
  String organiserHealthPending(int count) {
    return '$count pendientes';
  }

  @override
  String organiserHealthAtRisk(int count) {
    return '$count en riesgo';
  }

  @override
  String organiserHealthOverdue(int count) {
    return '$count vencidos';
  }

  @override
  String get organiserHealthHealthy => 'Saludable';

  @override
  String get organiserStartNewPocket => 'Crear nuevo bolsillo';

  @override
  String get organiserStartNewPocketBody =>
      'Reúne a tu comunidad por una nueva meta.';

  @override
  String get organiserPulseChecklist => 'Lista de pulso';

  @override
  String get organiserReview => 'Revisar';

  @override
  String get organiserSendNudge => 'Enviar recordatorio';
}
