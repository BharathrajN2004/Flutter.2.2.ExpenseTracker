// ignore_for_file: camel_case_types
import 'package:hive/hive.dart';

part 'tdata.g.dart';

@HiveType(typeId: 0)
class tdata extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String amount;
  @HiveField(2)
  final String ipath;
  @HiveField(3)
  final String eori;

  tdata(
      {required this.name,
      required this.amount,
      required this.ipath,
      required this.eori});
}
