const express = require('express');
const fs = require('fs');
const path = require('path');
const cors = require('cors'); // 引入cors中间件
const axios = require('axios'); // 用于代理API请求
const axiosInstance = axios.create(); // 创建Axios实例

const app = express();
app.use(express.json());
app.use(express.static('public'));
app.use(cors()); // 使用cors中间件解决跨域问题

const PORT = 3001;
const QRCODES_FILE = path.join(__dirname, 'public', 'qrcodes.json');

// 启用日志记录中间件
app.use((req, res, next) => {
  console.log(`接收到请求: ${req.method} ${req.url}`);
  next();
});

// 获取当前周数
function getWeekNumber(date) {
  const firstDayOfYear = new Date(date.getFullYear(), 0, 1);
  const pastDaysOfYear = (date - firstDayOfYear) / 86400000;
  return Math.ceil((pastDaysOfYear + firstDayOfYear.getDay() + 1) / 7);
}

// 初始化qrcodes.json文件
if (!fs.existsSync(QRCODES_FILE)) {
  console.log('qrcodes.json文件不存在，正在创建...');
  try {
    fs.writeFileSync(QRCODES_FILE, JSON.stringify({}, null, 2));
    console.log('成功创建qrcodes.json文件');
  } catch (error) {
    console.error('创建qrcodes.json文件失败:', error);
  }
} else {
  console.log('qrcodes.json文件已存在');
}

// API端点：添加产品信息
app.post('/api/add-product', (req, res) => {
  console.log('收到添加产品请求:', req.body);
  try {
    const { productData } = req.body;

    if (!productData) {
      console.log('请求缺少必要参数');
      return res.status(400).json({ error: '缺少必要参数' });
    }

    const now = new Date();
    const weekNumber = getWeekNumber(now);
    const weekKey = `${now.getFullYear()}-W${weekNumber}`;

    // 读取qrcodes.json文件
    let qrcodesData = {};
    try {
      const fileContent = fs.readFileSync(QRCODES_FILE, 'utf-8');
      if (fileContent.trim()) {
        qrcodesData = JSON.parse(fileContent);
      }
    } catch (error) {
      console.error('读取或解析qrcodes.json文件失败:', error);
    }

    // 确保周数据存在
    if (!qrcodesData[weekKey]) {
      qrcodesData[weekKey] = {
        weekStart: new Date(now.getFullYear(), 0, (weekNumber - 1) * 7).toISOString(),
        weekEnd: new Date(now.getFullYear(), 0, weekNumber * 7).toISOString(),
        products: {},
        nextId: 1
      };
    }

    // 使用递增的序号作为ID
    const productId = `product_${qrcodesData[weekKey].nextId}`;
    qrcodesData[weekKey].nextId++;

    // 保存产品数据
    qrcodesData[weekKey].products[productId] = {
      productId,
      productDataUrl: productData.url,
      productName: productData.name,
      createdAt: new Date().toISOString()
    };

    // 写入文件
    fs.writeFileSync(QRCODES_FILE, JSON.stringify(qrcodesData, null, 2));
    console.log('成功写入数据到qrcodes.json');

    res.json({ success: true, weekKey, productId });
  } catch (error) {
    console.error('添加产品失败:', error);
    res.status(500).json({ error: '服务器内部错误' });
  }
});

// API端点：获取二维码数据
app.get('/api/update-qrcodes', (req, res) => {
  try {
    if (!fs.existsSync(QRCODES_FILE)) {
      fs.writeFileSync(QRCODES_FILE, JSON.stringify({}, null, 2));
      return res.json({ success: true, data: {} });
    }

    const fileContent = fs.readFileSync(QRCODES_FILE, 'utf-8');
    const qrcodesData = fileContent.trim() ? JSON.parse(fileContent) : {};
    res.json({ success: true, data: qrcodesData });
  } catch (error) {
    console.error('获取二维码数据失败:', error);
    res.status(500).json({ success: false, error: '服务器内部错误' });
  }
});

// API端点：更新二维码数据
app.post('/api/update-qrcodes', (req, res) => {
  try {
    const qrcodesData = req.body;
    if (!qrcodesData) {
      return res.status(400).json({ success: false, error: '缺少必要参数' });
    }

    fs.writeFileSync(QRCODES_FILE, JSON.stringify(qrcodesData, null, 2));
    res.json({ success: true });
  } catch (error) {
    console.error('更新二维码数据失败:', error);
    res.status(500).json({ success: false, error: '服务器内部错误' });
  }
});

// 新添加的API端点：代理DeepSeek API请求
app.post('/api/deepseek/chat/complete', async (req, res) => {
  try {
    console.log('接收到DeepSeek API代理请求');
    const { authorization } = req.headers;
    const { model, messages } = req.body;

    if (!model || !messages) {
      return res.status(400).json({ error: '缺少必要参数' });
    }

    const response = await axiosInstance.post(
      'https://api.deepseek.com/v1/chat/complete',
      { model, messages },
      {
        headers: {
          'Authorization': `Bearer ${authorization}`,
          'Content-Type': 'application/json'
        }
      }
    );

    res.json(response.data);
  } catch (error) {
    console.error('代理DeepSeek API请求失败:', error);
    if (error.response) {
      res.status(error.response.status).json(error.response.data);
    } else {
      res.status(500).json({ error: '服务器内部错误' });
    }
  }
});

app.listen(PORT, () => {
  console.log(`服务器运行在 http://localhost:${PORT}`);
});