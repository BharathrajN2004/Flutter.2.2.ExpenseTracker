// ignore_for_file: camel_case_types
import 'package:hive/hive.dart';

part 'history.g.dart';

@HiveType(typeId: 1)
class history extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String amount;
  @HiveField(2)
  final String ipath;
  @HiveField(3)
  final String eori;

  history(
      {required this.name,
      required this.amount,
      required this.ipath,
      required this.eori});
}
