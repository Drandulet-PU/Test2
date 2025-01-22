import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

void main() {
  runApp(EskerLandApp());
}

class EskerLandApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Эшкер Лэнд',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey.shade200,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/qa': (context) => QA(),
        '/provide': (context) => ProvideHousing(),
        '/chatbot': (context) => ChatbotPage(),
        '/favorites': (context) => FavoritesPage(),
        '/notifications': (context) => NotificationsPage(),
        '/profile': (context) => ProfilePage(),
        '/settings': (context) => SettingsPage(),
        '/contact': (context) => ContactPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Эшкер Лэнд',
          style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        actions: [
          _buildHeaderButton(context, 'Главная', '/'),
          _buildHeaderButton(context, 'Q&A', '/qa'),
          _buildHeaderButton(context, 'Жильё', '/provide'),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroSection(),
            SizedBox(height: 16),
            _buildHousingSlider(),
            SizedBox(height: 16),
            _buildQuickLinks(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent]),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Добро пожаловать в Эшкер Лэнд!',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            'Ваш надёжный помощник в поиске и предоставлении жилья.',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderButton(BuildContext context, String title, String route) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, route),
      child: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildHousingSlider() {
    final List<Map<String, String>> housingList = [
      {'title': 'Квартира в Москве', 'description': 'Уютная квартира в центре города.'},
      {'title': 'Дом в Казани', 'description': 'Просторный дом для большой семьи.'},
      {'title': 'Комната в Санкт-Петербурге', 'description': 'Уютная комната в историческом центре.'},
      {'title': 'Квартира в Новосибирске', 'description': 'Стильная квартира для одного.'},
    ];

    return SizedBox(
      height: 220,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        itemCount: housingList.length,
        itemBuilder: (context, index) {
          final item = housingList[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      item['description']!,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildQuickLinks(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildQuickLinkCard(context, Icons.favorite, 'Избранное', '/favorites'),
              _buildQuickLinkCard(context, Icons.notifications, 'Уведомления', '/notifications'),
              _buildQuickLinkCard(context, Icons.contact_mail, 'Поддержка', '/chatbot'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickLinkCard(BuildContext context, IconData icon, String title, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 32, color: Colors.blue),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Q&A',
          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info, color: Colors.black, size: 28), // Иконка информации
            onPressed: () {
              // Действие при нажатии на иконку (например, показать всплывающее окно или справку)
            },
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Назад', style: TextStyle(color: Colors.black, fontSize: 18)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Q&A',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildExpansionTile(
              question: 'Как работает Эшкере Лэнд?',
              answer: 'Эшкер Лэнд — это сервис для поиска и предоставления жилья. Он предлагает пользователям удобный интерфейс для поиска квартир, домов и комнат, а также возможность предложить своё жильё для аренды. Система проста в использовании, и каждый может легко найти нужный объект.',
            ),
            SizedBox(height: 16),
            _buildExpansionTile(
              question: 'Как подать заявку на жильё?',
              answer: 'Чтобы подать заявку на жильё, нужно заполнить форму на странице "Предоставить жильё", указав все необходимые данные о своём объекте. Включите подробное описание, фотографии и контактные данные. После подачи заявки ваша информация будет проверена, и вы получите ответ в течение 2-3 рабочих дней.',
            ),
            SizedBox(height: 16),
            _buildExpansionTile(
              question: 'Как связаться с поддержкой?',
              answer: 'Для связи с поддержкой вы можете отправить запрос через наш чат-бот в Telegram. Мы стараемся отвечать на все запросы в течение нескольких часов. Или просто прийти в Общагу МАДИ корпус 2 и найти Юру Гарборя. Он скорее всего будет спать или просто не будет отвечать вам, потому, что в целом ему плевать. Но попробовать стоит.',
            ),
            SizedBox(height: 16),
            _buildExpansionTile(
              question: 'Что такое избранное?',
              answer: 'Это список ваших любимых объектов, которые можно сохранить для быстрого доступа.',
            ),
            SizedBox(height: 16),
            _buildExpansionTile(
              question: 'Как настроить уведомления?',
              answer: 'Уведомления можно настроить в разделе "Настройки".',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpansionTile({required String question, required String answer}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        title: Text(
          question,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              answer,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}

class ProvideHousing extends StatefulWidget {
  @override
  _ProvideHousingState createState() => _ProvideHousingState();
}

class _ProvideHousingState extends State<ProvideHousing> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> _sendEmail() async {
    final String username = 'kulinovhotnikov@gmail.com';  // Укажи свою почту
    final String password = 'your_password';  // Укажи пароль или App Password (если включена двухфакторка)

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'Эшкер Лэнд')
      ..recipients.add('kulinovhotnikov@gmail.com')  // Укажи получателя
      ..subject = 'Новая заявка на жильё'
      ..text = '''
Имя: ${_nameController.text}
Email: ${_emailController.text}
Описание: ${_descriptionController.text}
      ''';

    try {
      final sendReport = await send(message, smtpServer);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Заявка успешно отправлена!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка при отправке: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Предоставить жильё',
          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Назад', style: TextStyle(color: Colors.black, fontSize: 18)),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Заполните форму, чтобы предложить жильё:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Имя', border: OutlineInputBorder()),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Описание', border: OutlineInputBorder()),
              maxLines: 4,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _sendEmail,
              child: Text('Отправить'),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatbotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Поддержка',
          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => _launchURL('https://t.me/PrincessSupport_bot'),
          child: Text(
            'Написать в поддержку',
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) {
    print('Открытие ссылки: $url');
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Избранное',
          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Text('Здесь будут избранные объявления'),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Уведомления',
          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Text('Здесь будут уведомления'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Профиль',
          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Text('Здесь будет профиль пользователя'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Настройки',
          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Text('Здесь будут настройки'),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Контакты',
          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Text('Здесь будут контактные данные'),
      ),
    );
  }
}
