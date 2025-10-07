# Usamos imagen base de OpenJDK
FROM eclipse-temurin:17-jdk-alpine

# Crear usuario no root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Crear carpeta de la app
WORKDIR /app

# Copiar jar generado por Maven
COPY target/*.jar app.jar

# Cambiar permisos para que el usuario pueda ejecutar
RUN chown -R appuser:appgroup /app

# Cambiar a usuario no root
USER appuser

# Exponer puerto 8080
EXPOSE 8080

# Healthcheck básico usando curl
HEALTHCHECK --interval=10s --timeout=5s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/api || exit 1

# Comando por defecto
ENTRYPOINT ["java","-jar","app.jar"]
