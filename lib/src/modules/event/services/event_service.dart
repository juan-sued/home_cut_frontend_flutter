import 'package:home_cut/src/modules/event/models/event_model.dart';
import 'package:home_cut/src/modules/event/services/http_client_interface.dart';

const url = 'https://my.api.mockaroo.com/events.json?key=bb2d01e0';

class EventService {
  final IHttpClient client;

  EventService(this.client);

  Future<List<EventModel>> getEvents() async {
    final body = await client.get(url);
    return (body as List).map((event) => EventModel.fromJson(event)).toList();
  }
}
