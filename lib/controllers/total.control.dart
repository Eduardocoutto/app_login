
import 'package:mobx/mobx.dart';

part 'total.control.g.dart';

class TotalControl = _TotalControl with _$TotalControl;


abstract class _TotalControl with Store{
  @observable
  double value = 0.0;

  @action
  void add(double val){
    value += val;
  }

  @action
  void remove(double val){
    value -= val;
  }

  @action
  void reset(){
    value = 0;
  }
}