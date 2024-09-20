import 'package:flutter/material.dart';
class DocDetails extends StatelessWidget {
  DoctorsClass doctorsClass;
  DocDetails({super.key, required this.doctorsClass});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Book Detials"),
       ),
        body: SingleChildScrollView(
          child: Container(

            width: double.infinity,
            child: Column(
              children: [
                Hero(
                    tag:"${doctorsClass.imgUrl}",
                    child: Image.asset("${doctorsClass.imgUrl}")),
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${doctorsClass.name}", style: TextStyle(fontSize: 24,fontWeight:FontWeight.bold),),
                              Text("${doctorsClass.speciality}", style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          Text("\$${doctorsClass.payment}",style: TextStyle(fontSize: 28,fontWeight:FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("About Doctor", style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                          Text("${doctorsClass.aboutDec}", style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            elevation: 4,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.27,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Text("Publisher", style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: 24,

                                      ),
                                      Text("${doctorsClass.patients}+")
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 4,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.27,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Experience",
                                    style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.shopping_bag, size: 24, ),
                                      Text("${doctorsClass.experience}+")
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 4,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.27,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Text("Rating", style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 24,
                                        color: Colors.yellow,
                                      ),
                                      Text("${doctorsClass.rating}+")
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),



                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
