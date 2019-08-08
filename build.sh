# read: 将输入内容赋值给指定的变量,并作为创建的文件夹名
read -p "项目文件夹名称: " catName
if [ "${catName}zz" == "zz" ]
then 
  echo '请输入项目名称'
  exit 
fi

mkdir $catName

# 项目类型
read -p "创建的项目类型 v/r(vue/react): " proType
cd $catName

if [  "${proType}zz" == "rzz" ]
then
  echo 'no build'
else
  #
  # 生成build目录
  # 包含webpack.config.js, webpack.dev.js, webpack.prod.js
  mkdir build
  cd build

  # >生成webpack.config.js
  echo "const path = require('path');" >webpack.config.js
  echo "const HtmlwebpackPlugin = require('html-webpack-plugin');" >>webpack.config.js
  # echo "const VueLoaderPlugin = require('vue-loader/lib/plugin');" >>webpack.config.js
  # echo "const webpack = require('webpack');" >>webpack.config.js
  echo "" >>webpack.config.js
  echo "module.exports = {" >>webpack.config.js
  echo "  entry: {" >>webpack.config.js
  echo "    main: path.resolve(__dirname, '../src/main.js')" >>webpack.config.js
  echo "  }," >>webpack.config.js
  echo "  output: {" >>webpack.config.js
  echo "    filename: '[name][hash].js'," >>webpack.config.js
  echo "    path: path.resolve(__dirname, '../dist')" >>webpack.config.js
  echo "  }," >>webpack.config.js
  echo "  module: {" >>webpack.config.js
  echo "    rules: [" >>webpack.config.js
  echo "      {" >>webpack.config.js
  echo "        test: /\.(scss|css)$/," >>webpack.config.js
  echo "        use: [" >>webpack.config.js
  echo "          // style-loader" >>webpack.config.js
  echo "          { loader: 'style-loader' }," >>webpack.config.js
  echo "          // css-loader" >>webpack.config.js
  echo "          {" >>webpack.config.js
  echo "            loader: 'css-loader'," >>webpack.config.js
  echo "            options: {" >>webpack.config.js
  echo "              modules: false" >>webpack.config.js
  echo "            }" >>webpack.config.js
  echo "          }," >>webpack.config.js
  echo "          // scss-loader" >>webpack.config.js
  echo "          { loader: 'sass-loader' }," >>webpack.config.js
  echo "        ]" >>webpack.config.js
  echo "      }," >>webpack.config.js
  echo "      {" >>webpack.config.js
  echo "        test: /\.vue$/," >>webpack.config.js
  echo "        loader: 'vue-loader'," >>webpack.config.js
  echo "        options: {" >>webpack.config.js
  echo "          // hotReload: false" >>webpack.config.js
  echo "        }" >>webpack.config.js
  echo "      }," >>webpack.config.js
  echo "      {" >>webpack.config.js
  echo "        test: /\.(png|jpg|gif)$/," >>webpack.config.js
  echo "        use: [" >>webpack.config.js
  echo "          {" >>webpack.config.js
  echo "            loader: 'file-loader'," >>webpack.config.js
  echo "          }," >>webpack.config.js
  echo "        ]," >>webpack.config.js
  echo "      }," >>webpack.config.js
  echo "    ]" >>webpack.config.js
  echo "  }," >>webpack.config.js
  echo "  resolve: {" >>webpack.config.js
  echo "    extensions: [\".js\", \".json\", \".jsx\", \".css\", \".vue\"]," >>webpack.config.js
  echo "    alias: {" >>webpack.config.js
  echo "      \"@\": path.resolve(__dirname, \"../src/\")," >>webpack.config.js
  echo "    }," >>webpack.config.js
  echo "  }," >>webpack.config.js
  echo "  plugins: [" >>webpack.config.js
  echo "    new HtmlwebpackPlugin({" >>webpack.config.js
  echo "      inject: true," >>webpack.config.js
  echo "      template: path.resolve(__dirname, '../public/index.html')," >>webpack.config.js
  echo "      meta: [" >>webpack.config.js
  echo "        {" >>webpack.config.js
  echo "          name: 'viewport'," >>webpack.config.js
  echo "content: 'width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0'" >>webpack.config.js
  echo "        }," >>webpack.config.js
  echo "        {" >>webpack.config.js
  echo "          name: \"msapplication-tap-highlight\"," >>webpack.config.js
  echo "          content: \"no\"" >>webpack.config.js
  echo "        }" >>webpack.config.js
  echo "      ]," >>webpack.config.js
  echo "      mobile: true," >>webpack.config.js
  echo "      lang: 'en-US'," >>webpack.config.js
  echo "      inlineManifestWebpackName: 'webpackManifest'," >>webpack.config.js
  echo "      title: 'My App'," >>webpack.config.js
  echo "    })" >>webpack.config.js
  # echo "    // vue loader 需要载入此插件" >>webpack.config.js
  # echo "    new VueLoaderPlugin()," >>webpack.config.js
  # echo "    new webpack.SourceMapDevToolPlugin({" >>webpack.config.js
  # echo "      filename: '[name].js.map'," >>webpack.config.js
  # echo "      exclude: ['vendor.js']" >>webpack.config.js
  # echo "    })" >>webpack.config.js
  echo "  ]," >>webpack.config.js
  echo "  devServer: {" >>webpack.config.js
  echo "    hot: false," >>webpack.config.js
  echo "    port: 9000," >>webpack.config.js
  echo "  }," >>webpack.config.js
  echo "  performance: {" >>webpack.config.js
  echo "    hints: false" >>webpack.config.js
  echo "  }," >>webpack.config.js
  echo "}" >>webpack.config.js
  
  # >生成webpack.dev.js
  echo "const merge = require('webpack-merge');" >webpack.dev.js
  echo "const common = require('./webpack.config');" >>webpack.dev.js
  echo "const path = require('path');" >>webpack.dev.js
  echo "" >>webpack.dev.js
  echo "module.exports = merge(common, {" >>webpack.dev.js
  echo "  devtool: '#eval-source-map'," >>webpack.dev.js
  echo "  devServer: {" >>webpack.dev.js
  echo "    contentBase: path.join(__dirname, '../dist')" >>webpack.dev.js
  echo "  }" >>webpack.dev.js
  echo "})" >>webpack.dev.js
  
  # >生成webpack.prod.js
  echo "const merge = require('webpack-merge');" >webpack.prod.js
  echo "const webpack = require('webpack');" >>webpack.prod.js
  # echo "const UglifyJSPlugin = require('uglifyjs-webpack-plugin');" >>webpack.prod.js
  echo "const { CleanWebpackPlugin } = require('clean-webpack-plugin');" >>webpack.prod.js
  echo "" >>webpack.prod.js
  echo "const common = require('./webpack.config');" >>webpack.prod.js
  echo "module.exports = merge(common, {" >>webpack.prod.js
  echo "  // devtool: 'source-map'," >>webpack.prod.js
  echo "  plugins: [" >>webpack.prod.js
  # echo "    new UglifyJSPlugin({" >>webpack.prod.js
  # echo "      sourceMap: false" >>webpack.prod.js
  # echo "    })," >>webpack.prod.js
  echo "    new webpack.DefinePlugin({" >>webpack.prod.js
  echo "      'process.env.NODE_ENV': JSON.stringify('production')" >>webpack.prod.js
  echo "    })," >>webpack.prod.js
  echo "    new webpack.optimize.UglifyJsPlugin({" >>webpack.prod.js
  echo "      sourceMap: true," >>webpack.prod.js
  echo "      compress: {" >>webpack.prod.js
  echo "        warnings: false" >>webpack.prod.js
  echo "      }" >>webpack.prod.js
  echo "    })," >>webpack.prod.js
  echo "    new webpack.LoaderOptionsPlugin({" >>webpack.prod.js
  echo "      minimize: true" >>webpack.prod.js
  echo "    })," >>webpack.prod.js
  echo "    new CleanWebpackPlugin()" >>webpack.prod.js
  echo "  ]" >>webpack.prod.js
  echo "})" >>webpack.prod.js
  
  # >生成webpack.test.js
  echo "const merge = require('webpack-merge');" >webpack.test.js
  echo "const common = require('./webpack.config');" >>webpack.test.js
  echo "const nodeExternals = require('webpack-node-externals')();" >>webpack.test.js
  echo "" >>webpack.test.js
  echo "module.exports = merge(common, {" >>webpack.test.js
  echo "  devtool: 'eval'," >>webpack.test.js
  echo "  externals: [nodeExternals]" >>webpack.test.js
  echo "})" >>webpack.test.js
  
  # >返回上级
  cd ..
  # --
  # -

  #
  # 生成public目录
  mkdir public
  cd public
  
  # >生成index.html
  echo "<!DOCTYPE html>" >index.html
  echo "<html lang=\"en\">" >>index.html
  echo "  <head>" >>index.html
  echo "    <meta charset=\"UTF-8\">" >>index.html
  echo "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" >>index.html
  echo "    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">" >>index.html
  echo "    <title>vue project</title>" >>index.html
  echo "  </head>" >>index.html
  echo   "<body>" >>index.html
  echo "    <div id=\"app\"></div>" >>index.html
  echo "  </body>" >>index.html
  echo "</html>" >>index.html
  cd ..

  # 生成src目录
  mkdir src
  cd src
  mkdir asset

  # components目录
  mkdir components

  # pages目录
  mkdir pages
  cd pages
  # >Home.vue
  echo "<template>" >Home.vue
  echo "  <div class=\"home\">You are beautiful!</div>" >>Home.vue
  echo "</template>" >>Home.vue
  echo "<script>" >>Home.vue
  echo "export default {" >>Home.vue
  echo "  name:\"home\"," >>Home.vue
  echo "}" >>Home.vue
  echo "</script>" >>Home.vue
  cd ..

  # plugins目录
  mkdir plugins
  
  # App.vue
  echo "<template>" >App.vue
  echo "  <div id="app">" >>App.vue
  echo "    <router-view></router-view>" >>App.vue
  echo "  </div>" >>App.vue
  echo "</template>" >>App.vue
  echo "<script>" >>App.vue
  echo "export default {" >>App.vue
  echo "  name: \"app\"," >>App.vue
  echo "};" >>App.vue
  echo "</script>" >>App.vue
  
  # main.js
  echo "import Vue from 'vue';" >main.js
  echo "import App from './App';" >>main.js
  echo "import router from './router.js';" >>main.js
  echo "new Vue({" >>main.js
  echo "  router," >>main.js
  echo "  render: h => h(App)" >>main.js
  echo "}).\$mount('#app')" >>main.js

  # router.js
  echo "import Vue from 'vue';" >router.js
  echo "import VueRouter from 'vue-router';" >>router.js
  echo ""  >>router.js
  echo "Vue.use(VueRouter);" >>router.js
  echo ""  >>router.js
  echo "import Home from '@/pages/Home';" >>router.js
  echo "const routes = [" >>router.js
  echo "  {" >>router.js
  echo "    path: '/'," >>router.js
  echo "    component: Home" >>router.js
  echo "  }," >>router.js
  echo "];" >>router.js
  echo "" >>router.js
  echo "export default new VueRouter({" >>router.js
  echo "  mode: 'hash'," >>router.js
  echo "  routes" >>router.js
  echo "});" >>router.js

  echo "node_modules" >.gitignore
  cd ..

  # 生成mock目录
  mkdir mock-server
  cd mock-server
  # >生成模拟js存放的文件夹
  mkdir mocks
  # >入口文件
  echo "var path = require('path');" >index.js
  echo "var express = require('express');" >>index.js
  echo "" >>index.js
  echo "var app = express();" >>index.js
  echo "app.use('/api', mockjs(path.join(__dirname, 'mocks')));" >>index.js
  echo "app.listen(3333);" >>index.js 
  cd ..

  # test目录
  mkdir test
  cd test
  # >setup.js
  echo "// setup JSDOM" >setup.js
  echo "require('jsdom-global')()" >>setup.js
  echo "" >>setup.js
  echo "// make expect available globally" >>setup.js
  echo "global.expect = require('expect')" >>setup.js
  # >Home.spec.js
  echo "import { shallowMount } from '@vue/test-utils'" >Home.spec.js
  echo "import Home from '@/pages/Home.vue'" >>Home.spec.js
  echo "" >>Home.spec.js
  echo "describe('Home.vue', () => {" >>Home.spec.js
  echo "  it('Home root element\'s text is \"You are beautiful!\"', () => {" >>Home.spec.js
  echo "    const wrapper = shallowMount(Home)" >>Home.spec.js
  echo "    expect(wrapper.findAll('.home').at(0).text()).toBe('You are beautiful!')" >>Home.spec.js
  echo "  })" >>Home.spec.js
  echo "})" >>Home.spec.js
  cd ..
  
  #
  #
  # 生成package.json文件
  echo "{" > package.json
  
  # >项目名称(默认目录名称)
  read -p "name: ($catName)" proName
  if [ "${proName}zz" == "zz" ]; then
    echo "  \"name\": \"$catName\"," >> package.json
  else
    echo "  \"name\": \"$proName\"," >> package.json
  fi
  
  # >版本号
  read -p "version: (1.0.0) " proVersion
  if [ "${proVersion}zz" == "zz" ]; then
    echo "  \"version\": \"1.0.0\"," >> package.json
  else
    echo "  \"version\": \"$proVersion\"," >> package.json
  fi
  
  # >描述
  read -p "description: " proDesc
  if [ "${proDesc}zz" == "zz" ]; then
    echo "  \"description\": \"description $proName\"," >> package.json
  else
    echo "  \"description\": \"$proDesc\"," >> package.json
  fi
 
  # >main
  echo "  \"main\": \"index.js\"," >> package.json
 
  # >scripts
  echo "  \"scripts\": {" >> package.json
  # >>test
  echo "    \"test\": \"cross-env NODE_ENV=test nyc --reporter=lcov --reporter=text mocha-webpack --webpack-config ./build/webpack.test.js --require test/setup.js test/**/*.spec.js\"," >> package.json
  # >>dev
  echo "    \"dev\": \"cross-env NODE_ENV=development webpack-dev-server --config ./build/webpack.dev.js\"," >> package.json
  # >>build
  echo "    \"biuld\": \"cross-env NODE_ENV=production webpack --config ./build/webpack.prod.js\"," >> package.json
  # >>test
  echo "    \"mock\": \"nodemon --watch mock-server node mock-server/index.js\"" >> package.json
  echo "  }," >> package.json
  
  # >author
  read -p "author: " proAuthor
  if [ $proAuthor"zz" == "zz" ]; then
    echo "  \"author\": \"\"," >> package.json
  else
    echo "  \"author\": \"$proAuthor\"," >> package.json
  fi
  
  # >license
  echo "  \"license\": \"ISC\"," >> package.json
  
  # >reponsitory
  echo "  \"reponsitory\": {" >> package.json
  echo "    \"type\": \"\"," >> package.json
  echo "    \"url\": \"\"" >> package.json
  echo "  }," >> package.json
  
  # >dependences
  echo "  \"dependencies\": {" >> package.json
  echo "    \"vue\": \"^2.4.4\"," >> package.json
  echo "    \"vue-router\": \"^3.0.6\"" >> package.json
  echo "  }," >> package.json
  
  # >devDependences
  echo "  \"devDependencies\": {" >> package.json
  # >>babel
  echo "    \"babel-core\": \"^6.26.3\"," >> package.json
  echo "    \"babel-loader\": \"^7.1.2\"," >> package.json
  echo "    \"babel-plugin-istanbul\": \"^4.1.5\"," >> package.json
  echo "    \"babel-preset-env\": \"^1.7.0\"," >> package.json
  # >>loader
  echo "    \"css-loader\": \"^3.2.0\"," >> package.json
  echo "    \"file-loader\": \"^1.1.4\"," >> package.json
  echo "    \"vue-loader\": \"^14.1.1\"," >> package.json
  echo "    \"style-loader\": \"^1.0.0\"," >> package.json
  echo "    \"sass-loader\": \"^7.1.0\"," >> package.json
  echo "    \"node-sass\": \"^4.12.0\"," >> package.json
  echo "    \"ts-loader\": \"^6.0.4\"," >> package.json
  # >>compiler
  echo "    \"vue-template-compiler\": \"^2.4.4\"," >> package.json
  # >>env
  echo "    \"cross-env\": \"^5.0.5\"," >> package.json
  # >>webpack和相关
  echo "    \"webpack\": \"^3.6.0\"," >> package.json
  echo "    \"webpack-cli\": \"^3.3.6\"," >> package.json
  echo "    \"webpack-dev-server\": \"^2.11.5\"," >> package.json
  echo "    \"html-webpack-template\": \"^6.2.0\"," >> package.json
  echo "    \"html-webpack-plugin\": \"^3.2.0\"," >> package.json
  echo "    \"webpack-node-externals\": \"^1.6.0\"," >> package.json
  echo "    \"webpack-merge\": \"^4.2.1\"," >> package.json
  echo "    \"clean-webpack-plugin\": \"^3.0.0\"," >> package.json
  # >>mock
  echo "    \"express-mockjs\": \"^0.4.9\"," >>package.json
  # >>mocha test
  echo "    \"@vue/test-utils\": \"^1.0.0-beta.25\"," >>package.json
  echo "    \"mocha\": \"^5.2.0\"," >>package.json
  echo "    \"mocha-webpack\": \"^1.1.0\"," >>package.json
  echo "    \"jsdom\": \"^12.1.0\"," >>package.json
  echo "    \"jsdom-global\": \"^3.0.2\"," >>package.json
  echo "    \"nyc\": \"^12.0.2\"," >>package.json
  echo "    \"expect\": \"^21.2.1\"" >>package.json
  echo "  }," >> package.json

  # >nyc
  echo "  \"nyc\": {" >> package.json
  echo "    \"include\": [" >> package.json
  echo "      \"src/**/*.(js|vue)\"" >> package.json
  echo "    ]," >> package.json
  echo "    \"instrument\": false," >> package.json
  echo "    \"sourceMap\": false" >> package.json
  echo "  }" >> package.json

  # close tag for package.json
  echo "}" >> package.json
  # --
  # -
  #

  # build ReadMe.md
  echo "" > ReadMe.md
fi

echo "安装依赖进行中..."
npm i

read -p "Press any key to continue."
