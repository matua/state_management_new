import 'package:redux/redux.dart';
import 'package:state_management/business/state/cart_state.dart';

final Store<CartState> store =
    Store<CartState>(reducer, initialState: CartState.initialState());
