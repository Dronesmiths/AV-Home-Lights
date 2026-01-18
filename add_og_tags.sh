#!/bin/bash

# Script to add Open Graph and Twitter Card meta tags to all pages

# About page
cat > /tmp/og_about.txt << 'EOF'

    <!-- Open Graph / Facebook -->
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://avhomelights.com/about/">
    <meta property="og:title" content="About AV Home Lighting | Expert LED Lighting in Antelope Valley">
    <meta property="og:description" content="Learn about AV Home Lighting's mission to provide professional LED lighting and security systems for Antelope Valley homes. Meet our team and discover our commitment to quality.">
    <meta property="og:image" content="https://avhomelights.com/images/andrew-manager.webp">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://avhomelights.com/about/">
    <meta property="twitter:title" content="About AV Home Lighting | Expert LED Lighting in Antelope Valley">
    <meta property="twitter:description" content="Learn about AV Home Lighting's mission to provide professional LED lighting and security systems for Antelope Valley homes.">
    <meta property="twitter:image" content="https://avhomelights.com/images/andrew-manager.webp">
EOF

# Contact page
cat > /tmp/og_contact.txt << 'EOF'

    <!-- Open Graph / Facebook -->
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://avhomelights.com/contact/">
    <meta property="og:title" content="Contact Us - AV Home Lighting">
    <meta property="og:description" content="Get a free LED lighting consultation for your Antelope Valley home. Call (661) 486-2640 or request a quote online. Professional service in Palmdale, Lancaster & surrounding areas.">
    <meta property="og:image" content="https://avhomelights.com/images/hero-home-lighting.webp">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://avhomelights.com/contact/">
    <meta property="twitter:title" content="Contact Us - AV Home Lighting">
    <meta property="twitter:description" content="Get a free LED lighting consultation for your Antelope Valley home. Call (661) 486-2640 or request a quote online.">
    <meta property="twitter:image" content="https://avhomelights.com/images/hero-home-lighting.webp">
EOF

# Services page
cat > /tmp/og_services.txt << 'EOF'

    <!-- Open Graph / Facebook -->
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://avhomelights.com/services/">
    <meta property="og:title" content="LED Lighting Services | AV Home Lighting">
    <meta property="og:description" content="Professional LED lighting services for Antelope Valley homes: Security lighting, holiday displays, Christmas packages, landscape lighting, and integrated camera systems.">
    <meta property="og:image" content="https://avhomelights.com/images/hero-home-lighting.webp">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://avhomelights.com/services/">
    <meta property="twitter:title" content="LED Lighting Services | AV Home Lighting">
    <meta property="twitter:description" content="Professional LED lighting services for Antelope Valley homes: Security lighting, holiday displays, Christmas packages, and more.">
    <meta property="twitter:image" content="https://avhomelights.com/images/hero-home-lighting.webp">
EOF

echo "OG tag templates created successfully!"
