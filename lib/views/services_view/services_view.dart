import 'package:appme/constants/constants.dart';
import 'package:appme/locator_services/cloud_service/cloud_service.dart';
import 'package:appme/locator_services/locator.dart';
import 'package:appme/ui/base_widget.dart';
import 'package:appme/utils/async_list.dart';
import 'package:appme/utils/async_text.dart';
import 'package:flutter/material.dart';

class ViewTwo extends StatelessWidget {
  const ViewTwo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Black.withOpacity(0.9),
      ),
      child: SizedWidget(
        theBuilder: (context, sizeInfo) {
          double vertPad = sizeInfo.mobile ? 20 : 40;
          double horiPad = sizeInfo.mobile ? 10 : 60;
          locator<Cloud>().addEvent('servicios', sizeInfo.mobile.toString());
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: vertPad,
                horizontal: horiPad,
              ),
              child: Column(
                children: [
                  AsyncText(
                    path: 'assets/info/appmeinfo.json',
                    mapKey: 'AppMe2',
                    fontSize: sizeInfo.mobile ? 16 : 22,
                  ),
                  SizedBox(
                    height: sizeInfo.mobile ? 80 : 30,
                  ),
                  AsyncList(
                    path: 'assets/info/appmeinfo.json',
                    mapKey: 'ServiciosList',
                    fontSize: sizeInfo.mobile ? 16 : 22,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// class ViewingStorage extends StatelessWidget {
//   const ViewingStorage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [

//       ],
//     );
//   }
// }

// class ImageViewer extends StatelessWidget {
//   const ImageViewer({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: locator<StorageService>()
//           .storage
//           .ref('assets/blender_shot.m4v')
//           .getDownloadURL(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Center(
//             child: Container(
//               color: Colors.black,
//               child: Text(
//                 'Ocurrió un error al hacer la petición',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontFamily: 'BronovaB',
//                   fontSize: 25,
//                 ),
//               ),
//             ),
//           );
//         } else if (snapshot.hasData) {
//           return Container(
//             color: Colors.black,
//             child: BackgroundVideo(
//               url: snapshot.data,
//             ),
//           );
//         } else {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }
// }
