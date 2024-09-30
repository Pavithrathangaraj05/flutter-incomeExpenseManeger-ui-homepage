import 'package:flutter/material.dart';

class IconChanger extends StatefulWidget {
  final IconData icon;
  final String title;

  IconChanger({required this.icon, required this.title});

  @override
  _IconChangerState createState() => _IconChangerState();
}

class _IconChangerState extends State<IconChanger> {
  Color _containerColor = Colors.grey[300]!;

  void _changeColor() {
    setState(() {
      _containerColor = _containerColor == Colors.grey[300]
          ? Color.fromARGB(255, 177, 218, 252)
          : Colors.grey[300]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: _containerColor,
                borderRadius: BorderRadius.circular(10)),
            child: Icon(
              widget.icon,
              color: Colors.grey,
              size: 30,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.title,
            style: TextStyle(fontSize: 13, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}

class Fabbotton extends StatefulWidget {
  const Fabbotton({super.key});

  @override
  State<Fabbotton> createState() => _FabbottonState();
}

class _FabbottonState extends State<Fabbotton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ),
        title: const Center(
          child: Text(
            'Add Transaction',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(20),
                  minHeight: 10,
                  value: 0.5,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Select Transaction Type",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10),
                child: Row(
                  children: [
                    IconChanger(icon: Icons.trending_down, title: ""),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 20),
                      child: title("Income"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    IconChanger(icon: Icons.trending_up, title: ""),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 20),
                      child: title("Expense"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: title("Name"),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                child: TextField(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: title("Choose category"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconChanger(
                        icon: Icons.shopping_bag_outlined, title: "Salary"),
                    IconChanger(icon: Icons.home_outlined, title: "Rent"),
                    IconChanger(icon: Icons.cases_outlined, title: "Business"),
                    IconChanger(
                        icon: Icons.local_hospital_outlined, title: "Health"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconChanger(icon: Icons.trending_up, title: "Stocks"),
                    IconChanger(icon: Icons.shopping_cart, title: "Shopping"),
                    IconChanger(
                        icon: Icons.airplanemode_active, title: "Travel"),
                    IconChanger(icon: Icons.add, title: "Others"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // title(String title1) {
  //   return Text(
  //     title1,
  //     style: TextStyle(
  //         fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[700]),
  //   );
  // }
// }
  title(String title1) {
  return Text(
    title1,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.grey[700],
    ),
  );
  }
}



















// class Add extends StatefulWidget {
//   const Add({super.key});

//   @override
//   State<Add> createState() => _HomeState();
// }

// class _HomeState extends State<Add> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.grey[200],
//               shape: BoxShape.circle,
//             ),
//             child: IconButton(
//               icon: const Icon(Icons.arrow_back, color: Colors.black),
//               onPressed: () {},
//             ),
//           ),
//         ),
//         title: const Center(
//           child: Text(
//             'Add Transaction',
//             style: TextStyle(
//                 color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
//                 child: LinearProgressIndicator(
//                   borderRadius: BorderRadius.circular(20),
//                   minHeight: 10,
//                   value: 0.5,
//                   backgroundColor: Colors.grey[300],
//                   valueColor: const AlwaysStoppedAnimation<Color>(
//                       Color.fromARGB(255, 0, 0, 0)),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(left: 10),
//                 child: Text(
//                   "Select Transaction Type",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 25, top: 10),
//                 child: Row(
//                   children: [
//                     IconChanger(icon: Icons.trending_down, title: ""),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20, bottom: 20),
//                       child: title("Income"),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 25),
//                 child: Row(
//                   children: [
//                     IconChanger(icon: Icons.trending_up, title: ""),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20, bottom: 20),
//                       child: title("Expense"),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 20, left: 20),
//                 child: title("Name"),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(left: 20,right: 20,bottom: 10),
//                 child: TextField(),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20),
//                 child: title("Choose category"),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconChanger(
//                         icon: Icons.shopping_bag_outlined, title: "Salary"),
//                     IconChanger(icon: Icons.home_outlined, title: "Rent"),
//                     IconChanger(icon: Icons.cases_outlined, title: "Business"),
//                     IconChanger(
//                         icon: Icons.local_hospital_outlined, title: "Health"),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconChanger(icon: Icons.trending_up, title: "Stocks"),
//                     IconChanger(icon: Icons.shopping_cart, title: "Shopping"),
//                     IconChanger(
//                         icon: Icons.airplanemode_active, title: "Travel"),
//                     IconChanger(icon: Icons.add, title: "Others"),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
//                 child: InkWell(
//                   child: Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         color: Colors.grey[300],
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(15),
//                         child: Text(
//                           "Continue",
//                           style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey[700]),
//                         ),
//                       ),
//                     ),
//                   ),
//                   onTap: () {},
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // title(String title1) {
//   //   return Text(
//   //     title1,
//   //     style: TextStyle(
//   //         fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[700]),
//   //   );
//   // }
// // }
//   title(String title1) {
//   return Text(
//     title1,
//     style: TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.bold,
//       color: Colors.grey[700],
//     ),
//   );
//   }
// }