# 📊 uctesis-project-template

Plantilla para proyectos de tesis con PySpark, Streamlit y Jupyter. Ambiente completo pre-configurado con Docker + Conda.

![Python](https://img.shields.io/badge/Python-3.12.10-blue)
![PySpark](https://img.shields.io/badge/PySpark-3.5.5-orange)
![Docker](https://img.shields.io/badge/Docker-Compose-blue)

## 🚀 Inicio Rápido

### Clonar el repositorio

```bash
git clone https://github.com/lacamposm/uctesis-project-template.git
cd uctesis-project-template
```

### Ejecutar con Docker Compose

```bash
docker compose up -d
```

### Acceder al contenedor

```bash
docker compose exec ucentral-pyspark-project /bin/bash
```

### Verificar instalación

```bash
python src/test_spark.py
```

## 🛠️ Comandos Útiles

| Comando | Descripción |
|---------|-------------|
| `docker compose up -d` | Inicia el contenedor en segundo plano |
| `docker compose down` | Detiene y elimina el contenedor |
| `docker compose build` | Reconstruye la imagen (después de modificar Dockerfile o environment.yml) |
| `docker compose logs -f` | Ver logs del contenedor |

## 🔌 Servicios y Puertos

| Puerto | Servicio | Descripción |
|--------|----------|-------------|
| 4040 | Spark UI | Interfaz de monitoreo de Spark |
| 8501 | Streamlit | Desarrollo de aplicaciones web con Python |
| 8888 | Jupyter | Notebooks interactivos para desarrollo y pruebas |
| 5678 | Debugpy | Depuración remota desde VS Code |

## 🧩 Componentes Principales

- **PySpark 3.5.5**: Framework de procesamiento distribuido
- **Python 3.12.10**: Versión base del lenguaje
- **Jupyter**: Entorno interactivo para análisis de datos
- **Streamlit**: Creación rápida de aplicaciones web con Python
- **Conda**: Gestión de dependencias y entornos

## 📁 Estructura del Proyecto

```
./
├── docker-compose.yml   # Configuración de servicios Docker
├── Dockerfile           # Definición de imagen Docker
├── environment.yml      # Dependencias Conda
├── README.md            # Este archivo
└── src/                 # Scripts de ejemplo
    └── test_spark.py    # Test simple de PySpark
```

## 🔍 Ejemplo PySpark

`src/test_spark.py` contiene un ejemplo básico que:
- Crea una sesión de Spark
- Genera un DataFrame
- Ejecuta una agregación simple
- Guarda/lee datos en formato Parquet

## 📋 Requisitos

- Docker y Docker Compose instalados
- Git para clonar el repositorio

## 📝 Notas Importantes

- El directorio `src/` contiene ejemplos, no un paquete para instalar
- Los archivos del proyecto local se montan en `/ucentral-tesis-project` dentro del contenedor
- Cambios en `environment.yml` requieren reconstruir la imagen con `docker compose build`

---

Desarrollado para proyectos de la maestría en analítica de datos en la Universidad Central