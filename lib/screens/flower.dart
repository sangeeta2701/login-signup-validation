import 'package:flutter/material.dart';

class FlowerScreen extends StatefulWidget {
  const FlowerScreen({Key? key}) : super(key: key);

  @override
  State<FlowerScreen> createState() => _FlowerScreenState();
}

class _FlowerScreenState extends State<FlowerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/flower.PNG"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Lotus",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "The national flower of India is Lotus. It is an aquatic herb that is often termed as ‘Padma’ in Sanskrit and enjoys a sacred status among the Indian culture. It has been an integral part of the Indian culture from time immemorial.",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
