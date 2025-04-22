<template>
    <div class="hello-container">
      <!-- 草地动画效果 -->
      <div class="grass-animation">
        <div class="scene">
          <div class="grid"></div>
        </div>
      </div>
      <!-- 导航栏 -->
      <nav class="navbar">
        <div class="navbar-container">
          <div class="logo-container">
            <img class="logo-img" src="../assets/logo.png" alt="智慧农田">
            <span class="logo-text">智慧农田管理平台</span>
          </div>
          <div class="nav-links">
            <a href="https://www.yuque.com/firmament-sjwzd/oz0bwr/pco24gof07f7o5qg?singleDoc# 《智慧农田管理平台项目》" target="_blank" class="nav-btn primary-btn">
              语雀文档
            </a>
            <a href="https://github.com/Firmament11/SmartFarm.git" target="_blank" class="nav-btn secondary-btn">
              <svg class="github-icon" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 0C5.37 0 0 5.37 0 12c0 5.31 3.435 9.795 8.205 11.385.6.105.825-.255.825-.57 0-.285-.015-1.23-.015-2.235-3.015.555-3.795-.735-4.035-1.41-.135-.345-.72-1.41-1.23-1.695-.42-.225-1.02-.78-.015-.795.945-.015 1.62.87 1.845 1.23 1.08 1.815 2.805 1.305 3.495.99.105-.78.42-1.305.765-1.605-2.67-.3-5.46-1.335-5.46-5.925 0-1.305.465-2.385 1.23-3.225-.12-.3-.54-1.53.12-3.18 0 0 1.005-.315 3.3 1.23.96-.27 1.98-.405 3-.405s2.04.135 3 .405c2.295-1.56 3.3-1.23 3.3-1.23.66 1.65.24 2.88.12 3.18.765.84 1.23 1.905 1.23 3.225 0 4.605-2.805 5.625-5.475 5.925.435.375.81 1.095.81 2.22 0 1.605-.015 2.895-.015 3.3 0 .315.225.69.825.57A12.02 12.02 0 0024 12c0-6.63-5.37-12-12-12z"/>
              </svg>
              GitHub
            </a>
            <router-link to="/login" class="nav-btn primary-btn">
              登录
            </router-link>
            <router-link to="/register" class="nav-btn outline-btn">
              注册
            </router-link>
          </div>
        </div>
      </nav>
  
      <!-- 主要内容 -->
      <div class="main-content">
        <!-- 英雄区域 -->
        <div class="hero-section">
          <div class="hero-content">
            <h1 class="hero-title">智慧农田管理平台</h1>
            <p class="hero-subtitle">科技赋能农业，智慧创造未来</p>
            <div class="hero-buttons">
              <a href="#features" class="hero-btn">
                了解更多
                <svg class="arrow-icon" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd" />
                </svg>
              </a>
              <router-link to="/code" class="hero-btn ml-4">
                生成溯源码
              </router-link>
              <router-link to="/verify" class="hero-btn ml-4">
                验证溯源码
              </router-link>
            </div>
          </div>
          <div class="hero-background">
            <div class="hero-overlay"></div>
            <div class="hero-pattern"></div>
          </div>
        </div>
  
        <!-- 视频演示 -->
        <div class="video-section">
            <div class="video-container">
                <iframe width="560" height="315" src="https://www.youtube.com/embed/VDf4YZuwFhE" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
        </div>
  
        <!-- 核心功能模块 -->
        <div id="features" class="features-section">
          <h2 class="section-title">核心功能模块</h2>
          <div class="features-grid">
            <!-- 农场主页 -->
            <div class="feature-card">
              <div class="feature-icon">🏡</div>
              <h3 class="feature-title">农场主页</h3>
              <p class="feature-desc">系统公告、天气预报、农事提醒，让您随时掌握农场动态。</p>
              <ul class="feature-list">
                <li class="feature-item">实时天气信息</li>
                <li class="feature-item">重要通知提醒</li>
                <li class="feature-item">农事活动日历</li>
              </ul>
            </div>
  
            <!-- 统计分析 -->
            <div class="feature-card">
              <div class="feature-icon">📊</div>
              <h3 class="feature-title">统计分析</h3>
              <p class="feature-desc">数据可视化展示，帮助您更好地理解农场运营状况。</p>
              <ul class="feature-list">
                <li class="feature-item">产量统计分析</li>
                <li class="feature-item">成本收益分析</li>
                <li class="feature-item">生长周期追踪</li>
              </ul>
            </div>
  
            <!-- 农田管理 -->
            <div class="feature-card">
              <div class="feature-icon">🌾</div>
              <h3 class="feature-title">农田管理</h3>
              <p class="feature-desc">智能监控系统，实时掌握农田环境状况。</p>
              <ul class="feature-list">
                <li class="feature-item">土壤监测</li>
                <li class="feature-item">灌溉控制</li>
                <li class="feature-item">病虫害预警</li>
              </ul>
            </div>
  
            <!-- 物资管理 -->
            <div class="feature-card">
              <div class="feature-icon">📦</div>
              <h3 class="feature-title">物资管理</h3>
              <p class="feature-desc">农资采购、库存管理、农产品销售的一站式解决方案。</p>
              <ul class="feature-list">
                <li class="feature-item">库存追踪</li>
                <li class="feature-item">采购管理</li>
                <li class="feature-item">销售记录</li>
              </ul>
            </div>
  
            <!-- 系统管理 -->
            <div class="feature-card">
              <div class="feature-icon">⚙️</div>
              <h3 class="feature-title">系统管理</h3>
              <p class="feature-desc">完善的权限管理，确保系统安全可靠运行。</p>
              <ul class="feature-list">
                <li class="feature-item">用户权限管理</li>
                <li class="feature-item">系统配置</li>
                <li class="feature-item">日志监控</li>
              </ul>
            </div>
          </div>
        </div>
  
        <!-- 平台优势 -->
        <div class="advantages-section">
          <h2 class="section-title">平台优势</h2>
          <div class="advantages-grid">
            <div class="advantage-card">
              <div class="advantage-icon-container">
                <span class="advantage-icon">⚡</span>
              </div>
              <h3 class="advantage-title">实时监控</h3>
              <p class="advantage-desc">24小时实时监测农田环境数据，及时预警异常情况。</p>
            </div>
  
            <div class="advantage-card">
              <div class="advantage-icon-container">
                <span class="advantage-icon">🤖</span>
              </div>
              <h3 class="advantage-title">智能决策</h3>
              <p class="advantage-desc">基于大数据分析，提供智能化的农业生产决策建议。</p>
            </div>
  
            <div class="advantage-card">
              <div class="advantage-icon-container">
                <span class="advantage-icon">📱</span>
              </div>
              <h3 class="advantage-title">移动管理</h3>
              <p class="advantage-desc">支持移动端操作，随时随地管理您的农场。</p>
              <a href="/miniprogram/home.html" target="_blank" class="mt-3 inline-block px-4 py-2 bg-green-500 text-white rounded-lg text-sm hover:bg-green-600 transition-colors font-bold">
                体验小程序原型
                <svg class="inline-block ml-1 w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path>
                </svg>
              </a>
            </div>
  
            <div class="advantage-card">
              <div class="advantage-icon-container">
                <span class="advantage-icon">🔒</span>
              </div>
              <h3 class="advantage-title">安全可靠</h3>
              <p class="advantage-desc">采用先进的安全技术，保护您的数据安全。</p>
            </div>
          </div>
        </div>
  
        <!-- 数据统计 -->
        <div class="stats-section">
          <h2 class="section-title">平台数据</h2>
          <div class="stats-grid">
            <div class="stat-card">
              <div class="stat-value count-up" data-target="1000">0</div>
              <div class="stat-label">农田管理面积（亩）</div>
            </div>
            <div class="stat-card">
              <div class="stat-value count-up" data-target="500">0</div>
              <div class="stat-label">服务农户数量</div>
            </div>
            <div class="stat-card">
              <div class="stat-value count-up" data-target="98">0</div>
              <div class="stat-label">用户满意度（%）</div>
            </div>
            <div class="stat-card">
              <div class="stat-value count-up" data-target="365">0</div>
              <div class="stat-label">全年服务天数</div>
            </div>
          </div>
        </div>
  
        <!-- 技术架构 -->
        <div class="tech-section">
          <h2 class="section-title">技术架构</h2>
          <div class="tech-container">
            <div class="tech-diagram">
              <div class="tech-layer">
                <div class="tech-box">前端展示层</div>
                <div class="tech-items">
                  <span class="tech-item">Vue.js</span>
                  <span class="tech-item">Element UI</span>
                  <span class="tech-item">ECharts</span>
                </div>
              </div>
              <div class="tech-arrow">↓</div>
              <div class="tech-layer">
                <div class="tech-box">应用服务层</div>
                <div class="tech-items">
                  <span class="tech-item">Spring Boot</span>
                  <span class="tech-item">Spring Security</span>
                  <span class="tech-item">MyBatis Plus</span>
                </div>
              </div>
              <div class="tech-arrow">↓</div>
              <div class="tech-layer">
                <div class="tech-box">数据存储层</div>
                <div class="tech-items">
                  <span class="tech-item">MySQL</span>
                  <span class="tech-item">Redis</span>
                  <span class="tech-item">文件存储</span>
                </div>
              </div>
            </div>
            <div class="tech-description">
              <h3 class="tech-title">系统架构说明</h3>
              <p class="tech-text">智慧农田管理平台采用前后端分离架构，前端使用 Vue.js 框架和 Element UI 组件库构建用户界面，后端基于 Spring Boot 提供 RESTful API 服务，数据存储采用 MySQL 关系型数据库和 Redis 缓存。系统支持多种数据采集设备接入，实现农田环境数据的实时监测和智能分析。</p>
            </div>
          </div>
        </div>
  
        <!-- 客户评价 -->
        <div class="testimonials-section">
          <h2 class="section-title">客户评价</h2>
          <div class="testimonials-container">
            <div class="testimonial-card">
              <div class="testimonial-content">
                <p class="testimonial-text">"智慧农田管理平台帮助我们提高了农作物产量，降低了生产成本，是现代农业不可或缺的好帮手。"</p>
              </div>
              <div class="testimonial-author">
                <div class="testimonial-avatar">
                  <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="用户头像">
                </div>
                <div class="testimonial-info">
                  <h4 class="testimonial-name">张先生</h4>
                  <p class="testimonial-role">合作社负责人</p>
                </div>
              </div>
            </div>
            <div class="testimonial-card">
              <div class="testimonial-content">
                <p class="testimonial-text">"系统操作简单直观，即使是不懂技术的老农民也能轻松上手，真正实现了智慧农业的普及。"</p>
              </div>
              <div class="testimonial-author">
                <div class="testimonial-avatar">
                  <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="用户头像">
                </div>
                <div class="testimonial-info">
                  <h4 class="testimonial-name">李女士</h4>
                  <p class="testimonial-role">家庭农场主</p>
                </div>
              </div>
            </div>
            <div class="testimonial-card">
              <div class="testimonial-content">
                <p class="testimonial-text">"数据分析功能非常强大，帮助我们精准把握市场需求，优化种植结构，提高了经济效益。"</p>
              </div>
              <div class="testimonial-author">
                <div class="testimonial-avatar">
                  <img src="https://randomuser.me/api/portraits/men/67.jpg" alt="用户头像">
                </div>
                <div class="testimonial-info">
                  <h4 class="testimonial-name">王先生</h4>
                  <p class="testimonial-role">农业企业经理</p>
                </div>
              </div>
            </div>
          </div>
        </div>
  
        <!-- 常见问题 -->
        <div class="faq-section">
          <h2 class="section-title">常见问题</h2>
          <div class="faq-container">
            <div class="faq-item" v-for="(faq, index) in faqs" :key="index" @click="toggleFaq(index)">
              <div class="faq-question" :class="{ 'active': faq.active }">
                <span>{{ faq.question }}</span>
                <span class="faq-icon">{{ faq.active ? '−' : '+' }}</span>
              </div>
              <div class="faq-answer" :class="{ 'active': faq.active }">
                <p>{{ faq.answer }}</p>
              </div>
            </div>
          </div>
        </div>
  
        <!-- 联系我们 -->
        <div class="contact-section">
          <h2 class="section-title">联系我们</h2>
          <div class="contact-container">
            <div class="contact-info">
              <div class="contact-item">
                <div class="contact-icon">📍</div>
                <div class="contact-text">
                  <h3>地址</h3>
                  <p>郑州市中原区荷园五号楼b单元</p>
                </div>
              </div>
              <div class="contact-item">
                <div class="contact-icon">📞</div>
                <div class="contact-text">
                  <h3>电话</h3>
                  <p>186-2483-3344</p>
                </div>
              </div>
              <div class="contact-item">
                <div class="contact-icon">✉️</div>
                <div class="contact-text">
                  <h3>邮箱</h3>
                  <p>hoaliptrap@gmail.com</p>
                </div>
              </div>
            </div>
            <div class="contact-form">
              <h3 class="form-title">发送消息</h3>
              <div class="form-group">
                <label for="name">姓名</label>
                <input type="text" id="name" placeholder="请输入您的姓名">
              </div>
              <div class="form-group">
                <label for="email">邮箱</label>
                <input type="email" id="email" placeholder="请输入您的邮箱">
              </div>
              <div class="form-group">
                <label for="message">消息</label>
                <textarea id="message" rows="4" placeholder="请输入您的消息"></textarea>
              </div>
              <button class="form-submit">发送消息</button>
            </div>
          </div>
        </div>
      </div>
  
      <!-- 页脚 -->
      <footer class="footer">
        <div class="footer-container">
          <div class="footer-grid">
            <div class="footer-section">
              <h3 class="footer-title">关于我们</h3>
              <p class="footer-text">智慧农田管理平台致力于为现代农业提供智能化解决方案，助力农业数字化转型。</p>
            </div>
            <div class="footer-section">
              <h3 class="footer-title">联系方式</h3>
              <p class="footer-text">邮箱：hoaliptrap@gmail.com</p>
              <p class="footer-text">电话：186-2483-3344</p>
            </div>
            <div class="footer-section">
              <h3 class="footer-title">关注我们</h3>
              <div class="footer-social">
                <a href="#" class="social-link">微信</a>
                <a href="#" class="social-link">微博</a>
                <a href="#" class="social-link">抖音</a>
              </div>
            </div>
          </div>
          <div class="footer-bottom">
            <p class="copyright">&copy; 2025 智慧农田管理平台. All rights reserved.</p>
          </div>
        </div>
      </footer>
  
      <!-- 返回顶部按钮 -->
      <div class="back-to-top" @click="scrollToTop" :class="{ 'visible': showBackToTop }">
        <span class="top-arrow">↑</span>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: 'Hello',
    data() {
      return {
        showBackToTop: false,
        faqs: [
          {
            question: '智慧农田管理平台适用于哪些类型的农场？',
            answer: '我们的平台适用于各种规模的农场，从小型家庭农场到大型农业企业都可以使用。系统提供了灵活的配置选项，可以根据不同农场的需求进行定制。',
            active: false
          },
          {
            question: '平台是否支持移动设备访问？',
            answer: '是的，我们的平台采用响应式设计，可以在电脑、平板和手机等各种设备上使用，让您随时随地管理您的农场。',
            active: false
          },
          {
            question: '如何将我的农田设备接入系统？',
            answer: '我们的平台支持多种标准协议的农业物联网设备接入，包括但不限于温湿度传感器、土壤监测设备、灌溉控制系统等。您可以联系我们的技术支持团队获取详细的设备接入指南。',
            active: false
          },
          {
            question: '平台的数据安全性如何保障？',
            answer: '我们采用多层次的安全防护措施，包括数据加密传输、访问权限控制、定期备份等，确保您的农场数据安全可靠。同时，我们严格遵守相关的数据保护法规。',
            active: false
          },
          {
            question: '是否提供培训和技术支持？',
            answer: '是的，我们提供全面的培训和技术支持服务，包括系统使用培训、技术问题解答、远程协助等，确保您能够充分利用平台的各项功能。',
            active: false
          }
        ]
      }
    },
    mounted() {
      // 监听滚动事件
      window.addEventListener('scroll', this.handleScroll);
      
      // 添加滚动动画
      this.addScrollAnimation();
      
      // 启动数字计数动画
      this.startCountUp();
      
      // 初始化草地动画
      this.initGrassAnimation();
    },
    beforeDestroy() {
      // 移除滚动事件监听
      window.removeEventListener('scroll', this.handleScroll);
    },
    methods: {
      handleScroll() {
        // 控制返回顶部按钮显示
        this.showBackToTop = window.scrollY > 500;
        
        // 检查元素是否在视口中，添加动画
        this.checkElementsInView();
      },
      scrollToTop() {
        window.scrollTo({
          top: 0,
          behavior: 'smooth'
        });
      },
      addScrollAnimation() {
        // 获取所有需要添加动画的元素
        const animElements = document.querySelectorAll('.feature-card, .advantage-card, .stat-card, .tech-layer, .testimonial-card, .faq-item');
        
        // 设置观察器选项
        const observerOptions = {
          threshold: 0.1
        };
        
        // 创建观察器
        const observer = new IntersectionObserver((entries) => {
          entries.forEach(entry => {
            if (entry.isIntersecting) {
              entry.target.classList.add('animate-in');
              observer.unobserve(entry.target);
            }
          });
        }, observerOptions);
        
        // 观察每个元素
        animElements.forEach(el => {
          observer.observe(el);
        });
      },
      checkElementsInView() {
        // 获取所有需要检查的元素
        const elements = document.querySelectorAll('.feature-card, .advantage-card, .stat-card, .tech-layer, .testimonial-card, .faq-item');
        
        elements.forEach(el => {
          const rect = el.getBoundingClientRect();
          const windowHeight = window.innerHeight || document.documentElement.clientHeight;
          
          if (rect.top <= windowHeight * 0.8) {
            el.classList.add('animate-in');
          }
        });
      },
      startCountUp() {
        // 获取所有计数元素
        const countElements = document.querySelectorAll('.count-up');
        
        // 设置观察器选项
        const observerOptions = {
          threshold: 0.1
        };
        
        // 创建观察器
        const observer = new IntersectionObserver((entries) => {
          entries.forEach(entry => {
            if (entry.isIntersecting) {
              const target = parseInt(entry.target.getAttribute('data-target'));
              const duration = 2000; // 动画持续时间（毫秒）
              const step = target / (duration / 16); // 每16ms更新一次
              let current = 0;
              
              const timer = setInterval(() => {
                current += step;
                if (current >= target) {
                  entry.target.textContent = target;
                  clearInterval(timer);
                } else {
                  entry.target.textContent = Math.floor(current);
                }
              }, 16);
              
              observer.unobserve(entry.target);
            }
          });
        }, observerOptions);
        
        // 观察每个计数元素
        countElements.forEach(el => {
          observer.observe(el);
        });
      },
      toggleFaq(index) {
        this.faqs.forEach((faq, i) => {
          if (i === index) {
            this.faqs[i].active = !this.faqs[i].active;
          } else {
            this.faqs[i].active = false;
          }
        });
      },
      
      initGrassAnimation() {
        const gridElement = document.querySelector('.grid');
        if (!gridElement) return;
        
        let htmlCode = '';
        
        for (let i = 0; i < 110; i++) {
          let rowStartDelay = -0.2 * Math.floor(i / 10); // 计算每行的开始延迟
          let delay = rowStartDelay + -0.22 * (i % 10); // 计算每个元素的延迟
          htmlCode += `<i style="--delay:${delay}s;"></i>`; // 创建HTML代码，并设置延迟
        }
        
        gridElement.innerHTML = htmlCode; // 将生成的HTML代码插入网格中
      }
    }
  }
  </script>
  
  <style scoped>
