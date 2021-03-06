import 'dart:io';
import 'dart:convert' as convert;

bool isValidClassName(String value) =>
    RegExp(r'^[A-Z][a-zA-Z0-9]*$').hasMatch(value);

bool isValidLocale(String value) =>
    RegExp(r'^[a-z]{2}(_[A-Z][a-z]{3})?(_[A-Z]{2})?$').hasMatch(value);

bool isLangScriptCountryLocale(String locale) =>
    RegExp(r'^[a-z]{2}_[A-Z][a-z]{3}_[A-Z]{2}$').hasMatch(locale);

bool isLangScriptLocale(String locale) =>
    RegExp(r'^[a-z]{2}_[A-Z][a-z]{3}$').hasMatch(locale);

bool isLangCountryLocale(String locale) =>
    RegExp(r'^[a-z]{2}_[A-Z]{2}$').hasMatch(locale);

void info(String message) => stdout.writeln('INFO: $message');

void warning(String message) => stdout.writeln('WARNING: $message');

void error(String message) => stderr.writeln('ERROR: $message');

void exitWithError(String message) {
  error(message);
  exit(2);
}

/// Convert to inline json message.
String formatJsonMessage(String jsonMessage) {
  var decoded = convert.jsonDecode(jsonMessage);
  return convert.jsonEncode(decoded);
}
