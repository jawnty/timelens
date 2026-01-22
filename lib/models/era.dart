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
Act as a Precision Historical Image Editor. Your goal is to perform a semantic "restyling" of the provided image while maintaining 100% facial identity.

### PHASE 1: VISUAL ANALYSIS & ANCHORING
1. Identify all human and animal faces in the source image.
2. These faces are your "Static Anchors."
3. You MUST lock the geometry, features, skin tone, and textures of these Anchors. They cannot be modified.

### PHASE 2: ${year == 'Today' ? 'MODERN "NOW"' : '$year "$name"'} TRANSFORMATION
While keeping the Static Anchors completely untouched, transform all "Variable Elements" to ${year == 'Today' ? 'a contemporary modern style' : 'the $year era'}:
- CLOTHING: $clothingTransform
- HAIR: $hairTransform (style only - do not change hairline or face shape)
- ENVIRONMENT: $environmentTransform

### PHASE 3: PHOTOGRAPHIC AESTHETIC
Render the final output using ${year == 'Today' ? 'a "Modern Digital Photography" engine' : 'a "$year Analog Film" engine'}:
$photographyStyle

### MANDATE
The subjects must be instantly recognizable as the exact same people from the source image. This is a restyling of existing subjects, not a replacement. Any deviation from the original facial features is a failure.''';
}

const List<Era> eras = [
  Era(
    position: 0,
    year: '1920s',
    name: 'Silver Screen',
    description: 'Black & white, film grain, vintage portraits',
    thumbnailPath: 'assets/images/eras/1_silver_screen.png',
    photographyStyle: '''- Convert to black and white orthochromatic film with high contrast and silver halide grain.
- Apply soft, diffused lighting reminiscent of early Hollywood portraits.
- Add slight vignetting at edges for authentic period look.''',
    clothingTransform: 'Replace modern fabrics with period-accurate 1920s attire: three-piece suits with wide lapels for males, drop-waist flapper dresses with fringe or beading for females.',
    hairTransform: 'Style into slicked-back looks with pomade for men/boys, finger waves or sleek bob cuts for women/girls.',
    environmentTransform: 'Replace modern decor with Art Deco aesthetic featuring geometric patterns, dark wood furniture, velvet upholstery, gramophones, candlestick telephones, and ornate gilded details. Remove any modern electronics.',
  ),
  Era(
    position: 1,
    year: '1950s',
    name: 'Atomic',
    description: 'Technicolor, warm retro, Americana vibes',
    thumbnailPath: 'assets/images/eras/2_atomic.png',
    photographyStyle: '''- Apply warm, saturated Kodachrome color processing with rich reds and teals.
- Use bright, optimistic lighting with soft shadows.
- Render with clean, crisp mid-century photography aesthetic.''',
    clothingTransform: 'Replace modern fabrics with period-accurate 1950s attire: cardigans, polo shirts, letterman jackets for males; full circle skirts, Peter Pan collars, saddle shoes for females.',
    hairTransform: 'Style into short neat cuts with side parts for men, victory rolls or pin curls for women.',
    environmentTransform: 'Replace modern decor with mid-century modern furniture (clean lines, tapered legs), pastel colors (mint, pink, turquoise), chrome appliances, small B&W TV with rabbit ears, rotary phones. Remove modern electronics.',
  ),
  Era(
    position: 2,
    year: '1970s',
    name: 'Groovy',
    description: 'Faded warm tones, earthy colors, soft grain',
    thumbnailPath: 'assets/images/eras/3_groovy.png',
    photographyStyle: '''- Apply faded Polaroid or Ektachrome aesthetic with warm color cast.
- Use soft film grain, slightly hazy with subtle light leaks.
- Shift palette to earthy tones: oranges, browns, olive greens, harvest gold.''',
    clothingTransform: 'Replace modern fabrics with earth-toned polyester, wide-pointed collars, bell-bottom pants, leisure suits, peasant blouses.',
    hairTransform: 'Style into longer shaggy hair with sideburns for men, feathered Farrah Fawcett styles for women.',
    environmentTransform: 'Replace modern decor with shag carpet (orange/brown), wood paneling, harvest gold and avocado green palette, wood-cabinet console TV, lava lamps, macramé wall hangings.',
  ),
  Era(
    position: 3,
    year: '1980s',
    name: 'Neon Dreams',
    description: 'Neon, synthwave, bold saturated colors',
    thumbnailPath: 'assets/images/eras/4_neon_dreams.png',
    photographyStyle: '''- Apply 35mm film aesthetic with vibrant colors and neon accent lighting (pink, cyan, purple glow).
- Use high contrast with punchy saturation.
- Add hard flash photography look common in 80s snapshots. Keep it realistic, not illustrated.''',
    clothingTransform: 'Replace modern fabrics with bold 1980s attire: shoulder pads, Members Only jackets, neon accents, geometric patterns, leg warmers, acid-wash denim.',
    hairTransform: 'Style into big voluminous hair with lots of volume, permed styles, or mullets.',
    environmentTransform: 'Replace modern decor with Memphis design patterns, glass block walls, brass and chrome accents, neon signs, boxy CRT TV with VCR, boomboxes.',
  ),
  Era(
    position: 4,
    year: '2000s',
    name: 'Y2K',
    description: 'Glossy, early digital, metallic/futuristic',
    thumbnailPath: 'assets/images/eras/5_y2k.png',
    photographyStyle: '''- Apply early digital camera or 35mm point-and-shoot aesthetic.
- Use cool, slightly overexposed look with metallic silvery-blue color cast.
- Add slight softness and digital noise characteristic of early 2000s.''',
    clothingTransform: 'Replace modern fabrics with Y2K fashion: low-rise bootcut jeans, cargo pants, graphic tees, velour tracksuits, trucker hats, metallic accents.',
    hairTransform: 'Style into frosted tips, chunky highlights, or spiky gelled hair for men; straightened hair with side bangs for women.',
    environmentTransform: 'Replace modern decor with silver/chrome accents, minimalist Y2K aesthetic, beige/silver/blue palette, rear-projection TV, DVD players, early flip phones, transparent plastic electronics.',
  ),
  Era(
    position: 5,
    year: 'Today',
    name: 'Now',
    description: 'Clean, natural, modern photography',
    thumbnailPath: 'assets/images/eras/6_now.png',
    photographyStyle: '''- Apply modern mirrorless camera aesthetic with clean, natural colors.
- Use high resolution with shallow depth of field and pleasing bokeh.
- Add soft, flattering natural lighting typical of professional lifestyle photography.''',
    clothingTransform: 'Update to current contemporary casual clothing with modern cuts and current fashion trends.',
    hairTransform: 'Style into current modern hairstyles with natural, relaxed styling.',
    environmentTransform: 'Update to contemporary decor with clean lines, minimalist aesthetic, neutral colors with warm wood accents, modern furniture, indoor plants, Scandinavian-inspired design.',
  ),
];
