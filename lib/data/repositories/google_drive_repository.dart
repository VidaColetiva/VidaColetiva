import 'dart:io' as io;

import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis/storage/v1.dart';
import 'package:vidacoletiva/utils/authenticated_client.dart';

class GoogleDriveRepository {
  late drive.DriveApi driveApi;

  GoogleDriveRepository(AuthenticatedClient client) {
    driveApi = drive.DriveApi(client);
  }

  Future createFolder(String name) async {
    drive.File file = drive.File(
      name: name,
      mimeType: "application/vnd.google-apps.folder",
    );
    file.parents = [];

    await driveApi.files.create(file);
  }

  Future uploadFile(io.File file) async {
    drive.File driveFile = drive.File(
      name: "backup-${DateTime.now()}"
    );
    await driveApi.files.create(driveFile, 
      uploadMedia: Media(file.openRead(), await file.length()),

    );
  }
}