$content = Get-Content -Raw index.html

# 1. Root variables
$content = $content -replace '--bg-color: #0a0a0a;', '--bg-color: #ffffff;'
$content = $content -replace '--text-primary: #ffffff;', '--text-primary: #000000;'
$content = $content -replace '--text-secondary: #E5E5E5;', '--text-secondary: #333333;'

# 2. Backgrounds
$content = $content -replace 'background-color: #050505;', 'background-color: #f9f9f9;'
$content = $content -replace 'background-color: #0f0f0f;', 'background-color: #ffffff;'
$content = $content -replace 'background-color: #0a0a0a;', 'background-color: #ffffff;'
$content = $content -replace 'linear-gradient\(to bottom, var\(--bg-color\), #0f0f0f\)', 'linear-gradient(to bottom, var(--bg-color), #f9f9f9)'

# 3. Navbar and Layout
$content = $content -replace 'background-color: rgba\(10, 10, 10, 0\.85\);', 'background-color: rgba(255, 255, 255, 0.95);'
$content = $content -replace '\.nav-links a \{ color: #ffffff;', '.nav-links a { color: #000000;'
$content = $content -replace '\.nav-contact \{ color: #ffffff;', '.nav-contact { color: #000000;'

# 4. Modal and Overlays
$content = $content -replace 'background-color: rgba\(0, 0, 0, 0\.85\);', 'background-color: rgba(0, 0, 0, 0.5);'
$content = $content -replace 'background-color: rgba\(255, 255, 255, 0\.03\);', 'background-color: #f9f9f9;'
$content = $content -replace 'color: #ffffff;\s*border: 1px solid #ffffff;', 'color: #ffffff; border: 1px solid #ffffff;' # View Project overlay - keep white

# 5. Language Toggle
$content = $content -replace 'color: #a0a0a0;', 'color: #666666;'
$content = $content -replace 'color: #0a0a0a;', 'color: #ffffff;' # Active state text

# 6. Specific overrides for CTA (if any need to change to white/black instead of Sage green)
# The user said "keseluruhan web", so let's make CTA white too?
# "warna dasar ubah ke warna putih untuk keseluruhan web untuk kata2 ubah ke warna hitam"
# Let's change CTA background #E2EFE0 to #ffffff or #f9f9f9 to be safe.
$content = $content -replace 'background: #E2EFE0;', 'background: #f9f9f9;'
$content = $content -replace 'color: #2C3E2B;', 'color: #000000;'

Set-Content -Path index.html -Value $content
