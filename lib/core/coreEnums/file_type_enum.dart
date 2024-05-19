import 'package:mime/mime.dart';

enum FileTypeEnum { image, file }

FileTypeEnum fileType(String path) {
  String mimeStr = lookupMimeType(path)!;
  var fileType = mimeStr.split('/');
  if (fileType[0] == "image") {
    return FileTypeEnum.image;
  } else {
    return FileTypeEnum.file;
  }
}
