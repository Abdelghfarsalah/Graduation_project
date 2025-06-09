import 'package:flutter/material.dart';

Icon getIconForType(String type, {double size = 20}) {
  switch (type) {
    case 'single_video':
      return Icon(Icons.play_circle_fill, color: Colors.redAccent, size: size);
    case 'course':
      return Icon(Icons.school, color: Colors.indigo, size: size);
    case 'documentation':
      return Icon(Icons.description, color: Colors.blueGrey, size: size);
    case 'pdf':
      return Icon(Icons.picture_as_pdf, color: Colors.deepOrange, size: size);
    case 'book':
      return Icon(Icons.menu_book, color: Colors.brown, size: size);
    case 'tutorial':
      return Icon(Icons.list_alt, color: Colors.teal, size: size);
    case 'practice':
      return Icon(Icons.code, color: Colors.purple, size: size);
    case 'project':
      return Icon(Icons.build, color: Colors.green, size: size);
    case 'article':
      return Icon(Icons.article, color: Colors.blue, size: size);
    case 'tool':
      return Icon(Icons.settings, color: Colors.grey, size: size);
    default:
      return Icon(Icons.help_outline, color: Colors.black38, size: size);
  }
}
