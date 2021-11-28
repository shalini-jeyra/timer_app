import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:simple_timer/simple_timer.dart';
import 'package:timer_app/pages/activity_timer/activity_timer_components/activity_timer_components.dart';
import 'package:timer_app/pages/home_page/home_page.dart';
import 'package:timer_app/styles/styles.dart';

class ActivityTimer extends StatefulWidget {
  const ActivityTimer({
    Key? key,
    required this.title,
    required this.description,
    required this.activityTime,
  }) : super(key: key);
  final String title;
  final String description;
  final DateTime activityTime;

  @override
  _ActivityTimerState createState() => _ActivityTimerState();
}

class _ActivityTimerState extends State<ActivityTimer>
    with SingleTickerProviderStateMixin {
  late TimerController _timerController;
  final TimerStyle _timerStyle = TimerStyle.ring;
  final TimerProgressIndicatorDirection _progressIndicatorDirection =
      TimerProgressIndicatorDirection.clockwise;
  final TimerProgressTextCountDirection _progressTextCountDirection =
      TimerProgressTextCountDirection.count_down;

  @override
  void initState() {
    _timerController = TimerController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
         backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: AppColors.secondary,),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const HomePage(),
              ),
            );
            FlutterRingtonePlayer.stop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: Container(
                width: 350,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: SimpleTimer(
                  duration: Duration(
                      hours: widget.activityTime.hour,
                      minutes: widget.activityTime.minute,
                      seconds: widget.activityTime.second),
                  controller: _timerController,
                  timerStyle: _timerStyle,
                  onStart: handleTimerOnStart,
                  onEnd: handleTimerOnEnd,
                  valueListener: timerValueChangeListener,
                  backgroundColor: Colors.grey,
                  progressIndicatorColor: Colors.green,
                  progressTextFormatter: progressTextFormatter,
                  progressIndicatorDirection: _progressIndicatorDirection,
                  progressTextCountDirection: _progressTextCountDirection,
                  progressTextStyle: const TextStyle(color: Colors.black),
                  strokeWidth: 10,
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  constraints:
                      const BoxConstraints(minWidth: 400, minHeight: 100),
                  decoration: const BoxDecoration(
                      borderRadius: BoxBorders.primaryBoxBorder,
                      color: BoxColor.primary),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: HeaderFonts.secondaryHeader,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(widget.description,
                              style: TextFonts.ternaryText),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonWidget(
                    onPressed: _timerController.start,
                    text: "Start",
                  ),
                  ButtonWidget(
                    onPressed: _timerController.stop,
                    text: "Stop",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String progressTextFormatter(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  void timerValueChangeListener(Duration timeElapsed) {}

  void handleTimerOnStart() {
  }

  void handleTimerOnEnd() {
    FlutterRingtonePlayer.playAlarm();

  }
}
