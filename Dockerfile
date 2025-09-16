# Dockerfile
FROM node:18-alpine
WORKDIR /app

# Instala dependencias primero (aprovecha cache)
COPY package*.json ./
RUN npm ci

# Copia el resto del código
COPY . .

# CRA usa 3000 por defecto
EXPOSE 3000

# Para exponer el dev server fuera del contenedor
ENV HOST=0.0.0.0
ENV CHOKIDAR_USEPOLLING=true
ENV WATCHPACK_POLLING=true

CMD ["npm", "start"]
