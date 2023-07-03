import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:seller/features/admin/data/model/product_model.dart';
import 'package:seller/features/admin/presentation/views/widgets/category.dart';
import 'package:seller/features/admin/presentation/views/widgets/edit_loading.dart';
import 'package:seller/features/cart/data/model/user_model/user_model.dart';
import 'package:seller/features/cart/presentation/views/widgets/loading_delete.dart';
import 'package:seller/features/login/presentation/views/login_screen.dart';
import 'package:seller/features/new_products/presentation/views/new_products_screen.dart';
import 'package:seller/features/new_products/presentation/views/widgets/loading_screen.dart';
import '../../features/admin/presentation/views/edite_screen.dart';
import '../../features/cart/presentation/manger/order_cubit/order_screen_cubit.dart';
import '../../features/cart/presentation/views/order_screen.dart';
import '../../features/cart/presentation/views/pre_pare.dart';
import '../../features/cart/presentation/views/widgets/order_bottom_sheet.dart';
import '../../features/home/presentation/views/home_screen.dart';
import '../../features/new_products/presentation/manger/add_data_cubit/add_data_cubit.dart';
import '../../features/admin/presentation/manger/admin_screen_cubit/admin_screen_cubit.dart';
import '../../features/admin/presentation/manger/edit_cubit/edit_screen_cubit.dart';
import '../../features/admin/presentation/views/admin_screen_view.dart';
import '../../features/login/presentation/manger/cubit/login_cubit.dart';
import '../../main.dart';

abstract class AppRouter {
  static const adminScreen = '/adminScreen';
  static const loginScreen = '/loginScreen';
  static const editScreen = '/editScreen';
  static const newProductScreen = '/newProductScreen';
  static const orderScreen = '/orderScreen';
  static const homeScreen = '/homeScreen';
  static const loadingScreen = '/loadingScreen';
  static const editLoadingScreen = '/editLoadingScreen';
  static const categoryScreen = '/categoryScreen';
  static const prepareOrderScreen = '/prepareOrderScreen';
  static const loadingDeleteScreen = '/loadingDeleteScreen';
  static const showOrderBottomScreen = '/showOrderBottomScreen';

  static final router = GoRouter(
    initialLocation: /*homeScreen */ initialRoute,
    routes: [
      GoRoute(
        path: homeScreen,
        builder: (context, state) => const AdminHomeScreen(),
      ),
      GoRoute(
        path: showOrderBottomScreen,
        builder: (context, state) => ShowOrderBottomScreen(
          user: state.extra as UserModel,
        ),
      ),
      GoRoute(
        path: editLoadingScreen,
        builder: (context, state) => const EditLoading(),
      ),
      GoRoute(
        path: loadingDeleteScreen,
        builder: (context, state) => LoadindDelete(
          user: state.extra as UserModel,
        ),
      ),
      GoRoute(
        path: prepareOrderScreen,
        builder: (context, state) => const PrePareOrder(),
      ),
      GoRoute(
        path: loadingScreen,
        builder: (context, state) => const LoadingScreen(),
      ),
      GoRoute(
        path: adminScreen,
        builder: (context, state) => const AdminScreenView(),
      ),
      GoRoute(
        path: loginScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LoginCubit(),
            ),
          ],
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: newProductScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AddDataCubit(),
            ),
          ],
          child: const NewProductScreenView(),
        ),
      ),
      GoRoute(
        path: editScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => EditScreenCubit(),
            ),
          ],
          child: EditScreen(
            product: state.extra as ProductModel,
          ),
        ),
      ),
      GoRoute(
        path: categoryScreen,
        builder: (context, state) => BlocProvider<AdminScreenCubit>(
          create: (context) => AdminScreenCubit(),
          child: CategortScreen(
            categoryName: state.extra as String,
          ),
        ),
      ),
      GoRoute(
        path: orderScreen,
        builder: (context, state) => const OrderScreen(),
      ),
    ],
  );
}
