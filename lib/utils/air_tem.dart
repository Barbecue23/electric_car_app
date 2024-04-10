import 'package:flutter/material.dart';

class AirConditionerController extends StatefulWidget {
  @override
  _AirConditionerControllerState createState() =>
      _AirConditionerControllerState();
}

class _AirConditionerControllerState extends State<AirConditionerController> {
  bool isOnOff = false;
  int temperature = 25; // อุณหภูมิเริ่มต้น
  int temperature2 = 25;
  void increaseTemperature() {
    setState(() {
      temperature++;
    });
  }

  void decreaseTemperature() {
    setState(() {
      temperature--;
    });
  }

  void increaseTemperature2() {
    setState(() {
      temperature2++;
    });
  }

  void decreaseTemperature2() {
    setState(() {
      temperature2--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade300,
                      ),
                      onPressed: increaseTemperature,
                      child: Icon(Icons.arrow_drop_up, color: Colors.white),
                    ),
                    // SizedBox(height: 10),
                    Text(
                      '$temperature °C',
                      style:
                          TextStyle(fontSize: 20, color: Colors.blue.shade300),
                    ),
                    // SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade300,
                      ),
                      onPressed: decreaseTemperature,
                      child: Icon(Icons.arrow_drop_down, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 50),
            InkWell(
              onTap: () {
                setState(() {
                  isOnOff = !isOnOff;
                });
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff222222),
                  border: Border.all(
                      color:
                          isOnOff ? Colors.green.shade300 : Colors.red.shade300,
                      width: 2),
                ),
                child: Icon(
                  Icons.power_settings_new,
                  color: isOnOff ? Colors.green.shade300 : Colors.red.shade300,
                  size: 40,
                ),
              ),
            ),
            SizedBox(width: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade300,
                      ),
                      onPressed: increaseTemperature2,
                      child: Icon(Icons.arrow_drop_up, color: Colors.white),
                    ),
                    // SizedBox(height: 10),
                    Text(
                      '$temperature2 °C',
                      style:
                          TextStyle(fontSize: 20, color: Colors.blue.shade300),
                    ),
                    // SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade300,
                      ),
                      onPressed: decreaseTemperature2,
                      child: Icon(Icons.arrow_drop_down, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
