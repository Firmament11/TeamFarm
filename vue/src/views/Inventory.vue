<template>
  <div>
    <!-- 搜索表单 -->
    <div style="margin: 10px 0">
      <el-input
          style="width: 200px"
          placeholder="请输入产品名称"
          suffix-icon="el-icon-search"
          v-model="produce"
          clearable
      ></el-input>
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button type="warning" @click="reset">重置</el-button>
    </div>

    <!-- 操作按钮 -->
    <div style="margin: 10px 0">
      <el-button type="primary" @click="handleAdd">新增 <i class="el-icon-circle-plus-outline"></i></el-button>
      <el-popconfirm
          class="ml-5"
          confirm-button-text="确定"
          cancel-button-text="我再想想"
          icon="el-icon-info"
          icon-color="red"
          title="您确定批量删除这些数据吗？"
          @confirm="delBatch"
      >
        <el-button type="danger" slot="reference">批量删除 <i class="el-icon-remove-outline"></i></el-button>
      </el-popconfirm>
      <el-button type="primary" @click="downloadTemplate" class="ml-5">下载导入模板</el-button>
      <el-upload
          action=""
          :show-file-list="false"
          accept="xlsx"
          :http-request="handleExcelImport"
          style="display: inline-block"
      >
        <el-button type="primary" class="ml-5">导入 <i class="el-icon-bottom"></i></el-button>
      </el-upload>
      <el-button type="primary" @click="exp" class="ml-5">导出 <i class="el-icon-top"></i></el-button>
    </div>

    <!-- 表格展示 -->
    <el-table
        :data="tableData"
        border
        stripe
        :header-cell-class-name="'headerBg'"
        @selection-change="handleSelectionChange"
        height="400px"
    >
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="ID" width="80" sortable></el-table-column>
      <!-- 新增农作物批次信息 -->
      <el-table-column prop="batch" label="批次" width="100"></el-table-column>
      <!-- 新增溯源码信息 -->
      <el-table-column prop="traceCode" label="溯源码" width="150"></el-table-column>
      <el-table-column prop="produce" label="产品"></el-table-column>
      <el-table-column prop="warehouse" label="仓库"></el-table-column>
      <el-table-column prop="region" label="存储区"></el-table-column>
      <el-table-column prop="number" label="数量"></el-table-column>
      <el-table-column prop="keeper" label="仓库管理员"></el-table-column>
      <el-table-column prop="remark" label="备注"></el-table-column>
      <!-- 新增施肥信息 -->
      <el-table-column prop="fertilizing" label="施肥记录" width="120"></el-table-column>
      <!-- 新增浇水信息 -->
      <el-table-column prop="watering" label="浇水记录" width="120"></el-table-column>
      <!-- 新增生长阶段时间线 -->
      <el-table-column prop="growthTimeline" label="生长阶段时间线" width="150"></el-table-column>
      <!-- 新增农场信息 -->
      <el-table-column prop="farmName" label="农场名称" width="120"></el-table-column>
      <!-- 新增农田情况 -->
      <el-table-column prop="fieldCondition" label="农田情况" width="120"></el-table-column>
      <el-table-column label="操作" width="180" align="center">
        <template slot-scope="scope">
          <el-button type="success" @click="handleEdit(scope.row)">编辑 <i class="el-icon-edit"></i></el-button>
          <el-popconfirm
              class="ml-5"
              confirm-button-text="确定"
              cancel-button-text="我再想想"
              icon="el-icon-info"
              icon-color="red"
              title="您确定删除吗？"
              @confirm="del(scope.row.id)"
          >
            <el-button type="danger" slot="reference">删除 <i class="el-icon-remove-outline"></i></el-button>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页 -->
    <div style="padding: 10px 0">
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="pageNum"
          :page-sizes="[2, 5, 10, 20]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
      >
      </el-pagination>
    </div>

    <!-- 编辑对话框 -->
    <el-dialog title="信息" :visible.sync="dialogFormVisible" width="40%" :close-on-click-modal="false">
      <el-form label-width="120px" size="small" style="width: 80%; margin: 0 auto">
        <el-form-item label="产品">
          <el-input v-model="form.produce" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="批次">
          <el-input v-model="form.batch" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="溯源码">
          <el-input v-model="form.traceCode" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="仓库">
          <el-input v-model="form.warehouse" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="存储区">
          <el-input v-model="form.region" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="数量">
          <el-input v-model="form.number" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="仓库管理员">
          <el-input v-model="form.keeper" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="备注">
          <el-input v-model="form.remark" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="施肥记录">
          <el-input v-model="form.fertilizing" autocomplete="off" type="textarea" rows="2"></el-input>
        </el-form-item>
        <el-form-item label="浇水记录">
          <el-input v-model="form.watering" autocomplete="off" type="textarea" rows="2"></el-input>
        </el-form-item>
        <el-form-item label="生长阶段时间线">
          <el-input v-model="form.growthTimeline" autocomplete="off" type="textarea" rows="3"></el-input>
        </el-form-item>
        <el-form-item label="农场名称">
          <el-input v-model="form.farmName" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="农田情况">
          <el-input v-model="form.fieldCondition" autocomplete="off" type="textarea" rows="2"></el-input>
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
  name: "Inventory",
  data() {
    return {
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      produce: "",
      form: {},
      dialogFormVisible: false,
      multipleSelection: [],
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      excelFile: null
    };
  },
  created() {
    this.load();
  },
  methods: {
    // 加载模拟数据
    load() {
      // 这里使用模拟数据，实际项目中应该从后端获取
      this.tableData = [
        {
          id: 1,
          batch: "2025-A1",
          traceCode: "TRACE2025A1001",
          produce: "小麦",
          warehouse: "一号仓库",
          region: "A区",
          number: 1000,
          keeper: "张三",
          remark: "无",
          fertilizing: "2025-01-15：施肥10kg",
          watering: "2025-01-20：浇水100L",
          growthTimeline: "播种:2025-01-01, 发芽:2025-01-10, 生长:2025-02-01, 收获:2025-04-15",
          farmName: "绿色农场",
          fieldCondition: "土壤肥沃，灌溉良好"
        },
        {
          id: 2,
          batch: "2025-B1",
          traceCode: "TRACE2025B1002",
          produce: "玉米",
          warehouse: "二号仓库",
          region: "B区",
          number: 800,
          keeper: "李四",
          remark: "无",
          fertilizing: "2025-02-20：施肥15kg",
          watering: "2025-02-25：浇水150L",
          growthTimeline: "播种:2025-02-01, 发芽:2025-02-10, 生长:2025-03-01, 收获:2025-06-15",
          farmName: "希望农场",
          fieldCondition: "土壤一般，灌溉充足"
        },
        {
          id: 3,
          batch: "2025-C1",
          traceCode: "TRACE2025C1003",
          produce: "水稻",
          warehouse: "三号仓库",
          region: "C区",
          number: 1200,
          keeper: "王五",
          remark: "无",
          fertilizing: "2025-03-10：施肥12kg",
          watering: "2025-03-15：浇水200L",
          growthTimeline: "播种:2025-03-01, 发芽:2025-03-10, 生长:2025-04-01, 收获:2025-08-15",
          farmName: "丰收农场",
          fieldCondition: "土壤肥沃，灌溉充足"
        },
        {
          id: 4,
          batch: "2025-D1",
          traceCode: "TRACE2025D1004",
          produce: "大豆",
          warehouse: "四号仓库",
          region: "D区",
          number: 900,
          keeper: "赵六",
          remark: "无",
          fertilizing: "2025-04-15：施肥8kg",
          watering: "2025-04-20：浇水120L",
          growthTimeline: "播种:2025-04-01, 发芽:2025-04-10, 生长:2025-05-01, 收获:2025-07-15",
          farmName: "丰裕农场",
          fieldCondition: "土壤良好，灌溉一般"
        },
        {
          id: 5,
          batch: "2025-E1",
          traceCode: "TRACE2025E1005",
          produce: "棉花",
          warehouse: "五号仓库",
          region: "E区",
          number: 700,
          keeper: "钱七",
          remark: "无",
          fertilizing: "2025-05-20：施肥10kg",
          watering: "2025-05-25：浇水180L",
          growthTimeline: "播种:2025-05-01, 发芽:2025-05-10, 生长:2025-06-01, 收获:2025-09-15",
          farmName: "蓝天农场",
          fieldCondition: "土壤一般，灌溉良好"
        },
        {
          id: 6,
          batch: "2025-F1",
          traceCode: "TRACE2025F1006",
          produce: "花生",
          warehouse: "六号仓库",
          region: "F区",
          number: 600,
          keeper: "孙八",
          remark: "无",
          fertilizing: "2025-06-10：施肥7kg",
          watering: "2025-06-15：浇水130L",
          growthTimeline: "播种:2025-06-01, 发芽:2025-06-10, 生长:2025-07-01, 收获:2025-10-15",
          farmName: "阳光农场",
          fieldCondition: "土壤肥沃，灌溉充足"
        },
        {
          id: 7,
          batch: "2025-G1",
          traceCode: "TRACE2025G1007",
          produce: "芝麻",
          warehouse: "七号仓库",
          region: "G区",
          number: 500,
          keeper: "周九",
          remark: "无",
          fertilizing: "2025-07-15：施肥6kg",
          watering: "2025-07-20：浇水100L",
          growthTimeline: "播种:2025-07-01, 发芽:2025-07-10, 生长:2025-08-01, 收获:2025-11-15",
          farmName: "绿野农场",
          fieldCondition: "土壤良好，灌溉一般"
        },
        {
          id: 8,
          batch: "2025-H1",
          traceCode: "TRACE2025H1008",
          produce: "油菜",
          warehouse: "八号仓库",
          region: "H区",
          number: 800,
          keeper: "吴十",
          remark: "无",
          fertilizing: "2025-08-20：施肥9kg",
          watering: "2025-08-25：浇水160L",
          growthTimeline: "播种:2025-08-01, 发芽:2025-08-10, 生长:2025-09-01, 收获:2025-12-15",
          farmName: "大地农场",
          fieldCondition: "土壤一般，灌溉充足"
        }
      ];
      this.total = this.tableData.length;
    },
    // 保存数据
    save() {
      if (this.form.id) {
        // 编辑
        const index = this.tableData.findIndex((item) => item.id === this.form.id);
        if (index !== -1) {
          this.tableData.splice(index, 1, JSON.parse(JSON.stringify(this.form)));
        }
      } else {
        // 新增
        this.form.id = this.tableData.length + 1;
        this.tableData.push(JSON.parse(JSON.stringify(this.form)));
        this.total++;
      }
      this.dialogFormVisible = false;
      this.$message.success("保存成功");
    },
    // 打开添加对话框
    handleAdd() {
      this.dialogFormVisible = true;
      this.form = {
        id: null,
        produce: "",
        batch: "",
        traceCode: "",
        warehouse: "",
        region: "",
        number: 0,
        keeper: "",
        remark: "",
        fertilizing: "",
        watering: "",
        growthTimeline: "",
        farmName: "",
        fieldCondition: ""
      };
    },
    // 打开编辑对话框
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row));
      this.dialogFormVisible = true;
    },
    // 删除数据
    del(id) {
      this.tableData = this.tableData.filter((item) => item.id !== id);
      this.total = this.tableData.length;
      this.$message.success("删除成功");
    },
    // 处理选择变化
    handleSelectionChange(val) {
      this.multipleSelection = val;
    },
    // 批量删除
    delBatch() {
      if (!this.multipleSelection.length) {
        this.$message.error("请选择需要删除的数据");
        return;
      }
      const ids = this.multipleSelection.map((v) => v.id);
      this.tableData = this.tableData.filter((item) => !ids.includes(item.id));
      this.total = this.tableData.length;
      this.$message.success("批量删除成功");
    },
    // 重置搜索
    reset() {
      this.produce = "";
      this.load();
    },
    // 处理分页大小变化
    handleSizeChange(pageSize) {
      this.pageSize = pageSize;
    },
    // 处理当前页变化
    handleCurrentChange(pageNum) {
      this.pageNum = pageNum;
    },
    // 导出数据
    exp() {
      this.$message.success("导出成功");
    },
    // 下载导入模板
    downloadTemplate() {
      const template = [
        {
          id: "",
          produce: "产品名称",
          batch: "批次",
          traceCode: "溯源码",
          warehouse: "仓库",
          region: "存储区",
          number: "数量",
          keeper: "仓库管理员",
          remark: "备注",
          fertilizing: "施肥记录",
          watering: "浇水记录",
          growthTimeline: "生长阶段时间线",
          farmName: "农场名称",
          fieldCondition: "农田情况"
        }
      ];
      // 这里应该使用实际的导出功能，例如使用exceljs等库导出为excel文件
      this.$message.success("下载模板成功");
    },
    // 处理excel导入
    handleExcelImport(event) {
      this.excelFile = event.file;
      this.readExcelFile();
    },
    // 读取excel文件
    readExcelFile() {
      if (!this.excelFile) return;
      const fileReader = new FileReader();
      fileReader.onload = (e) => {
        try {
          const data = e.target.result;
          const workbook = XLSX.read(data, { type: "binary" });
          const worksheet = workbook.Sheets[workbook.SheetNames[0]];
          const jsonData = XLSX.utils.sheet_to_json(worksheet);
          this.handleImportedData(jsonData);
        } catch (error) {
          console.error("读取Excel文件出错:", error);
          this.$message.error("导入失败，请检查文件格式");
        }
      };
      fileReader.readAsBinaryString(this.excelFile);
    },
    // 处理导入的数据
    handleImportedData(data) {
      // 这里应该根据实际数据格式进行处理和保存
      this.tableData = data;
      this.total = this.tableData.length;
      this.$message.success("导入成功");
    }
  }
};
</script>

<style>
.headerBg {
  background: #eee !important;
}

.ml-5 {
  margin-left: 5px;
}
</style>