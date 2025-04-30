import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvTypeEnum { dev, prod }

class EnvVariable {
  EnvVariable._();

  static final EnvVariable instance = EnvVariable._();

  String _envType = '';
  String _notificationBaseUrl = '';
  String _firebaseKey = '';
  Future<void> init({required EnvTypeEnum envtype}) async {
    switch (envtype) {
      case EnvTypeEnum.dev:
        await dotenv.load(fileName: '.env.dev');

      case EnvTypeEnum.prod:
        await dotenv.load(fileName: '.env.prod');
    }
    _envType = dotenv.get('ENV_TYPE');
    _firebaseKey = dotenv.get('FIREBASE_KEY');
    _notificationBaseUrl = dotenv.get('NOTIFICATION_BASEURL');
    

  }

 // String get envType => _envType;
bool get debugMode => _envType=='dev';
String get notificationBaseUrl =>_notificationBaseUrl;
String get firebaseKey =>_firebaseKey;
}
