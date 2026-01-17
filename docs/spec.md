# TimeLens - Project Specification

## Overview
A simple Android app that lets users take photos or selfies and apply era-based filters using AI image transformation.

## Core Features

### Camera
- Take a photo (rear camera)
- Take a selfie (front camera)

### Era Slider
- Slider ranging from 1920s to today
- 6 distinct eras (left to right):

| Position | Era | Name | Visual Style |
|----------|-----|------|--------------|
| 1 | 1920s | Silver Screen | Black & white, film grain, vintage portraits |
| 2 | 1950s | Atomic | Technicolor, warm retro, Americana vibes |
| 3 | 1970s | Groovy | Faded warm tones, earthy colors, soft grain |
| 4 | 1980s | Neon Dreams | Neon, synthwave, bold saturated colors |
| 5 | 2000s | Y2K | Glossy, early digital, metallic/futuristic |
| 6 | Today | Now | Clean, natural, modern photography |

### Preview
- Static thumbnail previews (no live AI generation while browsing)
- 1 base image: AI-generated family of 4 in a living room
- Pre-transformed into all 6 era styles (6 thumbnails total)
- Thumbnails ship with the app as bundled assets
- As user slides, the corresponding era's thumbnail is shown

**Thumbnail Assets (ready to bundle):**
- `docs/era_thumbnails/1_silver_screen.png` — Silver Screen (1920s)
- `docs/era_thumbnails/2_atomic.png` — Atomic (1950s)
- `docs/era_thumbnails/3_groovy.png` — Groovy (1970s)
- `docs/era_thumbnails/4_neon_dreams.png` — Neon Dreams (1980s)
- `docs/era_thumbnails/5_y2k.png` — Y2K (2000s)
- `docs/era_thumbnails/6_now.png` — Now (Today)

