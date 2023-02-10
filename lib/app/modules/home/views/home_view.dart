import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:task_app/app/modules/home/views/video.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flick_video_player/flick_video_player.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFFE6EEFA),
              child:
              IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)),
            ),

            const Text(
              'Explore',
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFFE6EEFA),
              child: IconButton(
                  onPressed: () {Get.to(VideoApp());}, icon: const Icon(Icons.notification_add)),
            ),
          ],
        ),
        centerTitle: true,

      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.pink,
                  size: 50,
                ),
              )
            : ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.videoList.length,
                itemBuilder: (context, index) {
                  final model=controller.videoList.elementAt(index);
                  return Container(
                    //height: 300,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(15),
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffDBFFEE)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(model.caption.toString()),
                        Text('${model.createdAt!.split('T')[1].split('.')[0]} PM'),
                        SizedBox(height: 15,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: FlickVideoPlayer(
                                    flickManager: FlickManager(
                                      autoPlay: false,
                                      videoPlayerController:
                                      VideoPlayerController.network("${model.videoUrl}"),
                                    )
                                ),
                              ),
                              Positioned(
                                  top: 10,
                                  right: 10,
                                  child: IconButton(
                                    onPressed: (){},
                                    icon:const Icon(Icons.volume_down) ,
                                  )),

                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(

                                  //width: Get.width-70,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.all(Radius.circular(15)
                                        // topLeft: Radius.circular(20),
                                        // topRight: Radius.circular(20)
                                    )
                                    
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          children:  [
                                            Image.asset('assets/icons/chat.png',
                                              width: 30,
                                              height: 30,
                                            ),
                                            Text('10',style: TextStyle(color: Colors.white),),
                                            SizedBox(width: 10,),
                                            Image.asset('assets/icons/subtract.png',
                                              width: 30,
                                              height: 30,),
                                            Text('122',style: TextStyle(color: Colors.white)),
                                          ],
                                        ),
                                        //const SizedBox(width: 120,),

                                        Row(
                                          children:  [
                                            Image.asset('assets/icons/send.png',
                                              width: 30,
                                              height: 30,),

                                            SizedBox(width: 15,),
                                            Image.asset('assets/icons/subtract_1.png',
                                              width: 30,
                                              height: 30,),

                                          ],
                                        ),


                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        
                        // Container(
                        //   height: 200,
                        //   child: Chewie(
                        //     controller: ChewieController(
                        //       videoPlayerController: VideoPlayerController.network(
                        //           model.videoUrl.toString()),
                        //       autoPlay: false,
                        //       looping: true,
                        //     ),
                        //   ),
                        // )

                        // YoutubePlayer(
                        //   controller: YoutubePlayerController(
                        //     // initialVideoId: YoutubePlayer.,
                        //     initialVideoId: YoutubePlayer.convertUrlToId(
                        //         // 'https://www.youtube.com/watch?v=3gU1OLKBcys&t=398s&ab_channel=LazyTechNo'
                        //         '${model.videoUrl!}')!,
                        //     flags: const YoutubePlayerFlags(
                        //       mute: false,
                        //       autoPlay: false,
                        //       disableDragSeek: false,
                        //       loop: false,
                        //       isLive: false,
                        //       forceHD: false,
                        //       enableCaption: false,
                        //     ),
                        //   ),
                        //
                        //   aspectRatio: 16 / 9,
                        //   showVideoProgressIndicator: true,
                        //   onReady: () {},
                        //   progressColors: const ProgressBarColors(
                        //     playedColor: Colors.amber,
                        //     handleColor: Colors.amberAccent,
                        //   ),
                        //
                        //   //   onReady () {
                        //   // _controller.addListener(listener);
                        //   // },
                        // ),

                        // InkWell(
                        //   onTap: (){},
                        //   child: Stack(
                        //     children: [
                        //       ClipRRect(
                        //         borderRadius: BorderRadius.circular(10),
                        //         child: Image.asset(
                        //             'assets/images/bg_images.jpg',
                        //           height: 200,
                        //           width: Get.width,
                        //           fit: BoxFit.fill,
                        //
                        //         ),
                        //       ),
                        //
                        //
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
