# 🎬 Cinemapedia

**Cinemapedia** es una aplicación móvil desarrollada con fines de estudio, la cual consume datos de la API pública de [The Movie Database (TMDB)](https://www.themoviedb.org/) para mostrar información de películas, actores, recomendaciones, entre otros. Además, pone en práctica múltiples herramientas del ecosistema Flutter como gestión de estado, uso de widgets personalizados, almacenamiento local, navegación avanzada y consumo de servicios externos.

---

## 🚀 Funcionalidades principales

- Consulta de películas en cartelera, populares y próximas.
- Visualización de detalles de películas y actores.
- Búsqueda dinámica de películas.
- Favoritos guardados en una base de datos local.
- Arquitectura limpia y escalable.

---

## 🧱 Tecnologías y herramientas usadas

- **Flutter** + **Dart**
- **State Management** (Riverpod)
- **API REST** (TheMovieDB)
- **Base de datos local**: (Issar)
- **build_runner** para generación automática de código
- **Widgets personalizados** para UI modular y reutilizable

---

## 🧪 Desarrollo

1. Copiar el archivo `.env.template` y renombrarlo como `.env`.
2. Reemplazar las variables de entorno con tus propias claves (API Key de TheMovieDB).
3. Ejecutar el siguiente comando para generar las entidades necesarias:

   ```bash
   flutter pub run build_runner build
   ```

---

## 👨‍💻 Objetivo del proyecto

Esta app fue creada como parte de un proceso de aprendizaje para dominar el ecosistema Flutter, trabajando con APIs, bases de datos locales y estructuras limpias, orientadas a un desarrollo profesional de aplicaciones móviles.
 
 