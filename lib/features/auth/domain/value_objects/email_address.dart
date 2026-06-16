/// Value object for an email address — a self-validating, normalized domain
/// primitive. Construct via [EmailAddress.new]; the raw string is trimmed.
///
/// Value objects keep validation rules in the domain (not scattered in widgets)
/// and give entities/use cases meaningful types instead of bare `String`s.
class EmailAddress {
  factory EmailAddress(String input) => EmailAddress._(input.trim());

  const EmailAddress._(this.value);

  /// The trimmed, normalized value.
  final String value;

  static final RegExp _pattern = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');

  bool get isEmpty => value.isEmpty;
  bool get isValid => _pattern.hasMatch(value);

  @override
  bool operator ==(Object other) =>
      other is EmailAddress && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
