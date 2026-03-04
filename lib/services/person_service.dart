import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lista_contato/core/datasource/dio_service.dart';
import 'package:lista_contato/models/person.dart';

class PersonService {
  final Dio dio = DioService.instance;

  Future<void> createdPerson(Person person) async {
    try {
      debugPrint('ENVIANDO PERSON: ${person.toJson()}');
      final response = await dio.post('/classes/Person', data: person.toJson());
      debugPrint('CREATE OK STATUS: ${response.statusCode}');
      debugPrint('CREATE OK DATA: ${response.data}');
    } on DioException catch (e) {
      debugPrint('CREATE ERROR STATUS: ${e.response?.statusCode}');
      debugPrint('CREATE ERROR DATA: ${e.response?.data}');
      rethrow;
    }
  }

  Future<List<Person>> getAllPersons() async {
    final response = await dio.get('/classes/Person');
    final results = response.data["results"] as List;
    return results.map((e) => Person.fromJson(e)).toList();
  }

  Future<void> updatePerson(Person person) async {
    await dio.put('/classes/Person/${person.id}', data: person.toJson());
  }
}
