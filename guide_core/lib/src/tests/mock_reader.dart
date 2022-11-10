import 'dart:io';

String mockReader(String name) => File('./test/mocks/$name').readAsStringSync();
