import 'package:appme/constants/colors.dart';
import 'package:appme/services/jsonreader.dart';
import 'package:appme/services/locator.dart';
import 'package:appme/ui/base_widget.dart';
import 'package:appme/ui/ui_enum.dart';
import 'package:appme/utils/delayed_list_item.dart';
import 'package:flutter/material.dart';

class ResponsiveListCourses extends StatelessWidget {
  const ResponsiveListCourses({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
        future: locator<JsonReader>().jsonContent('assets/info/courses.json'),
        builder: (context, mapSnapshot) {
          if (mapSnapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.black,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (mapSnapshot.hasData) {
            Map data = mapSnapshot.data;
            return ArticlesBuilder(
              articles: data,
              mapKeys: data.keys.toList(),
            );
          } else if (mapSnapshot.hasError) {
            return Container(
              child: Text(
                mapSnapshot.error.toString(),
              ),
            );
          } else {
            return Container(
              child: Text('Something went wrong :('),
            );
          }
        });
  }
}

class ArticlesBuilder extends StatefulWidget {
  final Map<String, Map> articles;
  final List mapKeys;
  const ArticlesBuilder(
      {Key key, @required this.articles, @required this.mapKeys})
      : super(key: key);

  @override
  _ArticlesBuilderState createState() => _ArticlesBuilderState();
}

class _ArticlesBuilderState extends State<ArticlesBuilder>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return SizedWidget(
      theBuilder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.Mobile) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                height: 110,
                child: Center(
                  child: AnimatedCourseWidget(
                      controller: _controller,
                      details: widget.articles[widget.mapKeys[index]],
                      mobile: true),
                ),
              );
            },
            separatorBuilder: (c, i) => SizedBox(
              height: 10,
            ),
            itemCount: widget.mapKeys.length,
          );
        } else {
          return ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                height: 150,
                child: Center(
                  child: AnimatedCourseWidget(
                      controller: _controller,
                      details: widget.articles[widget.mapKeys[index]],
                      mobile: false),
                ),
              );
            },
            separatorBuilder: (c, i) => SizedBox(
              height: 10,
            ),
            itemCount: widget.mapKeys.length,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}

class CourseWidget extends StatelessWidget {
  final Map<String, String> details;
  final bool mobile;
  const CourseWidget({Key key, @required this.details, @required this.mobile})
      : super(key: key);

  static const List keys = [
    "Aprendizajes",
    "Requisitos",
    "Clase vía",
    "Edad recomendada"
  ];

  String assetPath(String asset, bool mobile) {
    String template = "assets/courses/";
    String path =
        mobile ? template + "${asset}350.png" : template + "${asset}500.png";
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mobile ? 110 : 150,
      decoration: BoxDecoration(
        color: AMTBlack,
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            assetPath(details['asset'], mobile),
            fit: BoxFit.cover,
            height: mobile ? 110 : 150,
            width: mobile ? 110 : 150,
          ),
          SizedBox(
            width: mobile ? 10 : 15,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: mobile ? 10 : 15,
                ),
                Center(
                  child: Text(
                    details['Nombre'],
                    style: TextStyle(
                        fontFamily: 'BioMonster',
                        fontSize: mobile ? 18 : 25,
                        color: Colors.amber),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: keys
                        .map(
                          (e) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              KeyText(
                                text: e + ": ",
                                fontSize: mobile ? 10 : 18,
                              ),
                              PropertieText(
                                text: details[e],
                                fontSize: mobile ? 10 : 18,
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class KeyText extends StatelessWidget {
  final String text;
  final double fontSize;
  const KeyText({Key key, @required this.text, @required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey[200],
        fontFamily: 'BronovaB',
        fontSize: fontSize,
      ),
    );
  }
}

class PropertieText extends StatelessWidget {
  final String text;
  final double fontSize;
  const PropertieText({Key key, @required this.text, @required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'BronovaR',
        fontSize: fontSize,
      ),
    );
  }
}

// class MobileArticlePreview extends StatelessWidget {
//   const MobileArticlePreview({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 150,
//       width: 150,
//       decoration: BoxDecoration(
//         color: AMTGrey,
//         borderRadius: BorderRadius.circular(25),
//       ),
//       clipBehavior: Clip.antiAlias,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             flex: 2,
//             child: Image.asset('assets/images/creativa.png', fit: BoxFit.cover),
//           ),
//           Expanded(
//             flex: 3,
//             child: Center(
//               child: Text(
//                   'Un Artículo acerca de los métodos que tenémos para el aprendizaje'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
