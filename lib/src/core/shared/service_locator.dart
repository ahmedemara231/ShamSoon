import 'package:get_it/get_it.dart';
import 'package:shamsoon/src/features/auth/data/data_source/auth_data_source.dart';
import 'package:shamsoon/src/features/auth/data/repo/auth_repo.dart';
import 'package:shamsoon/src/features/auth/presentation/bloc/auth_cubit.dart';
import '../../features/home/blocs/home/cubit.dart';
import '../../features/home/data_source/home_impl.dart';
import '../../features/home/repositories/get.dart';
import '../data_source/remote/api_service/service/dio_connection.dart';

class ServiceLocator{
  final _getIt = GetIt.instance;

  void setUpBlocs(){
    _getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(
        HomeGetRepo(
            HomeDataSourceImpl(
                DioConnection.getInstance(),
            )
        ),));
    _getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(
        AuthRepo(
            AuthDataSource(
                DioConnection.getInstance()
            )
        )
    ));
  }
}