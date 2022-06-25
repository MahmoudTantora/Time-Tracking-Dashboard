import 'package:get_it/get_it.dart';
import 'package:time_tracking_dashboard/data/core/api_client.dart';
import 'package:time_tracking_dashboard/data/data_sources/remote_data_sources/dashboard_remote_data_source.dart';
import 'package:time_tracking_dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:time_tracking_dashboard/domain/repositories/dashboard_repositories.dart';
import 'package:time_tracking_dashboard/domain/usecases/fetch_time_tracking_data.dart';
import 'package:time_tracking_dashboard/presentation/blocs/choose_time_period/choose_time_period_cubit.dart';
import 'package:time_tracking_dashboard/presentation/blocs/fetch_time_tracking/fetch_time_tracking_cubit.dart';

final getItInstance = GetIt.I;

Future init() async {
  ///LIBRARY
  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient());

  // DATA SOURCES
  getItInstance.registerFactory<DashboardRemoteDataSource>(
      () => DashboardRemoteDataSourceImpl(apiClient: getItInstance()));

  //REPOSITORIES
  getItInstance.registerFactory<DashboardRepository>(() =>
      DashboardRepositoryImpl(dashboardRemoteDataSource: getItInstance()));

  //USE CASES
  getItInstance.registerFactory(() => FetchTimeTrackingData(getItInstance()));

  //BLOCS
  getItInstance.registerSingleton(
      FetchTimeTrackingCubit(fetchTimeTrackingData: getItInstance()));
  getItInstance.registerSingleton(ChooseTimePeriodCubit());
}
