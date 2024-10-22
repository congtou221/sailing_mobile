import 'dart:io';
import 'dart:ui';

import 'package:archive/archive.dart';
import 'package:camera/camera.dart';
import 'dart:async' show Future;
import 'dart:isolate'
    show
        Isolate,
        IsolateNameServer,
        MessageSink,
        Port,
        RawReceivePort,
        RawSendPort,
        SendPort;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
// import 'package:keframe/frame_separate_widget.dart';
// import 'package:keframe/size_cache_widget.dart';

bool isDarkMode() {
  final brightness = SchedulerBinding.instance.window.platformBrightness;
  return brightness == Brightness.dark;
}

/// Navigates to a new page with a right-to-left slide transition.
///
/// Parameters:
/// - context: The BuildContext from which the navigation is initiated.
/// - pageBuilder: A function that builds the page to be navigated to.
/// - duration: The duration of the transition animation.
void navigateWithSlideTransition(BuildContext context, Widget page,
    [Duration duration = const Duration(milliseconds: 50)]) async {
  const begin = Offset(1.0, 0.0);
  const end = Offset.zero;
  final tween = Tween(begin: begin, end: end);
  // final offsetAnimation = await _computeOffsetAnimation(tween, duration);

  Navigator.push(
    context,
    (PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: duration,
    )),
  );
}

// Future<Animation<Offset>> _computeOffsetAnimation(
//     Tween<Offset> tween, Duration duration) async {
//   final receivePort = RawReceivePort();
//   final sendPort = IsolateNameServer.registerPortWithName(
//       receivePort.sendPort, 'offsetAnimationPort');

//   receivePort.handler = (message) {
//     final result = message as Animation<Offset>;
//     IsolateNameServer.removePortNameMapping('offsetAnimationPort');
//     receivePort.close();
//     sendPort.close();
//     return result;
//   };

//   Isolate.run(RunOptions(eagerEvaluation: true), _computeOffsetInIsolate,
//       [tween, duration]);

//   return await receivePort.first as Animation<Offset>;
// }

// void _computeOffsetInIsolate(SendPort sendPort, List<dynamic> args) {
//   final tween = args[0] as Tween<Offset>;
//   final duration = args[1] as Duration;

//   final controller = AnimationController(
//     duration: duration,
//     vsync: NoVSync(),
//   );

//   final offsetAnimation = controller.drive(tween);

//   controller.forward();

//   sendPort.send(offsetAnimation);
// }

Future<File> zipImages(List<XFile> imageFiles) async {
  final archive = Archive();

  Future.forEach(imageFiles, (imageFile) {
    final file = File(imageFile.path);
    final bytes = file.readAsBytesSync();
    final archiveFile = ArchiveFile(imageFile.name, bytes.length, bytes);
    archive.addFile(archiveFile);
  });

  final zipEncoder = ZipEncoder();

  final encodedArchive = zipEncoder.encode(archive);

  if (encodedArchive == null) return File('');

  final File zipFile = File(
      '${Directory.systemTemp.path}/images_${DateTime.now().millisecondsSinceEpoch}.zip');

  zipFile.writeAsBytesSync(encodedArchive);

  return zipFile;
}

deleteFiles(List<XFile> imageFiles) async {
  for (var imageFile in imageFiles) {
    final file = File(imageFile.path);
    if (await file.exists()) {
      await file.delete();
    } else {
      print('File does not exist.');
    }
  }
}
