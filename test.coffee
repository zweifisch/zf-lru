chai = require 'chai'
chai.should()
{expect} = chai

LRU = require './index'

describe 'LRU', ->

    it "should increase size", ->
        lru = new LRU 3
        lru.set "a", "1"
        lru.size.should.equal 1
        lru.set "b", "2"
        lru.size.should.equal 2

    it "should get set key value", ->
        lru = new LRU 3
        lru.set "a", "1"
        lru.set "b", "2"
        lru.get("a").should.equal "1"
        lru.get("b").should.equal "2"
        expect(lru.get("c")).to.be.undefined
        lru.set "c", "3"
        lru.get("c").should.equal "3"

    it "should envinct", ->
        lru = new LRU 2
        lru.set "a", "1"
        lru.set "b", "2"
        lru.set "c", "3"
        lru.set "d", "4"
        lru.size.should.equal 2
        expect(lru.get("a")).to.be.undefined
        expect(lru.get("b")).to.be.undefined
        lru.get("c").should.equal "3"
        lru.get("d").should.equal "4"
