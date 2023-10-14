import 'package:hive/hive.dart';

import 'tdata.dart';

class Boxes {
  static Box<tdata> getTrans() => Hive.box<tdata>('tdatadb');
}
