assert = require('chai').assert
_      = require 'underscore'
fs     = require 'fs'
helper = require '../src/index'

describe 'GSEA leading-edge extractor', ->
  @timeout 100
  data   = ''
  it 'should have a valid data for testing purpose', ->
    assert fs.existsSync './test/test.data.xls', 'No data'
    data = fs.readFileSync './test/test.data.xls', 'utf-8'
    # GSEA use \r\t\n as EOL for some reason 
    data = data.replace /\t\r/gm, ''
    data = data.split '\n'
    assert.isArray data
    foo = []
    # Recounstruct data as 2-D array
    foo[i] = line.split '\t' for line, i in data
    data = foo
    assert.isArray data[1]
    assert helper?, 'No helper'
  it 'should be able to detect the ES column from header', ->
    assert.equal helper.indexOfES(data), 6
  it 'should detect leading-edge from processed GSEA reports', ->
    assert.deepEqual helper.leadingEdgeAnalysis(data), [0.28724527, 34]
  it 'should extract leading-edge genes', ->
    list = helper.leadingEdge(data)
    assert.isArray list
    assert.equal list.length, 34