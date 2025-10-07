# 🚀 DevOps Exercise – Demo Java App

**Autor:** Laura Chinchilla  
**App base:** demo-devops-java  
**Lenguaje:** Java + Maven

# DevOps Java Demo Application

## 1️⃣ Descripción
Proyecto demo de aplicación Java Spring Boot para fines de práctica.  
Incluye:  

- Dockerización de la app  
- CI/CD con GitHub Actions  
- Despliegue en Kubernetes local (Docker Desktop / Minikube)  


# DevOps Java Demo Application

## 1️⃣ Descripción
Proyecto demo de aplicación Java Spring Boot para práctica de DevOps. Incluye: Dockerización de la aplicación, CI/CD con GitHub Actions y despliegue en Kubernetes local (Docker Desktop / Minikube).

## 2️⃣ Requisitos previos
- Docker Desktop con Kubernetes habilitado
- Git
- Java 17 y Maven
- Acceso a GitHub para CI/CD

## 3️⃣ Ejecución local con Docker
### 3.1 Construir la imagen Docker
cd C:\Users\DELL\Desktop\devsu-demo-devops-java
docker build -t devops-java-app .

### 3.2 Correr el contenedor
docker run -d -p 8080:8080 --name devops-java devops-java-app

### 3.3 Verificar contenedor
docker ps
docker logs -f devops-java

### 3.4 Acceder a la app
http://localhost:8080/api
> Nota: La app expone endpoints bajo `/api`. El root `/` mostrará Whitelabel Error Page 404, lo cual es esperado.

## 4️⃣ Despliegue en Kubernetes
### 4.1 Aplicar Deployment y Service
kubectl apply -f k8s/deployment.yaml

### 4.2 Verificar pods y servicios
kubectl get pods
kubectl get service

### 4.3 Acceder a la app en NodePort
http://localhost:30080/api
> Deployment configurado con 2 réplicas. Service tipo NodePort expone el puerto 30080 hacia el host.

## 5️⃣ Pipeline CI/CD con GitHub Actions
Archivo workflow: .github/workflows/ci-cd-java-docker.yml

### 5.1 Pasos del pipeline
1. Checkout del repositorio  
2. Configuración de Java 17  
3. Cache de dependencias Maven  
4. Build del proyecto: mvn clean package --no-transfer-progress  
5. Unit tests: mvn test  
6. Análisis estático de código: mvn checkstyle:check  
7. Reporte de cobertura: mvn jacoco:report  
8. Build de Docker: docker build -t devops-java-app .  
9. (Opcional) Push de la imagen a Docker Hub: docker tag devops-java-app yourdockerhubuser/devops-java-app:latest && docker push yourdockerhubuser/devops-java-app:latest

### 5.2 Verificar workflow
En GitHub Actions, revisar que todas las etapas se ejecuten correctamente. Capturas de pantalla como evidencia: docker ps, kubectl get pods, kubectl get service

## 6️⃣ Diagrama de arquitectura (opcional)
Código Java -> Maven Build -> Imagen Docker -> Deployment Kubernetes -> Service NodePort -> Ingress
|-> 2 réplicas de pods
|-> Unit Tests, Checkstyle, JaCoCo

> Puedes reemplazarlo por una imagen real (docs/diagrama.png) si quieres que quede más profesional.

## 7️⃣ Justificación técnica
- Dockerfile optimizado con usuario no root y healthcheck  
- Puerto 8080 expuesto y accesible desde host  
- CI/CD completo con GitHub Actions (build, tests, análisis, cobertura, Docker)  
- Kubernetes local con Deployment de 2 réplicas y NodePort  
- ConfigMaps, Secrets y Ingress configurados si aplica

## 8️⃣ Contacto / Repositorio
Repositorio público en GitHub: https://github.com/LauraChinchilla/devops-java-LauraChinchilla
