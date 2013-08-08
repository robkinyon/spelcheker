chai = require 'chai'
expect = chai.expect
request = require 'supertest'

app = require '../lib/app'

describe 'Server', ->
  it 'compiles', ->
    expect(true).to.be.ok

  it 'responds to /', (done) ->
    request(app).get('/')
      .expect(200)
      .expect('Content-Type', 'application/json')
      .expect(JSON.stringify
        success: false
        word: ""
        suggestions: []
      )
      .end(done)

  it "responds to /hello", (done) ->
    word = 'hello'
    request(app).get("/#{word}")
      .expect(200)
      .expect('Content-Type', 'application/json')
      .expect(JSON.stringify
        success: true
        word: word
        suggestions: []
      )
      .end(done)

  it "responds to /hellop", (done) ->
    word = 'hellop'
    request(app).get("/#{word}")
      .expect(200)
      .expect('Content-Type', 'application/json')
      .expect(JSON.stringify
        success: false
        word: word
        suggestions: ['hello']
      )
      .end(done)
