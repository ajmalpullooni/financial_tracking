import 'package:flutter/material.dart';
import 'package:project_int/pages/calc.dart';
import 'package:project_int/components/goalSet.dart';

import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.65,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //header text
                      const Text(
                        'Buy a Dream House',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      //circular progress bar
                      Container(
                        height: size.height * 0.25,
                        width: 200,
                        // color: Colors.grey,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 20,
                              left: 25,
                              child: SimpleCircularProgressBar(
                                // mergeMode: true,
                                // onGetText: (double value) {
                                //   return Text('${value.toInt()}%');
                                // },

                                backColor: Colors.white.withOpacity(0.5),
                                backStrokeWidth: 5,
                                progressStrokeWidth: 6,
                                startAngle: 180,
                                //maxValue: 40,
                                progressColors: const [
                                  Colors.white,
                                ],
                                size: 150,
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: Container(
                                        //color: Colors.amber,
                                        height: 100,
                                        width: 100,
                                        child: const Icon(
                                          Icons.home,
                                          size: 100,
                                        ),
                                      ),
                                    ),

                                    //the total amount is calculated here
                                    FutureBuilder<int>(
                                      future: totalSum(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return CircularProgressIndicator(); // While data is loading
                                        } else if (snapshot.hasError) {
                                          return Text(
                                              'Error: ${snapshot.error}'); // If there's an error
                                        } else {
                                          return Text(
                                            '${snapshot.data}'.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ); // If data is successfully loaded
                                        }
                                      },
                                    ),
                                    const Text('You Saved'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Goal Set
                      GoalSetting(),
                      const SizedBox(
                        height: 20,
                      ),
                      Spacer(),
                      //savings box
                      theStatistics(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Transaction History',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/list');
                    },
                    child: Text('See All'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container theStatistics() {
    return Container(
      height: 100,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Need More Savings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '25000',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Monthly Savings ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '250',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
