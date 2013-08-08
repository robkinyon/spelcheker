express = require 'express'
app = express();

app.get '/', (req,res) ->
  res.set 'Content-Type', 'application/json'
  res.send JSON.stringify
    success: false
    word: ""
    suggestion: null

spell = require 'speller'
fs = require 'fs'
fs.readFile __dirname + '/../node_modules/speller/bin/big.txt', 'ascii', (err, data)->
  if err
    throw err
  spell.train data

app.get '/:word', (req, res) ->
  word = req.param('word');
  if word
    actual = spell.correct word

  res.set 'Content-Type', 'application/json'
  res.send JSON.stringify
    success: word and actual == word
    word: word
    suggestion: if actual == word then null else actual

module.exports = app
