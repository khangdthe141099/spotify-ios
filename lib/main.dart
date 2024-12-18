import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projects/core/configs/theme/app_theme.dart';
import 'package:projects/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:projects/presentation/splash/pages/splash.dart';
import 'package:projects/service_locator.dart';
import 'firebase_options.dart';

//Setting hydrated bloc:
Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  //Initialize splash:
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Initialize firebase:
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //Initialize dependency:
  await initializeDependencies();

  runApp(const MyApp());

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (_) => ThemeCubit())],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, mode) => MaterialApp(
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: mode,
                  debugShowCheckedModeBanner: false,
                  home: const SplashPage(),
                )));
  }
}
