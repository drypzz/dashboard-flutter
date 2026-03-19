import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Responsivo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    List<Widget> cards = [
      const DashboardCard(
        title: 'Usuários Ativos',
        value: '1.234',
        icon: Icons.people_alt,
        backgroundColor: Colors.blueAccent,
      ),
      const DashboardCard(
        title: 'Receita Mensal',
        value: 'R\$ 5.000',
        icon: Icons.monetization_on,
        backgroundColor: Colors.green,
      ),
      const DashboardCard(
        title: 'Novos Pedidos',
        value: '84',
        icon: Icons.shopping_bag,
        backgroundColor: Colors.orange,
      ),
      const DashboardCard(
        title: 'Sessões',
        value: '9.012',
        icon: Icons.analytics,
        backgroundColor: Colors.purpleAccent,
      ),
    ];

    Widget layout;

    if (width < 600) {
      layout = Column(
        children: cards
            .map(
              (c) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: c,
              ),
            )
            .toList(),
      );
    } else if (width <= 900) {
      layout = Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        children: cards
            .map(
              (c) => SizedBox(
                // Subtraindo paddings laterais e espaçamento central para criar as 2 colunas perfeitamente
                width: (width - 32 - 16) / 2,
                child: c,
              ),
            )
            .toList(),
      );
    } else {
      layout = Row(
        children: cards
            .map(
              (c) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: c,
                ),
              ),
            )
            .toList(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard Responsivo',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      // SingleChildScrollView permite rolagem no celular caso a tela seja muito pequena
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: layout,
      ),
    );
  }
}

// 4. Widget customizado e reutilizável para os Cards
class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color backgroundColor;

  // Aceitando os parâmetros exigidos: título, valor, ícone e cor
  const DashboardCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          16.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            child: Icon(
              icon,
              size: 110,
              color: Colors.white.withValues(alpha: 0.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(icon, color: Colors.white),
                  ],
                ),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
