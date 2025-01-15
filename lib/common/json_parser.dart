Never parseMultipleTypes(
  List<Function(Map<String, dynamic>)> parsers,
  Map<String, dynamic> data,
) {
  if (parsers.isEmpty) {
    throw ArgumentError('Parsers list cannot be empty');
  }

  List errors = [];

  for (final parser in parsers) {
    try {
      final dataObject = parser(data);

      throw dataObject;
    } catch (e) {
      if (e is! Exception && e is! Error) {
        rethrow;
      }
      errors.add(e.toString());
      continue;
    }
  }

  throw FormatException(
    'Failed to parse data using any of the provided parsers. Errors: $errors',
  );
}

typedef MultipleJsonTypes = dynamic;
