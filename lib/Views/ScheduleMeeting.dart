import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(ScheduleMeetingApp());
}

class ScheduleMeetingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScheduleMeetingPage(),
    );
  }
}

class ScheduleMeetingPage extends StatefulWidget {
  @override
  _ScheduleMeetingPageState createState() => _ScheduleMeetingPageState();
}

class _ScheduleMeetingPageState extends State<ScheduleMeetingPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool _isAm = true;
  bool _isReminderSet = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Schedule Meetings'),
        titleTextStyle: TextStyle(
            fontFamily: 'Mulish',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xff0F1828),
            height: 1),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calendar widget inside Flexible
              Container(
                // Adjust height to fit within the screen
                child: _buildCalendar(),
              ),
              // SizedBox(height: 8),

              // Time picker with AM/PM options
              _buildTimePicker(),
              SizedBox(height: 16),

              Container(
                width: 327, // Align with the width as per your image
                height: 50, // Adjust height as necessary
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Color(0xffF7F7FC), // Background color
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border:
                              InputBorder.none, // Completely removes the border
                          focusedBorder:
                              InputBorder.none, // Removes the focused outline
                          enabledBorder:
                              InputBorder.none, // Removes the enabled border
                          errorBorder:
                              InputBorder.none, // Removes the error border
                          disabledBorder:
                              InputBorder.none, // Removes the disabled border
                          labelText: 'Title',
                          labelStyle: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 14,
                              color: Color(0XFF6C7278)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 327, // Align with the width as per your image
                height: 117, // Adjust height as necessary
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Color(0xffF7F7FC), // Background color
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        // textAlign: TextAlign.left,
                        // textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 80, horizontal: 4),
                          border:
                              InputBorder.none, // Completely removes the border
                          focusedBorder:
                              InputBorder.none, // Removes the focused outline
                          enabledBorder:
                              InputBorder.none, // Removes the enabled border
                          errorBorder:
                              InputBorder.none, // Removes the error border
                          disabledBorder:
                              InputBorder.none, // Removes the disabled border
                          labelText: 'Description',
                          // floatingLabelAlignment: FloatingLabelAlignment.center,
                          labelStyle: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 14,
                              color: Color(0XFF6C7278)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 8),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  hintText: "Enter meeting description",
                ),
                maxLines: 3,
              ),
              SizedBox(height: 16),

              // Add Reminder Checkbox
              Row(
                children: [
                  Checkbox(
                    value: _isReminderSet,
                    onChanged: (value) {
                      setState(() {
                        _isReminderSet = value!;
                      });
                    },
                  ),
                  Text("Add Reminder"),
                ],
              ),
              SizedBox(height: 16),

              // Personal Notes Text Field
              Text(
                "Personal Notes",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _notesController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  hintText: "Enter personal notes",
                ),
                maxLines: 3,
              ),

              SizedBox(height: 16),

              // Schedule button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the scheduling logic here
                    print(
                        "Scheduled for: $_selectedDay at ${_selectedTime.format(context)}");
                  },
                  child: Text("Schedule"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Calendar builder with enforced background color
  Widget _buildCalendar() {
    return Container(
      color: Color(0xFFFCFCFC), // Set the background color here
      child: TableCalendar(
        focusedDay: _focusedDay,
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        calendarStyle: CalendarStyle(
          cellMargin: EdgeInsets.all(6.0),
          todayDecoration: BoxDecoration(
            color: Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          weekendTextStyle: TextStyle(color: Colors.red),
          outsideDecoration: BoxDecoration(
            color: Color(
                0xFFFCFCFC), // Set outside day cells to the same background color
          ),
          defaultDecoration: BoxDecoration(
            color:
                Color(0xFFFCFCFC), // Set default cells to match the background
          ),
          disabledDecoration: BoxDecoration(
            color: Color(
                0xFFFCFCFC), // Disabled days should also match the background
          ),
        ),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
          rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
          decoration: BoxDecoration(
            color: Color(0xFFFCFCFC), // Header background color
          ),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          decoration: BoxDecoration(
            color: Color(0xFFFCFCFC), // Days of the week background color
          ),
        ),
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
      ),
    );
  }

  // Time picker builder with AM/PM
  Widget _buildTimePicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Time",
          style: TextStyle(fontSize: 16),
        ),
        _buildDropdownTimePicker(),
        Row(
          children: [
            _buildAmPmSelector("AM", _isAm),
            SizedBox(width: 8),
            _buildAmPmSelector("PM", !_isAm),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdownTimePicker() {
    String formattedTime = _formatTime();
    List<String> timeOptions = _generateTimeOptions();
    if (!timeOptions.contains(formattedTime)) {
      formattedTime = timeOptions.first;
    }

    return DropdownButton<String>(
      value: formattedTime,
      items: timeOptions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          List<String> timeParts = newValue.split(":");
          int hour = int.parse(timeParts[0]);
          int minute = int.parse(timeParts[1]);

          setState(() {
            _selectedTime = TimeOfDay(hour: hour, minute: minute);
          });
        }
      },
    );
  }

  Widget _buildAmPmSelector(String period, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isAm = (period == "AM");
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          period,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  String _formatTime() {
    final hour = _selectedTime.hourOfPeriod.toString().padLeft(2, '0');
    final minute = _selectedTime.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }

  List<String> _generateTimeOptions() {
    List<String> times = [];
    for (int hour = 1; hour <= 12; hour++) {
      for (int minute = 0; minute < 60; minute += 15) {
        times.add(
            "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}");
      }
    }
    return times;
  }
}
