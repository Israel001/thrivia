class JsonParser {
  static T parse<T>(
    List<T Function(Map<String, dynamic>)> parsers,
    Map<String, dynamic> data,
  ) {
    if (parsers.isEmpty) {
      throw ArgumentError('Parsers list cannot be empty');
    }

    String? lastError;

    for (final parser in parsers) {
      try {
        final result = parser(data);
        if (result != null) {
          return result;
        }
      } catch (e) {
        lastError = e.toString();
        continue;
      }
    }

    throw FormatException(
      'Failed to parse data using any of the provided parsers. Last error: $lastError',
    );
  }
}
