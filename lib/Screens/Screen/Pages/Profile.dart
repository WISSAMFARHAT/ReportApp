import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../../constant.dart';


class Profile extends StatefulWidget {
  final String branch;
  const Profile({Key? key,required this.branch}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}



class _ProfileState extends State<Profile> {
  File? images;


  @override
  void initState() {
    super.initState();
    File newImage;
    (getApplicationDocumentsDirectory()).then((value) =>
    {
      (File('${value.path}/profile.png').exists()).then((e) =>
      { newImage = File('${value.path}/profile.png'),
        setState(() {
          images = newImage;
        })
      }
      ),

  }
    );

  }

  Future pickImage() async {
    try {
      final  image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final imagetemporary = File(image.path);
      final String path = (await getApplicationDocumentsDirectory()).path;
      // copy the file to a new path
      final File newImage = await imagetemporary.copy('$path/profile.png');

      setState(() {
        images = imagetemporary;
      });



    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //return total size , w ,hof screen
    String checkbranch=widget.branch.toString();
    return
      SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            children: [
              Row(children: [
                Container(
                  width: size.width * 0.7,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Ksecond,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(80))),
                )
              ]),
              SizedBox(height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        pickImage();
                      },
                      child: Container(

                        margin: const EdgeInsets.all(20),
                        width: 200,
                        height: 200,

                        child:CircleAvatar(
                            backgroundColor: Colors.transparent,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child:  Column(children: [
                              images != null
                                  ? Image.file(images!,height: 200, width: 200,fit: BoxFit.cover,)
                                  : Image.asset('Images/humane.png')
                            ]),
                          )
                         )

                      ),
                    ),
                  ),
                  if(checkbranch=="Services Departement")
                    Column(
                      children: [
                        const Text(
                          "Services Departement ",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 30)),
                        const Text(
                          "Allam Al Jurdi",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const Text(
                          "Ali Yassin",
                          overflow: TextOverflow.clip,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const Text(
                          "Shadi Farhat",
                          overflow: TextOverflow.clip,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const Text(
                          "Mohamad Faraa",
                          overflow: TextOverflow.clip,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const Text(
                          "Hanadi Abdulbaki",
                          overflow: TextOverflow.clip,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    )
                  else if(checkbranch=="Stationary Departement")
                    Column(
    children: [
    const Text(
    "Stationary Departement ",
    style: TextStyle(color: Colors.white, fontSize: 25),
    ),
    const Padding(padding: EdgeInsets.only(top: 30)),
    const Text(
    "Wael Chamandi",
    overflow: TextOverflow.clip,
    style: TextStyle(
    color: Colors.white,
    fontSize: 20,
    ),
    ),
    const Text(
    "Norma Saiid",
    overflow: TextOverflow.clip,
    style: TextStyle(color: Colors.white, fontSize: 20),
    ),
    const Text(
    "Silvia Baaklini",
    overflow: TextOverflow.clip,
    style: TextStyle(color: Colors.white, fontSize: 20),
    ),
    const Text(
    "Rabih Gh",
    overflow: TextOverflow.clip,
    style: TextStyle(color: Colors.white, fontSize: 20),
    ),
    const Text(
    "Hanin Zahwe",
    overflow: TextOverflow.clip,
    style: TextStyle(color: Colors.white, fontSize: 20),
    ),
    ],
    )
                  else
                    Column(
                      children: [
                         Text(
                          "${widget.branch}",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 30)),
                        const Text(
                          "Hassan Naserdine",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const Text(
                          "Ziad Saad",
                          overflow: TextOverflow.clip,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const Text(
                          "Nihal Farchoukh",
                          overflow: TextOverflow.clip,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    )

                ],
              )
            ],
          )

        ],
      ),
    );
  }
}
