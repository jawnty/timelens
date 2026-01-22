import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class GeminiService {
  // API key passed via --dart-define=GEMINI_API_KEY=xxx at build time
  static const String _apiKey = String.fromEnvironment('GEMINI_API_KEY');
  static const String _model = 'gemini-3-pro-image-preview';
  static const String _baseUrl = 'https://generativelanguage.googleapis.com/v1beta/models';

  Future<Uint8List?> transformImage({
    required Uint8List imageBytes,
    required String prompt,
  }) async {
    try {
      final base64Image = base64Encode(imageBytes);

      final url = Uri.parse('$_baseUrl/$_model:generateContent?key=$_apiKey');

      final requestBody = {
        'contents': [
          {
            'parts': [
              {
                'inline_data': {
                  'mime_type': 'image/jpeg',
                  'data': base64Image,
                }
              },
              {
                'text': prompt,
              }
            ]
          }
        ],
        'generationConfig': {
          'responseModalities': ['image', 'text'],
          'imageConfig': {
            'imageSize': '2K',
          },
        }
      };

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        // Extract the image from the response
        final candidates = jsonResponse['candidates'] as List?;
        if (candidates != null && candidates.isNotEmpty) {
          final content = candidates[0]['content'];
          final parts = content['parts'] as List?;

          if (parts != null) {
            for (var part in parts) {
              if (part['inlineData'] != null) {
                final imageData = part['inlineData']['data'] as String;
                return base64Decode(imageData);
              }
            }
          }
        }

        debugPrint('No image found in response');
        return null;
      } else {
        debugPrint('API Error: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('Error transforming image: $e');
      return null;
    }
  }
}
