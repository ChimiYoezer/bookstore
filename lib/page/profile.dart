import 'package:bookstore/page/homepage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFe6ccb2),
      appBar: AppBar(
        backgroundColor: Color(0xFFd4a276),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>homepage()));
            },child: Icon(Icons.arrow_back_ios_new)),
        title: Text("Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        centerTitle: true,
      ),
      body:Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
          ),
          child: Column(
            children: [

              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFd4a373)),
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: AssetImage("assets/image/profile.png"),

                      )
                  ),



                ),
              ),
              SizedBox(height: 40,),
              Container(
                padding: EdgeInsets.all(20),
                height: 290,
                width: 380,

                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFd4a373)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Name: ", style: TextStyle(fontSize: 20,color: Colors.blue),),
                        Text(" Chimi Yoezer", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ],

                    ),Gap(13),
                    Divider(),
                    Gap(13),

                    Row(
                      children: [
                        Text("Email: ", style: TextStyle(fontSize: 20,color: Colors.blue),),
                        Text("ChimiYoezer27@gmail.com", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Gap(13),
                    Divider(),
                    Gap(13),
                    Row(
                      children: [
                        Text("Gender: ", style: TextStyle(fontSize: 20,color: Colors.blue),),
                        Text("Male", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ],
                    ),Gap(13),
                    Divider(),
                    Gap(13),
                    Row(
                      children: [
                        Text("Contact : ",style: TextStyle(fontSize: 20,color: Colors.blue),),
                        Text("17621055", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ],
                    ),

                  ],
                ),
              ),


            ],
          ),

        ),
      ),
    );
  }
}
