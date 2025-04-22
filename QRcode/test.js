// 使用 CommonJS 语法
const OpenAI = require("openai");

// 初始化 OpenAI 客户端
const openai = new OpenAI({
  baseURL: 'https://api.deepseek.com', // DeepSeek API 地址
  apiKey: 'sk-edf00f6268ac4d078d0c2058490e2284', // 替换为你的 API 密钥
});

// 主函数
async function main() {
  try {
    // 创建聊天完成
    const completion = await openai.chat.completions.create({
      messages: [
        { role: "system", content: "You are a helpful assistant." } // 系统消息
      ],
      model: "deepseek-chat", // 使用的模型
    });

    // 输出助手的回复
    console.log("Assistant's response:");
    console.log(completion.choices[0].message.content);
  } catch (error) {
    // 错误处理
    console.error("An error occurred:");
    console.error(error);
  }
}

// 执行主函数
main();