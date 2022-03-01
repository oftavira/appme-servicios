import 'package:appme/constants/colors.dart';
import 'package:appme/locator_services/locator.dart';
import 'package:appme/locator_services/storage_service/storage_service.dart';
import 'package:appme/ui/base_widget.dart';
import 'package:appme/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoLoopContainer extends StatelessWidget {
  final String doc;
  final double width;
  final double height;
  final String text;
  final bool mobile;
  final AnimationController controller;
  const VideoLoopContainer(
      {Key key,
      @required this.text,
      @required this.controller,
      @required this.doc,
      @required this.width,
      @required this.height,
      @required this.mobile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: FutureBuilder(
        future: locator<StorageService>().storage.ref(doc).getDownloadURL(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              fit: StackFit.expand,
              children: [
                BackGroundVideo(
                  controller: controller,
                  url: snapshot.data,
                ),
                AnimatedVideoText(
                  text: text,
                  mobile: mobile,
                  controller: controller,
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  color: Colors.green,
                  child: Center(
                    child: Text(text),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class BackGroundVideo extends StatefulWidget {
  final String url;
  final Animation<double> opacity;
  final AnimationController controller;
  BackGroundVideo({Key key, @required this.url, @required this.controller})
      : opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.8, 1, curve: Curves.easeInOut),
          ),
        ),
        super(key: key);

  @override
  _BackGroundVideoState createState() => _BackGroundVideoState();
}

class _BackGroundVideoState extends State<BackGroundVideo> {
  VideoPlayerController _videoController;
  double opacity;

  @override
  void initState() async {
    opacity = 0;
    print('El url es... ${widget.url}');
    super.initState();
    _videoController = VideoPlayerController.network(widget.url);
    _videoController.setVolume(0);
    _videoController.initialize();
    _videoController.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    opacity = 1;
    _videoController.play();
    setState(() {});
    return SizedWidget(
      theBuilder: (context, sizingInfo) {
        return FadeTransition(
          opacity: widget.opacity,
          child: FittedBox(
            // If your background video doesn't look right, try changing the BoxFit property.
            // BoxFit.fill created the look I was going for.
            fit: BoxFit.fill,
            child: SizedBox(
              width: sizingInfo.widgetSize.width,
              height: sizingInfo.widgetSize.height,
              child: VideoPlayer(_videoController),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }
}

class AnimatedVideoText extends StatelessWidget {
  final String text;
  final bool mobile;
  final AnimationController controller;
  final Animation<double> opacity;
  final Animation<double> scale;
  final Animation<double> rotation;
  AnimatedVideoText(
      {Key key,
      @required this.text,
      @required this.mobile,
      @required this.controller})
      : opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.8, 1),
          ),
        ),
        scale = Tween<double>(begin: 0.5, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 0.8, curve: Curves.bounceIn),
          ),
        ),
        rotation = Tween<double>(begin: 0, end: 3).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.2, 0.5, curve: Curves.easeInOut),
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: Center(
        child: CustomText(
          text: text,
          fSize: mobile ? 15 : 20,
        ),
      ),
      builder: (BuildContext context, Widget child) {
        return RotationTransition(
          turns: rotation,
          child: ScaleTransition(
            scale: scale,
            child: Container(
              decoration: BoxDecoration(
                color: Black.withOpacity(0.5),
                border: Border.all(color: Colors.white),
              ),
              padding: EdgeInsets.all(10),
              child: FadeTransition(opacity: opacity, child: child),
            ),
          ),
        );
      },
    );
  }
}
