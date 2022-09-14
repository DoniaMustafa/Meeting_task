import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

CollectionReference meeting = FirebaseFirestore.instance.collection('Meeting');
CollectionReference days = FirebaseFirestore.instance.collection(dayName!);
String? monthly= DateFormat('MMMM').format(DateTime.now());
String? daily =DateFormat('EEEE').format(DateTime.now());
String? dailies =DateFormat('d').format(DateTime.now());

String? monthName;
String? dayName;
// String? monthName;
String? dayNumber ;
List categoryList = [
  'Development',
  'Research',
  'Design',
  'Backend',
  'Frontend',
  'Marketing',
  'Business Development',
];
List countNumber = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
];
List countMonthly = [
  'S',
  'M',
  'T',
  'W',
  'T',
  'F',
  'S',
  'S',
  'M',
  'T',
];
List<bool> isSelect = [true, false, false, false, false, false, false];
