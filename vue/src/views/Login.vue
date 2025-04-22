<template>
  <div class="wrapper" :class="{ 'show-password': showPassword }">
    <div class="header">
      <div class="logo">智慧农田管理平台</div>
      <div class="nav-buttons">
        <el-button type="text" icon="el-icon-s-home" class="home-btn" @click="$router.push('/hello')">返回主页</el-button>
      </div>
    </div>
    <div class="shell">
      <div class="login-form">
        <h2>登 录</h2>
        <el-form :model="user" :rules="rules" ref="userForm">
          <el-form-item prop="username" class="form-item">
            <label for="username">用户名</label>
            <div class="input-wrapper">
              <el-input 
                id="username"
                size="medium" 
                prefix-icon="el-icon-user" 
                v-model="user.username"
                class="custom-input">
              </el-input>
            </div>
          </el-form-item>
          
          <el-form-item prop="password" class="form-item">
            <label for="password">密码</label>
            <div class="input-wrapper">
              <el-input 
                id="password"
                size="medium" 
                prefix-icon="el-icon-lock" 
                :type="showPassword ? 'text' : 'password'"
                v-model="user.password"
                class="custom-input">
              </el-input>
              <button type="button" id="eyeball" @click="togglePassword">
                <div class="eye"></div>
              </button>
              <div id="beam" :style="beamStyle"></div>
            </div>
          </el-form-item>

          <div class="button-group">
            <el-button type="warning" class="register-btn" autocomplete="off" @click="$router.push('/register')">前往注册</el-button>
            <el-button type="primary" class="login-btn" autocomplete="off" @click="login">登录</el-button>
          </div>
          
          <div class="forgot-password">
            <el-button type="text" class="forgot-btn" autocomplete="off" @click="handlePass">找回密码</el-button>
          </div>
        </el-form>
      </div>
    </div>

    <el-dialog title="找回密码" :visible.sync="dialogFormVisible" width="30%" >
      <el-form label-width="100px" size="small">
        <el-form-item label="用户名">
          <el-input v-model="pass.username" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="手机号">
          <el-input v-model="pass.phone" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="passwordBack">重置密码</el-button>
      </div>
    </el-dialog>
    
    <div class="footer">
      <p>© 2025 智慧农田管理平台 - 让农业更智能</p>
    </div>
    <div class="password-overlay" v-if="showPassword"></div>
  </div>
</template>

<script>
import {resetRouter, setRoutes} from "@/router";
import Identify from "@/components/Identify";

