<template>
  <div ref="chartContainer" class="line-chart-container"></div>
</template>

<script>
import * as echarts from 'echarts/core';
import { LineChart } from 'echarts/charts';
import {
  GridComponent,
  TooltipComponent,
  LegendComponent,
  TitleComponent
} from 'echarts/components';
import { CanvasRenderer } from 'echarts/renderers';

echarts.use([
  LineChart,
  GridComponent,
  TooltipComponent,
  LegendComponent,
  TitleComponent,
  CanvasRenderer
]);

export default {
  props: {
    data: {
      type: Object,
      required: true
    },
    options: {
      type: Object,
      default: () => ({})
    }
  },
  data() {
    return {
      chartInstance: null,
      resizeObserver: null
    };
  },
  watch: {
    data: {
      deep: true,
      handler(newVal) {
        this.updateChart(newVal);
      }
    }
  },
  mounted() {
    this.initChart();
    this.setupResizeObserver();
  },
  beforeUnmount() {
    this.resizeObserver.disconnect();
    this.chartInstance.dispose();
  },
  methods: {
    initChart() {
      this.chartInstance = echarts.init(this.$refs.chartContainer);
      const baseOptions = {
        title: {
          text: this.data.title,
          left: 'center',
          textStyle: {
            color: '#666'
          }
        },
        tooltip: {
          trigger: 'axis',
          formatter: params => {
            return `${params[0].axisValue}<br>${params
                .map(item => `${item.marker} ${item.seriesName}: ${item.value}`)
                .join('<br>')}`;
          }
        },
        legend: {
          top: 30,
          data: this.data.datasets.map(d => d.label)
        },
        xAxis: {
          type: 'category',
          data: this.data.labels
        },
        yAxis: {
          type: 'value'
        },
        series: this.data.datasets.map(dataset => ({
          name: dataset.label,
          data: dataset.data,
          type: 'line',
          smooth: true,
          showSymbol: false,
          lineStyle: {
            width: 2
          },
          areaStyle: dataset.fill ? {
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
              { offset: 0, color: dataset.backgroundColor },
              { offset: 1, color: '#fff' }
            ])
          } : null
        })),
        ...this.options
      };
      this.chartInstance.setOption(baseOptions);
    },
    updateChart(newData) {
      this.chartInstance.setOption({
        xAxis: { data: newData.labels },
        series: newData.datasets.map(dataset => ({
          name: dataset.label,
          data: dataset.data
        }))
      });
    },
    setupResizeObserver() {
      this.resizeObserver = new ResizeObserver(() => {
        this.chartInstance.resize();
      });
      this.resizeObserver.observe(this.$refs.chartContainer);
    }
  }
};
</script>

<style scoped>
.line-chart-container {
  width: 100%;
  height: 100%;
  min-height: 300px;
}
</style>