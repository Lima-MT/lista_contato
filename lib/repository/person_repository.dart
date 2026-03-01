import 'package:lista_contato/models/person.dart';
import 'package:lista_contato/services/person_service.dart';

class PersonRepository {
  final PersonService service;

  PersonRepository(this.service);

  Future<void> save(Person person) async {
    await service.createdPerson(person);
  }

  Future<List<Person>> getAll() async {
    return await service.getAllPersons();
  }

  Future<Person> toggleFavorite(Person person) async {
    final updatedPerson = person.copyWith(isFavorite: !person.isFavorite);
    await service.updatePerson(updatedPerson);

    return updatedPerson;
  }
}
