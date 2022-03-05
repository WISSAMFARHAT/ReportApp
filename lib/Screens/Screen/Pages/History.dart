import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import '../../../constant.dart';

class History extends StatefulWidget {
  final String branch;

  const History({Key? key,required this.branch}) : super(key: key);
  @override
  _HistoryState createState() => _HistoryState();


}

class _HistoryState extends State<History> {
   List<FileSystemEntity> entities = [];
   var directory=null;



   void open(path)
   {
     OpenFile.open(path);
   }
   @override
   void initState() {
     (getApplicationDocumentsDirectory()).then((value) =>
         setState((){
           directory=value.path;
         })
     );
     super.initState();
   }
     @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //return total size , w ,hof screen
    try{
     var folder=io.Directory('${directory}/${widget.branch}');
        entities=folder.listSync();
        return ListView(
          children:[
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
                        const SizedBox(height: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for(int i=entities.length-1;i>=0;i--)
                              ElevatedButton.icon(
                                onPressed: () {
                                  open(entities[i].path);
                                },
                                icon: Icon( // <-- Icon
                                  Icons.picture_as_pdf,
                                  size: 24.0,
                                ),
                                label: Text(entities[i].path.split("/").last), // <-- Text
                              ),

                          ],
                        )
                      ]),
                ],
              ),
            ),
          ],
        );

      }catch(exception )
        {
          return Center(child: Text("File is emty ??",style: TextStyle(color: Colors.white,fontSize: 20)));
        }

  }
}
