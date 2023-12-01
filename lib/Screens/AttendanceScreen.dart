// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// // import 'package:table_calendar/table_calendar.dart';
//
//
// class AttendanceRecord extends StatefulWidget {
//   const AttendanceRecord({Key? key}) : super(key: key);
//
//   @override
//   State<AttendanceRecord> createState() => _AttendanceRecordState();
// }
//
// class _AttendanceRecordState extends State<AttendanceRecord> {
//   DateTime today=DateTime.now();
//   @override
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Calendar'),
//       ),
//       body:content(),
//     );
//   }
//
//   Widget content() {
//     return Container(
//       child: TableCalendar(
//         startDay: DateTime.utc(2010, 10, 16),
//         endDay: DateTime.utc(2030, 3, 14),
//         // focusedDay: DateTime.now(),
//       ),
//     );
//   }
// }