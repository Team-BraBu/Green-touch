import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, EventList, EventInterface;
import 'package:greentouch/layout/appbar_back.dart';

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
      appBar: BackAppbar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '캘 린 더',
                  style: TextStyle(
                      color: Color(0xff739072),
                      fontSize: 30,
                      fontFamily: 'Jua'),
                ),
                Text(
                  '반려식물의 물 주는 날을 기록해 놓으면 쑥쑥커요 💧',
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff3A4D39),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
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
              headerTextStyle: TextStyle(
                  color: Color(0xff3A4D39), fontFamily: 'Jua', fontSize: 20),
              prevMonthDayBorderColor: Color(0xff3A4D39),
              nextMonthDayBorderColor: Color(0xff3A4D39),

              todayButtonColor: Color(0xffece3ce), // 오늘 날짜 버튼의 배경색 변경
              todayBorderColor: Color(0xffece3ce), // 오늘 날짜 버튼의 테두리 색상 변경
              selectedDayButtonColor: Color(0xff739072), // 선택된 날짜 버튼의 배경색 변경
              selectedDayBorderColor: Color(0xff739072), // 선택된 날짜 버튼의 테두리 색상 변경
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showAddEventDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff739072),
                      padding:
                          EdgeInsets.symmetric(horizontal: 130, vertical: 18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    '메 모 하 기',
                    style: TextStyle(
                        color: Color(0xffECE3CE),
                        fontFamily: 'Jua',
                        fontSize: 20),
                  ),
                ),
              ],
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
          title: Text(
            "일정 추가",
            style: TextStyle(color: Color(0xff739072), fontFamily: 'Jua'),
          ),
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
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffece3ce),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text("취소",
                  style: TextStyle(
                      color: Color(0xff739072),
                      fontFamily: 'Jua',
                      fontSize: 15)),
            ),
            ElevatedButton(
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
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff739072),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                "저장",
                style: TextStyle(
                    color: Color(0xffECE3CE), fontFamily: 'Jua', fontSize: 15),
              ),
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
