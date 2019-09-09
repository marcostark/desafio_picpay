import 'package:desafio_picpay/src/shared/models/users.dart';
import 'package:desafio_picpay/src/shared/repositories/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {

  //  final SpeakerViewModel speakerViewModel = SpeakerViewModel();
  // final speakerController = StreamController<List<Speaker>>();
  // Stream<List<Speaker>> get speakerItems => speakerController.stream;

  //  SpeakerBloc() {
  //   speakerController.add(speakerViewModel.getSpeakers());
//   // }

  final UserRepository _repository = UserRepository();
  final BehaviorSubject<UserResponse> _subject = BehaviorSubject<UserResponse>();

  getSpeaker() async {
    UserResponse response = await _repository.fetchUsers();
    _subject.sink.add(response);
  }

  dispose(){
    _subject.close();
  }

  BehaviorSubject<UserResponse> get subject => _subject;

}

 final bloc = UserBloc();

