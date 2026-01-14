import 'package:flutter/material.dart';

void main() {
  runApp(const PriceCompareApp());
}

class PriceCompareApp extends StatelessWidget {
  const PriceCompareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PriceCompare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _categories = [
    {'icon': Icons.phone_android, 'title': 'Electronics', 'color': Colors.blue},
    {'icon': Icons.local_grocery_store, 'title': 'Grocery', 'color': Colors.green},
    {'icon': Icons.directions_car, 'title': 'Automotive', 'color': Colors.orange},
    {'icon': Icons.home, 'title': 'Home & Kitchen', 'color': Colors.purple},
    {'icon': Icons.palette, 'title': 'Fashion', 'color': Colors.pink},
    {'icon': Icons.sports_baseball, 'title': 'Sports', 'color': Colors.red},
  ];

  final List<Map<String, dynamic>> _trendingProducts = [
    {
      'name': 'Wireless Headphones',
      'price': 99.99,
      'originalPrice': 149.99,
      'rating': 4.5,
      'reviews': 1243,
      'storeCount': 8,
    },
    {
      'name': 'Smart Watch Series 5',
      'price': 299.99,
      'originalPrice': 399.99,
      'rating': 4.7,
      'reviews': 2341,
      'storeCount': 6,
    },
    {
      'name': 'Gaming Laptop',
      'price': 1299.99,
      'originalPrice': 1599.99,
      'rating': 4.8,
      'reviews': 876,
      'storeCount': 5,
    },
    {
      'name': 'Coffee Machine',
      'price': 89.99,
      'originalPrice': 129.99,
      'rating': 4.3,
      'reviews': 1567,
      'storeCount': 7,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              _buildHeader(),
              
              // Hero Banner
              _buildHeroBanner(),
              
              // Categories Section
              _buildCategoriesSection(),
              
              // Trending Products Section
              _buildTrendingProductsSection(),
              
              // Features Section
              _buildFeaturesSection(),
              
              // Footer
              _buildFooter(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          Row(
            children: [
              // Logo
              const Row(
                children: [
                  Icon(Icons.compare_arrows, color: Colors.blue, size: 28),
                  SizedBox(width: 8),
                  Text(
                    'PriceCompare',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              
              const Spacer(),
              
              // Desktop Navigation
              if (MediaQuery.of(context).size.width > 768)
                Row(
                  children: [
                    _buildNavItem('Home', 0),
                    _buildNavItem('Categories', 1),
                    _buildNavItem('Compare', 2),
                    _buildNavItem('Deals', 3),
                    _buildNavItem('Help', 4),
                  ],
                ),
              
              // User Icon
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person_outline),
              ),
            ],
          ),
          
          // Search Bar
          const SizedBox(height: 16),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey[400]!),
            ),
            child: Row(
              children: [
                const SizedBox(width: 16),
                const Icon(Icons.search, color: Colors.grey),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search for products, brands, or categories...',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Center(
                    child: Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        style: TextButton.styleFrom(
          foregroundColor: _selectedIndex == index ? Colors.blue : Colors.grey[700],
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildHeroBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue.shade50, Colors.blue.shade100],
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 768) {
            return Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Find the Best Prices,\nSave More Money',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Compare prices across thousands of stores to find the best deals. Save up to 70% on your favorite products.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[700],
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Start Comparing',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.blue),
                            ),
                            child: const Center(
                              child: Text(
                                'Learn More',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 60),
                Container(
                  width: 400,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.1),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.compare_arrows, color: Colors.blue, size: 80),
                      const SizedBox(height: 20),
                      const Text(
                        'Compare Prices\nFrom Multiple Stores',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Find the Best Prices,\nSave More Money',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Compare prices across thousands of stores to find the best deals.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Center(
                    child: Text(
                      'Start Comparing',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Shop by Category',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Browse products by category',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 30),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 768 ? 6 : 3;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.8,
                ),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  return _buildCategoryCard(category);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(Map<String, dynamic> category) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: (category['color'] as Color).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              category['icon'] as IconData,
              color: category['color'] as Color,
              size: 30,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            category['title'] as String,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingProductsSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trending Products',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Most compared products this week',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: MediaQuery.of(context).size.width > 768 
                ? Axis.horizontal 
                : Axis.vertical,
            child: MediaQuery.of(context).size.width > 768
                ? Row(
                    children: _trendingProducts.map((product) {
                      return Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 280,
                        child: _buildProductCard(product),
                      );
                    }).toList(),
                  )
                : Column(
                    children: _trendingProducts.map((product) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: _buildProductCard(product),
                      );
                    }).toList(),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image Placeholder
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: const Center(
              child: Icon(Icons.shopping_bag, color: Colors.grey, size: 60),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'] as String,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '\$${product['price']}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '\$${product['originalPrice']}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[500],
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.green, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            '${product['rating']}',
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  '${product['reviews']} reviews • ${product['storeCount']} stores',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.compare_arrows, color: Colors.white, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Compare Prices',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(Icons.favorite_border, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Why Choose PriceCompare?',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'We make price comparison easy and reliable',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 768) {
                return const Row(
                  children: [
                    Expanded(child: _FeatureCard(
                      icon: Icons.compare_arrows,
                      title: 'Real-time Price Comparison',
                      description: 'Compare prices from hundreds of retailers instantly',
                    )),
                    SizedBox(width: 20),
                    Expanded(child: _FeatureCard(
                      icon: Icons.bolt,
                      title: 'Price Alerts',
                      description: 'Get notified when prices drop on your favorite products',
                    )),
                    SizedBox(width: 20),
                    Expanded(child: _FeatureCard(
                      icon: Icons.verified_user,
                      title: 'Verified Reviews',
                      description: 'Read genuine reviews from verified buyers',
                    )),
                  ],
                );
              } else {
                return Column(
                  children: const [
                    _FeatureCard(
                      icon: Icons.compare_arrows,
                      title: 'Real-time Price Comparison',
                      description: 'Compare prices from hundreds of retailers instantly',
                    ),
                    SizedBox(height: 20),
                    _FeatureCard(
                      icon: Icons.bolt,
                      title: 'Price Alerts',
                      description: 'Get notified when prices drop on your favorite products',
                    ),
                    SizedBox(height: 20),
                    _FeatureCard(
                      icon: Icons.verified_user,
                      title: 'Verified Reviews',
                      description: 'Read genuine reviews from verified buyers',
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      color: Colors.blue[900],
      padding: const EdgeInsets.all(40),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 768) {
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.compare_arrows, color: Colors.white, size: 28),
                              SizedBox(width: 8),
                              Text(
                                'PriceCompare',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Find the best prices across thousands of stores. Save money on every purchase with our intelligent price comparison tool.',
                            style: TextStyle(
                              color: Colors.grey[300],
                              fontSize: 16,
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 60),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Quick Links',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildFooterLink('Home'),
                          _buildFooterLink('Categories'),
                          _buildFooterLink('Price Comparison'),
                          _buildFooterLink('Deals'),
                          _buildFooterLink('About Us'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Support',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildFooterLink('Help Center'),
                          _buildFooterLink('Contact Us'),
                          _buildFooterLink('Privacy Policy'),
                          _buildFooterLink('Terms of Service'),
                          _buildFooterLink('FAQ'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Contact Us',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildContactInfo(Icons.email, 'support@pricecompare.com'),
                          _buildContactInfo(Icons.phone, '+1 (555) 123-4567'),
                          _buildContactInfo(Icons.location_on, '123 Commerce St, City'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Divider(color: Colors.white24),
                const SizedBox(height: 20),
                Text(
                  '© 2024 PriceCompare. All rights reserved.',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.compare_arrows, color: Colors.white, size: 28),
                    SizedBox(width: 8),
                    Text(
                      'PriceCompare',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Find the best prices across thousands of stores. Save money on every purchase.',
                  style: TextStyle(
                    color: Colors.grey[300]!,
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFooterLink('Home'),
                    _buildFooterLink('Categories'),
                    _buildFooterLink('Price Comparison'),
                    _buildFooterLink('Deals'),
                    _buildFooterLink('About Us'),
                  ],
                ),
                const SizedBox(height: 30),
                const Divider(color: Colors.white24),
                const SizedBox(height: 20),
                Text(
                  '© 2024 PriceCompare. All rights reserved.',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey[300],
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[300], size: 20),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return MediaQuery.of(context).size.width < 768
        ? BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.compare_arrows),
                label: 'Compare',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_offer),
                label: 'Deals',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: Colors.blue, size: 30),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}