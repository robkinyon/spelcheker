express = require 'express'
app = express();

app.get '/', (req,res) ->
  res.send ""

module.exports = app
