<template>
  <div class="home-container">
    <!-- 头部信息 -->
    <div class="header-info">
      <div class="welcome">
        <b>您好！{{ user.nickname }},欢迎使用本系统</b>
      </div>
      <div class="system-time">
        <span>{{ currentTime }}</span>
      </div>
    </div>

    <!-- 主要内容区 -->
    <el-row :gutter="20" style="margin-top: 20px;">
      <!-- 左侧通知栏 -->
      <el-col :span="12">
        <el-card class="notice-card">
          <div class="card-title">
            <h3>系统通知</h3>
          </div>
          <el-collapse accordion v-model="activeNames">
            <el-collapse-item v-for="(item, index) in notice" :key="index" :name="index + ''">
              <template slot="title">
                <div class="collapse-title">
                  <span style="font-size: 16px; color: #E6A23C">{{ item.name }}</span>
                  <i style="color: #E6A23C" class="header-icon el-icon-info"></i>
                  <span style="margin-left: 20px; font-size: 14px">{{ item.time }}</span>
                </div>
              </template>
              <div class="collapse-content">
                <div class="notice-image">
                  <el-image :src="item.img" fit="cover"></el-image>
                </div>
                <div class="notice-text">{{ item.content }}</div>
              </div>
            </el-collapse-item>
          </el-collapse>
        </el-card>
      </el-col>

      <!-- 右侧天气和统计信息 -->
      <el-col :span="12">
        <el-card class="weather-card">
          <div class="card-title">
            <h3>天气信息</h3>
          </div>
          <div class="weather-info">
            <div class="weather-icon">
              <svg class="weather-svg" aria-hidden="true" version="1.1" width="100" height="100" viewBox="0 0 1024 1024">
                <path
                    fill="#F5A623"
                    d="M454.355 518.4c-79.125 105.375-39.678 249.344 98.372 313.572 12.886 5.632 27.678-1.218 32.58-15.488 3.292-8.864 5.714-21.184 5.714-33.728 0-66.272-22.72-126.336-62.01-167.616-8.19-8.192-18.272-13.408-29.662-13.408-16.512 0-31.327 8.192-41.76 24.576-10.434 16.384-15.65 37.792-13.994 60.352 6.592 98.112 67.009 176.128 156.889 176.128 81.92 0 147.84-43.872 193.664-124.288 43.872-78.336 66.912-185.856 59.392-293.504-7.616-108.864-48.576-204.928-110.528-250.72 157.472 55.552 286.656 166.016 326.592 306.144 19.008 75.808-6.144 158.272-55.584 219.52-49.568 61.184-117.824 91.776-196.256 91.776-100.992 0-191.136-41.984-260.416-121.664-68.448-79.616-100.352-179.072-93.184-288.416 6.144-89.344 42.24-170.624 101.664-237.504 30.976-38.912 66.304-72.416 103.424-100.416 49.568-39.552 103.104-69.216 162.784-87.36 60.864-18.272 124.544-27.264 190.272-27.264 66.912 0 126.336 9.024 181.76 27.264 58.176 18.272 112.192 47.808 152.672 87.36 38.912 37.984 74.464 83.328 104.992 132.096 29.504 47.104 47.808 101.312 51.712 158.688 3.968 57.376-10.432 111.936-35.968 162.784-25.536 50.848-63.328 94.208-112.224 126.336-48.896 32.128-107.072 48.288-172.8 48.288-35.968 0-69.984-7.552-101.664-22.624z"
                ></path>
              </svg>
            </div>
            <div class="weather-details">
              <div class="weather-temp">{{ weather.temp }}°C</div>
              <div class="weather-condition">{{ weather.condition }}</div>
              <div class="weather-wind">风速: {{ weather.wind }} km/h</div>
              <div class="weather-humidity">湿度: {{ weather.humidity }}%</div>
            </div>
          </div>
        </el-card>

        <el-card class="stats-card" style="margin-top: 20px;">
          <div class="card-title">
            <h3>系统统计</h3>
          </div>
          <div class="stats-content">
            <div class="stat-item">
              <span class="stat-label">用户总数</span>
              <span class="stat-value">1,234</span>
            </div>
            <div class="stat-item">
              <span class="stat-label">今日访问</span>
              <span class="stat-value">356</span>
            </div>
            <div class="stat-item">
              <span class="stat-label">活跃用户</span>
              <span class="stat-value">245</span>
            </div>
            <div class="stat-item">
              <span class="stat-label">系统运行时间</span>
              <span class="stat-value">45 天</span>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: "Home",
  data() {
    return {
      activeNames: ["0"],
      user: {
        nickname: "管理员",
      },
      notice: [
        {
          name: "系统维护通知",
          time: "2025-07-15",
          content:
              "尊敬的用户，系统将于2025年7月20日凌晨2:00-4:00进行例行维护，请提前做好准备。",
          img: "https://via.placeholder.com/300x150?text=System+Maintenance",
        },
        {
          name: "新功能上线",
          time: "2025-07-10",
          content:
              "我们很高兴地宣布，系统已于今日上线了新的功能模块，请各位用户及时体验并反馈意见。",
          img: "https://via.placeholder.com/300x150?text=New+Feature",
        },
        {
          name: "安全提示",
          time: "2025-07-05",
          content:
              "近期检测到多起异常登录行为，请各位用户注意账户安全，定期修改密码。",
          img: "https://via.placeholder.com/300x150?text=Security+Alert",
        },
      ],
      currentTime: "",
      weather: {
        temp: 25,
        condition: "晴朗",
        wind: 12,
        humidity: 45,
      },
    };
  },
  created() {
    // 初始化时间显示
    this.updateTime();
    setInterval(this.updateTime, 1000);
  },
  methods: {
    updateTime() {
      const now = new Date();
      const timeString = now.toLocaleString();
      this.currentTime = timeString;
    },
  },
};
</script>

<style scoped>
.home-container {
  padding: 20px;
  background-color: #f5f5f5;
  min-height: 100vh;
}

.header-info {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
  padding: 10px;
  background-color: #fff;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.welcome {
  color: #666;
  font-size: 16px;
}

.system-time {
  font-size: 16px;
  color: #666;
}

.card-title {
  border-bottom: 1px solid #e0e0e0;
  padding-bottom: 10px;
  margin-bottom: 10px;
}

.notice-card,
.weather-card,
.stats-card {
  background-color: #fff;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.collapse-title {
  display: flex;
  align-items: center;
}

.collapse-content {
  padding: 10px 0;
}

.notice-image {
  margin-bottom: 10px;
}

.notice-image img {
  width: 100%;
  border-radius: 5px;
}

.notice-text {
  line-height: 1.5;
}

.weather-info {
  display: flex;
  align-items: center;
  padding: 15px 0;
}

.weather-icon {
  margin-right: 20px;
}

.weather-svg {
  width: 80px;
  height: 80px;
}

.weather-details {
  flex: 1;
}

.weather-temp {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 5px;
}

.weather-condition {
  font-size: 16px;
  margin-bottom: 5px;
}

.weather-wind,
.weather-humidity {
  font-size: 14px;
  color: #666;
}

.stats-content {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 15px;
}

.stat-item {
  background-color: #f9f9f9;
  padding: 15px;
  border-radius: 5px;
  display: flex;
  justify-content: space-between;
}

.stat-label {
  color: #666;
}

.stat-value {
  font-weight: bold;
  color: #333;
}
</style>