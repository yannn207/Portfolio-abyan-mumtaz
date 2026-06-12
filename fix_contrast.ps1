$content = Get-Content -Raw index.html

# 1. Root variables (Dark mode)
$content = $content -replace '--bg-color: #F5F8F2;', '--bg-color: #0a0a0a;'
$content = $content -replace '--text-primary: #2C3E2B;', '--text-primary: #ffffff;'
$content = $content -replace '--text-secondary: #5A6E59;', '--text-secondary: #E5E5E5;'

# 2. Revert dark backgrounds for sections (Leaving CTA alone)
$content = $content -replace '\.skills-section \{\s*padding: 8rem 4rem;\s*background-color: #E2EFE0;\s*\}', ".skills-section {`r`n            padding: 8rem 4rem;`r`n            background-color: #050505;`r`n        }"
$content = $content -replace '\.skills-card \{\s*background-color: #ffffff;', '.skills-card { background-color: #0a0a0a;'
$content = $content -replace '\.showcase-section \{\s*padding: 8rem 4rem;\s*background-color: #E2EFE0;\s*\}', ".showcase-section {`r`n            padding: 8rem 4rem;`r`n            background-color: #0f0f0f;`r`n        }"
$content = $content -replace 'linear-gradient\(to bottom, var\(--bg-color\), #E2EFE0\)', 'linear-gradient(to bottom, var(--bg-color), #0f0f0f)'
$content = $content -replace '\.testimonial-section \{\s*padding: 8rem 4rem;\s*background-color: #E2EFE0;\s*\}', ".testimonial-section {`r`n            padding: 8rem 4rem;`r`n            background-color: #050505;`r`n        }"
$content = $content -replace '\.testimonial-card \{\s*background-color: #ffffff;', '.testimonial-card { background-color: #0a0a0a;'
$content = $content -replace '\.modal-container \{\s*background-color: #ffffff;', '.modal-container { background-color: #0a0a0a;'

# 3. Navbar fixes
$content = $content -replace '\.nav-links a \{\s*color: var\(--text-primary\);', '.nav-links a { color: #ffffff;'
$content = $content -replace 'color: var\(--text-primary\);\s*\}\s*\.nav-contact-wrapper', "color: var(--accent-green);`r`n        }`r`n`r`n        .nav-contact-wrapper"
$content = $content -replace '\.nav-contact \{\s*color: var\(--text-primary\);', '.nav-contact { color: #ffffff;'

# 4. Language toggle fixes
$content = $content -replace '\.lang-btn \{\s*padding: 4px 12px;[\s\S]*?background: transparent;\s*\}', ".lang-btn {`r`n            padding: 4px 12px;`r`n            border-radius: 50px;`r`n            font-size: 0.7rem;`r`n            font-weight: 800;`r`n            cursor: pointer;`r`n            transition: all 0.3s ease;`r`n            color: #a0a0a0;`r`n            border: none;`r`n            background: transparent;`r`n        }"

$content = $content -replace '\.lang-btn\.active \{\s*background: var\(--accent-green\);\s*color: #ffffff;\s*\}', ".lang-btn.active {`r`n            background: var(--accent-green);`r`n            color: #0a0a0a;`r`n        }"

# 5. Form inputs background
$content = $content -replace 'background-color: #F5F8F2;', 'background-color: rgba(255, 255, 255, 0.03);'

# 6. Navbar and Overlay Backgrounds
$content = $content -replace 'background: rgba\(245, 248, 242, 0\.85\);', 'background: rgba(10, 10, 10, 0.85);'
$content = $content -replace 'background-color: rgba\(245, 248, 242, 0\.85\);', 'background-color: rgba(0, 0, 0, 0.85);'
$content = $content -replace 'background-color: rgba\(245, 248, 242, 0\.7\);', 'background-color: rgba(0, 0, 0, 0.4);'

Set-Content -Path index.html -Value $content
