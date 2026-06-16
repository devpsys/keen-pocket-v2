/// The host a contribution belongs to. The contributions ledger is shared by
/// Pocket and Adashi, so it stays host-agnostic by accepting this small context
/// instead of importing either feature.
enum ContributionHost { pocket, adashi }

/// Identifies *what* a contribution is for: a pocket (optionally a slot/month)
/// or an adashi (optionally a cycle).
class ContributionContext {
  const ContributionContext({
    required this.host,
    required this.hostId,
    this.reference,
  });

  factory ContributionContext.pocket(String pocketId, {String? slot}) =>
      ContributionContext(
        host: ContributionHost.pocket,
        hostId: pocketId,
        reference: slot,
      );

  factory ContributionContext.adashi(String adashiId, {String? cycle}) =>
      ContributionContext(
        host: ContributionHost.adashi,
        hostId: adashiId,
        reference: cycle,
      );

  final ContributionHost host;
  final String hostId;

  /// Optional sub-reference (pocket slot/month or adashi cycle).
  final String? reference;

  @override
  bool operator ==(Object other) =>
      other is ContributionContext &&
      other.host == host &&
      other.hostId == hostId &&
      other.reference == reference;

  @override
  int get hashCode => Object.hash(host, hostId, reference);
}
