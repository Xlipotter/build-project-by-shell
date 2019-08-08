const merge = require('webpack-merge');
const common = require('./webpack.config');
const path = require('path');

module.exports = merge(common, {
  devtool: '#eval-source-map',
  devServer: {
    contentBase: path.join(__dirname, '../dist')
  }
})