### AI Transformation
- User clicks button to capture photo/selfie
- Photo is sent to an AI image transformation service (e.g., Gemini's image generation API)
- Transformed result is displayed to the user

## Screens & User Flow

### Screen 0: Sign-In
- Displayed on first launch (or if not signed in)
- Single option: **Google Sign-In** button (standard Google branding)
- No other sign-in methods
- On success, proceed to Home screen
- Persist session (user stays signed in until they sign out)

### Screen 1: Home
- Era slider (Silver Screen ← → Now)
- Sample thumbnail showing selected era's style
- "Take Photo" button
- Profile/settings icon (top corner) with sign-out option

### Screen 2: Camera
- Opens native camera interface (system camera)
- User adjusts, frames, and captures with standard camera button
- On capture, proceeds to processing

### Screen 3: Processing (Transition)
- Fun/engaging loading state while Gemini transforms the image
- Visual feedback so user knows something is happening
- Keep it interesting so they don't get bored

### Screen 4: Result
- Displays the transformed image
- Two action buttons:
  - **Save** — saves to device photo gallery
  - **Share** — opens native OS share sheet (user picks destination)

### Flow Summary
1. Open app → Sign-In screen (if not authenticated)
2. Tap Google Sign-In → Authenticate
3. On success → Home screen
4. Slide to select era, see sample thumbnail
5. Tap "Take Photo" → Camera opens
6. Take photo → Processing screen (fun loading state)
7. Transformation complete → Result screen
8. Save or share

## Design & Theme

### Principles
- **Clean & Minimalistic** — No clutter, generous whitespace, clear visual hierarchy
- **Modern** — Contemporary UI patterns, smooth animations, polished feel
- **Fun & Playful** — Delightful micro-interactions, engaging loading states, personality without being childish
- **Accessible** — Easy for all ages, intuitive without instructions needed

### Visual Style
- **Color palette:** Vibrant but not overwhelming; consider a primary accent color with neutral backgrounds
- **Typography:** Modern sans-serif, good readability, clear hierarchy
- **Shapes:** Rounded corners, soft edges, friendly feel
- **Animations:** Smooth transitions, subtle feedback on interactions, playful loading states
- **Icons:** Simple, recognizable, consistent style

### Target Audience
- Broad range of users (all ages, tech-savvy and casual users alike)
- Should feel instantly familiar and usable
- Should also feel like a "cool, modern app" worth showing off

---

## Technical Stack

### Client
- **Framework:** Flutter (Dart)
- **Target platforms:** Android first, then iOS
- **Camera:** Flutter camera plugin with native CameraX integration

### Backend & Infrastructure
- **Cloud:** Google Cloud Platform (GCP)
- **App services:** Firebase
  - **Auth:** Firebase Authentication (Google Sign-In only)
  - **Database:** Firestore (user preferences, history)
  - **Distribution:** Firebase App Distribution (beta testing)
- **AI:** Gemini API (image transformation)
  - **Model:** `gemini-3-pro-image-preview` (codename: **Nano Banana Pro**)
  - Direct API calls from app (no Cloud Function middleman)
  - API key stored in app (acceptable for limited private distribution)
  - Prompts bundled in app (see Appendix A for finalized prompts)

### Project Setup
- **Display name:** TimeLens
- **Project ID:** `timelens-jt`
- **Billing account:** `01653C-6160E0-3BDE23` (My Billing Account)
- GCP project with billing enabled ✓
- Gemini API enabled ✓
- API key created ✓

### Distribution
- **Method:** Firebase App Distribution
- **Signing:** Debug builds (no release keystore required)
- **Tester:** john.thomas@gmail.com

### Principles
- Keep it simple and focused
- Android first, iOS later
- Firebase all the way for backend needs

---

## Build Plan (with Verification Steps)

### Phase 1: Infrastructure Setup
1. **Create GCP project** (`timelens-jt`) ✅ DONE
   - Link billing account ✅
   - Gemini API enabled ✅
   - API key created ✅

2. **Set up Firebase project**
   - Add Firebase to GCP project
   - Enable Firebase Authentication with Google Sign-In provider
   - Configure OAuth consent screen in GCP
   - Configure Firebase App Distribution
   - Add tester (john.thomas@gmail.com)
   - ✓ Verify: `firebase projects:list` shows timelens-jt, Auth provider enabled

### Phase 2: App Scaffold & Theme
4. **Create Flutter project**
   - Initialize project structure
   - ✓ Verify: `flutter run` launches blank app on emulator

5. **Implement app theme & design system**
   - Color palette, typography, common widgets
   - ✓ Verify: Visual inspection — looks clean, modern, matches design principles

### Phase 3: Core Screens (Build & Test Each)
6. **Sign-In Screen**
   - Google Sign-In button (standard branding)
   - Firebase Auth integration
   - Session persistence
   - ✓ Verify: Tap sign-in, Google auth flow completes, user signed in, app remembers on restart

   **Sign-Out (in Home screen)**
   - Profile/settings icon in top corner
   - Tap to reveal sign-out option
   - ✓ Verify: Sign-out clears session, returns to Sign-In screen

7. **Home Screen**
   - Era slider with 6 positions
   - Era name/label display
   - Sample thumbnail (placeholder initially)
   - "Take Photo" button
   - ✓ Verify: Slider moves smoothly, labels update, button is tappable

8. **Camera Integration**
   - Open native camera on button tap
   - Capture photo and receive image back
   - ✓ Verify: Camera opens, photo captured, image data returned to app

9. **Processing Screen**
   - Fun loading animation
   - Receives image, displays processing state
   - ✓ Verify: Animation plays smoothly, screen displays correctly

10. **Result Screen**
    - Display transformed image
    - Save button (saves to gallery)
    - Share button (opens native share sheet)
    - ✓ Verify: Image displays, save works, share sheet opens

### Phase 4: AI Integration
11. **Gemini API integration**
    - Send captured image + era prompt to Gemini
    - Receive transformed image
    - ✓ Verify: End-to-end test — capture photo, send to API, receive transformed result

12. **Prompt tuning** ✅ DONE
    - Prompts finalized and tested (see Appendix A)
    - All 6 eras produce distinctly different, high-quality transformations ✅

### Phase 5: Sample Thumbnails ✅ DONE
13. **Era sample images generated**
    - Base image: AI-generated family of 4 in living room ✅
    - Transformed into all 6 era styles using Nano Banana Pro ✅
    - Ready to bundle as app assets at `docs/era_thumbnails/` ✅

### Phase 6: Polish & Deploy
14. **UI polish**
    - Smooth transitions between screens
    - Error handling (API failures, camera permission denied, etc.)
    - ✓ Verify: Full user flow feels smooth and handles edge cases gracefully

15. **Build release APK**
    - Debug-signed APK
    - ✓ Verify: APK installs and runs on emulator

16. **Deploy to Firebase App Distribution**
    - Upload APK
    - Notify tester
    - ✓ Verify: Tester receives email, can download and install app

---

## Appendix A: Finalized Era Prompts

These prompts are used with model `gemini-3-pro-image-preview` (Nano Banana Pro) to transform user photos.

### 1. Silver Screen (1920s)
```
Transform this photo into an authentic 1920s "Silver Screen" era scene:

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

Keep the people and composition similar. Make it look like a genuine 1920s photograph.
```

### 2. Atomic (1950s)
```
Transform this photo into an authentic 1950s "Atomic" era scene:

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

Keep the people and composition similar. Make it look like a genuine 1950s color photograph.
```

### 3. Groovy (1970s)
```
Transform this photo into an authentic 1970s "Groovy" era scene:

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

Keep the people and composition similar. Make it look like a genuine 1970s photograph.
```

### 4. Neon Dreams (1980s)
```
Transform this photo into a stylized 1980s "Neon Dreams" scene:

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

Keep the people and composition similar. Make it look like a stylized 1980s photograph with neon lighting accents.
```

### 5. Y2K (2000s)
```
Transform this photo into an authentic early 2000s "Y2K" millennium style scene:

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

Keep the people and composition similar. Make it look like an early 2000s digital photograph.
```

### 6. Now (Today)
```
Enhance this photo with a modern "Now" contemporary style:

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

Keep the people and composition similar. Make it look like a high-quality contemporary lifestyle photograph.
```
