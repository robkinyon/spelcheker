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
      .expect(JSON.stringify({success: false, word: "", suggestions: []}))
      .end(done)
