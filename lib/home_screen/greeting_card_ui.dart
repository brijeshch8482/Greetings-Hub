import 'package:flutter/cupertino.dart';

class GreetingCardsScreen extends StatefulWidget {
  const GreetingCardsScreen({super.key});

  @override
  State<GreetingCardsScreen> createState() => _GreetingCardsScreenState();
}

class _GreetingCardsScreenState extends State<GreetingCardsScreen> {
  @override
  Widget build(BuildContext context) {
    return  const Center(
        child: Text('It is a contact tab, which is responsible for displaying the contacts stored in your mobile',
          style: TextStyle(fontSize: 32.0),
        )
    );
  }
}
