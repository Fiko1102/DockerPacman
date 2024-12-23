# Используем базовый образ с Node.js
FROM node:20-alpine

# Устанавливаем необходимые утилиты
RUN apk update && apk add --no-cache git bash sed

# Устанавливаем рабочую директорию
WORKDIR /app

# Клонируем репозиторий
RUN git clone https://github.com/masonicGIT/pacman.git .

# Устанавливаем зависимости
RUN npm install

# Устанавливаем Next.js
RUN npm install next

# Выполняем сборку приложения
RUN npm run build

# Открываем порт, на котором работает приложение (обычно для Next.js это 3000)
EXPOSE 3000

# Устанавливаем переменные окружения для MongoDB
ENV MONGO_URI=mongodb://mongo:27017/pacman2.0

# Запускаем приложение
CMD ["npm", "start"]
