import 'package:dr_zyggy/domain/model/option.dart';

class Question {
  final String id;
  final String title;
  final List<Option> options;

  Question(this.options, {required this.id, required this.title});
}
