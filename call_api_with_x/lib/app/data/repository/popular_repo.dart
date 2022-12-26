import 'package:call_api_with_x/app/data/api/api_client.dart';
import 'package:call_api_with_x/app/util/app_constant.dart';
import 'package:get/get.dart';

// class PopularProductRepo extends GetxService {
//   final ApiClient apiClient;
//   PopularProductRepo({required this.apiClient});

//   Future<Response> getPopularProductList()async{
//     return await apiClient.getData(AppConstant.popularFoodUri);
//   }
// }

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response>getPopularProductList()async{
    return await apiClient.getData(AppConstant.POPULAR_PRODUCT_URI);
  }
}