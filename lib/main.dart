import 'package:flutter/widgets.dart';
import 'package:medpg/utils/services/web_services.dart';
import 'app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await WebService.instance.init();
  runApp(MedPgApp());
}