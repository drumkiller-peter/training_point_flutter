//! This file is for your reference only.


// class VideoPlayerWidgetForChatScreenState
//     extends State<VideoPlayerWidgetForChatScreen> {
//   late VideoPlayerController controller;
//   bool isPlaying = false;
//   bool isBuffering = false;
//   bool isInitialized = false;
//   bool isFullScreenModeOn = false;
//   double _sliderValue = 0.0;
//   @override
//   void initState() {
//     isFullScreenModeOn = widget.isFullScreenMode;
//     log(isFullScreenModeOn.toString());
//     controller = VideoPlayerController.network(widget.uri)..initialize();

//     controller.addListener(() {
//       setState(() {
//         isInitialized = controller.value.isInitialized;
//       });
//       // check if controller is loaded or initialized
//       if (controller.value.isInitialized) {
//         // check if controller is playing
//         if (controller.value.isPlaying != isPlaying) {
//           isPlaying = controller.value.isPlaying;
//         }

//         //Check if the video is buffering
//         if (controller.value.isBuffering != isBuffering) {
//           // setState(() {
//           isBuffering = controller.value.isBuffering;
//           // });
//         }

//         final Duration currentPosition = controller.value.position;
//         final Duration totalDuration = controller.value.duration;
//         final double progress =
//             currentPosition.inSeconds / totalDuration.inSeconds;
//         if (!progress.isNaN) {
//           setState(() {
//             _sliderValue = progress;
//           });
//         }

//         // on video player complete
//         if (progress > 1) {
//           controller.pause();
//           setState(() {
//             isPlaying = false;
//             isBuffering = false;
//           });
//         }
//       }
//     });
//     super.initState();
//   }

//   void _onSliderChanged(double value) {
//     setState(() {
//       _sliderValue = value;
//       final Duration newPosition = controller.value.duration * _sliderValue;
//       controller.seekTo(newPosition);
//       controller.play();
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double aspectRatio =
//         controller.value.aspectRatio; // Get the video's aspect ratio

//     final bool isLandscape = aspectRatio > 1.0;
//     final bool isPortrait = aspectRatio < 1.0;
//     return WillPopScope(
//       onWillPop: () {
//         Navigator.pop(context, false);
//         return Future.value(false);
//       },
//       child: SafeArea(
//         child: GestureDetector(
//           onTap: () async {
//             log(isFullScreenModeOn.toString());

//             if (!isFullScreenModeOn) {
//               setState(() {
//                 isFullScreenModeOn = !isFullScreenModeOn;
//                 log("${isFullScreenModeOn}After Set state");
//               });
//               isFullScreenModeOn = await Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => VideoPlayerWidgetForChatScreen(
//                     uri: widget.uri,
//                     isFullScreenMode: isFullScreenModeOn,
//                   ),
//                 ),
//               );
//             } else {
//               controller.value.isPlaying
//                   ? controller.pause()
//                   : controller.play();
//               setState(() {
//                 isPlaying = controller.value.isPlaying;
//               });
//             }
//           },
//           child: Container(
//             color: Colors.black.withOpacity(0.7),
//             child: AspectRatio(
//               aspectRatio: isPortrait ? 2 / 3 : 16 / 9,
//               child: Stack(
//                 children: [
//                   !isInitialized
//                       ? Container(
//                           color: Colors.black,
//                           child: const Center(
//                             child: CircularProgressIndicator(),
//                           ),
//                         )
//                       : Center(
//                           child: SizedBox(
//                             width: double.infinity,
//                             height: isLandscape ? 300 : null,
//                             child: VideoPlayer(
//                               controller,
//                               key: GlobalKey(
//                                 debugLabel: widget.uri,
//                               ),
//                             ),
//                           ),
//                         ),
//                   AnimatedOpacity(
//                     opacity: isBuffering
//                         ? 1
//                         : isPlaying
//                             ? 0
//                             : 1,
//                     duration: const Duration(milliseconds: 300),
//                     child: Center(
//                       child: isBuffering
//                           ? const CircularProgressIndicator()
//                           : CircleAvatar(
//                               backgroundColor: Colors.black.withOpacity(0.4),
//                               radius: 20,
//                               child: Icon(
//                                   isPlaying ? Icons.pause : Icons.play_arrow,
//                                   color: Colors.white,
//                                   size: 30),
//                             ),
//                     ),
//                   ),
//                   if (isFullScreenModeOn)
//                     Positioned(
//                       bottom: 0,
//                       left: 0,
//                       right: 0,
//                       child: AnimatedOpacity(
//                         opacity: isBuffering
//                             ? 1
//                             : isPlaying
//                                 ? 0
//                                 : 1,
//                         duration: const Duration(milliseconds: 300),
//                         child: Container(
//                           color: Colors.black.withOpacity(0.4),
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 controller.value.position
//                                     .getFormattedDuration(),
//                                 style: const TextStyle(color: Colors.white),
//                               ),
//                               Expanded(
//                                 child: Slider(
//                                   value: _sliderValue,
//                                   onChanged: _onSliderChanged,
//                                 ),
//                               ),
//                               Text(
//                                 controller.value.duration
//                                     .getFormattedDuration(),
//                                 style: const TextStyle(color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }