import 'package:bloc/bloc.dart';
import 'package:travelo/cubit/app_cubit_states.dart';
import 'package:travelo/model/data_model.dart';
import 'package:travelo/pages/detail_page.dart';
import 'package:travelo/services/data_services.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;

  Future<void> getData() async {
    try{
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    }catch(e){

    }
  }
   DetailPage(DataModel data){
    emit(DetailState(data));
   }

   goBack(){
    emit(LoadedState(places));
   }

}