import 'package:bookstore/page/managestatepage.dart';
import 'package:bookstore/page/secondpage.dart';
import 'package:bookstore/page/thirdpage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
class bookmarkpage extends StatelessWidget {
  const bookmarkpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFe6ccb2),
        appBar: AppBar(
          backgroundColor: Color(0XFFd4a276),
          title: Text("BookMark"),
          centerTitle: true,
        ),
        body: Consumer<ManageState>(
          builder: (context, ms, _) {
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.6,
                      crossAxisCount: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                    ),
                    itemCount:  ms.bookProducts.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Color(0XFFb08968),
                        child: Column(
                          children: [
                            Container(
                              height: 115,
                              width: MediaQuery.of(context).size.width * 1.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "${ms.bookProducts[index].imgeUrl}"),
                                      fit: BoxFit.cover)
                              ),

                            ),
                            Gap(5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(" ${ms.bookProducts[index].bookName}", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                                    Text(" ${ms.bookProducts[index].authorName}", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                                  ],),
                            Gap(5),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>CartPage()));
                              },
                              child: Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                  color:Color(0XFFddb892),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Center(child: Text("BUY",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                              ),
                            )


                          ],
                        ),
                      );



                    },
                  ),
                ),


              ],
            );
          },
        ));
  }
}

