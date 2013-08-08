express = require 'express'
app = express();

app.get '/', (req,res) ->
  res.set 'Content-Type', 'application/json'
  res.send JSON.stringify
    success: false
    word: ""
    suggestions: []

spell = require 'speller'
fs = require 'fs'
fs.readFile __dirname + '/../node_modules/speller/bin/big.txt', 'ascii', (err, data)->
  if err
    throw err
  spell.train data

app.get '/:word', (req, res) ->
  word = req.param('word');
  actual = spell.correct word
  res.set 'Content-Type', 'application/json'
  res.send JSON.stringify
    success: actual == word
    word: word
    suggestions: if actual == word then [] else [actual]

module.exports = app
