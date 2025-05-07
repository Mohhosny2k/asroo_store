import '../data_source/upload_image_data_source.dart';
import '../model/upload_image_response.dart';
import '../../../service/graphql/api_result.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageRepo {
  const UploadImageRepo(this._dataSource);
  final UploadImageDataSource _dataSource;

  Future<ApiResult<UploadImageResourse>> uploadImage(XFile imageFile) async {
    try {
      final response = await _dataSource.uploadImage(imageFile: imageFile);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure('Please try again we have error');//e.toString()
    }
  }
}
