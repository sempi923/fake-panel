import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const FakePanelApp());
}

class FakePanelApp extends StatelessWidget {
  const FakePanelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panel de Configuración FX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0D14),
        fontFamily: 'sans-serif',
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00E5FF),
          secondary: Color(0xFFFF0055),
          surface: Color(0xFF141923),
        ),
      ),
      home: const SettingsPanelScreen(),
    );
  }
}

class SettingsPanelScreen extends StatefulWidget {
  const SettingsPanelScreen({super.key});

  @override
  State<SettingsPanelScreen> createState() => _SettingsPanelScreenState();
}

class _SettingsPanelScreenState extends State<SettingsPanelScreen> {
  // Estados locales independientes para cada switch simulado
  bool _aimbotSim = false;
  bool _wallhackSim = false;
  bool _fpsOptimization = false;
  bool _pingStabilizer = false;

  void _onActivateAndLaunch() {
    HapticFeedback.heavyImpact();

    // 1. Mostrar SnackBar emergente
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.sports_esports, color: Color(0xFF00E5FF)),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Abre ahora Free Fire',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF161F30),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Color(0xFF00E5FF), width: 1.5),
        ),
      ),
    );

    // 2. Mostrar cuadro de diálogo estilizado
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return Dialog(
          backgroundColor: const Color(0xFF121620),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Color(0xFF00E5FF), width: 1.5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF00E5FF).withOpacity(0.15),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF00E5FF).withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.check_circle_outline,
                    color: Color(0xFF00E5FF),
                    size: 48,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  '¡CONFIGURACIÓN FX APLICADA!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF00E5FF),
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E2638),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFFF0055).withOpacity(0.5)),
                  ),
                  child: const Text(
                    'Abre ahora Free Fire',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Los parámetros visuales simulados han sido cargados localmente en la memoria de la aplicación.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 24),
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
            // Header Gaming con estilo Cyberpunk
            _buildHeader(),

            // Panel de telemetría simulada (Ping, FPS, etc.)
            _buildTelemetryBar(),

            // Lista deslizable con los interruptores simulados
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
                    subtitle: 'Modo de aceleración de cuadros por segundo a 120Hz',
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
                    subtitle: 'Filtro simulado de jitter y reducción de latencia',
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

            // Botón inferior destacado: "Activar e Iniciar"
            _buildBottomActionButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF0D121B),
        border: Border(
          bottom: BorderSide(
            color: const Color(0xFF00E5FF).withOpacity(0.3),
            width: 1.5,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00E5FF).withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF00E5FF), Color(0xFFFF0055)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF00E5FF).withOpacity(0.4),
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Icon(
              Icons.tune_rounded,
              color: Colors.black,
              size: 26,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Panel de Configuración FX',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.8,
                  ),
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      'ESTADO: ',
                      style: TextStyle(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'LISTO PARA JUEGO',
                      style: TextStyle(color: Color(0xFF00FF9D), fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFFF0055).withOpacity(0.15),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: const Color(0xFFFF0055).withOpacity(0.4)),
            ),
            child: const Text(
              'DEMO FX',
              style: TextStyle(
                color: Color(0xFFFF0055),
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
        color: const Color(0xFF111723),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF1E2838)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TelemetryItem(label: 'PING', value: '18 ms', color: Color(0xFF00FF9D)),
          _TelemetryItem(label: 'FPS', value: '120 MAX', color: Color(0xFF00E5FF)),
          _TelemetryItem(label: 'ENGINE', value: 'DIRECT-X', color: Color(0xFFFFD600)),
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
        color: value ? const Color(0xFF141C2B) : const Color(0xFF10141D),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: value ? accentColor.withOpacity(0.8) : const Color(0xFF1D2433),
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
                        : const Color(0xFF19202E),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: value
                          ? accentColor.withOpacity(0.6)
                          : const Color(0xFF283247),
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
        color: const Color(0xFF10141D),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF1F2937)),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.shield_outlined, color: Colors.white38, size: 18),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Simulación de interfaz segura: no requiere permisos de accesibilidad, superposición de pantalla ni lectura de memoria.',
              style: TextStyle(
                color: Colors.white38,
                fontSize: 11,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActionButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF0D121B),
        border: Border(
          top: BorderSide(
            color: const Color(0xFF1E2838),
            width: 1,
          ),
        ),
      ),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [Color(0xFF00E5FF), Color(0xFFFF0055)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00E5FF).withOpacity(0.35),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: _onActivateAndLaunch,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.play_arrow_rounded, color: Colors.black, size: 28),
              SizedBox(width: 8),
              Text(
                'Activar e Iniciar',
                style: TextStyle(
                  color: Colors.black,
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
          style: const TextStyle(
            color: Colors.white38,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 11,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
