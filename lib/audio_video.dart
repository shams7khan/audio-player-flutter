// import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//12.00

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool playing = false;
  IconData playButton = Icons.play_arrow;

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();

  double currentPosition = 0.0;
  Duration position = Duration();
  Duration duration = Duration();

 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // audioPlayer = AudioPlayer();
    // audioCache = AudioCache(fixedPlayer: audioPlayer);

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF1565C0), Color(0xFF90CAF9)])),
          // padding: EdgeInsets.only(top: 30  ),
          child: Container(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Music player",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage("assets/musicImage.jpg"),
                            fit: BoxFit.fill)),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Expanded(
                  child: Container(
                    // width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),

                    

                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                          child: slider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {

                                  }, icon: Icon(
                                    Icons.skip_previous,
                                    size: 50,
                                  )
                              ),

                              IconButton(
                                  onPressed: () {
                                    if (!playing) {
                                      audioCache.fixedPlayer = audioPlayer;
                                      audioCache.play("o_sanam.mp3");
                                      setState(() {
                                        playButton = Icons.pause;
                                        playing = true;
                                      });
                                    } else {
                                      setState(() {
                                        audioPlayer.stop();
                                        playButton = Icons.play_arrow;
                                        playing = false;
                                      });
                                    }
                                  }, icon: Icon(
                                    playButton,
                                    size: 60,
                                  )
                              ),

                              IconButton(
                                  onPressed: () {

                                  }, icon: Icon(
                                    Icons.skip_next,
                                    size: 50,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget slider(){
    return Slider.adaptive(
      value: currentPosition,
      onChanged: (val)async{ 
        int dur = await audioPlayer.getDuration();
        double temp1 = (dur/1000) * val;
        // print(temp1);
        setState(() {
          currentPosition = val;
          // print(currentPosition);
        });
        
        // Timer.periodic(Duration(seconds: 1), (timer) async {
        //   int dur = await audioPlayer.getDuration();
        //   double temp1 = (dur/1000) * val;
        // // print(temp1);
        //   setState(() {
        //     currentPosition = val;
        //     print(currentPosition);
        //   });
        // });
        // });
          // audioPlayer.seek(Duration(seconds: temp1.toInt()));
          // audioPlayer.
          // Timer.periodic(Duration(seconds: 1), (timer) {
          //   currentPosition = val;
          //   print(currentPosition);
          //  });
        //   currentPosition = val;
        //   print(currentPosition);
        // });
        
        audioPlayer.seek(Duration(seconds: temp1.toInt()));
        });

        // getPositon(){
          // return audioPlayer.seek(Duration(seconds: temp1.toInt()));
        }
        // Timer.periodic(Duration(seconds: 1), (Timer t){
        //   // return audioPlayer.seek(Duration(seconds: temp1.toInt()));

        //   // getPositon();

        //   // getPositon();
        //   // setState(() {
        //     // getPositon();
        //     // cure
        //   });
        // });
        // audioPlayer.seek(Duration(seconds: temp1.toInt()));
        // // audioPlayer.onDurationChanged.listen((Duration ) { })
        // audioPlayer.onAudioPositionChanged.listen((d)async {
        //   int dur = await audioPlayer.getDuration();
        //   double temp1 = (dur/1000) * val;
        //   setState(() {
        //     currentPosition = d;
        //   });
        //  })
    //   }
    // );
      // max: musicLength.inSeconds.toDouble(),
      // onChanged: (val)
      //   seekToSec(value.toInt());
      //   });
  // }

  // void seekToSec(int sec){
  //   Duration newPos = Duration(seconds: sec); 
  //   audioPlayer.seek(newPos);
  // }

  // Widget slider(){
  //  return Slider(
  //    value: position.inSeconds.toDouble(), 
  //    min: 0.0,
  //    max: duration.inSeconds.toDouble(),
  //    onChanged: (double value){
  //      setState(() {
  //        changeToSec(value.toInt());
  //        value = value;
  //      });

  //    }
  //   );
  // }

  // void changeToSec(int sec){
  //   Duration newDuration = Duration(seconds: sec);
  //   audioPlayer.seek(newDuration);
  // }
}
