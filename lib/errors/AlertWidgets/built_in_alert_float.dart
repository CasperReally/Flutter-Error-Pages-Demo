import 'package:flutter/material.dart';
import 'package:error_page/errors/ChartDataErrorPage/chart_data_error_animation.dart';
import 'package:error_page/errors/InternetErrorPage/internet_error_animation.dart';
import 'package:error_page/errors/LoginErrorPage/login_error_animation.dart';
import 'package:error_page/errors/ServerErrorPage/server_error_animation.dart';
import 'package:error_page/errors/StyleErrorPage/style_error_animation.dart';

class FloatAlertPage extends StatefulWidget {
  const FloatAlertPage(
      {super.key,
        required this.title,
        required this.errorTxt,
        required this.buttonTxt});

  final String title;
  final String errorTxt;
  final String buttonTxt;

  @override
  State<FloatAlertPage> createState() => _FloatAlertPageState();
}

class _FloatAlertPageState extends State<FloatAlertPage> {

  Widget updateWidget(String title) {
    switch (title) {
      case 'Login Failed':
        return const LoginErrorAnimation();
      case 'Server Error':
        return const ServerErrorAnimation();
      case 'Bug Found':
        return const StyleErrorAnimation();
      case 'Chart Data Unavailable':
        return const ChartDataErrorAnimation();
      case 'No Internet':
        return const InternetErrorAnimation();
      default:
        return const StyleErrorAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10,
      // title: const Text('AlertDialog Title'),
      content: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  child: updateWidget(widget.title),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Oh no!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                Text(widget.errorTxt,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15)),
              ],
            )
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: Text(widget.buttonTxt),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

