import 'package:ForDev/data/usecases/usecases.dart';
import 'package:ForDev/infra/http/http.dart';
import 'package:ForDev/presentation/presenters/stream_login_presenter.dart';
import 'package:ForDev/validation/validators/email_validation.dart';
import 'package:ForDev/validation/validators/required_field_validation.dart';
import 'package:ForDev/validation/validators/validation_composite.dart';
import 'package:flutter/material.dart';

import 'package:ForDev/ui/pages/pages.dart';
import 'package:http/http.dart';

Widget makeLoginPage() {
  final url = 'https://fordevs.herokuapp.com/api/login';
  final client = Client();
  final httpAdapter = HttpAdatper(client);
  final remoteAuthentication =
      RemoteAuthentication(httpClient: httpAdapter, url: url);
  final validationComposite = ValidationComposite([
    RequiredFieldValidation('email'),
    EmailValidation('email'),
    RequiredFieldValidation('password'),
  ]);
  final streamLoginPresenter = StreamLoginPresenter(
    authentication: remoteAuthentication,
    validation: validationComposite,
  );
  return LoginPage(streamLoginPresenter);
}
