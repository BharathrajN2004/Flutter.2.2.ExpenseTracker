import 'history.dart';
import 'package:hive/hive.dart';

class HBoxes {
  static Box<history> getTrans() => Hive.box<history>('histdb');
}
