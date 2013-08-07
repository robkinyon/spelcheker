express = require 'express'
app = express();

app.get '/', (req,res) ->
  res.set 'Content-Type', 'application/json'
  res.send JSON.stringify
    success: false
    word: ""
    suggestions: []

module.exports = app
