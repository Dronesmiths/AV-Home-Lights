#!/usr/bin/env python3
"""
Batch update all HTML files with new global header
"""

import os
import re

# New header HTML
NEW_HEADER = '''    <!-- Global Header Component -->
    <header class="site-header">
        <div class="header-container">
            <!-- Logo -->
            <a href="/" class="site-logo">
                AV Home <span class="logo-accent">Lighting</span>
            </a>

            <!-- Desktop Navigation -->
            <nav class="desktop-nav">
                <a href="/" class="nav-link">Home</a>
                <a href="/services/" class="nav-link">Services</a>
                <a href="/about/" class="nav-link">About Us</a>
                <a href="/contact/" class="nav-link">Contact</a>
            </nav>

            <!-- Header Actions -->
            <div class="header-cta">
                <a href="tel:6614862640" class="phone-btn">
                    <i class="fas fa-phone"></i>
                    <span class="phone-number">(661) 486-2640</span>
                </a>
                <a href="/contact/" class="cta-btn">Free Lighting Design</a>
            </div>

            <!-- Mobile Menu Toggle -->
            <button class="mobile-toggle" aria-label="Menu" id="mobileMenuBtn">
                <span class="hamburger-line"></span>
                <span class="hamburger-line"></span>
                <span class="hamburger-line"></span>
            </button>
        </div>

        <!-- Mobile Navigation Overlay -->
        <div class="mobile-nav-overlay" id="mobileNavOverlay">
            <div class="mobile-nav-content">
                <a href="/" class="mobile-nav-link">Home</a>
                <a href="/services/" class="mobile-nav-link">Services</a>
                <a href="/about/" class="mobile-nav-link">About Us</a>
                <a href="/contact/" class="mobile-nav-link">Contact</a>
                <a href="tel:6614862640" class="mobile-phone-link">
                    <i class="fas fa-phone"></i> (661) 486-2640
                </a>
            </div>
        </div>
    </header>'''

# Pattern to match old header
OLD_HEADER_PATTERN = r'    <!-- Header -->.*?</header>'

# Files to update
files_to_update = [
    'about/index.html',
    'contact/index.html',
    'services/index.html',
    'locations/palmdale/index.html',
    'locations/lancaster/index.html',
    'locations/quartz-hill/index.html',
    'locations/rosamond/index.html',
    'locations/lake-los-angeles/index.html',
    'locations/littlerock/index.html',
]

base_dir = '/Users/briansmith/Documents/GitHub/AV-Home-Lights'

for file_path in files_to_update:
    full_path = os.path.join(base_dir, file_path)
    
    if not os.path.exists(full_path):
        print(f"⚠️  Skipping {file_path} (not found)")
        continue
    
    with open(full_path, 'r') as f:
        content = f.read()
    
    # Replace old header with new header
    new_content = re.sub(OLD_HEADER_PATTERN, NEW_HEADER, content, flags=re.DOTALL)
    
    # Add header.css if not present
    if 'header.css' not in new_content:
        # Determine correct path depth
        depth = file_path.count('/')
        css_path = '../' * depth + 'css/header.css?v=2.0'
        
        # Add after styles.css
        new_content = new_content.replace(
            'href="../css/styles.css' if depth == 1 else 'href="/css/styles.css',
            f'href="{"../" * depth}css/styles.css?v=1.8">\n    <link rel="stylesheet" href="{css_path}'
        )
    
    # Add header.js if not present
    if 'header.js' not in new_content:
        depth = file_path.count('/')
        js_path = '../' * depth + 'js/header.js'
        
        # Add before script.js
        new_content = new_content.replace(
            '<script src="../js/script.js' if depth == 1 else '<script src="/js/script.js',
            f'<script src="{js_path}"></script>\n    <script src="{"../" * depth}js/script.js'
        )
    
    with open(full_path, 'w') as f:
        f.write(new_content)
    
    print(f"✅ Updated {file_path}")

print("\n🎉 All files updated successfully!")
