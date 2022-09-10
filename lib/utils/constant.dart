import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference meeting =
FirebaseFirestore.instance.collection('Meeting');
String? monthName;
String? dayName;