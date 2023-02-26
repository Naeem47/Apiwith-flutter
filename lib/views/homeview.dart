import 'package:apifucntional/controller/user_controller.dart';
import 'package:apifucntional/views/adduser.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async {
        return setState(() {
          
        });
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text("USERS",style: GoogleFonts.rubik(),),
        ),
        body: FutureBuilder(
          future: getuser(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
             
             if(snapshot.hasData == ConnectionState.none){
              return LottieBuilder.asset("assets/lottie/connection.json");
             }
             else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(
                        snapshot.data.data[index].name,
                        style: GoogleFonts.rubik(),
                      ),
                      subtitle: Text(
                        snapshot.data.data[index].email,
                        
                        style:  GoogleFonts.rubik(
                          color: Colors.grey,
                        ),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            dltuser(snapshot.data.data[index].id.toString());
                            setState(() {});
                          },
                          icon: const Icon(Icons.delete)));
                },
              );
            }
            // ignore: unnecessary_null_comparison
            else if (snapshot.hasData ==  null){
              return LottieBuilder.asset("assets/lottie/nodata.json");
            }
             else {
              return  Center(
                child: LottieBuilder.asset("assets/lottie/loader.json"),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: const Icon(Icons.add),
          onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddUser(),
              ),);
    
        }),
      ),
    );
  }
}
