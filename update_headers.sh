#!/bin/bash

# Script to update all HTML files with new header structure
# This ensures consistent header across the entire site

echo "🔄 Updating headers across all pages..."

# Define the new header HTML
read -r -d '' NEW_HEADER << 'EOF'
    <!-- Global Header Component -->
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
    </header>
EOF

echo "✅ Header update script ready"
echo "📝 Note: Manual updates recommended for precise control"
