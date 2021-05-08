import 'package:appme/constants/colors.dart';
import 'package:appme/ui/base_widget.dart';
import 'package:appme/utils/async_text.dart';
import 'package:appme/utils/video_loop.dart';
import 'package:appme/views/landing/landing_background.dart';
import 'package:flutter/material.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key key}) : super(key: key);

  @override
  _LandingViewState createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return SizedWidget(
      theBuilder: (context, sizingInformation) {
        double verticalPadd = sizingInformation.mobile ? 20 : 40;
        double horizontPadd = sizingInformation.mobile ? 40 : 100;
        return Stack(
          fit: StackFit.expand,
          children: [
            LandingBackground(),
            Opacity(
              opacity: 0.8,
              child: Container(color: Colors.black),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: verticalPadd,
                  horizontal: horizontPadd,
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: AsyncText(
                        fontSize: sizingInformation.mobile ? 14 : 20,
                        path: 'assets/info/appmeinfo.json',
                        mapKey: 'AppMe',
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SidedContainer(
                      childs: [],
                      child: VideoLoopContainer(
                        text:
                            'Creamos contenido interactivo 3D para un enganche de tu público',
                        doc: 'assets/blender.m4v',
                        height: sizingInformation.mobile ? 150 : 200,
                        width: sizingInformation.mobile ? 210 : 280,
                        mobile: sizingInformation.mobile,
                        controller: _controller,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SidedContainer(
                      begin: false,
                      childs: [],
                      child: VideoLoopContainer(
                        text:
                            'Creamos apps para tu negocio, gestiona tus finanzas, inventario o trabajadores desde tu celular',
                        doc: 'assets/coding.m4v',
                        height: sizingInformation.mobile ? 150 : 200,
                        width: sizingInformation.mobile ? 210 : 280,
                        mobile: sizingInformation.mobile,
                        controller: _controller,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SidedContainer(
                      childs: [],
                      child: VideoLoopContainer(
                        text:
                            'Diseño e imagen, convertimos tu idea en imagenes que transmiten lo que deseas',
                        doc: 'assets/design.m4v',
                        height: sizingInformation.mobile ? 150 : 200,
                        width: sizingInformation.mobile ? 210 : 280,
                        mobile: sizingInformation.mobile,
                        controller: _controller,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

/// A container that switchs the side of the content deppending on the position
/// in the list

class SidedContainer extends StatelessWidget {
  final Widget child;
  final bool begin;
  final List childs;
  const SidedContainer({
    Key key,
    this.child,
    this.childs,
    this.begin = true,
  }) : super(key: key);

  void setPlaces(bool atBegin) {
    childs.add(
      SizedBox(
        width: 10,
      ),
    );
    childs.add(child);
    if (atBegin) {
      childs.insert(1, childs.removeAt(0));
    }
  }

  @override
  Widget build(BuildContext context) {
    setPlaces(begin);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: childs,
    );
  }
}

class GrowingInfo extends StatelessWidget {
  final bool mobile;
  final AnimationController animation;
  final Animation<double> scale;
  GrowingInfo({Key key, @required this.mobile, @required this.animation})
      : scale = Tween<double>().animate(
          CurvedAnimation(
            parent: animation,
            curve: Interval(0.8, 1, curve: Curves.easeIn),
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: AsyncText(
          fontSize: mobile ? 14 : 20,
          path: 'assets/info/appmeinfo.json',
          mapKey: 'AppMe',
        ),
      ),
      builder: (BuildContext context, Widget child) {
        return ScaleTransition(
          scale: scale,
          child: child,
        );
      },
    );
  }
}
