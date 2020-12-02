import 'package:aksara/aksara.dart';
import 'package:aksaraapp/konversi_event.dart';
import 'package:aksaraapp/konversi_state.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KonversiBloc extends Bloc<KonversiEvent, KonversiState>{
  var _aksara = AksaraJava();
  final TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();

  @override
  KonversiState get initialState => AksaraInitState();

  @override
  Stream<KonversiState> mapEventToState(KonversiEvent event) async* {
    bool isFirstTime = await getIsFirstTime();
    if(isFirstTime){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("IS_MURDHA", false);
      await prefs.setBool("IS_COPAS", true);
      await prefs.setBool("IS_SPASI", false);
      await prefs.setBool("IS_FIRST_TIME", false);
    }

    if(event is AksaraToLatin){
      String s = _aksara.javaToLatin(event.s);
      yield AksaraLoadedState(domainText: event.s, targetText: s, isFromFile: false);
    }else if(event is LatinToAksara){
      bool isMurdha = await getIsMurdha();
      bool isSpasi = await getIsSpasi();
      bool isCopas = await getIsUsingE();
      String s = _aksara.latinToJava(event.s, isCopas: isCopas, isSpasi: isSpasi, isMurdha: isMurdha);
      yield AksaraLoadedState(domainText: event.s, targetText: s, isFromFile: false);
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