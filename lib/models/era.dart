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
    prompt: '''Transform this photo into an authentic 1920s "Silver Screen" era scene:

PHOTOGRAPHY STYLE:
- Black and white with rich contrast and subtle film grain
- Soft, dreamy lighting like early Hollywood portraits

PEOPLE - transform to 1920s appearance:
- Hairstyles: slicked back hair for men/boys, finger waves or bob cuts for women/girls
- Clothing: three-piece suits for males, drop-waist flapper dresses for females
- Formal, elegant posture

SETTING - transform to 1920s:
- Art Deco furniture with geometric patterns, dark wood, velvet upholstery
- Ornate floor lamp with fabric shade
- Dark patterned wallpaper
- No TV - perhaps a gramophone or radio cabinet
- Persian rug, decorative vases, Art Deco accents

Keep the people and composition similar. Make it look like a genuine 1920s photograph.''',
  ),
  Era(
    position: 1,
    year: '1950s',
    name: 'Atomic',
    description: 'Technicolor, warm retro, Americana vibes',
    thumbnailPath: 'assets/images/eras/2_atomic.png',
    prompt: '''Transform this photo into an authentic 1950s "Atomic" era scene:

PHOTOGRAPHY STYLE:
- Warm, saturated Kodachrome colors
- Bright, optimistic lighting
- Clean, crisp mid-century photography look

PEOPLE - transform to 1950s appearance:
- Hairstyles: short neat cut for men, crew cut for boys, victory rolls or pin curls for women, ribbons for girls
- Clothing: cardigans or polos for men, full skirt dresses for women, preppy clothes for kids
- Wholesome, all-American look

SETTING - transform to 1950s:
- Mid-century modern furniture with clean lines, tapered legs
- Boomerang or atomic-pattern coffee table
- Starburst clock on wall
- Small black & white TV set with rabbit ears
- Pastel colors (mint, pink, turquoise), kidney-shaped accessories
- Table lamp with cone shade

Keep the people and composition similar. Make it look like a genuine 1950s color photograph.''',
  ),
  Era(
    position: 2,
    year: '1970s',
    name: 'Groovy',
    description: 'Faded warm tones, earthy colors, soft grain',
    thumbnailPath: 'assets/images/eras/3_groovy.png',
    prompt: '''Transform this photo into an authentic 1970s "Groovy" era scene:

PHOTOGRAPHY STYLE:
- Faded, warm color tones with muted saturation
- Soft film grain, slightly hazy
- Earthy color cast (oranges, browns, olive greens, harvest gold)

PEOPLE - transform to 1970s appearance:
- Hairstyles: longer hair with sideburns for men, feathered hair for women, shaggy cuts for kids
- Clothing: earth tones, wide collars, bell bottoms, polyester shirts
- Relaxed, casual vibe

SETTING - transform to 1970s:
- Orange or brown shag carpet
- Wood paneling on walls
- Bulky upholstered furniture in harvest gold, avocado green, or burnt orange
- Macramé wall hangings
- Boxy wood-cabinet color TV console
- Lava lamp, hanging swag lamp

Keep the people and composition similar. Make it look like a genuine 1970s photograph.''',
  ),
  Era(
    position: 3,
    year: '1980s',
    name: 'Neon Dreams',
    description: 'Neon, synthwave, bold saturated colors',
    thumbnailPath: 'assets/images/eras/4_neon_dreams.png',
    prompt: '''Transform this photo into a stylized 1980s "Neon Dreams" scene:

PHOTOGRAPHY STYLE:
- Vibrant colors with neon accent lighting (pink, cyan, purple glow)
- High contrast, stylized 80s aesthetic
- Keep it a realistic photo, not illustration

PEOPLE - transform to 1980s appearance:
- Hairstyles: big voluminous hair, permed styles, mullets
- Clothing: bold colors, shoulder pads, Members Only jackets, neon accents, geometric patterns
- Confident, fun expressions

SETTING - transform to 1980s:
- Bold geometric patterns on furniture/decor
- Glass and brass/chrome accents
- Large boxy entertainment center with VCR
- Memphis design influences
- Bright accent colors: teal, hot pink, purple
- Neon signs or accent lighting

Keep the people and composition similar. Make it look like a stylized 1980s photograph with neon lighting accents.''',
  ),
  Era(
    position: 4,
    year: '2000s',
    name: 'Y2K',
    description: 'Glossy, early digital, metallic/futuristic',
    thumbnailPath: 'assets/images/eras/5_y2k.png',
    prompt: '''Transform this photo into an authentic early 2000s "Y2K" millennium style scene:

PHOTOGRAPHY STYLE:
- Cool, slightly overexposed look
- Metallic/silvery blue tones
- Early digital photography aesthetic with slight softness

PEOPLE - transform to early 2000s appearance:
- Hairstyles: frosted tips for men, chunky highlights for women, spiky gel hair for boys, butterfly clips for girls
- Clothing: low-rise jeans, cargo pants, graphic tees, velour tracksuits, early 2000s fashion
- Casual millennium style

SETTING - transform to early 2000s:
- Minimalist design emerging
- Silver/chrome accents
- Big rear-projection TV or early flat panel
- CD tower, DVD player, gaming console visible
- IKEA-style furniture
- Beige/silver/blue color palette

Keep the people and composition similar. Make it look like an early 2000s digital photograph.''',
  ),
  Era(
    position: 5,
    year: 'Today',
    name: 'Now',
    description: 'Clean, natural, modern photography',
    thumbnailPath: 'assets/images/eras/6_now.png',
    prompt: '''Enhance this photo with a modern "Now" contemporary style:

PHOTOGRAPHY STYLE:
- Clean, natural colors with subtle enhancement
- Crisp, high-quality modern photography
- Soft, flattering natural lighting
- Professional lifestyle photography look

PEOPLE - keep modern contemporary appearance:
- Current casual clothing and hairstyles
- Natural, relaxed expressions
- Contemporary fashion

SETTING - modern contemporary:
- Clean-lined modern furniture
- Minimalist Scandinavian-influenced decor
- Large wall-mounted flat-screen smart TV
- Neutral color palette with warm wood accents
- Indoor plants, simple abstract art
- Natural materials (wood, linen, cotton)

Keep the people and composition similar. Make it look like a high-quality contemporary lifestyle photograph.''',
  ),
];
