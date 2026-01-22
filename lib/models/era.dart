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

  String get prompt => '''[TASK]: Transform the attached image into an authentic photograph from ${year == 'Today' ? 'the present day' : year} ($name era).

[CONSTRAINTS]:
- Keep the subject's facial features, bone structure, skin tone, eye color, and body type exactly the same as the source image.
- Maintain the original pose, silhouette, and camera angle.
- Only modify the semantic layers: clothing, hair, objects, and background.
- Replace modern objects (smartphones, laptops, modern cars, contemporary furniture) with $year-appropriate equivalents.

[TRANSFORMATION]:
- Restyle hair to $year fashion: $peopleAppearance
- Swap modern technology, furniture, and decor with period-appropriate items: $objectsRoomsStyle

[VISUAL STYLE]: Apply the photographic aesthetic of ${year == 'Today' ? 'modern professional photography' : year}, specifically: $photographyStyle
Use authentic lighting and period-appropriate film characteristics. The image should look like it was captured on original ${year == 'Today' ? 'contemporary' : year} camera equipment.

[OUTPUT]: The result must be an authentic ${year == 'Today' ? 'contemporary' : year} photograph where the subjects are immediately recognizable as the same people - not a costume photo, not a digital collage, not different people styled to look similar.''';
}

const List<Era> eras = [
  Era(
    position: 0,
    year: '1920s',
    name: 'Silver Screen',
    description: 'Black & white, film grain, vintage portraits',
    thumbnailPath: 'assets/images/eras/1_silver_screen.png',
    photographyStyle: '''Black and white orthochromatic film with high contrast and silver halide grain. Soft, diffused lighting reminiscent of early Hollywood portrait photography. Slight vignetting at edges.''',
    peopleAppearance: '''Slicked back hair with pomade for men/boys, finger waves or bob cuts for women/girls. Three-piece suits with wide lapels for males, drop-waist flapper dresses with beading for females.''',
    objectsRoomsStyle: '''Art Deco aesthetic with geometric patterns. Dark wood furniture, velvet upholstery, ornate gilded details. Gramophones, candlestick telephones, Art Deco lamps.''',
  ),
  Era(
    position: 1,
    year: '1950s',
    name: 'Atomic',
    description: 'Technicolor, warm retro, Americana vibes',
    thumbnailPath: 'assets/images/eras/2_atomic.png',
    photographyStyle: '''Kodachrome film with warm, saturated reds and teals. Bright, optimistic lighting with soft shadows. Clean, crisp mid-century photography aesthetic with slight color bloom.''',
    peopleAppearance: '''Short neat cuts with side parts for men, victory rolls or pin curls for women. Cardigans, polo shirts, letterman jackets for males. Full circle skirts, Peter Pan collars, saddle shoes for females.''',
    objectsRoomsStyle: '''Mid-century modern furniture with clean lines and tapered legs. Pastel colors (mint, pink, turquoise). Chrome appliances, small black-and-white TV with rabbit ears, rotary phones, diner-style furniture.''',
  ),
  Era(
    position: 2,
    year: '1970s',
    name: 'Groovy',
    description: 'Faded warm tones, earthy colors, soft grain',
    thumbnailPath: 'assets/images/eras/3_groovy.png',
    photographyStyle: '''Faded Polaroid or Ektachrome aesthetic with warm color cast and muted saturation. Soft film grain, slightly hazy with light leaks. Earthy tones: oranges, browns, olive greens, harvest gold.''',
    peopleAppearance: '''Longer shaggy hair with sideburns for men, feathered Farrah Fawcett hair for women. Earth-tone clothing, wide collars, bell-bottom pants, polyester leisure suits, peasant blouses.''',
    objectsRoomsStyle: '''Shag carpet in orange or brown, wood paneling on walls. Harvest gold, avocado green, burnt orange color palette. Wood-cabinet console TV, lava lamps, macramé wall hangings, beanbag chairs.''',
  ),
  Era(
    position: 3,
    year: '1980s',
    name: 'Neon Dreams',
    description: 'Neon, synthwave, bold saturated colors',
    thumbnailPath: 'assets/images/eras/4_neon_dreams.png',
    photographyStyle: '''35mm film with vibrant colors and neon accent lighting (pink, cyan, purple glow). High contrast with punchy saturation. Hard flash photography aesthetic common in 80s snapshots.''',
    peopleAppearance: '''Big voluminous hair with lots of hairspray, permed styles, mullets. Bold neon colors, shoulder pads, Members Only jackets, leg warmers, geometric patterns, acid-wash denim.''',
    objectsRoomsStyle: '''Memphis design with bold geometric patterns. Glass block walls, brass and chrome accents, neon signs. Boxy CRT television with VCR, boomboxes, early personal computers, Rubik's cubes.''',
  ),
  Era(
    position: 4,
    year: '2000s',
    name: 'Y2K',
    description: 'Glossy, early digital, metallic/futuristic',
    thumbnailPath: 'assets/images/eras/5_y2k.png',
    photographyStyle: '''Early digital camera or 35mm point-and-shoot aesthetic. Cool, slightly overexposed with metallic silvery-blue color cast. Slight softness and digital noise characteristic of early 2000s photography.''',
    peopleAppearance: '''Frosted tips, chunky highlights, spiky gelled hair for men. Straightened hair with side bangs for women. Low-rise bootcut jeans, cargo pants, graphic tees, velour tracksuits, trucker hats.''',
    objectsRoomsStyle: '''Silver and chrome accents, minimalist Y2K aesthetic. Beige, silver, and blue color palette. Rear-projection big-screen TV, DVD players, early flip phones, iPod Classic, transparent plastic electronics.''',
  ),
  Era(
    position: 5,
    year: 'Today',
    name: 'Now',
    description: 'Clean, natural, modern photography',
    thumbnailPath: 'assets/images/eras/6_now.png',
    photographyStyle: '''Modern mirrorless camera aesthetic with clean, natural colors and subtle enhancement. High resolution with shallow depth of field and pleasing bokeh. Soft, flattering natural lighting typical of professional lifestyle photography.''',
    peopleAppearance: '''Current contemporary casual clothing and modern hairstyles. Natural, relaxed styling with clean lines.''',
    objectsRoomsStyle: '''Clean minimalist aesthetic with neutral colors and warm wood accents. Contemporary furniture, smart TVs, modern smartphones and laptops, indoor plants, Scandinavian-inspired design.''',
  ),
];
