import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String endpointOpenLibrary =
      dotenv.env['ENDPOINT_OPEN_LIBRARY'] ?? 'No hay endpoint en .env';
  static String endpointOpenLibraryImage =
      dotenv.env['ENDPOINT_OPEN_LIBRARY_IMAGE'] ?? 'No hay endpoint images en .env';
}
