module.exports = {
  // 配置开发服务器
  devServer: {
    // 配置静态资源目录
    contentBase: './public',
    // 配置代理
    proxy: {
      '/api': {
        target: 'http://localhost:9090',
        changeOrigin: true,
        pathRewrite: {
          '^/api': ''
        }
      }
    }
  },
  // 配置路径别名
  configureWebpack: {
    resolve: {
      alias: {
        '@': require('path').resolve(__dirname, 'src')
      }
    }
  },
  // 配置静态资源路径
  publicPath: '/',
  // 配置输出目录
  outputDir: 'dist',
  // 配置静态资源目录
  assetsDir: 'static',
  // 配置HTML模板
  indexPath: 'index.html',
  // 配置多页面应用
  pages: {
    index: {
      entry: 'src/main.js',
      template: 'public/index.html',
      filename: 'index.html',
      title: '智慧农场管理平台'
    },
    code: {
      entry: 'src/main.js',
      template: 'public/index.html',
      filename: 'index.html',
      title: '智慧农场溯源系统'
    },
    verify: {
      entry: 'src/main.js',
      template: 'public/index.html',
      filename: 'verify.html',
      title: '农产品溯源详情'
    }
  }
};