<template>
  <div class="error-container">
    <!-- 背景图层 -->
    <div class="bg-img"></div>

    <!-- 内容区域 -->
    <div class="content-wrapper">
      <div class="error-content">
        <h1 class="error-title">404</h1>
        <p class="error-message">页面未找到</p>
        <p class="error-description">您访问的页面不存在或已被移动</p>

        <!-- 返回按钮 -->
        <el-button
            type="primary"
            size="large"
            @click="$router.push('/')"
            class="back-btn"
        >
          返回首页
        </el-button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "NotFound",
  methods: {
    goBack() {
      this.$router.go(-1);
    }
  }
}
</script>

<style scoped>
.error-container {
  position: relative;
  min-height: 100vh;
  width: 100%;
  overflow: hidden;
}

.bg-img {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;
  opacity: 0.85;
  z-index: -1;
}

.content-wrapper {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  z-index: 1;
}

.error-content {
  text-align: center;
  padding: 30px;
  background-color: rgba(255, 255, 255, 0.9);
  border-radius: 15px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(10px);
  max-width: 500px;
  width: 90%;
}

.error-title {
  font-size: 120px;
  font-weight: bold;
  color: #4caf50;
  margin-bottom: 15px;
  text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
}

.error-message {
  font-size: 24px;
  color: #333;
  margin-bottom: 10px;
}

.error-description {
  font-size: 16px;
  color: #666;
  margin-bottom: 30px;
  line-height: 1.6;
}

.back-btn {
  padding: 12px 30px;
  font-size: 16px;
  background: linear-gradient(45deg, #4caf50, #8bc34a);
  border: none;
  border-radius: 30px;
  transition: all 0.3s;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
}

.back-btn:hover {
  transform: translateY(-3px);
  box-shadow: 0 5px 15px rgba(76, 175, 80, 0.4);
  background: linear-gradient(45deg, #3d8b40, #7cb342);
}
</style>