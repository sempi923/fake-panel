import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const HackFireApp());
}

class HackFireApp extends StatelessWidget {
  const HackFireApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HACK-FIRE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF070A0F),
        fontFamily: 'sans-serif',
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00E5FF),
          secondary: Color(0xFFFF0055),
          surface: Color(0xFF101520),
        ),
      ),
      home: const HackFireScreen(),
    );
  }
}

class HackFireScreen extends StatefulWidget {
  const HackFireScreen({super.key});

  @override
  State<HackFireScreen> createState() => _HackFireScreenState();
}

class _HackFireScreenState extends State<HackFireScreen>
    with SingleTickerProviderStateMixin {
  // Estados locales independientes para cada switch simulado
  bool _aimbotSim = false;
  bool _wallhackSim = false;
  bool _fpsOptimization = true; // Activo por defecto para modo ligero
  bool _pingStabilizer = false;

  late AnimationController _glowController;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _glowAnimation = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  void _onActivateAndLaunch() {
    HapticFeedback.heavyImpact();

    // 1. Mensaje emergente (SnackBar)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            SizedBox(
              width: 28,
              height: 28,
              child: CustomPaint(
                painter: SkullPainter(
                  skullColor: Color(0xFF00E5FF),
                  eyeColor: Color(0xFFFF0055),
                ),
              ),
            ),
            SizedBox(width: 14),
            Expanded(
              child: Text(
                'Abre ahora Free Fire',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  letterSpacing: 0.6,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF131A29),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Color(0xFFFF0055), width: 1.5),
        ),
      ),
    );

    // 2. Cuadro de diálogo estilizado con la calavera HACK-FIRE
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return Dialog(
          backgroundColor: const Color(0xFF0F141F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
            side: const BorderSide(color: Color(0xFF00E5FF), width: 1.6),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo de la calavera en el centro del diálogo
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFFF0055).withOpacity(0.12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFF0055).withOpacity(0.35),
                        blurRadius: 24,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const SizedBox(
                    width: 64,
                    height: 64,
                    child: CustomPaint(
                      painter: SkullPainter(
                        skullColor: Color(0xFF00E5FF),
                        eyeColor: Color(0xFFFF0055),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'HACK-FIRE ACTIVADO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF00E5FF),
                    fontSize: 19,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.4,
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF182030),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFFF0055), width: 1.2),
                  ),
                  child: const Text(
                    'Abre ahora Free Fire',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Motor de optimización FX cargado en memoria ligera.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00E5FF),
                      foregroundColor: Colors.black,
                      elevation: 8,
                      shadowColor: const Color(0xFF00E5FF).withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'ACEPTAR',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildTelemetryBar(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                children: [
                  _buildToggleCard(
                    title: 'Ajuste de Mira (Aimbot sim)',
                    subtitle: 'Calibración de retícula y fijación virtual de objetivo',
                    icon: Icons.filter_center_focus,
                    accentColor: const Color(0xFFFF0055),
                    value: _aimbotSim,
                    onChanged: (val) {
                      setState(() => _aimbotSim = val);
                      HapticFeedback.selectionClick();
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildToggleCard(
                    title: 'Visor de Contorno (Wallhack sim)',
                    subtitle: 'Filtro espectral de siluetas de alta visibilidad',
                    icon: Icons.radar,
                    accentColor: const Color(0xFF00E5FF),
                    value: _wallhackSim,
                    onChanged: (val) {
                      setState(() => _wallhackSim = val);
                      HapticFeedback.selectionClick();
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildToggleCard(
                    title: 'Optimización de FPS',
                    subtitle: 'Modo ultra ligero de cuadros estables a 120Hz',
                    icon: Icons.bolt,
                    accentColor: const Color(0xFFFFD600),
                    value: _fpsOptimization,
                    onChanged: (val) {
                      setState(() => _fpsOptimization = val);
                      HapticFeedback.selectionClick();
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildToggleCard(
                    title: 'Estabilizador de Ping',
                    subtitle: 'Filtro simulado de latencia y jitter de paquetes',
                    icon: Icons.wifi_tethering,
                    accentColor: const Color(0xFF00FF9D),
                    value: _pingStabilizer,
                    onChanged: (val) {
                      setState(() => _pingStabilizer = val);
                      HapticFeedback.selectionClick();
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildDisclaimerBox(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            _buildBottomActionButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0F17),
        border: Border(
          bottom: BorderSide(
            color: const Color(0xFFFF0055).withOpacity(0.4),
            width: 1.5,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF0055).withOpacity(0.12),
            blurRadius: 18,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Calavera animada con resplandor neón
          AnimatedBuilder(
            animation: _glowAnimation,
            builder: (context, child) {
              return Container(
                width: 48,
                height: 48,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFF141A28),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color(0xFF00E5FF).withOpacity(_glowAnimation.value),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00E5FF)
                          .withOpacity(0.3 * _glowAnimation.value),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: const CustomPaint(
                  painter: SkullPainter(
                    skullColor: Color(0xFF00E5FF),
                    eyeColor: Color(0xFFFF0055),
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'HACK-FIRE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.4,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.local_fire_department,
                        color: Color(0xFFFF0055), size: 20),
                  ],
                ),
                SizedBox(height: 2),
                Text(
                  'PANEL DE CONFIGURACIÓN FX • V1.1 LIGERA',
                  style: TextStyle(
                    color: Color(0xFF00E5FF),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF00FF9D).withOpacity(0.15),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: const Color(0xFF00FF9D).withOpacity(0.5)),
            ),
            child: const Text(
              'PRO FX',
              style: TextStyle(
                color: Color(0xFF00FF9D),
                fontSize: 10,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTelemetryBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F1522),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF1B2333)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TelemetryItem(label: 'PING', value: '15 ms', color: Color(0xFF00FF9D)),
          _TelemetryItem(label: 'FPS', value: '120 ULTRA', color: Color(0xFF00E5FF)),
          _TelemetryItem(label: 'RAM', value: '45 MB OPT', color: Color(0xFFFFD600)),
        ],
      ),
    );
  }

  Widget _buildToggleCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color accentColor,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: value ? const Color(0xFF131A29) : const Color(0xFF0E131C),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: value ? accentColor.withOpacity(0.85) : const Color(0xFF1A2230),
          width: value ? 1.8 : 1.0,
        ),
        boxShadow: value
            ? [
                BoxShadow(
                  color: accentColor.withOpacity(0.2),
                  blurRadius: 14,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => onChanged(!value),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: value
                        ? accentColor.withOpacity(0.2)
                        : const Color(0xFF161E2C),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: value
                          ? accentColor.withOpacity(0.6)
                          : const Color(0xFF242E42),
                    ),
                  ),
                  child: Icon(
                    icon,
                    color: value ? accentColor : Colors.white38,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: value ? Colors.white : Colors.white70,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Colors.white38,
                          fontSize: 11,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Switch(
                  value: value,
                  onChanged: onChanged,
                  activeColor: accentColor,
                  activeTrackColor: accentColor.withOpacity(0.35),
                  inactiveThumbColor: const Color(0xFF64748B),
                  inactiveTrackColor: const Color(0xFF1E293B),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDisclaimerBox() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0E131C),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF1B2333)),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.shield_outlined, color: Colors.white38, size: 18),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'HACK-FIRE es una demo segura: no requiere permisos de accesibilidad, superposición ni lectura de memoria.',
              style: TextStyle(color: Colors.white38, fontSize: 11, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActionButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: Color(0xFF0B0F17),
        border: Border(top: BorderSide(color: Color(0xFF1B2333), width: 1)),
      ),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [Color(0xFFFF0055), Color(0xFF00E5FF)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFF0055).withOpacity(0.4),
              blurRadius: 18,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: _onActivateAndLaunch,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.play_arrow_rounded, color: Colors.white, size: 30),
              SizedBox(width: 8),
              Text(
                'Activar e Iniciar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TelemetryItem extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _TelemetryItem({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$label: ',
          style: const TextStyle(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}

/// CustomPainter vectorial para el logo de la calavera de HACK-FIRE
class SkullPainter extends CustomPainter {
  final Color skullColor;
  final Color eyeColor;

  const SkullPainter({
    required this.skullColor,
    required this.eyeColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    final Paint skullPaint = Paint()
      ..color = skullColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final Paint eyePaint = Paint()
      ..color = const Color(0xFF070A0F)
      ..style = PaintingStyle.fill;

    final Paint pupilPaint = Paint()
      ..color = eyeColor
      ..style = PaintingStyle.fill;

    final Paint teethPaint = Paint()
      ..color = const Color(0xFF070A0F)
      ..strokeWidth = w * 0.04
      ..style = PaintingStyle.stroke;

    // 1. Silueta del cráneo
    final Path skullPath = Path();
    skullPath.moveTo(w * 0.5, h * 0.12);
    // Borde craneal superior derecho
    skullPath.cubicTo(w * 0.78, h * 0.12, w * 0.88, h * 0.32, w * 0.88, h * 0.50);
    // Pómulo derecho
    skullPath.cubicTo(w * 0.88, h * 0.62, w * 0.78, h * 0.70, w * 0.72, h * 0.74);
    // Mandíbula derecha
    skullPath.lineTo(w * 0.72, h * 0.88);
    skullPath.cubicTo(w * 0.70, h * 0.92, w * 0.65, h * 0.94, w * 0.60, h * 0.94);
    // Base de la mandíbula
    skullPath.lineTo(w * 0.40, h * 0.94);
    skullPath.cubicTo(w * 0.35, h * 0.94, w * 0.30, h * 0.92, w * 0.28, h * 0.88);
    // Mandíbula izquierda
    skullPath.lineTo(w * 0.28, h * 0.74);
    // Pómulo izquierdo
    skullPath.cubicTo(w * 0.22, h * 0.70, w * 0.12, h * 0.62, w * 0.12, h * 0.50);
    // Borde craneal superior izquierdo
    skullPath.cubicTo(w * 0.12, h * 0.32, w * 0.22, h * 0.12, w * 0.5, h * 0.12);
    skullPath.close();

    canvas.drawPath(skullPath, skullPaint);

    // 2. Cuencas de los ojos
    final Path leftEye = Path();
    leftEye.addOval(Rect.fromCenter(
      center: Offset(w * 0.38, h * 0.50),
      width: w * 0.18,
      height: h * 0.22,
    ));
    canvas.drawPath(leftEye, eyePaint);

    final Path rightEye = Path();
    rightEye.addOval(Rect.fromCenter(
      center: Offset(w * 0.62, h * 0.50),
      width: w * 0.18,
      height: h * 0.22,
    ));
    canvas.drawPath(rightEye, eyePaint);

    // 3. Pupilas rojas neón estilo cibernético
    canvas.drawCircle(Offset(w * 0.38, h * 0.51), w * 0.05, pupilPaint);
    canvas.drawCircle(Offset(w * 0.62, h * 0.51), w * 0.05, pupilPaint);

    // 4. Cavidad nasal triangular
    final Path nosePath = Path();
    nosePath.moveTo(w * 0.5, h * 0.62);
    nosePath.lineTo(w * 0.44, h * 0.72);
    nosePath.lineTo(w * 0.56, h * 0.72);
    nosePath.close();
    canvas.drawPath(nosePath, eyePaint);

    // 5. Separaciones de dientes en la mandíbula
    canvas.drawLine(Offset(w * 0.38, h * 0.80), Offset(w * 0.38, h * 0.92), teethPaint);
    canvas.drawLine(Offset(w * 0.46, h * 0.80), Offset(w * 0.46, h * 0.92), teethPaint);
    canvas.drawLine(Offset(w * 0.54, h * 0.80), Offset(w * 0.54, h * 0.92), teethPaint);
    canvas.drawLine(Offset(w * 0.62, h * 0.80), Offset(w * 0.62, h * 0.92), teethPaint);
  }

  @override
  bool shouldRepaint(covariant SkullPainter oldDelegate) {
    return oldDelegate.skullColor != skullColor || oldDelegate.eyeColor != eyeColor;
  }
}
