import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Invoice App'),
            leading: _stack(),
          ),
          body: const SizedBox(),
        ),
      );
}

Widget _stack() => Stack(
      children: [
        Center(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                  ),
                ),
                height: 28,
                width: 60,
              ),
              Container(
                height: 28,
                width: 60,
                color: Colors.purpleAccent,
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/logo.svg',
            colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
          ),
        )
      ],
    );
