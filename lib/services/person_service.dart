import 'package:dio/dio.dart';
import 'package:lista_contato/core/datasource/dio_service.dart';
import 'package:lista_contato/models/person.dart';

class PersonService {
  final Dio dio = DioService.instance;
  Future<void> createdPerson(Person person) async {
    await dio.post("/Person", data: person.toJson());
  }

  Future<List<Person>> getAllPersons() async {
    final response = await dio.get("/Person");
    final results = response.data["results"] as List;
    return results.map((e) => Person.fromJson(e)).toList();
  }
}
