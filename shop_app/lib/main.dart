import 'package:shop_app/shared/export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("cart_box");
  await Hive.openBox("fav_box");

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainScreenNotifier(),),
        ChangeNotifierProvider(create: (context) => ProductNotifier(),),
        ChangeNotifierProvider(create: (context) => FavoritesNotifier(),),
        ChangeNotifierProvider(create: (context) => CartProvider(),)
      ],
      child: (const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Online Shop App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MainScreen(),
        );
      },
    );
  }
}
