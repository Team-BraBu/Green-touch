import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, EventList, EventInterface;

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class Event implements EventInterface {
  final DateTime date;
  final String title;
  final String description;

  Event({
    required this.date,
    required this.title,
    required this.description,
  });

  @override
  DateTime getDate() => date;

  @override
  String? getDescription() => description;

  @override
  Widget? getDot() => null;

  @override
  Widget? getIcon() => null;

  @override
  int? getId() => null;

  @override
  String? getLocation() => null;

  @override
  String? getTitle() => title;
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _currentDate = DateTime.now();
  EventList<Event> _events = EventList<Event>(events: {});
  String _newEventTitle = ''; // 새로운 일정 제목을 저장할 변수
  String _newEventDescription = ''; // 새로운 일정 내용을 저장할 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('캘린더'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CalendarCarousel<Event>(
              locale: 'ko_KR',
              onDayPressed: (DateTime date, List<Event> events) {
                setState(() {
                  _currentDate = date;
                  // 해당 날짜의 일정 출력
                  _showEventDetails(events);
                });
              },
              weekendTextStyle: TextStyle(
                color: Colors.red,
              ),
              thisMonthDayBorderColor: Colors.grey,
              weekFormat: false,
              height: 600.0,
              selectedDateTime: _currentDate,
              markedDatesMap: _events,
            ),
            ElevatedButton(
              onPressed: () {
                _showAddEventDialog(context);
              },
              child: Text('메모'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddEventDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("일정 추가"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  _newEventTitle = value; // 새로운 일정 제목 갱신
                },
                decoration: InputDecoration(hintText: "제목을 입력하세요"),
              ),
              TextField(
                onChanged: (value) {
                  _newEventDescription = value; // 새로운 일정 내용 갱신
                },
                decoration: InputDecoration(hintText: "내용을 입력하세요"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("취소"),
            ),
            TextButton(
              onPressed: () {
                // 새로운 일정 추가 로직
                setState(() {
                  _events.add(
                    _currentDate,
                    Event(
                      date: _currentDate,
                      title: _newEventTitle, // 저장된 제목 사용
                      description: _newEventDescription, // 저장된 내용 사용
                    ),
                  );
                });
                Navigator.of(context).pop();
              },
              child: Text("저장"),
            ),
          ],
        );
      },
    );
  }

  void _showEventDetails(List<Event> events) {
    if (events.isNotEmpty) {
      // 해당 날짜에 일정이 있는 경우
      String eventDetails = '';
      for (var event in events) {
        // 여러 개의 일정이 있을 수 있으므로 각 일정의 내용을 반복하여 문자열에 추가합니다.
        eventDetails += '제목: ${event.title}\n';
        eventDetails += '내용: ${event.description}\n\n';
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("메모"),
            content: SingleChildScrollView(
              child: Text(eventDetails),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("닫기"),
              ),
            ],
          );
        },
      );
    }
  }
}
