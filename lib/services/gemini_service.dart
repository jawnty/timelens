import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class GeminiService {
  // API key passed via --dart-define=GEMINI_API_KEY=xxx at build time
  static const String _apiKey = String.fromEnvironment('GEMINI_API_KEY');
  static const String _model = 'gemini-3-pro-image-preview';
  static const String _baseUrl = 'https://generativelanguage.googleapis.com/v1beta/models';

  String _detectMimeType(Uint8List bytes) {
    if (bytes.length >= 3 &&
        bytes[0] == 0xFF &&
        bytes[1] == 0xD8 &&
        bytes[2] == 0xFF) {
      return 'image/jpeg';
    }
    if (bytes.length >= 4 &&
        bytes[0] == 0x89 &&
        bytes[1] == 0x50 &&
        bytes[2] == 0x4E &&
        bytes[3] == 0x47) {
      return 'image/png';
    }
    if (bytes.length >= 4 &&
        bytes[0] == 0x52 &&
        bytes[1] == 0x49 &&
        bytes[2] == 0x46 &&
        bytes[3] == 0x46) {
      return 'image/webp';
    }
    // Default to JPEG if unknown
    return 'image/jpeg';
  }

  Future<Uint8List?> transformImage({
    required Uint8List imageBytes,
    required String prompt,
  }) async {
    try {
      final base64Image = base64Encode(imageBytes);
      final mimeType = _detectMimeType(imageBytes);

      final url = Uri.parse('$_baseUrl/$_model:generateContent?key=$_apiKey');

      final requestBody = {
        'contents': [
          {
            'parts': [
              {
                'inline_data': {
                  'mime_type': mimeType,
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
