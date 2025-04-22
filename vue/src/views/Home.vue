<template>
  <div style="color: #666;font-size: 14px;">

    <div style="padding-bottom: 5px" class="welcome">
      <b>您好！{{ user.nickname }},欢迎使用本系统</b>
    </div>


    <el-row :gutter="10" style="margin-bottom: 60px">
      <el-col :span="12">

    <el-card style="margin: 10px 0">

      <el-collapse accordion v-model="activeNames" v-for="(item, index) in notice">
        <el-collapse-item :name="index + ''">
          <template slot="title">
            <span style="font-size: 20px; color: #E6A23C">{{ item.name }}</span><i style="color: #E6A23C" class="header-icon el-icon-info"></i>
            <span style="margin-left: 20px">{{ item.time }}</span>
          </template>
          <div>
            <div style="padding: 10px 0"><el-image :src="item.img"></el-image></div>
            <div>{{ item.content }}</div>
          </div>
        </el-collapse-item>
      </el-collapse>
    </el-card>
      </el-col>

    <el-col :span="12" style="margin: 10px 0">
      <div  id="he-plugin-standard" ></div>
    </el-col>


</el-row>
  </div>
</template>

<script >

export default {
  name: "Home",
  data() {
    return {
     activeNames: ['0'],
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      notice: []

    }
  },
  created(){
    this.request.get("/notice").then(res => {
      this.notice = res.data.splice(0, 5)
    })
    window.WIDGET = {
      "CONFIG": {
        "layout": "1",
        "width": "550",
        "height": "350",
        "background": "1",
        "dataColor": "FFFFFF",
        "borderRadius": "5",
        "key": "729e0fc2344044c5adc578d91398aef5"
      }

    };
    (function (d) {
      var c = d.createElement('link')
      c.rel = 'stylesheet'
      c.href = 'https://widget.qweather.net/standard/static/css/he-standard.css?v=2.0'
      var s = d.createElement('script')
      s.src = 'https://widget.qweather.net/standard/static/js/he-standard-common.js?v=2.0"'
      var sn = d.getElementsByTagName('script')[0]
      sn.parentNode.insertBefore(c, sn)
      sn.parentNode.insertBefore(s, sn)
      s.onload=()=>{
        //自动宽度
        setTimeout(() => {
          document.getElementById("he-plugin-standard").style.width  = "100%";
        }, 100);
      }
    })(document)

  }

};
</script>

<style>
.welcome{
  background-color: rgb(255, 255, 255);
}
</style>