export default {
  name: "Login",
  data() {
    return {
      user: {},
      pass: {},
      code: '',
      dialogFormVisible: false,
      // 图片验证码
      identifyCode: '',
      // 验证码规则
      identifyCodes: '3456789ABCDEFGHGKMNPQRSTUVWXY',
      // 添加密码显示状态变量
      showPassword: false,
      beamDegrees: 0,
      rules: {
        username: [
          { required: true, message: '请输入用户名', trigger: 'blur' },
          { min: 3, max: 10, message: '长度在 3 到 5 个字符', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur' }
        ],
      }
    }
  },
  components: {Identify},
  mounted() {
    // 重置路由
    resetRouter()
    this.refreshCode()
    
    // 添加光束效果
    this.setupBeamEffect()
  },
  methods: {
    login() {
      this.$refs['userForm'].validate((valid) => {
        if (valid) {
          this.request.post("/user/login", this.user).then(res => {
            if(res.code === '200') {
              localStorage.setItem("user", JSON.stringify(res.data))
              localStorage.setItem("menus", JSON.stringify(res.data.menus))

              setRoutes()
              this.$router.push("/")
              this.$message.success("登录成功")
            } else {
              this.$message.error(res.msg)
            }
          })
        }
      });
    },

    refreshCode() {
      this.identifyCode = ''
      this.makeCode(this.identifyCodes, 4)
    },
    // 生成随机验证码
    makeCode(o, l) {
      for (let i = 0; i < l; i++) {
        this.identifyCode += this.identifyCodes[Math.floor(Math.random() * (this.identifyCodes.length))]
      }
    },
    handlePass() {
      this.dialogFormVisible = true
      this.pass = {}
    },
    passwordBack() {
      this.request.put("/user/reset", this.pass).then(res => {
        if (res.code === '200') {
          this.$message.success("重置密码成功，新密码为：123，请尽快修改密码")
          this.dialogFormVisible = false
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    // 切换密码显示/隐藏
    togglePassword() {
      this.showPassword = !this.showPassword;
      // 密码输入框获取焦点
      setTimeout(() => {
        document.getElementById('password').focus();
      }, 100);
    },
    
    // 设置光束效果
    setupBeamEffect() {
      document.addEventListener('mousemove', (e) => {
        if (this.showPassword) {
          const beam = document.querySelector('#beam');
          if (beam) {
            const rect = beam.getBoundingClientRect();
            const beamX = rect.right;
            const beamY = rect.top + (rect.height / 2);
            const mouseX = e.clientX;
            const mouseY = e.clientY;
            
            // 计算光束角度
            const rad = Math.atan2(mouseY - beamY, mouseX - beamX);
            this.beamDegrees = (rad * (180 / Math.PI)) - 180;
          }
        }
      });
    }
  }
}
</script>

<style>
:root {
  --primary-color: #2c9e4b;
  --secondary-color: #8bc34a;
  --accent-color: #ffeb3b;
  --text-color: #333;
  --border-color: #4caf50;
  --input-bg: rgba(255, 255, 255, 0.9);
  --form-bg: rgba(255, 255, 255, 0.85);
  --beam-color: rgba(140, 230, 150, 0.6);
  --header-bg: rgba(44, 158, 75, 0.85);
  --footer-bg: rgba(44, 158, 75, 0.85);
}

.wrapper {
  background-image: url('../assets/background2.jpg');
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
  min-height: 100vh;
  font-family: 'Microsoft YaHei', sans-serif;
  display: flex;
  flex-direction: column;
}

.header {
  height: 60px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 50px;
  color: white;
  background-color: var(--header-bg);
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
  z-index: 10;
}

.logo {
  font-size: 25px;
  font-weight: bold;
  letter-spacing: 1px;
}

.nav-buttons {
  display: flex;
  align-items: center;
}

/* 眼睛按钮样式 */
#eyeball {
  --size: 1.25rem;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  outline: none;
  position: absolute;
  top: 50%;
  right: 40px;
  border: none;
  background-color: transparent;
  transform: translateY(-50%);
  z-index: 10;
}

#eyeball:active {
  transform: translateY(calc(-50% + 1px));
}

.eye {
  width: var(--size);
  height: var(--size);
  border: 2px solid var(--text-color);
  border-radius: calc(var(--size) / 1.5) 0;
  transform: rotate(45deg);
  position: relative;
}

.eye:before,
.eye:after {
  content: "";
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  margin: auto;
  border-radius: 100%;
}

.eye:before {
  width: 35%;
  height: 35%;
  background-color: var(--text-color);
}

.eye:after {
  width: 65%;
  height: 65%;
  border: 2px solid var(--text-color);
  border-radius: 100%;
}

/* 光束样式 */
#beam {
  position: absolute;
  top: 50%;
  right: 40px;
  clip-path: polygon(100% 50%, 100% 50%, 0 0, 0 100%);
  width: 100vw;
  height: 25vw;
  z-index: 1;
  mix-blend-mode: screen;
  transition: opacity 0.3s ease;
  transform-origin: 100% 50%;
  pointer-events: none;
  opacity: 0;
}

.show-password #beam {
  background: var(--beam-color);
  opacity: 0.8 !important;
}

/* 确保光束在密码框上方显示 */
.input-wrapper {
  position: relative;
  overflow: visible;
  z-index: 2;
}

/* 确保表单元素在暗背景上可见 */
.show-password .form-item label,
.show-password .el-form-item__label {
  color: white;
  text-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
}

/* 眼睛按钮在密码显示时的样式 */
.show-password #eyeball .eye,
.show-password #eyeball .eye:before,
.show-password #eyeball .eye:after {
  border-color: white;
}

.show-password #eyeball .eye:before {
  background-color: white;
}

/* 确保头部和底部在暗背景上仍然可见 */
.show-password .header,
.show-password .footer {
  z-index: 11;
  position: relative;
}

.custom-input {
  position: relative;
  z-index: 2;
}

.home-btn {
  color: white;
  font-size: 16px;
  transition: all 0.3s;
}

.home-btn:hover {
  color: var(--accent-color);
  transform: scale(1.05);
}

.shell {
  flex: 1;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 40px 0;
}

.login-form {
  width: 420px;
  padding: 35px;
  background-color: var(--form-bg);
  border: 3px solid var(--border-color);
  border-radius: 15px;
  box-shadow: 10px 10px 15px rgba(0, 0, 0, 0.3);
  transition: all 0.3s ease;
  position: relative;
  overflow: hidden;
}

