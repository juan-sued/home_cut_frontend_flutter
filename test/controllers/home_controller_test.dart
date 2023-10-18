import 'package:flutter_test/flutter_test.dart';
import 'package:home_cut/src/models/event_model.dart';
import 'package:home_cut/src/services/event_service.dart';

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
