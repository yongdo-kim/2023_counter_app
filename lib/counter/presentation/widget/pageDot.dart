import 'package:counter2023/counter/application/counter/counter_bloc.dart';
import 'package:counter2023/design/color/nari_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageDot extends StatelessWidget {
  const PageDot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 128),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: state.counterObjects
                  .map((obj) => Dot(
                        obj: obj,
                      ))
                  .toList()),
        );
      },
    );
  }
}

class Dot extends StatelessWidget {
  final CounterObject obj;
  const Dot({super.key, required this.obj});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: obj.id == state.currentIndex
                ? NariColor.primaryColor
                : NariColor.secondaryGrey,
            borderRadius: BorderRadius.circular(16),
          ),
        );
      },
    );
  }
}
