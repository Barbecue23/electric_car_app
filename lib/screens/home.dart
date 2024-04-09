import 'package:electric_car_app/screens/charging.dart';
import 'package:electric_car_app/screens/door.dart';
import 'package:electric_car_app/screens/tires.dart';
import 'package:electric_car_app/utils/air_tem.dart';
import 'package:electric_car_app/utils/api_caller.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLocked = false;
  bool isCharging = false;
  bool isCMode = false;
  bool isNMode = true;
  bool isPMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff111111),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello!", style: TextStyle(color: Colors.white, fontSize: 14)),
            Text("Kiw",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Color(0xff222222),
            child: Icon(Icons.grid_view, color: Colors.grey),
          ),
          SizedBox(width: 10),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ChargingScreen()));
        },
        child: Hero(
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                        height: 303,
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xff222222),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/console.png",
                                height: 180,
                                width: double.infinity,
                              ),
                              SizedBox(height: 10),
                              AirConditionerController(),
                            ])),
                    SizedBox(height: 20.0),
                    Container(
                      height: 60,
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xff222222),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 20),
                          Text(
                            "mode",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(width: 20),
                          FutureBuilder(
                            future: ApiCaller().getModes(),
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else {
                                if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isCMode = true;
                                            isNMode = false;
                                            isPMode = false;
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 80,
                                          margin: EdgeInsets.only(right: 10),
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            color: isCMode ? Color(0xff7fff00): Color(0xff808080),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${snapshot.data!.substring(0, 7)}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Poppins"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isNMode = true;
                                            isCMode = false;
                                            isPMode = false;
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 80,
                                          margin: EdgeInsets.only(right: 10),
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            color: isNMode ? Color(0xff7fff00): Color(0xff808080),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: Text(
                                                '${snapshot.data!.substring(7, 14)}',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: "Poppins")),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isPMode = true;
                                            isCMode = false;
                                            isNMode = false;
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 80,
                                          margin: EdgeInsets.only(right: 10),
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            color: isPMode ? Color(0xff7fff00): Color(0xff808080),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: Text(
                                                '${snapshot.data!.substring(14, 26)}',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: "Poppins")),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              }
                            },
                          ),
                          //ใส่ค่าจากapi
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Container(
                      height: 200,
                      width: 90,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Color(0xff222222),
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 140,
                        width: 90,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Color(0xff7fff00),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              isCharging
                                  ? Icons.battery_charging_full
                                  : Icons.battery_6_bar, // สลับไอคอน
                              color: Colors.black,
                              size: 30,
                            ),
                            Text("75%",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22)),
                            Text(isCharging ? "Charging" : " ", // สลับข้อความ,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Container(
                          height: 90,
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color(0xff222222),
                              borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Total distance",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Poppins"),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "1234",
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
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: RotatedBox(
                                    quarterTurns: 1,
                                    child: Icon(
                                      Icons.route,
                                      color: Color(0xff7fff00),
                                      size: 40,
                                    )),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 90,
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color(0xff222222),
                              borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Icon(
                                  Icons.directions_car,
                                  color: Color(0xff7fff00),
                                  size: 40,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isLocked = !isLocked;
                              });
                            },
                            child: Container(
                              height: 90,
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Color(0xff222222),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    isLocked
                                        ? Icons.lock
                                        : Icons.lock_open_rounded,
                                    color: Color(0xff7fff00),
                                    size: 40,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    isLocked ? "Lock" : "Unlock",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(
                                () {
                                  isCharging =
                                      !isCharging; // เปลี่ยนสถานะการชาร์จ
                                },
                              );
                            },
                            child: Container(
                              height: 90,
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xff222222),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    isCharging
                                        ? Icons.power_off
                                        : Icons.ev_station, // สลับไอคอน
                                    color: Color(0xff7fff00),
                                    size: 40,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    isCharging
                                        ? "Stop Charging"
                                        : "Start Charging", // สลับข้อความ
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Poppins"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Tires()),
                    );
                  },
                  child: Container(
                    height: 90,
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xff222222),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.tire_repair,
                                color: Color(0xff7fff00),
                                size: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Tires",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                              ),
                            ),
                            Spacer(),
                            Container(
                              child: Icon(
                                Icons.warning,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.chevron_right,
                                color: Colors.grey.shade600,
                                size: 40,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                
                  InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Door()),
                    );
                  },
                  child: Container(
                    height: 90,
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xff222222),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.car_crash,
                                color: Color(0xff7fff00),
                                size: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Door and Windows",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                              ),
                            ),
                            Spacer(),
                            Container(
                              child: Icon(
                                Icons.warning,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.chevron_right,
                                color: Colors.grey.shade600,
                                size: 40,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 90,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xff222222),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.alarm,
                            color: Color(0xff7fff00),
                            size: 40,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Service Reminder!",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
