import 'package:electric_car_app/utils/animation.dart';
import 'package:flutter/material.dart';

class ChargingScreen extends StatefulWidget {
  const ChargingScreen({super.key});

  @override
  State<ChargingScreen> createState() => _ChargingScreenState();
}

class _ChargingScreenState extends State<ChargingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              backgroundColor: Color(0xff222222),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff111111),
        title: Text("Charging",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: "Poppins")),
        actions: [
          CircleAvatar(
            backgroundColor: Color(0xff222222),
            child: Icon(
              Icons.settings_outlined,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Hero(
        tag: "Charge",
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff7fff00),
              boxShadow: [
                BoxShadow(
                    color: Color(0xff7fff00).withOpacity(0.3),
                    offset: const Offset(5, 5),
                    blurRadius: 10),
                BoxShadow(
                    color: Color(0xff7fff00).withOpacity(0.3),
                    offset: const Offset(-3, -3),
                    blurRadius: 10)
              ]),
          alignment: Alignment.center,
          child: const Icon(
            Icons.electric_car,
            size: 35,
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  ShowUpAnimation(
                      delay: 1500, child: Image.asset("assets/byd-seal.png",height: 300,width: 533,)),
                  const SizedBox(
                    height: 130,
                  )
                ],
              ),
              ShowUpAnimation(
                delay: 1000,
                child: Container(
                  height: 170,
                  width: 170,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(
                          color: Color(0xff7fff00).withOpacity(0.6), width: 2),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff7fff00).withOpacity(0.1),
                            offset: const Offset(5, 5),
                            blurRadius: 10),
                        BoxShadow(
                            color: Color(0xff7fff00).withOpacity(0.1),
                            offset: const Offset(-5, -5),
                            blurRadius: 10)
                      ]),
                  alignment: Alignment.center,
                  child: Container(
                    height: 170,
                    width: 170,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff7fff00),
                        border: Border.all(
                            color: Color(0xff7fff00).withOpacity(0.6),
                            width: 2),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff7fff00).withOpacity(0.4),
                              offset: const Offset(5, 5),
                              blurRadius: 10),
                          BoxShadow(
                              color: Color(0xff7fff00).withOpacity(0.4),
                              offset: const Offset(-5, -5),
                              blurRadius: 10)
                        ]),
                    alignment: Alignment.center,
                    child: Container(
                      height: 170,
                      width: 170,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bolt,
                            size: 35,
                            color: Color(0xff7fff00),
                          ),
                          Text(
                            "75%",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              child: Stack(
            children: [
              ShowUpAnimation(
                delay: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("Range",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins")),
                        Row(
                          children: [
                            Text(
                              "435",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Poppins"),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Km",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins"),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text("Time",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins")),
                        Row(
                          children: [
                            Text(
                              "30",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Poppins"),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "m",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins"),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              ShowUpAnimation(
                delay: 300,
                child: Center(
                  child: Container(
                    width: 7,
                    margin: const EdgeInsets.only(bottom: 50),
                    decoration: BoxDecoration(
                      color: Color(0xff7fff00),
                      border: Border.all(
                          color: Color(0xff7fff00).withOpacity(0.6), width: 2),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff7fff00).withOpacity(0.4),
                            offset: const Offset(5, 5),
                            blurRadius: 10),
                        BoxShadow(
                            color: Color(0xff7fff00).withOpacity(0.4),
                            offset: const Offset(-5, -5),
                            blurRadius: 10)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
