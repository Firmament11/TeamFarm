<template>
  <div class="code-iframe-container">
    <div v-if="!isLoaded && !hasError" class="loading-overlay">
      <div class="spinner"></div>
      <p>加载中...</p>
    </div>

    <div v-if="hasError" class="error-overlay">
      <p>加载失败，请稍后再试</p>
      <button @click="retryLoad">重试</button>
    </div>

    <iframe
        v-show="!hasError"
        ref="codeIframe"
        :src="currentSrc"
        class="code-iframe"
        @load="handleLoad"
        @error="handleError"
    ></iframe>
  </div>
</template>

<script>
export default {
  name: 'verifyIframe',
  props: {
    initialSrc: {
      type: String,
      default: 'miniprogram/pages/verify.html'
    }
  },
  data() {
    return {
      isLoaded: false,
      hasError: false,
      currentSrc: '',
      showBorder: false
    };
  },
  created() {
    this.initializeComponent();
  },
  mounted() {
    this.log('组件已挂载');
  },
  beforeUnmount() {
    this.log('组件即将卸载');
  },
  methods: {
    initializeComponent() {
      try {
        this.currentSrc = this.initialSrc;
        this.log('组件初始化完成');
        this.log(`初始 URL 设置为: ${this.currentSrc}`);
      } catch (error) {
        this.handleErrorDuringInitialization(error);
      }
    },
    handleErrorDuringInitialization(error) {
      this.log('组件初始化过程中出错', error);
      this.hasError = true;
    },
    handleLoad() {
      this.isLoaded = true;
      this.hasError = false;
      this.log('Iframe 加载成功', {
        iframeSrc: this.currentSrc,
        iframeHeight: this.$refs.codeIframe?.contentWindow?.document.body.scrollHeight,
        iframeWidth: this.$refs.codeIframe?.contentWindow?.document.body.scrollWidth
      });
    },
    handleError(error) {
      this.hasError = true;
      this.log('Iframe 加载失败', error);
    },
    retryLoad() {
      this.hasError = false;
      this.isLoaded = false;
      this.log('开始重试加载');
      // 使用时间戳强制重新加载
      this.currentSrc += '?_=' + Date.now();
    },
    refreshContent() {
      this.log('刷新按钮被点击');
      if (this.$refs.codeIframe) {
        this.log('正在刷新 iframe 内容');
        this.$refs.codeIframe.contentWindow.location.reload();
      }
    },
    toggleBorder() {
      this.showBorder = !this.showBorder;
      this.log(`边框状态已切换为: ${this.showBorder}`);
    },
    loadSample(url) {
      this.log(`尝试加载新 URL: ${url}`);
      this.currentSrc = url;
      this.isLoaded = false;
      this.hasError = false;
    },
    log(message, details) {
      const timestamp = new Date().toLocaleTimeString();
      const componentInfo = `[CodeIframe - ${this._uid}]`;
      const logMessage = `${timestamp} ${componentInfo} ${message}`;

      if (details) {
        console.groupCollapsed(logMessage);
        console.log('详情:', details);
        console.groupEnd();
      } else {
        console.log(logMessage);
      }
    }
  }
};
</script>

<style scoped>
.code-iframe-container {
  position: relative;
  width: 100%;
  height: 100vh;
  min-height: 500px;
}

.code-iframe {
  width: 100%;
  height: 100%;
  border: none;
  transition: border 0.3s ease;
}

.code-iframe.border {
  border: 1px solid #ddd;
}

.loading-overlay,
.error-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background-color: rgba(255, 255, 255, 0.95);
  z-index: 10;
}

.spinner {
  width: 40px;
  height: 40px;
  border: 4px solid rgba(0, 0, 0, 0.1);
  border-radius: 50%;
  border-top-color: #3498db;
  animation: spin 1s ease-in-out infinite;
  margin-bottom: 15px;
}

@keyframes spin {
  to { transform: rotate(360deg); }
}

.iframe-actions {
  position: absolute;
  top: 10px;
  right: 10px;
  z-index: 5;
  background: rgba(255, 255, 255, 0.9);
  padding: 5px 10px;
  border-radius: 4px;
}

.iframe-actions button {
  margin: 0 3px;
  padding: 4px 8px;
  background: #3498db;
  color: white;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

.iframe-actions button:hover {
  background: #2980b9;
}
</style>