/* 基础样式 */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.hello-container {
  font-family: 'Helvetica Neue', Arial, sans-serif;
  color: #333;
  line-height: 1.6;
}

/* 导航栏样式 */
.navbar {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  background-color: #fff;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  z-index: 1000;
}

.navbar-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
  height: 64px;
}

.logo-container {
  display: flex;
  align-items: center;
}

.logo-img {
  height: 32px;
  width: auto;
  transition: transform 0.3s;
}

.logo-img:hover {
  transform: rotate(12deg);
}

.logo-text {
  margin-left: 10px;
  font-size: 18px;
  font-weight: bold;
  color: #333;
  transition: color 0.3s;
}

.logo-text:hover {
  color: #2c8c3c;
}

.nav-links {
  display: flex;
  align-items: center;
  gap: 16px;
}

.nav-btn {
  display: inline-flex;
  align-items: center;
  padding: 8px 16px;
  border-radius: 4px;
  font-size: 14px;
  font-weight: 500;
  text-decoration: none;
  transition: all 0.3s;
  cursor: pointer;
}

.primary-btn {
  background-color: #2c8c3c;
  color: white;
  border: none;
}

.primary-btn:hover {
  background-color: #1b5e20;
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.secondary-btn {
  background-color: #f5f5f5;
  color: #333;
  border: none;
}

.secondary-btn:hover {
  background-color: #e0e0e0;
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.outline-btn {
  background-color: transparent;
  color: #2c8c3c;
  border: 1px solid #2c8c3c;
}

.outline-btn:hover {
  background-color: rgba(44, 140, 60, 0.1);
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.github-icon {
  width: 20px;
  height: 20px;
  margin-right: 8px;
}

/* 主要内容样式 */
.main-content {
  padding-top: 64px; /* 导航栏高度 */
}

/* 英雄区域样式 */
.hero-section {
  position: relative;
  height: 600px;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
}

.hero-content {
  position: relative;
  z-index: 10;
  text-align: center;
  max-width: 800px;
  padding: 0 20px;
}

.hero-title {
  font-size: 48px;
  font-weight: 800;
  color: white;
  margin-bottom: 20px;
  animation: slideDown 0.8s ease-out;
}

.hero-subtitle {
  font-size: 24px;
  color: rgba(255, 255, 255, 0.9);
  margin-bottom: 30px;
  animation: slideUp 0.8s ease-out 0.3s both;
}

.hero-buttons {
  display: flex;
  justify-content: center;
  gap: 16px;
  animation: fadeIn 1s ease-out 0.6s both;
}

.hero-btn {
  display: inline-flex;
  align-items: center;
  padding: 12px 24px;
  background-color: white;
  color: #2c8c3c;
  border-radius: 4px;
  font-size: 16px;
  font-weight: 500;
  text-decoration: none;
  transition: all 0.3s;
}

.hero-btn:hover {
  background-color: #f5f5f5;
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.arrow-icon {
  width: 20px;
  height: 20px;
  margin-left: 8px;
}

.hero-background {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.hero-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(to right, #2c8c3c, #1976d2);
  opacity: 0.85;
}

.hero-pattern {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: linear-gradient(rgba(255, 255, 255, 0.1) 1px, transparent 1px),
    linear-gradient(90deg, rgba(255, 255, 255, 0.1) 1px, transparent 1px);
  background-size: 20px 20px;
  opacity: 0.2;
}

/* 视频区域样式 */
.video-section {
  padding: 80px 20px;
  max-width: 1200px;
  margin: 0 auto;
}

.video-container {
  position: relative;
  width: 100%;
  max-width: 800px;
  margin: 0 auto;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
}

.video-player {
  width: 100%;
  display: block;
}

/* 功能模块样式 */
.features-section {
  padding: 80px 20px;
  max-width: 1200px;
  margin: 0 auto;
}

.section-title {
  font-size: 36px;
  font-weight: 700;
  text-align: center;
  margin-bottom: 60px;
  color: #333;
  position: relative;
}

.section-title::after {
  content: '';
  position: absolute;
  bottom: -15px;
  left: 50%;
  transform: translateX(-50%);
  width: 80px;
  height: 4px;
  background-color: #2c8c3c;
  border-radius: 2px;
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 30px;
}

.feature-card {
  background-color: white;
  border-radius: 12px;
  padding: 30px;
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
  transition: all 0.3s;
  opacity: 0;
  transform: translateY(20px);
}

.feature-card.animate-in {
  opacity: 1;
  transform: translateY(0);
}

.feature-card:hover {
  transform: translateY(-10px);
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
}

.feature-icon {
  font-size: 48px;
  margin-bottom: 20px;
}

.feature-title {
  font-size: 20px;
  font-weight: 600;
  margin-bottom: 15px;
  color: #333;
}

.feature-desc {
  color: #666;
  margin-bottom: 20px;
}

.feature-list {
  list-style: none;
}

.feature-item {
  position: relative;
  padding-left: 20px;
  margin-bottom: 10px;
  color: #666;
}

.feature-item::before {
  content: '✓';
  position: absolute;
  left: 0;
  color: #2c8c3c;
}

/* 平台优势样式 */
.advantages-section {
  padding: 80px 20px;
  background-color: #f9f9f9;
}

.advantages-grid {
  max-width: 1200px;
  margin: 0 auto;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 30px;
}

.advantage-card {
  background-color: white;
  border-radius: 12px;
  padding: 30px;
  text-align: center;
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
  transition: all 0.3s;
  opacity: 0;
  transform: translateY(20px);
}

.advantage-card.animate-in {
  opacity: 1;
  transform: translateY(0);
}

.advantage-card:hover {
  transform: translateY(-10px);
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
}

.advantage-icon-container {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  background-color: #e8f5e9;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 20px;
}

.advantage-icon {
  font-size: 30px;
}

.advantage-title {
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 15px;
  color: #333;
}

.advantage-desc {
  color: #666;
}

/* 数据统计样式 */
.stats-section {
  padding: 80px 20px;
  max-width: 1200px;
  margin: 0 auto;
}

.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 30px;
}

.stat-card {
  background-color: white;
  border-radius: 12px;
  padding: 30px;
  text-align: center;
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
  transition: all 0.3s;
  opacity: 0;
  transform: translateY(20px);
}

.stat-card.animate-in {
  opacity: 1;
  transform: translateY(0);
}

.stat-card:hover {
  transform: translateY(-10px);
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
}

.stat-value {
  font-size: 36px;
  font-weight: 700;
  color: #2c8c3c;
  margin-bottom: 10px;
}

.stat-label {
  color: #666;
}

/* 技术架构样式 */
.tech-section {
  padding: 80px 20px;
  background-color: #f9f9f9;
}

.tech-container {
  max-width: 1200px;
  margin: 0 auto;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 50px;
}

@media (max-width: 768px) {
  .tech-container {
    grid-template-columns: 1fr;
  }
}

.tech-diagram {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.tech-layer {
  background-color: white;
  border-radius: 12px;
  padding: 20px;
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
  transition: all 0.3s;
  opacity: 0;
  transform: translateY(20px);
}

.tech-layer.animate-in {
  opacity: 1;
  transform: translateY(0);
}

.tech-box {
  background-color: #2c8c3c;
  color: white;
  padding: 10px;
  border-radius: 6px;
  text-align: center;
  font-weight: 600;
  margin-bottom: 15px;
}

.tech-items {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}

.tech-item {
  background-color: #e8f5e9;
  color: #2c8c3c;
  padding: 5px 10px;
  border-radius: 4px;
  font-size: 14px;
}

.tech-arrow {
  text-align: center;
  font-size: 24px;
  color: #2c8c3c;
}

.tech-description {
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.tech-title {
  font-size: 24px;
  font-weight: 600;
  margin-bottom: 20px;
  color: #333;
}

.tech-text {
  color: #666;
  line-height: 1.8;
}

/* 客户评价样式 */
.testimonials-section {
  padding: 80px 20px;
  max-width: 1200px;
  margin: 0 auto;
}

.testimonials-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 30px;
}

.testimonial-card {
  background-color: white;
  border-radius: 12px;
  padding: 30px;
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
  transition: all 0.3s;
  opacity: 0;
  transform: translateY(20px);
}

.testimonial-card.animate-in {
  opacity: 1;
  transform: translateY(0);
}

.testimonial-card:hover {
  transform: translateY(-10px);
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
}

.testimonial-content {
  margin-bottom: 20px;
}

.testimonial-text {
  color: #666;
  font-style: italic;
  line-height: 1.8;
}

.testimonial-author {
  display: flex;
  align-items: center;
}

.testimonial-avatar {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  overflow: hidden;
  margin-right: 15px;
}

.testimonial-avatar img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.testimonial-name {
  font-size: 16px;
  font-weight: 600;
  color: #333;
  margin-bottom: 5px;
}

.testimonial-role {
  font-size: 14px;
  color: #666;
}

/* 常见问题样式 */
.faq-section {
  padding: 80px 20px;
  background-color: #f9f9f9;
}

.faq-container {
  max-width: 800px;
  margin: 0 auto;
}

.faq-item {
  background-color: white;
  border-radius: 12px;
  margin-bottom: 20px;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
  overflow: hidden;
  transition: all 0.3s;
  opacity: 0;
  transform: translateY(20px);
}

.faq-item.animate-in {
  opacity: 1;
  transform: translateY(0);
}

.faq-question {
  padding: 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  cursor: pointer;
  font-weight: 600;
  color: #333;
  transition: background-color 0.3s;
}

.faq-question:hover {
  background-color: #f5f5f5;
}

.faq-question.active {
  background-color: #e8f5e9;
  color: #2c8c3c;
}

.faq-icon {
  font-size: 20px;
  font-weight: 700;
}

.faq-answer {
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.3s ease-out;
}

.faq-answer.active {
  max-height: 200px;
  padding: 0 20px 20px;
}

.faq-answer p {
  color: #666;
  line-height: 1.8;
}

/* 联系我们样式 */
.contact-section {
  padding: 80px 20px;
  max-width: 1200px;
  margin: 0 auto;
}

.contact-container {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 50px;
}

@media (max-width: 768px) {
  .contact-container {
    grid-template-columns: 1fr;
  }
}

.contact-info {
  display: flex;
  flex-direction: column;
  gap: 30px;
}

.contact-item {
  display: flex;
  align-items: flex-start;
}

.contact-icon {
  font-size: 24px;
  margin-right: 15px;
  color: #2c8c3c;
}

.contact-text h3 {
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 5px;
  color: #333;
}

.contact-text p {
  color: #666;
}

.contact-form {
  background-color: white;
  border-radius: 12px;
  padding: 30px;
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
}

.form-title {
  font-size: 24px;
  font-weight: 600;
  margin-bottom: 20px;
  color: #333;
}

.form-group {
  margin-bottom: 20px;
}

.form-group label {
  display: block;
  margin-bottom: 5px;
  color: #666;
}

.form-group input,
.form-group textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 16px;
  transition: border-color 0.3s;
}

.form-group input:focus,
.form-group textarea:focus {
  outline: none;
  border-color: #2c8c3c;
}

.form-submit {
  background-color: #2c8c3c;
  color: white;
  border: none;
  border-radius: 4px;
  padding: 12px 24px;
  font-size: 16px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s;
}

.form-submit:hover {
  background-color: #1b5e20;
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* 页脚样式 */
.footer {
  background-color: #333;
  color: white;
  padding: 60px 20px 30px;
}

.footer-container {
  max-width: 1200px;
  margin: 0 auto;
}

.footer-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 30px;
  margin-bottom: 40px;
}

.footer-title {
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 20px;
  color: white;
}

.footer-text {
  color: #bbb;
  margin-bottom: 10px;
}

.footer-social {
  display: flex;
  gap: 15px;
}

.social-link {
  color: #bbb;
  text-decoration: none;
  transition: color 0.3s;
}

.social-link:hover {
  color: white;
}

.footer-bottom {
  border-top: 1px solid #444;
  padding-top: 20px;
  text-align: center;
}

.copyright {
  color: #bbb;
  font-size: 14px;
}

/* 返回顶部按钮 */
.back-to-top {
  position: fixed;
  bottom: 30px;
  right: 30px;
  width: 50px;
  height: 50px;
  background-color: #2c8c3c;
  color: white;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  opacity: 0;
  visibility: hidden;
  transition: all 0.3s;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  z-index: 100;
}

.back-to-top.visible {
  opacity: 1;
  visibility: visible;
}

.back-to-top:hover {
  background-color: #1b5e20;
  transform: translateY(-5px);
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

.top-arrow {
  font-size: 24px;
}

/* 动画 */
@keyframes slideDown {
  from {
    opacity: 0;
    transform: translateY(-20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes slideUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

/* 响应式设计 */
@media (max-width: 768px) {
  .hero-title {
    font-size: 36px;
  }
  
  .hero-subtitle {
    font-size: 18px;
  }
  
  .section-title {
    font-size: 28px;
  }
  
  .features-grid,
  .advantages-grid,
  .stats-grid,
  .testimonials-container {
    grid-template-columns: 1fr;
  }
}

/* 草地动画效果样式 */
.grass-animation {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 30vh;
  z-index: -1;
  overflow: hidden;
  pointer-events: none;
}

.scene {
  position: relative;
  height: 100%;
  width: 100%;
  animation: scene 40s infinite linear;
  transform-style: preserve-3d;
}

@keyframes scene {
  from {
    transform: rotateX(45deg) rotateZ(0deg);
  }
  to {
    transform: rotateX(45deg) rotateZ(360deg);
  }
}

.grid {
  position: absolute;
  inset: -10em;
  display: grid;
  grid-template-columns: repeat(10, 1fr);
  gap: 1.5em;
  transform-style: preserve-3d;
}

.grid i {
  position: relative;
  width: 100%;
  height: 100%;
  animation: i 5s var(--delay, 0s) infinite linear;
  transform-style: preserve-3d;
}

@keyframes i {
  from {
    transform: rotate(0deg) rotateX(30deg);
  }
  to {
    transform: rotate(360deg) rotateX(30deg);
  }
}

.grid i::before,
.grid i::after {
  content: "";
  position: absolute;
  top: -950%;
  width: 120%;
  height: 2000%;
  transform: rotateX(90deg);
  border-radius: 50%;
  background-image: linear-gradient(#e8f5e9, rgb(44, 140, 60));
}

.grid i::after {
  transform: rotateX(90deg) rotateY(90deg);
}
</style>