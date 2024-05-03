'use strict';

// Read config.properties file
const PropertiesReader = require('properties-reader');
const config = PropertiesReader('config.properties');

// Define translations
const translations = {
    "Username": config.get('swagger.username'),
    "Password": config.get('swagger.password'),
    // Add other translations as needed
};

// Replace hardcoded strings
window.SwaggerTranslator.learn({
    "Username": translations.Username,
    "Password": translations.Password,
    "Warning: Deprecated": "Ворнинг: Депрекейтед",
    "Implementation Notes": "Заметки",
    "Response Class": "Пример ответа",
    "Status": "Статус",
    "Parameters": "Параметры",
    "Parameter": "Параметр",
    "Value": "Значение",
    "Description": "Описание",
    "Parameter Type": "Тип параметра",
    "Data Type": "Тип данных",
    "HTTP Status Code": "HTTP код",
    "Reason": "Причина",
    "Response Model": "Структура ответа",
    "Request URL": "URL запроса",
    "Response Body": "Тело ответа",
    "Response Code": "HTTP код ответа",
    "Response Headers": "Заголовки ответа",
    "Hide Response": "Спрятать ответ",
    "Response Messages": "Что может прийти в ответ",
    "Try it out!": "Попробовать!",
    "Show/Hide": "Показать/Скрыть",
    "List Operations": "Операции кратко",
    "Expand Operations": "Операции подробно",
    "Raw": "В сыром виде",
    "can't parse JSON.  Raw result": "Не удается распарсить ответ:",
    "Model Schema": "Структура",
    "Model": "Описание",
    "apply": "применить",
    "Terms of service": "Условия использования",
    "Created by": "Разработано",
    "See more at": "Еще тут",
    "Contact the developer": "Связаться с разработчиком",
    "api version": "Версия API",
    "Response Content Type": "Content Type ответа",
    "fetching resource": "Получение ресурса",
    "fetching resource list": "Получение ресурсов",
    "Explore": "Поехали",
    "Show Swagger Petstore Example Apis": "Показать примеры АПИ",
    "Can't read from server.  It may not have the appropriate access-control-origin settings.": "Не удается получить ответ от сервера. Возможно, какая-то лажа с настройками доступа",
    "Please specify the protocol for": "Пожалуйста, укажите протогол для",
    "Can't read swagger JSON from": "Не получается прочитать swagger json из",
    "Finished Loading Resource Information. Rendering Swagger UI": "Загрузка информации о ресурсах завершена. Рендерим",
    "Unable to read api": "Не удалось прочитать api",
    "from path": "по адресу",
    "server returned": "сервер сказал"
});

// Handle theme if needed
