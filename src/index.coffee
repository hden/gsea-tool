_  = require 'underscore'
fs = require 'fs'

helper = {}

helper.indexOfES = (matrix) ->
  _.indexOf matrix[0], 'RUNNING ES'

helper.leadingEdgeAnalysis = (matrix) ->
  idx = helper.indexOfES matrix
  ESs = []
  ESs.push Number(row[idx]) for row in matrix
  max = _.max ESs
  i   = _.indexOf ESs, max
  return [max, i]

helper.leadingEdge = (matrix) ->
  idx         = helper.indexOfES matrix
  [max, edge] = helper.leadingEdgeAnalysis matrix
  matrix[...edge]

module.exports = helper