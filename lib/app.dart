import 'package:chapter_12/ui/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'network/network_services/api_service.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Provider<ApiService>(
        create: (BuildContext context) => ApiService.create(),
        dispose: (_, ApiService service) => service.client.dispose(),
        child: Home(),
      ),
    );
  }
}
