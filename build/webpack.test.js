const merge = require('webpack-merge');
const common = require('./webpack.config');
const nodeExternals = require('webpack-node-externals')();

module.exports = merge(common, {
  devtool: 'eval',
  externals: [nodeExternals]
})
