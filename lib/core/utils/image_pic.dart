import 'package:asroo_store/core/di/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PickImageutils {
  factory PickImageutils() {
    return _instance;
  }
  const PickImageutils._();
  static const PickImageutils _instance = PickImageutils._();

  Future<XFile?> pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        //imageQuality: 50,
      );
      if (pickedFile != null) {
        return XFile(pickedFile.path);
      }
      return null;
    } catch (e) {
      final permissionStatus = await Permission.photos.status;

      if (permissionStatus.isDenied) {
        // show dialog to enable permission
        _showAlertPermissionsDialog();
      } else {
        debugPrint('Permission  image exception: $e');
      }
    }
  }

  Future<void> _showAlertPermissionsDialog() {
    return showCupertinoDialog(
        context: sl<GlobalKey<NavigatorState>>().currentState!.context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Permission Denied'),
            content: const Text(
                'Please enable permission to access the gallery and photos'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text('cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const CupertinoDialogAction(
                isDefaultAction: true,
                child: Text('Settings'),
                onPressed: openAppSettings,
              ),
            ],
          );
        });
  }
}
