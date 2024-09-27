// app/javascript/channels/index.js
const channels = require.context('.', true, /\.js$/)
channels.keys().forEach(channels)
