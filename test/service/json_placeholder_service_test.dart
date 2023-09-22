import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:home_cut/service/http_client_interface.dart';
import 'package:home_cut/service/json_placeholder_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uno/uno.dart';

class UnoMock extends Mock implements Uno {}

class IHttpClientMock extends Mock implements IHttpClient {}

void main() {
  test('Deve retornar todos os eventos', () async {
    final client = IHttpClientMock();

    when(() => client.get(any()))
        .thenAnswer((_) async => jsonDecode(jsonReponse));

    final service = EventService(client);

    final events = await service.getEvents();

    print(events[0].title);

    expect(events[0].title, 'Goldi');
  });
}

const jsonReponse =
    r'''
[
  {
    "id": {
      "$oid": "650ca9b9b69101883bf06dd2"
    },
    "title": "Goldi",
    "description": "Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.",
    "from": "2023-08-21T13:18:22Z",
    "to": "2023-02-13T00:25:47Z",
    "isAllDay": true,
    "backgroundColor": "#8c4ed2",
    "idClient": {
      "$oid": "650ca9b9b69101883bf06dd3"
    }
  },
  {
    "id": {
      "$oid": "650ca9b9b69101883bf06dd4"
    },
    "title": "Vlad",
    "description": "Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.",
    "from": "2023-08-25T13:43:50Z",
    "to": "2022-11-23T03:18:42Z",
    "isAllDay": true,
    "backgroundColor": "#b5d275",
    "idClient": {
      "$oid": "650ca9b9b69101883bf06dd5"
    }
  },
  {
    "id": {
      "$oid": "650ca9b9b69101883bf06dd6"
    },
    "title": "Lynnett",
    "description": "Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.",
    "from": "2023-07-06T12:02:24Z",
    "to": "2022-09-30T20:29:28Z",
    "isAllDay": false,
    "backgroundColor": "#7be233",
    "idClient": {
      "$oid": "650ca9b9b69101883bf06dd7"
    }
  },
  {
    "id": {
      "$oid": "650ca9b9b69101883bf06dd8"
    },
    "title": "Gerhardine",
    "description": null,
    "from": "2022-09-20T10:40:21Z",
    "to": "2022-11-27T03:51:19Z",
    "isAllDay": false,
    "backgroundColor": "#43cc33",
    "idClient": {
      "$oid": "650ca9b9b69101883bf06dd9"
    }
  },
  {
    "id": {
      "$oid": "650ca9b9b69101883bf06dda"
    },
    "title": "Sawyer",
    "description": "Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.",
    "from": "2023-02-23T05:35:05Z",
    "to": "2023-05-04T12:29:37Z",
    "isAllDay": false,
    "backgroundColor": "#c5ad3d",
    "idClient": {
      "$oid": "650ca9b9b69101883bf06ddb"
    }
  },
  {
    "id": {
      "$oid": "650ca9b9b69101883bf06ddc"
    },
    "title": "Parry",
    "description": "Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.",
    "from": "2023-06-25T19:57:36Z",
    "to": "2023-07-31T23:04:49Z",
    "isAllDay": false,
    "backgroundColor": "#ad010e",
    "idClient": {
      "$oid": "650ca9b9b69101883bf06ddd"
    }
  },
  {
    "id": {
      "$oid": "650ca9b9b69101883bf06dde"
    },
    "title": "Linn",
    "description": "In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.",
    "from": "2023-05-11T10:54:08Z",
    "to": "2023-03-03T11:56:02Z",
    "isAllDay": false,
    "backgroundColor": "#a23bbd",
    "idClient": {
      "$oid": "650ca9b9b69101883bf06ddf"
    }
  },
  {
    "id": {
      "$oid": "650ca9b9b69101883bf06de0"
    },
    "title": "Staffard",
    "description": "In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.",
    "from": "2022-10-06T19:15:22Z",
    "to": "2022-09-29T15:07:38Z",
    "isAllDay": false,
    "backgroundColor": "#9c535a",
    "idClient": {
      "$oid": "650ca9b9b69101883bf06de1"
    }
  },
  {
    "id": {
      "$oid": "650ca9b9b69101883bf06de2"
    },
    "title": "Beatrix",
    "description": null,
    "from": "2023-06-29T20:21:11Z",
    "to": "2022-10-13T06:48:35Z",
    "isAllDay": true,
    "backgroundColor": "#e0fd2d",
    "idClient": {
      "$oid": "650ca9b9b69101883bf06de3"
    }
  },
  {
    "id": {
      "$oid": "650ca9b9b69101883bf06de4"
    },
    "title": "Rebeka",
    "description": "In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.",
    "from": "2023-02-21T04:20:53Z",
    "to": "2023-03-26T22:06:39Z",
    "isAllDay": false,
    "backgroundColor": "#042247",
    "idClient": {
      "$oid": "650ca9b9b69101883bf06de5"
    }
  }
]
 ''';
