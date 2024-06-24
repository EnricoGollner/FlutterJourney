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
      nextSalaryDate = _controller.getNextSalaryDate(nextSalaryDate.year, 5);
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
            ValueListenableBuilder(
              valueListenable: _controller.state,
              builder: (context, state, _) {
                return CustomSalaryDay(
                  state: state,
                  loadedWidget: _buildLoaded(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoaded() {
    return Container(
      padding: const EdgeInsets.all(70),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        border: Border.all(color: contentColor),
        shape: BoxShape.circle
      ),
      child: Column(
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
      ),
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
