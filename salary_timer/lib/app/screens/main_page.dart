import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salary_timer/app/controllers/main_controller.dart';
import 'package:salary_timer/app/core/theme/colors.dart';
import 'package:salary_timer/app/core/theme/fonts.dart';
import 'package:salary_timer/app/screens/widgets/custom_salary_day.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainController _controller = MainController();
  DateTime nextSalaryDate = DateTime.now();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _getHolidays();
      nextSalaryDate = _controller.getNextSalaryDate(nextSalaryDate.year, nextSalaryDate.month);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Next Salary', style: labelStyle),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              height: 210,
              width: 210,
              // padding: const EdgeInsets.all(70),
              decoration: BoxDecoration(
                border: Border.all(color: contentColor),
                shape: BoxShape.circle
              ),
              child: ValueListenableBuilder(
                valueListenable: _controller.state,
                builder: (context, state, _) {
                  return CustomSalaryDay(
                    state: state,
                    loadedWidget: _buildLoaded(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoaded() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          DateFormat('dd/MM/yyyy').format(nextSalaryDate),
          style: contentStyle,
        ),
        Text(
          DateFormat('EEEE', 'pt_BR').format(nextSalaryDate),
          style: contentStyle,
        ),
      ],
    );
  }
  
  Future<void> _getHolidays() async {
    await _controller.getHolidays(year: 2024).then((errorMessage) {
      if (_controller.state.value == AppState.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: failureColor,
            content: Text(errorMessage!),
          ),
        );
      }
    });
  }
}
