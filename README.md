# Panel de Configuración FX 🎮⚡

Aplicación móvil tipo demo / broma visual para Android desarrollada en **Flutter**, diseñada para simular estéticamente un panel de ajustes gamer avanzado.

> ⚠️ **Aviso de Seguridad / Naturaleza de la App**:
> Esta aplicación es 100% de demostración visual y de entretenimiento. 
> - **Sin permisos especiales**: No solicita ni utiliza permisos de accesibilidad, superposición sobre otras apps (`SYSTEM_ALERT_WINDOW`), lectura de memoria (`RAM`), ni acceso root.
> - **Simulación pura**: Los interruptores solo actualizan variables en memoria local de la interfaz sin interacción con el sistema operativo ni con juegos de terceros.

---

## 🎨 Características de la Interfaz

- **Estética Gaming Cyberpunk**: Paleta oscura (`#0A0D14`) con acentos en cian neón (`#00E5FF`) y rojo neón (`#FF0055`).
- **Interruptores Toggles Simulados**:
  - 🎯 **Ajuste de Mira (Aimbot sim)**: Calibración y retícula virtual.
  - 📡 **Visor de Contorno (Wallhack sim)**: Filtro espectral de siluetas.
  - ⚡ **Optimización de FPS**: Modo 120Hz simulado.
  - 📶 **Estabilizador de Ping**: Reducción simulada de jitter y latencia.
- **Barra de Telemetría Dinámica**: Indicadores estéticos de Ping (18ms), FPS (120 Max) y Motor Gráfico.
- **Botón de Acción**: Botón inferior destacado *"Activar e Iniciar"*, el cual despliega un cuadro de diálogo y SnackBar con el mensaje exacto: **"Abre ahora Free Fire"**.

---

## 🚀 Compilación Automática (CI/CD)

El repositorio incluye un flujo de trabajo en `.github/workflows/build-apk.yml`. Cada vez que realices un `git push` a la rama `main`, GitHub Actions:
1. Configurará automáticamente el entorno con Flutter y Java 17.
2. Compilará el APK Release optimizado (`app-release.apk`).
3. Publicará el archivo en la pestaña **Actions** como artefacto descargable listo para instalar en tu teléfono.
