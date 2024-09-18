import 'dart:io';

import 'package:archive/archive.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
    [Duration duration = const Duration(milliseconds: 200)]) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: duration,
    ),
  );
}

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
