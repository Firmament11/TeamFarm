<template>
  <div class="radial-gauge">
    <svg :width="size" :height="size">
      <!-- 背景圆 -->
      <circle
          :cx="center"
          :cy="center"
          :r="radius"
          :stroke-width="strokeWidth"
          stroke="#eee"
          fill="none"/>

      <!-- 进度弧 -->
      <path
          :d="progressPath"
          :stroke="color"
          :stroke-width="strokeWidth"
          fill="none"
          stroke-linecap="round"/>

      <!-- 中心指针 -->
      <polygon
          :points="needlePoints"
          :fill="color"
          :transform="`rotate(${rotation} ${center} ${center})`"/>

      <!-- 中心文字 -->
      <text
          :x="center"
          :y="center + 8"
          text-anchor="middle"
          font-size="24"
          fill="#666">
        {{ title }}
      </text>
      <text
          :x="center"
          :y="center - 15"
          text-anchor="middle"
          font-size="32"
          :fill="color"
          font-weight="600">
        {{ displayValue }}
      </text>
    </svg>
  </div>
</template>

<script>
export default {
  props: {
    value: {
      type: Number,
      default: 0
    },
    title: {
      type: String,
      default: 'Score'
    },
    color: {
      type: String,
      default: '#4CAF50'
    },
    size: {
      type: Number,
      default: 200
    },
    max: {
      type: Number,
      default: 100
    },
    min: {
      type: Number,
      default: 0
    }
  },
  computed: {
    center() {
      return this.size / 2;
    },
    radius() {
      return this.size * 0.4;
    },
    strokeWidth() {
      return this.size * 0.1;
    },
    rotation() {
      const range = this.max - this.min;
      return -135 + (270 * (this.value - this.min)) / range;
    },
    progressPath() {
      const startAngle = -135;
      const endAngle = this.rotation;
      const largeArc = endAngle - startAngle <= 180 ? 0 : 1;

      return `
        M ${this.calcPoint(startAngle)}
        A ${this.radius} ${this.radius} 0 ${largeArc} 1 ${this.calcPoint(endAngle)}
      `;
    },
    needlePoints() {
      return [
        [this.center - 2, this.center - this.radius * 0.3],
        [this.center + 2, this.center - this.radius * 0.3],
        [this.center, this.center - this.radius * 0.6]
      ].map(p => p.join(',')).join(' ');
    },
    displayValue() {
      return Math.round(this.value);
    }
  },
  methods: {
    calcPoint(angle) {
      const radian = (angle * Math.PI) / 180;
      return [
        this.center + this.radius * Math.cos(radian),
        this.center + this.radius * Math.sin(radian)
      ].join(' ');
    }
  }
};
</script>

<style scoped>
.radial-gauge {
  display: inline-block;
  transition: transform 0.3s ease;
}

.radial-gauge:hover {
  transform: scale(1.05);
}
</style>