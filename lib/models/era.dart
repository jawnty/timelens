class Era {
  final int position;
  final String year;
  final String name;
  final String description;
  final String thumbnailPath;
  final String photographyStyle;
  final String peopleAppearance;
  final String objectsRoomsStyle;

  const Era({
    required this.position,
    required this.year,
    required this.name,
    required this.description,
    required this.thumbnailPath,
    required this.photographyStyle,
    required this.peopleAppearance,
    required this.objectsRoomsStyle,
  });

  String get prompt => '''Transform this photo into ${year == 'Today' ? 'a modern "Now" contemporary style' : 'an authentic $year "$name" era image'}.

CRITICAL RULES:
- DO NOT add any people, objects, or elements that are not in the original photo
- PRESERVE exact faces, facial features, and identity of all people and animals
- DO NOT alter facial structure, skin tone, age, or body type
- Only change hairstyles, clothing, and surroundings - never the actual face
- Preserve the exact composition and subjects

PHOTOGRAPHY STYLE:
$photographyStyle

IF PEOPLE ARE PRESENT - transform their appearance to $year style:
$peopleAppearance

IF OBJECTS/ROOMS ARE PRESENT - transform to $year style:
$objectsRoomsStyle

Make it look like a ${year == 'Today' ? 'high-quality contemporary' : 'genuine $year'} photograph while keeping the same people with their exact faces.''';
}

const List<Era> eras = [
  Era(
    position: 0,
    year: '1920s',
    name: 'Silver Screen',
    description: 'Black & white, film grain, vintage portraits',
    thumbnailPath: 'assets/images/eras/1_silver_screen.png',
    photographyStyle: '''- Black and white with rich contrast and subtle film grain
- Soft, dreamy lighting like early Hollywood portraits''',
    peopleAppearance: '''- Hairstyles: slicked back hair for men/boys, finger waves or bob cuts for women/girls
- Clothing: three-piece suits for males, drop-waist flapper dresses for females''',
    objectsRoomsStyle: '''- Art Deco aesthetic with geometric patterns
- Dark wood, velvet upholstery, ornate details
- Period-appropriate technology (no modern electronics)''',
  ),
  Era(
    position: 1,
    year: '1950s',
    name: 'Atomic',
    description: 'Technicolor, warm retro, Americana vibes',
    thumbnailPath: 'assets/images/eras/2_atomic.png',
    photographyStyle: '''- Warm, saturated Kodachrome colors
- Bright, optimistic lighting
- Clean, crisp mid-century photography look''',
    peopleAppearance: '''- Hairstyles: short neat cut for men, victory rolls or pin curls for women
- Clothing: cardigans, polos, full skirt dresses, preppy clothes''',
    objectsRoomsStyle: '''- Mid-century modern furniture with clean lines, tapered legs
- Pastel colors (mint, pink, turquoise)
- Period-appropriate technology (small B&W TV with rabbit ears, no modern electronics)''',
  ),
  Era(
    position: 2,
    year: '1970s',
    name: 'Groovy',
    description: 'Faded warm tones, earthy colors, soft grain',
    thumbnailPath: 'assets/images/eras/3_groovy.png',
    photographyStyle: '''- Faded, warm color tones with muted saturation
- Soft film grain, slightly hazy
- Earthy color cast (oranges, browns, olive greens, harvest gold)''',
    peopleAppearance: '''- Hairstyles: longer hair with sideburns for men, feathered hair for women
- Clothing: earth tones, wide collars, bell bottoms, polyester''',
    objectsRoomsStyle: '''- Orange/brown shag carpet, wood paneling
- Harvest gold, avocado green, burnt orange colors
- Period-appropriate technology (wood-cabinet TV console, no modern electronics)''',
  ),
  Era(
    position: 3,
    year: '1980s',
    name: 'Neon Dreams',
    description: 'Neon, synthwave, bold saturated colors',
    thumbnailPath: 'assets/images/eras/4_neon_dreams.png',
    photographyStyle: '''- Vibrant colors with neon accent lighting (pink, cyan, purple glow)
- High contrast, stylized 80s aesthetic
- Keep it a realistic photo, not illustration''',
    peopleAppearance: '''- Hairstyles: big voluminous hair, permed styles, mullets
- Clothing: bold colors, shoulder pads, neon accents, geometric patterns''',
    objectsRoomsStyle: '''- Bold geometric patterns, Memphis design influences
- Glass and brass/chrome accents
- Neon lighting effects
- Period-appropriate technology (boxy TV with VCR, no modern electronics)''',
  ),
  Era(
    position: 4,
    year: '2000s',
    name: 'Y2K',
    description: 'Glossy, early digital, metallic/futuristic',
    thumbnailPath: 'assets/images/eras/5_y2k.png',
    photographyStyle: '''- Cool, slightly overexposed look
- Metallic/silvery blue tones
- Early digital photography aesthetic with slight softness''',
    peopleAppearance: '''- Hairstyles: frosted tips, chunky highlights, spiky gel hair
- Clothing: low-rise jeans, cargo pants, graphic tees, velour tracksuits''',
    objectsRoomsStyle: '''- Silver/chrome accents, minimalist design
- Beige/silver/blue color palette
- Period-appropriate technology (rear-projection TV, DVD player, early 2000s electronics)''',
  ),
  Era(
    position: 5,
    year: 'Today',
    name: 'Now',
    description: 'Clean, natural, modern photography',
    thumbnailPath: 'assets/images/eras/6_now.png',
    photographyStyle: '''- Clean, natural colors with subtle enhancement
- Crisp, high-quality modern photography
- Soft, flattering natural lighting
- Professional lifestyle photography look''',
    peopleAppearance: '''- Current casual clothing and hairstyles
- Natural, relaxed expressions''',
    objectsRoomsStyle: '''- Clean lines, minimalist aesthetic
- Neutral colors with warm wood accents
- Contemporary design elements''',
  ),
];
