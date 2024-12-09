import 'package:flutter/material.dart';
import 'package:utip/widgets/bill_amount_field.dart';
import 'package:utip/widgets/person_counter.dart';
import 'package:utip/widgets/tip_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTip',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  int _personCount = 1;

  double _tipValue = 0.0;

  void increment() {
    setState(() {
      _personCount++;
    });
  }

  void decrement() {
    setState(() {
      _personCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // Add style
    final style = theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: const Text("UTip"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                  color: theme.colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  Text(
                    "Total Per Person ",
                    style: style,
                  ),
                  Text(
                    "\$23.89 ",
                    style: style.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontSize: theme.textTheme.displaySmall?.fontSize),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border:
                      Border.all(color: theme.colorScheme.primary, width: 2)),
              child: Column(
                children: [
                  BillAmountField(
                    billAmount: "100",
                    onChanged: (String value) {
                      print("Amount: $value");
                    },
                  ),
                  //Split Bill area
                  PersonCounter(
                    theme: theme,
                    personCount: _personCount,
                    onDecrement: decrement,
                    onIncrement: increment,
                  ),
                  //Tip Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tip',
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                        '\$20',
                        style: theme.textTheme.titleMedium,
                      )
                    ],
                  ),
                  //Slider Text
                  Text('${(_tipValue * 100).round()}%'),

                  //Tip Slider
                  TipSlider(
                    tipValue: _tipValue,
                    onChanged: (double value) {
                      setState(() {
                        _tipValue = value;
                      });
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
