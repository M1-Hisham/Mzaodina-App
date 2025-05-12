import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/home/join-auction/view/widgets/counter_cubit_inc_dec.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubitIncDec(),
      child: BlocBuilder<CounterCubitIncDec, int>(
        builder: (context, count) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // increment button
              IconButton(
                icon: const Icon(Icons.add, color: Colors.white),
                style: IconButton.styleFrom(
                  backgroundColor: R.colors.primaryColorLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(10),
                ),
                onPressed: () => context.read<CounterCubitIncDec>().increment(),
              ),
              const SizedBox(width: 20),
              // result
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: Text('$count')),
                ),
              ),
              const SizedBox(width: 20),
              // decrement button
              IconButton(
                icon: const Icon(Icons.remove, color: Colors.white),
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFF18224F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(10),
                ),
                onPressed:
                    () =>
                        count == 0
                            ? null
                            : context.read<CounterCubitIncDec>().decrement(),
              ),
            ],
          );
        },
      ),
    );
  }
}
