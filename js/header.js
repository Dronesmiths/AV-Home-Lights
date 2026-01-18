/**
 * Global Header Navigation Script
 * Handles mobile menu toggle and smooth interactions
 */

(function () {
    'use strict';

    // Wait for DOM to be ready
    document.addEventListener('DOMContentLoaded', function () {

        // Get elements
        const mobileMenuBtn = document.getElementById('mobileMenuBtn');
        const mobileNavOverlay = document.getElementById('mobileNavOverlay');
        const mobileNavLinks = document.querySelectorAll('.mobile-nav-link');
        const body = document.body;

        // Check if elements exist
        if (!mobileMenuBtn || !mobileNavOverlay) {
            console.warn('Header: Mobile menu elements not found');
            return;
        }

        /**
         * Toggle mobile menu
         */
        function toggleMobileMenu() {
            const isActive = mobileNavOverlay.classList.contains('active');

            if (isActive) {
                closeMobileMenu();
            } else {
                openMobileMenu();
            }
        }

        /**
         * Open mobile menu
         */
        function openMobileMenu() {
            mobileNavOverlay.classList.add('active');
            mobileMenuBtn.classList.add('active');
            body.classList.add('mobile-menu-open');
        }

        /**
         * Close mobile menu
         */
        function closeMobileMenu() {
            mobileNavOverlay.classList.remove('active');
            mobileMenuBtn.classList.remove('active');
            body.classList.remove('mobile-menu-open');
        }

        // Mobile menu button click
        mobileMenuBtn.addEventListener('click', function (e) {
            e.preventDefault();
            e.stopPropagation();
            toggleMobileMenu();
        });

        // Close menu when clicking on overlay background
        mobileNavOverlay.addEventListener('click', function (e) {
            if (e.target === mobileNavOverlay) {
                closeMobileMenu();
            }
        });

        // Close menu when clicking any nav link
        mobileNavLinks.forEach(function (link) {
            link.addEventListener('click', function () {
                closeMobileMenu();
            });
        });

        // Close menu on ESC key
        document.addEventListener('keydown', function (e) {
            if (e.key === 'Escape' && mobileNavOverlay.classList.contains('active')) {
                closeMobileMenu();
            }
        });

        // Set active nav link based on current page
        setActiveNavLink();

        /**
         * Set active class on current page nav link
         */
        function setActiveNavLink() {
            const currentPath = window.location.pathname;
            const navLinks = document.querySelectorAll('.nav-link, .mobile-nav-link');

            navLinks.forEach(function (link) {
                const linkPath = link.getAttribute('href');

                // Exact match for home
                if (currentPath === '/' && linkPath === '/') {
                    link.classList.add('active');
                }
                // Match for other pages
                else if (currentPath !== '/' && linkPath !== '/' && currentPath.includes(linkPath)) {
                    link.classList.add('active');
                }
            });
        }

        console.log('Header: Navigation initialized successfully');
    });

})();
