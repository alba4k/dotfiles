const electron = require("electron");

// Keep existing spellchecker request
const request = {
  property: "spellcheckerEnabled",
  propertyValue: true,
};
electron.ipcRenderer.send('session-interaction', request);

// Automatically grant Notification permissions inside WhatsApp Web
if ("Notification" in window) {
  if (Notification.permission !== "granted") {
    Notification.requestPermission();
  }
}
