import 'package:asroo_store/core/service/graphql/api_result.dart';
import 'package:asroo_store/core/utils/app_strings.dart';
import 'package:asroo_store/features/admin/dashboard/data/data_source/dashboard_data_source.dart';
import 'package:asroo_store/features/admin/dashboard/data/models/catagories_number_response.dart';
import 'package:asroo_store/features/admin/dashboard/data/models/products_number_response.dart';
import 'package:asroo_store/features/admin/dashboard/data/models/users_number_response.dart';

class DashBoardRepo {
  const DashBoardRepo(this._dataSource);

  final DashBoardDataSource _dataSource;

  // Get Numbers Of Products
  Future<ApiResult<ProductsNumberResponse>> numberOfProducts() async {
    try {
      final response = await _dataSource.numberOfProducts();
      return ApiResult.success(response);
    } catch (error) {
      return const ApiResult.failure(errorMessage);
    }
  }

  // Get Numbers Of Categories
  Future<ApiResult<CategoriesNumberResponse>> numberOfCategories() async {
    try {
      final response = await _dataSource.numberOfCategories();
      return ApiResult.success(response);
    } catch (error) {
      return const ApiResult.failure(errorMessage);
    }
  }

  // Get Numbers Of users
  Future<ApiResult<UsersNumberResponse>> numberOfUsers() async {
    try {
      final response = await _dataSource.numberOfUsers();
      return ApiResult.success(response);
    } catch (error) {
      return const ApiResult.failure(errorMessage);
    }
  }
}