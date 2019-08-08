const path = require('path');
const HtmlwebpackPlugin = require('html-webpack-plugin');

module.exports = {
  entry: {
    main: path.resolve(__dirname, '../src/main.js')
  },
  output: {
    filename: '[name][hash].js',
    path: path.resolve(__dirname, '../dist')
  },
  module: {
    rules: [
      {
        test: /\.(scss|css)$/,
        use: [
          // style-loader
          { loader: 'style-loader' },
          // css-loader
          {
            loader: 'css-loader',
            options: {
              modules: false
            }
          },
          // scss-loader
          { loader: 'sass-loader' },
        ]
      },
      {
        test: /\.vue$/,
        loader: 'vue-loader',
        options: {
          // hotReload: false
        }
      },
      {
        test: /\.(png|jpg|gif)$/,
        use: [
          {
            loader: 'file-loader',
          },
        ],
      },
    ]
  },
  resolve: {
    extensions: [".js", ".json", ".jsx", ".css", ".vue"],
    alias: {
      "@": path.resolve(__dirname, "../src/"),
    },
  },
  plugins: [
    new HtmlwebpackPlugin({
      inject: true,
      template: path.resolve(__dirname, '../public/index.html'),
      meta: [
        {
          name: 'viewport',
content: 'width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0'
        },
        {
          name: "msapplication-tap-highlight",
          content: "no"
        }
      ],
      mobile: true,
      lang: 'en-US',
      inlineManifestWebpackName: 'webpackManifest',
      title: 'My App',
    })
  ],
  devServer: {
    hot: false,
    port: 9000,
  },
  performance: {
    hints: false
  },
}
