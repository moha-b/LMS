part of 'network.dart';

abstract class Mapper {
  factory Mapper(Mapper type, dynamic data) {
    if (type is SingleMapper) {
      return type.fromJson(data);
    } else if (type is ListMapper) {
      return type.fromJsonList(data as List);
    }
    return Mapper(type, data);
  }
}

abstract class SingleMapper implements Mapper {
  Mapper fromJson(Map<String, dynamic> json);
}

abstract class ListMapper implements Mapper {
  Mapper fromJsonList(List json);
}
