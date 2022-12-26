import 'package:call_api_with_x/app/controller/popular_controller.dart';
import 'package:call_api_with_x/app/data/api/api_client.dart';
import 'package:call_api_with_x/app/data/repository/popular_repo.dart';
import 'package:call_api_with_x/app/util/app_constant.dart';
import 'package:get/get.dart';

// step 1 create init
Future<void> iniit()async{

  // step 5 create a lazy put for api client, repo, controller
  Get.lazyPut(() => ApiClient(appBaseUrl:  AppConstant.BASE_URL));

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));

}