import 'package:aksara/aksara.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KonversiBloc extends Bloc<void, void>{
  var _aksara = AksaraJava();

  @override
  KonversiBloc get initialState => KonversiBloc();

  @override
  Stream<void> mapEventToState(void event) async* {
    bool isFirstTime = await getIsFirstTime();
    if(isFirstTime){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("IS_MURDHA", false);
      await prefs.setBool("IS_COPAS", true);
      await prefs.setBool("IS_SPASI", false);
      await prefs.setBool("IS_FIRST_TIME", false);
    }
  }

  Future<bool> getIsMurdha() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool b = (prefs.getBool('IS_MURDHA') ?? false);
    return b;
  }

  Future<bool> getIsUsingE() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool b = (prefs.getBool('IS_COPAS') ?? true);
    return b;
  }

  Future<bool> getIsSpasi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool b = (prefs.getBool('IS_SPASI') ?? false);
    return b;
  }

  Future<bool> getIsFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool b = (prefs.getBool('IS_FIRST_TIME') ?? true);
    return b;
  }
}