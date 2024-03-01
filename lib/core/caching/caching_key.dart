import '../base/enums.dart';

class CachingKey extends Enum<String> {
  const CachingKey(super.val);
  static const CachingKey USER_EMAIL = CachingKey('USER_EMAIL');
  static const CachingKey USER_PASSWORD = CachingKey('USER_PASSWORD');
  static const CachingKey TOKEN = CachingKey('TOKEN');
  static const CachingKey IS_LOGIN = CachingKey('IS_LOGIN');
}
