<template>
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 200px" placeholder="请输入名称" suffix-icon="el-icon-search" v-model="farm"></el-input>
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button type="warning" @click="reset">重置</el-button>
    </div>

    <div style="margin: 10px 0">
      <el-popconfirm
          class="ml-5"
          confirm-button-text='确定'
          cancel-button-text='我再想想'
          icon="el-icon-info"
          icon-color="red"
          title="您确定批量删除这些数据吗？"
          @confirm="delBatch"
      >
        <el-button type="danger" slot="reference">批量删除 <i class="el-icon-remove-outline"></i></el-button>
      </el-popconfirm>

      <el-button type="primary" @click="exp" class="ml-5">导出 <i class="el-icon-top"></i></el-button>
    </div>

    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'"  @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="ID" width="80" sortable></el-table-column>
      <el-table-column prop="farm" label="农田名称"></el-table-column>
      <el-table-column prop="crop" label="作物名称"></el-table-column>
      <el-table-column prop="number" label="数量"></el-table-column>
      <el-table-column prop="state" label="生长状态"></el-table-column>
      <el-table-column prop="temperature" label="温度（℃）"></el-table-column>
      <el-table-column prop="airhumidity" label="空气湿度（%）"></el-table-column>
      <el-table-column prop="soilhumidity" label="土壤湿度（%）"></el-table-column>
      <el-table-column prop="carbon" label="CO2含量ppm"></el-table-column>
      <el-table-column prop="ph" label="土壤PH值"></el-table-column>
      <el-table-column prop="light" label="光照强度(lux)"></el-table-column>
      <el-table-column prop="filllight" label="补光灯状态"></el-table-column>
      <el-table-column prop="monitor" label="摄像头状态"></el-table-column>
      <el-table-column prop="pump" label="水泵状态"></el-table-column>
      <el-table-column prop="keeper" label="农田负责人"></el-table-column>

      <el-table-column label="操作"  width="180" align="center">
        <template slot-scope="scope">
          <el-button type="success" @click="handleEdit(scope.row)">编辑 <i class="el-icon-edit"></i></el-button>

        </template>
      </el-table-column>
    </el-table>
    <div style="padding: 10px 0">
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="pageNum"
          :page-sizes="[2, 5, 10, 20]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
      </el-pagination>
    </div>

    <el-dialog title="信息" :visible.sync="dialogFormVisible" width="40%" :close-on-click-modal="false">
      <el-form label-width="120px" size="small" style="width: 80%; margin: 0 auto">
        <el-form-item label="农田名称">
          <el-input v-model="form.farm" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="作物名称">
          <el-input v-model="form.crop" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="数量">
          <el-input v-model="form.number" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="生长状态">
          <el-input v-model="form.state" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="温度（℃）">
          <el-input v-model="form.temperature" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="空气湿度（%）">
          <el-input v-model="form.airhumidity" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="土壤湿度（%）">
          <el-input v-model="form.soilhumidity" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="CO2含量ppm">
          <el-input v-model="form.carbon" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="土壤PH值">
          <el-input v-model="form.ph" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="光照强度(lux)">
          <el-input v-model="form.light" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="补光灯状态">
          <el-input v-model="form.filllight" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="摄像头状态">
          <el-input v-model="form.monitor" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="水泵状态">
          <el-input v-model="form.pump" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="农田负责人">
          <el-input v-model="form.keeper" autocomplete="off"></el-input>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "Statistic",
  data() {
    return {
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      farm: "",
      form: {},
      dialogFormVisible: false,
      multipleSelection: [],
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      this.request.get("/statistic/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          farm: this.farm,
        }
      }).then(res => {
        this.tableData = res.data.records
        this.total = res.data.total
      })
    },
    save() {
      this.request.post("/statistic", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    handleAdd() {
      this.dialogFormVisible = true
      this.form = {}
      this.$nextTick(() => {
        if(this.$refs.img) {
           this.$refs.img.clearFiles();
         }
         if(this.$refs.file) {
          this.$refs.file.clearFiles();
         }
      })
    },
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
       this.$nextTick(() => {
         if(this.$refs.img) {
           this.$refs.img.clearFiles();
         }
         if(this.$refs.file) {
          this.$refs.file.clearFiles();
         }
       })
    },
    del(id) {
      this.request.delete("/statistic/" + id).then(res => {
        if (res.code === '200') {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    handleSelectionChange(val) {
      console.log(val)
      this.multipleSelection = val
    },
    delBatch() {
      if (!this.multipleSelection.length) {
        this.$message.error("请选择需要删除的数据")
        return
      }
      let ids = this.multipleSelection.map(v => v.id)  // [{}, {}, {}] => [1,2,3]
      this.request.post("/statistic/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    reset() {
      this.farm = ""
      this.load()
    },
    handleSizeChange(pageSize) {
      console.log(pageSize)
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    },
    handleFileUploadSuccess(res) {
      this.form.file = res
    },
    handleImgUploadSuccess(res) {
      this.form.img = res
    },
    download(url) {
      window.open(url)
    },
    exp() {
      window.open("http://localhost:9090/statistic/export")
    },
    handleExcelImportSuccess() {
      this.$message.success("导入成功")
      this.load()
    }
  }
}
</script>


<style>
.headerBg {
  background: #eee!important;
}
</style>
