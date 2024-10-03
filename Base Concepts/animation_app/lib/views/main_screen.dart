import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MainScreen extends StatelessWidget {
  final ValueNotifier<bool> start = ValueNotifier(false);
  
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '🏀',
              style: TextStyle(fontSize: 190, color: Colors.white),
            )
            .animate(onComplete: (controller) => controller.repeat())
            .moveY(begin: -25, end: 15, curve: Curves.easeInOut, duration: 1000.ms)
            .then()
            .moveY(begin: 15, end: -25)
            ,
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                width: 150,
                height: 15,
                decoration: const BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.all(Radius.elliptical(150, 15)),
                ),
              ),
            )
            .animate(
              onPlay: (controller) => controller.repeat(),
            )
            .scaleX(begin: 1.2, end: .8, curve: Curves.easeInOut, duration: 1000.ms)
            .then()
            .scaleX(begin: .8, end: 1.2, curve: Curves.easeInOut)
            ,
            const SizedBox(height: 100),
            ValueListenableBuilder(
              valueListenable: start,
              builder: (context, started, _) {
                return  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 11)
                  ),
                  onPressed: () => start.value = !start.value,
                  child: const Text('JOGAR', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),),
                ).animate(
                  target: started ? 1 : 0,
                  onPlay: (controller) => controller.reverse(),
                  onComplete: (controller) => debugPrint('Completou'),
                )
                .elevation(end: 20, color: Colors.black, borderRadius: BorderRadius.circular(50))
                .shake(hz: 2, rotation: .2)
                .flip(begin: -.2)
                .slideY(end: -.5)
                .scaleXY(begin: .7)
                .animate(
                  onPlay: (controller) => controller.repeat(),
                )
                .shimmer(
                  delay: 2000.ms,
                  duration: 1000.ms
                )
                .shakeX(hz: 5);
              },
            )
            
          ],
        ),
      ),
    );
  }
}