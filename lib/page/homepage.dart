import 'package:bookstore/data/Book_list.dart';
import 'package:bookstore/page/fifthpage.dart';
import 'package:bookstore/page/managestatepage.dart';
import 'package:bookstore/page/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(
      builder: (context, ms, _) {
        return Scaffold(
          backgroundColor: Color(0XFFe6ccb2),
          appBar: AppBar(
            backgroundColor: Color(0XFFd4a276),
            leading: Icon(Icons.menu,size: 34,),
            actions: [
              Stack(clipBehavior: Clip.none,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>bookmarkpage()));
                      },
                      child: Icon(Icons.bookmark,size: 34,)),
                  Positioned(
                    right: -10,
                    top: -10,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          "${ms.booker}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],),
              Gap(10),

              Stack(clipBehavior: Clip.none,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>CartPage()));
                      },
                      child: Icon(Icons.shopping_cart_outlined, size: 34,)),
                  Positioned(
                    right: -10,
                    top: -10,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          "${ms.counter}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(15),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.77,
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemCount: allBook.length,
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
                                      image: AssetImage("${allBook[index].imgeUrl}"),
                                      fit: BoxFit.cover)
                              ),

                            ),
                            Gap(5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("${allBook[index].bookName}", style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),

                                Text("\$${allBook[index].price}", style: TextStyle(fontSize: 18),),
                                Gap(5),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {

                                          bool added = ms.addToCart(allBook[index]);
                                          if(added){
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text("Product Has been added"))
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text("Product is already added"))
                                            );
                                          }
                                        },
                                        icon: Icon(
                                          Icons.shopping_cart_checkout,
                                          size: 30,
                                        )),
                                    IconButton(
                                        onPressed: () {

                                          bool added = ms.addToBook(allBook[index]);
                                          if(added){
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text("Book Has been added"))
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text("Book is already added"))
                                            );
                                          }
                                        },
                                        icon: Icon(
                                          Icons.bookmark,
                                          size: 30,
                                        )
                                    ),
                                  ],
                                )
                              ],),

                          ],
                        ),
                      );
                    }))
            ],
          ),
        );
      },
    );
  }


}

