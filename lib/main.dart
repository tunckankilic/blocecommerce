import 'package:blocecommerce/blocs/blocs.dart';
import 'package:blocecommerce/config/configs.dart';
import 'package:blocecommerce/firebase_options.dart';
import 'package:blocecommerce/repositories/category/category_repository.dart';
import 'package:blocecommerce/repositories/checkout/checkout_repository.dart';
import 'package:blocecommerce/repositories/product/product_repository.dart';
import 'package:blocecommerce/screens/screens.dart';
import 'package:blocecommerce/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartBloc()
            ..add(
              LoadCart(),
            ),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(LoadCategories()),
        ),
        BlocProvider(
          create: (context) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(LoadProducts()),
        ),
        BlocProvider(
          create: (context) => WishlistBloc()
            ..add(
              StartWishlist(),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'Zero To Unicorn',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: CheckoutScreen.routeName,
      ),
    );
  }
}