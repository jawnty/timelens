class Era {
  final int position;
  final String year;
  final String name;
  final String description;
  final String thumbnailPath;
  final String prompt;

  const Era({
    required this.position,
    required this.year,
    required this.name,
    required this.description,
    required this.thumbnailPath,
    required this.prompt,
  });
}

const List<Era> eras = [
  Era(
    position: 0,
    year: '1920s',
    name: 'Silver Screen',
    description: 'Black & white, film grain, vintage portraits',
    thumbnailPath: 'assets/images/eras/1_silver_screen.png',
    prompt: '''Transform this photo into an authentic 1920s "Silver Screen" era image.

CRITICAL RULES:
- DO NOT add any people, objects, or elements that are not in the original photo
- Only transform what already exists in the image
- Preserve the exact composition and subjects

PHOTOGRAPHY STYLE:
- Black and white with rich contrast and subtle film grain
- Soft, dreamy lighting like early Hollywood portraits

IF PEOPLE ARE PRESENT - transform their appearance to 1920s:
- Hairstyles: slicked back hair for men/boys, finger waves or bob cuts for women/girls
- Clothing: three-piece suits for males, drop-waist flapper dresses for females

IF OBJECTS/ROOMS ARE PRESENT - transform to 1920s style:
- Art Deco aesthetic with geometric patterns
- Dark wood, velvet upholstery, ornate details
- Period-appropriate technology (no modern electronics)

Make it look like a genuine 1920s photograph while keeping the same subjects and composition.''',
  ),
  Era(
    position: 1,
    year: '1950s',
    name: 'Atomic',
    description: 'Technicolor, warm retro, Americana vibes',
    thumbnailPath: 'assets/images/eras/2_atomic.png',
    prompt: '''Transform this photo into an authentic 1950s "Atomic" era image.

CRITICAL RULES:
- DO NOT add any people, objects, or elements that are not in the original photo
- Only transform what already exists in the image
- Preserve the exact composition and subjects

PHOTOGRAPHY STYLE:
- Warm, saturated Kodachrome colors
- Bright, optimistic lighting
- Clean, crisp mid-century photography look

IF PEOPLE ARE PRESENT - transform their appearance to 1950s:
- Hairstyles: short neat cut for men, victory rolls or pin curls for women
- Clothing: cardigans, polos, full skirt dresses, preppy clothes

IF OBJECTS/ROOMS ARE PRESENT - transform to 1950s style:
- Mid-century modern furniture with clean lines, tapered legs
- Pastel colors (mint, pink, turquoise)
- Period-appropriate technology (small B&W TV with rabbit ears, no modern electronics)

Make it look like a genuine 1950s color photograph while keeping the same subjects and composition.''',
  ),
  Era(
    position: 2,
    year: '1970s',
    name: 'Groovy',
    description: 'Faded warm tones, earthy colors, soft grain',
    thumbnailPath: 'assets/images/eras/3_groovy.png',
    prompt: '''Transform this photo into an authentic 1970s "Groovy" era image.

CRITICAL RULES:
- DO NOT add any people, objects, or elements that are not in the original photo
- Only transform what already exists in the image
- Preserve the exact composition and subjects

PHOTOGRAPHY STYLE:
- Faded, warm color tones with muted saturation
- Soft film grain, slightly hazy
- Earthy color cast (oranges, browns, olive greens, harvest gold)

IF PEOPLE ARE PRESENT - transform their appearance to 1970s:
- Hairstyles: longer hair with sideburns for men, feathered hair for women
- Clothing: earth tones, wide collars, bell bottoms, polyester

IF OBJECTS/ROOMS ARE PRESENT - transform to 1970s style:
- Orange/brown shag carpet, wood paneling
- Harvest gold, avocado green, burnt orange colors
- Period-appropriate technology (wood-cabinet TV console, no modern electronics)

Make it look like a genuine 1970s photograph while keeping the same subjects and composition.''',
  ),
  Era(
    position: 3,
    year: '1980s',
    name: 'Neon Dreams',
    description: 'Neon, synthwave, bold saturated colors',
    thumbnailPath: 'assets/images/eras/4_neon_dreams.png',
    prompt: '''Transform this photo into a stylized 1980s "Neon Dreams" image.

CRITICAL RULES:
- DO NOT add any people, objects, or elements that are not in the original photo
- Only transform what already exists in the image
- Preserve the exact composition and subjects

PHOTOGRAPHY STYLE:
- Vibrant colors with neon accent lighting (pink, cyan, purple glow)
- High contrast, stylized 80s aesthetic
- Keep it a realistic photo, not illustration

IF PEOPLE ARE PRESENT - transform their appearance to 1980s:
- Hairstyles: big voluminous hair, permed styles, mullets
- Clothing: bold colors, shoulder pads, neon accents, geometric patterns

IF OBJECTS/ROOMS ARE PRESENT - transform to 1980s style:
- Bold geometric patterns, Memphis design influences
- Glass and brass/chrome accents
- Neon lighting effects
- Period-appropriate technology (boxy TV with VCR, no modern electronics)

Make it look like a stylized 1980s photograph while keeping the same subjects and composition.''',
  ),
  Era(
    position: 4,
    year: '2000s',
    name: 'Y2K',
    description: 'Glossy, early digital, metallic/futuristic',
    thumbnailPath: 'assets/images/eras/5_y2k.png',
    prompt: '''Transform this photo into an early 2000s "Y2K" millennium style image.

CRITICAL RULES:
- DO NOT add any people, objects, or elements that are not in the original photo
- Only transform what already exists in the image
- Preserve the exact composition and subjects

PHOTOGRAPHY STYLE:
- Cool, slightly overexposed look
- Metallic/silvery blue tones
- Early digital photography aesthetic with slight softness

IF PEOPLE ARE PRESENT - transform their appearance to early 2000s:
- Hairstyles: frosted tips, chunky highlights, spiky gel hair
- Clothing: low-rise jeans, cargo pants, graphic tees, velour tracksuits

IF OBJECTS/ROOMS ARE PRESENT - transform to early 2000s style:
- Silver/chrome accents, minimalist design
- Beige/silver/blue color palette
- Period-appropriate technology (rear-projection TV, DVD player, early 2000s electronics)

Make it look like an early 2000s digital photograph while keeping the same subjects and composition.''',
  ),
  Era(
    position: 5,
    year: 'Today',
    name: 'Now',
    description: 'Clean, natural, modern photography',
    thumbnailPath: 'assets/images/eras/6_now.png',
    prompt: '''Enhance this photo with a modern "Now" contemporary style.

CRITICAL RULES:
- DO NOT add any people, objects, or elements that are not in the original photo
- Only enhance what already exists in the image
- Preserve the exact composition and subjects

PHOTOGRAPHY STYLE:
- Clean, natural colors with subtle enhancement
- Crisp, high-quality modern photography
- Soft, flattering natural lighting
- Professional lifestyle photography look

IF PEOPLE ARE PRESENT - keep modern contemporary appearance:
- Current casual clothing and hairstyles
- Natural, relaxed expressions

IF OBJECTS/ROOMS ARE PRESENT - enhance with modern style:
- Clean lines, minimalist aesthetic
- Neutral colors with warm wood accents
- Contemporary design elements

Make it look like a high-quality contemporary photograph while keeping the same subjects and composition.''',
  ),
];
