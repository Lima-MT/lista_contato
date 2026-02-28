import 'package:flutter/material.dart';
import 'package:lista_contato/models/person.dart';
import 'package:lista_contato/repository/person_repository.dart';
import 'package:lista_contato/services/person_service.dart';
import './home.dart';

abstract class HomeViewModel extends State<Home> {
  late final PersonRepository repository;
  final TextEditingController searchController = TextEditingController();

  List<Person> _persons = [];
  bool _isLoading = false;

  // Getters
  List<Person> get persons => _persons;
  bool get isLoading => _isLoading;

  @override
  void initState() {
    super.initState();
    repository = PersonRepository(PersonService());
    loadPersons();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> loadPersons() async {
    setState(() => _isLoading = true);
    try {
      _persons = await repository.getAll();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }
}
