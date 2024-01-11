import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'details_page_state.dart';

class DetailsPageCubit extends Cubit<DetailsPageState> {
  DetailsPageCubit() : super(DetailsPageInitial());
}
