// run with browser-sync start --config bs-config.js
// or use foreman start
module.exports = {
  "ui": {
    "port": 3002
  },
  "files": ['app', 'public'],
  "proxy": 'localhost:3000',
  "port": 3001
}
