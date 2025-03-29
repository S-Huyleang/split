/// class for general sizes
class Sizes {
  ///`` xs = 8.0`` is the smallest size
  static const double xs = 8.0;

  ///`` sm = 10.0`` is the small size
  static const double sm = 10.0;

  ///`` md = 13.0`` is the medium size
  static const double md = 13.0;

  ///`` lg = 14.0`` is the large size
  static const double lg = 14.0;

  ///`` xl = 16.0`` is the extra large size
  static const double xl = 16.0;

  ///`` xxl = 18.0`` is the extra extra large size
  static const double xxl = 18.0;

  ///`` xxxl = 20.0`` is the largest size
  static const double xxxl = 20.0;
}

/// class for general durations
class SDurations {
  /// ``veryFast = 100 milliseconds`` is the fastest duration
  static const Duration veryFast = Duration(milliseconds: 100);

  /// ``fast = 200 milliseconds`` is the normal duration
  static const Duration fast = Duration(milliseconds: 200);

  /// ``normal = 300 milliseconds`` is the slowest duration
  static const Duration normal = Duration(milliseconds: 300);

  /// ``slow = 400 milliseconds`` is the slowest duration
  static const Duration slow = Duration(milliseconds: 400);

  /// ``verySlow = 500 milliseconds`` is the slowest duration
  static const Duration verySlow = Duration(milliseconds: 500);

  /// ``extraSlow = 600 milliseconds`` is the slowest duration
  static const Duration extraSlow = Duration(milliseconds: 600);

  /// ``extraExtraSlow = 700 milliseconds`` is the slowest duration
  static const Duration extraESlow = Duration(milliseconds: 700);

  /// ``extraExtraExtraSlow = 800 milliseconds`` is the slowest duration
  static const Duration extraEESlow = Duration(milliseconds: 800);

  /// ``extraExtraExtraExtraSlow = 900 milliseconds`` is the slowest duration
  static const Duration extraEEESlow = Duration(milliseconds: 900);
}

class Hints {
  static const String date = 'EEEE, dd MMMM, yyyy';
  static const String time = 'HH:mm';
  static String get dateTime => "$date - $time";
}

class KeyTask {
  static const String collectionkey = 'tasks';
  static const String keyId = 'id';
  static const String keyName = 'name';
  static const String keyStartDateTime = 'startDateTime';
  static const String keyEndDateTime = 'startTime';
  static const String keyPriority = 'priority';
  static const String keyDescription = 'description';
  static const String keyStatus = 'status';
  static const String keyCreateBy = 'createBy';
  static const String keyCreateAt = 'createAt';
  static const String keyModifiedAt = 'modifiedAt';
}
