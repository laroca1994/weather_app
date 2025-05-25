
# Weather App ☁️🌤

Esta app permite buscar el estado del tiempo actual de una ciudad usando datos de OpenWeatherMap. También guarda las búsquedas para poder consultarlas sin conexión.

## 🛠 Requisitos

- Flutter 3.10 o superior
- Dart 3.0 o superior
- Android Studio o VSCode con Flutter instalado
- Una clave de API gratuita de [OpenWeatherMap](https://openweathermap.org/api)
- Una clave de API de [Google Places](https://developers.google.com/maps/documentation/places/web-service/overview)
- Una clave de API de [Unsplash](https://unsplash.com/developers) (para mostrar imágenes relacionadas al clima)

## 🚀 Cómo correr el proyecto

1. **CDescomprimir el zip**  

   ```bash
   cd weather_app
   ```

2. **Instalar dependencias**  

   ```bash
   flutter pub get
   ```

3. **Agregar las claves API**  
   Crear un archivo `.env` o actualizar directamente los campos `OPENWEATHERMAP_API_KEY`, `GOOGLE_PLACES_API_KEY` y `UNPLASH_API_KEY` en el archivo donde se manejen las constantes o variables de entorno.

4. **Correr la app**  
   En un emulador o dispositivo físico:

   ```bash
   flutter run
   ```

## 📦 Build APK (opcional)

```bash
flutter build apk --release
```

El APK se generará en `build/app/outputs/flutter-apk/app-release.apk`.

## 📌 Notas

- Las búsquedas se guardan localmente para uso offline.
- Se requiere permiso de ubicación para mostrar el clima según tu ubicación actual.
- La app utiliza Google Places para autocompletar en la búsqueda de ciudades.
