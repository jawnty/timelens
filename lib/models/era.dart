class Era {
  final int position;
  final String year;
  final String name;
  final String description;
  final String thumbnailPath;
  final String photographyStyle;
  final String clothingTransform;
  final String hairTransform;
  final String environmentTransform;

  const Era({
    required this.position,
    required this.year,
    required this.name,
    required this.description,
    required this.thumbnailPath,
    required this.photographyStyle,
    required this.clothingTransform,
    required this.hairTransform,
    required this.environmentTransform,
  });

  String get prompt => '''### ROLE
Act as a Precision Historical Image Editor. Your goal is to perform a semantic "restyling" of the provided image while maintaining 100% pixel-level facial identity.

### PHASE 1: VISUAL ANALYSIS & ANCHORING
1. Identify all human and animal faces in the source image.
2. These faces are your "Static Anchors."
3. You MUST lock the geometry, features, and skin textures of these Anchors.

### PHASE 2: ${year == 'Today' ? 'MODERN "NOW"' : '$year "$name"'} TRANSFORMATION
While keeping the Static Anchors untouched, transform all "Variable Elements" (clothing, hair, and background) to ${year == 'Today' ? 'a contemporary modern style' : 'the $year era'}:
- CLOTHING: $clothingTransform
- HAIR: $hairTransform
- ENVIRONMENT: $environmentTransform

### PHASE 3: PHOTOGRAPHIC AESTHETIC
Render the final output using ${year == 'Today' ? 'a "Modern Digital Photography" engine' : 'a "$year Analog Film" engine'}:
$photographyStyle

### MANDATE
The subjects must be instantly recognizable as the same people from the source. This is a restyling of the existing subjects, not a replacement of them.''';
}

const List<Era> eras = [
  Era(
    position: 0,
    year: '1920s',
    name: 'Silver Screen',
    description: 'Black & white, film grain, vintage portraits',
    thumbnailPath: 'assets/images/eras/1_silver_screen.png',
    photographyStyle: '''- Convert to black and white with rich contrast and subtle film grain.
- Apply soft, dreamy lighting reminiscent of early Hollywood portraits.
- Set black levels slightly elevated for a vintage silver gelatin print look.''',
    clothingTransform: 'Replace modern fabrics with period-accurate attire: three-piece suits with wide lapels for males, drop-waist flapper dresses with fringe or beading for females.',
    hairTransform: 'Style hair into slicked-back looks for men/boys, finger waves or sleek bob cuts for women/girls, ensuring the hairline matches the original subject.',
    environmentTransform: 'Replace modern decor with Art Deco aesthetic featuring geometric patterns, dark wood furniture, velvet upholstery, and ornate period details. Remove any modern electronics.',
  ),
  Era(
    position: 1,
    year: '1950s',
    name: 'Atomic',
    description: 'Technicolor, warm retro, Americana vibes',
    thumbnailPath: 'assets/images/eras/2_atomic.png',
    photographyStyle: '''- Apply warm, saturated Kodachrome color processing.
- Use bright, optimistic lighting with clean, crisp exposure.
- Render with the look of mid-century color photography.''',
    clothingTransform: 'Replace modern fabrics with period-accurate 1950s attire: cardigans, polo shirts, and neat trousers for males; full-skirt dresses, peter pan collars, and preppy styles for females.',
    hairTransform: 'Style into short neat cuts for men, victory rolls or pin curls for women, ensuring the hairline matches the original subject.',
    environmentTransform: 'Replace modern decor with mid-century modern furniture (clean lines, tapered legs), pastel colors (mint, pink, turquoise), and period technology like small B&W TVs with rabbit ears. Remove modern electronics.',
  ),
  Era(
    position: 2,
    year: '1970s',
    name: 'Groovy',
    description: 'Faded warm tones, earthy colors, soft grain',
    thumbnailPath: 'assets/images/eras/3_groovy.png',
    photographyStyle: '''- Apply a warm, slightly yellow/magenta color cast.
- Use a soft-focus lens effect with organic film grain.
- Set black levels to be slightly "lifted" (faded matte look).''',
    clothingTransform: 'Replace modern fabrics with period-accurate earth-toned polyester, wide-pointed collars, and bell-bottom silhouettes.',
    hairTransform: 'Extend hair into feathered styles or long, straight natural textures, ensuring the hairline matches the original subject.',
    environmentTransform: 'Replace modern decor with wood-paneled walls, shag carpeting (burnt orange/avocado green), and period-appropriate analog technology like wood-cabinet TV consoles.',
  ),
  Era(
    position: 3,
    year: '1980s',
    name: 'Neon Dreams',
    description: 'Neon, synthwave, bold saturated colors',
    thumbnailPath: 'assets/images/eras/4_neon_dreams.png',
    photographyStyle: '''- Apply vibrant colors with neon accent lighting (pink, cyan, purple glow).
- Use high contrast with stylized 80s aesthetic.
- Keep it a realistic photograph, not an illustration.''',
    clothingTransform: 'Replace modern fabrics with bold-colored 1980s attire: shoulder pads, neon accents, geometric patterns, and oversized silhouettes.',
    hairTransform: 'Style into big voluminous hair, permed styles, or mullets, ensuring the hairline matches the original subject.',
    environmentTransform: 'Replace modern decor with bold geometric Memphis design patterns, glass and brass/chrome accents, neon lighting effects, and period technology like boxy TVs with VCRs.',
  ),
  Era(
    position: 4,
    year: '2000s',
    name: 'Y2K',
    description: 'Glossy, early digital, metallic/futuristic',
    thumbnailPath: 'assets/images/eras/5_y2k.png',
    photographyStyle: '''- Apply a cool, slightly overexposed look with metallic/silvery blue tones.
- Use early digital photography aesthetic with slight softness.
- Render with the characteristic Y2K glossy sheen.''',
    clothingTransform: 'Replace modern fabrics with Y2K fashion: low-rise jeans, cargo pants, graphic tees, velour tracksuits, and metallic accents.',
    hairTransform: 'Style into frosted tips, chunky highlights, or spiky gel hair, ensuring the hairline matches the original subject.',
    environmentTransform: 'Replace modern decor with silver/chrome accents, minimalist futuristic design, beige/silver/blue color palette, and period technology like rear-projection TVs and DVD players.',
  ),
  Era(
    position: 5,
    year: 'Today',
    name: 'Now',
    description: 'Clean, natural, modern photography',
    thumbnailPath: 'assets/images/eras/6_now.png',
    photographyStyle: '''- Apply clean, natural colors with subtle enhancement.
- Use crisp, high-quality modern digital photography rendering.
- Apply soft, flattering natural lighting with professional lifestyle photography look.''',
    clothingTransform: 'Update to current contemporary casual clothing with modern cuts, neutral tones, and current fashion trends.',
    hairTransform: 'Style into current modern hairstyles while ensuring the hairline matches the original subject.',
    environmentTransform: 'Update to contemporary decor with clean lines, minimalist aesthetic, neutral colors with warm wood accents, and modern design elements.',
  ),
];
