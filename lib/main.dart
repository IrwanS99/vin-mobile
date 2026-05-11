import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/theme/app_colors.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.darkNavy,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.darkNavy,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const VINDecoderApp());
}

class VINDecoderApp extends StatelessWidget {
  const VINDecoderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'VIN Decoder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.darkNavy,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.royalBlue,
          brightness: Brightness.dark,
        ),
      ),
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
    );
  }
}