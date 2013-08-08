express = require 'express'
app = express();

app.get '/', (req,res) ->
  res.set 'Content-Type', 'application/json'
  res.send JSON.stringify
    success: false
    word: ""
    suggestions: []

app.get '/:word', (req,res) ->
  word = req.param('word');
  res.set 'Content-Type', 'application/json'
  res.send JSON.stringify
    success: true
    word: word
    suggestions: []

module.exports = app
