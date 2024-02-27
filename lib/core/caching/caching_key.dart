import '../base/enums.dart';

class CachingKey extends Enum<String> {
  const CachingKey(super.val);
  static const CachingKey USER = CachingKey('USER');
  static const CachingKey TOKEN = CachingKey('TOKEN');
  static const CachingKey IS_LOGIN = CachingKey('IS_LOGIN');
}
