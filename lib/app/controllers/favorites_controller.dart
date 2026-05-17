import 'package:get/get.dart';
import '../routes/app_routes.dart';

class FavoritesController extends GetxController {
  final RxList<Map<String, dynamic>> favorites = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    favorites.value = [
      {
        'id': '1',
        'name': 'BMW 3 Series',
        'vin': 'WBA3A5G59DNP26082',
        'year': '2013',
        'country': 'Germany',
        'type': 'Passenger Car',
        'image': 'assets/bmw.png',
      },
      {
        'id': '2',
        'name': 'Honda Civic Sedan',
        'vin': '1HGBH41JXMN109186',
        'year': '2021',
        'country': 'United States',
        'type': 'Passenger Car',
        'image': 'assets/civic.png',
      },
      {
        'id': '3',
        'name': 'Toyota Corolla',
        'vin': '2T1BURHE0JC043821',
        'year': '2018',
        'country': 'Japan',
        'type': 'Passenger Car',
        'image': 'assets/corolla.png',
      },
    ];
  }

  void removeFavorite(String id) {
    favorites.removeWhere((item) => item['id'] == id);
    Get.snackbar(
      'Removed from favorites',
      'Vehicle has been removed from your favorites',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void onVehicleTap(String id) {
    final vehicle = favorites.firstWhere((v) => v['id'] == id);
    Get.toNamed(
      AppRoutes.detail,
      arguments: {
        'title': vehicle['name'],
        'vin': vehicle['vin'],
        'year': vehicle['year'],
        'country': vehicle['country'],
        'vehicleType': vehicle['type'],
        'image': vehicle['image'],
      },
    );
  }

  void onDecodeVin() {
    Get.offNamed(AppRoutes.home);
  }
}