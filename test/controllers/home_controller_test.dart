import 'package:flutter_test/flutter_test.dart';
import 'package:home_cut/controllers/home_controller.dart';
import 'package:home_cut/model/event_model.dart';
import 'package:home_cut/service/json_placeholder_service.dart';
import 'package:mocktail/mocktail.dart';

class JsonPlaceholderMock extends Mock implements EventService {}

void main() {
  test('Deve pegar todos os eventos', () async {
    final service = JsonPlaceholderMock();
    when(() => service.getEvents())
        .thenAnswer((_) async => [EventModel.stub()]);
    final controller = HomeController(service);
    await controller.getAllEvents();
    expect(controller.events.length, 1);
  });
}