.login-form::before {
  content: '';
  position: absolute;
  top: -10px;
  left: -10px;
  right: -10px;
  bottom: -10px;
  background: linear-gradient(45deg, var(--secondary-color), var(--primary-color));
  z-index: -1;
  filter: blur(20px);
  opacity: 0.3;
  transition: all 0.3s ease;
}

.login-form:hover {
  box-shadow: 15px 15px 20px rgba(0, 0, 0, 0.4);
  transform: translateY(-5px);
}

.login-form:hover::before {
  opacity: 0.5;
}

.login-form h2 {
  font-size: 32px;
  text-align: center;
  margin-bottom: 30px;
  color: var(--primary-color);
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
  position: relative;
}

.login-form h2::after {
  content: '';
  position: absolute;
  bottom: -10px;
  left: 50%;
  transform: translateX(-50%);
  width: 60px;
  height: 3px;
  background-color: var(--primary-color);
  border-radius: 3px;
}

.form-item {
  margin-bottom: 25px;
}

.form-item label {
  display: block;
  margin-bottom: 8px;
  font-size: 16px;
  color: var(--text-color);
  font-weight: bold;
}

.input-wrapper {
  position: relative;
}

.custom-input .el-input__inner {
  height: 48px;
  border: 2px solid var(--border-color);
  background-color: var(--input-bg);
  border-radius: 8px;
  padding-left: 45px;
  font-size: 16px;
  transition: all 0.3s;
  box-shadow: inset 3px 3px 5px rgba(0, 0, 0, 0.05);
}

.custom-input .el-input__inner:focus {
  border-color: var(--secondary-color);
  box-shadow: 0 0 10px rgba(76, 175, 80, 0.5);
}

.custom-input .el-input__prefix {
  left: 15px;
}

.custom-input .el-input__icon {
  font-size: 18px;
  color: var(--primary-color);
}

.button-group {
  display: flex;
  justify-content: space-between;
  margin-top: 30px;
}

.login-btn, .register-btn {
  padding: 12px 25px;
  font-size: 16px;
  border-radius: 8px;
  transition: all 0.3s;
  font-weight: bold;
}

.login-btn {
  background-color: var(--primary-color);
  border-color: var(--primary-color);
}

.login-btn:hover {
  background-color: #1e8e3e;
  transform: translateY(-3px);
  box-shadow: 0 7px 14px rgba(0, 0, 0, 0.2);
}

.login-btn:active {
  transform: translateY(-1px);
}

.register-btn {
  background-color: #ff9800;
  border-color: #ff9800;
}

.register-btn:hover {
  background-color: #f57c00;
  transform: translateY(-3px);
  box-shadow: 0 7px 14px rgba(0, 0, 0, 0.2);
}

.register-btn:active {
  transform: translateY(-1px);
}

.forgot-password {
  text-align: center;
  margin-top: 20px;
}

.forgot-btn {
  color: var(--primary-color);
  font-size: 15px;
  text-decoration: none;
  transition: all 0.3s;
}

.forgot-btn:hover {
  color: #1e8e3e;
  text-decoration: underline;
  transform: translateY(-1px);
}

/* 光束效果 */
#beam {
  position: absolute;
  top: 50%;
  right: 2rem;
  clip-path: polygon(100% 50%, 100% 50%, 0 0, 0 100%);
  width: 100vw;
  height: 25vw;
  z-index: 1;
  mix-blend-mode: overlay;
  transition: transform 200ms ease-out;
  transform-origin: 100% 50%;
  transform: translateY(-50%) rotate(var(--beamDegrees, 0));
  pointer-events: none;
  opacity: 0;
}

.el-input--suffix:hover #beam {
  background: var(--beam-color);
  opacity: 0.7;
}

/* 对话框样式 */
.el-dialog {
  border-radius: 15px;
  overflow: hidden;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
}

.el-dialog__header {
  background-color: var(--primary-color);
  padding: 15px 20px;
}

.el-dialog__title {
  color: white;
  font-weight: bold;
}

.el-dialog__headerbtn .el-dialog__close {
  color: white;
}

.el-dialog__body {
  padding: 30px;
}

.dialog-footer .el-button--primary {
  background-color: var(--primary-color);
  border-color: var(--primary-color);
}

.footer {
  background-color: var(--footer-bg);
  color: white;
  text-align: center;
  padding: 15px 0;
  font-size: 14px;
  box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.1);
}

/* 密码显示时的背景遮罩 */
.password-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.7);
  z-index: 0;
  pointer-events: none;
}

/* 显示密码时的样式调整 */
.show-password .login-form {
  z-index: 11;
  position: relative;
  box-shadow: 0 0 30px rgba(140, 230, 150, 0.3);
}
</style>
