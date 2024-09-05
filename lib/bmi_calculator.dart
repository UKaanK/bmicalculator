import 'package:bmicalculator/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text("BMI Calculator App"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: context.read<BMIProvider>().heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Height (cm)",
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  fillColor: Colors.white38,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: context.read<BMIProvider>().weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Weight (kg)",
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  fillColor: Colors.white38,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => context.read<BMIProvider>().calculateBMI(),
                child: Text("Calculate BMI")),
            SizedBox(
              height: 20,
            ),
            Consumer<BMIProvider>(
              builder: (context, provider, child) {
                Color categoryColor = provider.bmiCategory ==
                            "You have a UnderWeight\n(BMI less then 18.5)" ||
                        provider.bmiCategory ==
                            "You have a Normal Weight\n(BMI 18.5-24.9)" ||
                        provider.bmiCategory ==
                            "You have a OverWeight\n(BMI 25-29.9)" ||
                        provider.bmiCategory == "Obesity\n(BMI 30 or  higher)"
                    ? Colors.red
                    : Colors.green;
                return Column(
                  children: [
                    Text(
                      provider.bmi == 0
                          ? ''
                          : "Your BMI:${provider.bmi.toStringAsFixed(1)} kg/m2",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      provider.bmiCategory,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: categoryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
