import 'package:appme/services/locator.dart';
import 'package:appme/services/storage_service.dart';
import 'package:appme/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoLoopContainer extends StatelessWidget {
  final LinearGradient gradient;
  final String doc;
  final double width;
  final double height;
  final String text;
  final BoxDecoration decoration;
  const VideoLoopContainer(
      {Key key,
      @required this.text,
      @required this.doc,
      @required this.width,
      @required this.height,
      @required this.gradient,
      this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      child: FutureBuilder(
        future: locator<StorageService>().storage.ref(doc).getDownloadURL(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              fit: StackFit.expand,
              children: [
                BackGroundVideo(
                  url: snapshot.data,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: gradient,
                  ),
                  child: Center(
                    child: CustomText(text: text),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: Text(text),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class BackGroundVideo extends StatefulWidget {
  final String url;
  BackGroundVideo({Key key, @required this.url}) : super(key: key);

  @override
  _BackGroundVideoState createState() => _BackGroundVideoState();
}

class _BackGroundVideoState extends State<BackGroundVideo> {
  VideoPlayerController _controller;
  double _opacity = 0;

  @override
  void initState() async {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
        _opacity = 1;
      });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 800),
      child: FittedBox(
        // If your background video doesn't look right, try changing the BoxFit property.
        // BoxFit.fill created the look I was going for.
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller.value.size?.width ?? 0,
          height: _controller.value.size?.height ?? 0,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
