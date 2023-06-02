<template>
  <div class="dashboard-editor-container">
      <panel-group @handleSetLineChartData="handleSetLineChartData" />

      <!-- <div class="new-date" ><span class="new-date-span">{{date}}</span></div> -->

      <el-calendar v-model="value" style="text-align: center; height:620px;">
        <template slot="dateCell" slot-scope="{ data}">
          <p style="margin:0px">{{ data.day.split('-').slice(2).join('-') }}<br />
            <div v-if="data.day==value" class="budge"></div>
          </p>
        </template>
      </el-calendar>
    <!--
    <el-row style="background:#fff;padding:16px 16px 0;margin-bottom:32px;">
      <line-chart :chart-data="lineChartData" />
    </el-row>

    <el-row :gutter="32">
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="chart-wrapper">
          <raddar-chart />
        </div>
      </el-col>
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="chart-wrapper">
          <pie-chart />
        </div>
      </el-col>
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="chart-wrapper">
          <bar-chart />
        </div>
      </el-col>
    </el-row> -->


  </div>
</template>

<script>
import PanelGroup from './dashboard/PanelGroup'
import LineChart from './dashboard/LineChart'
import RaddarChart from './dashboard/RaddarChart'
import PieChart from './dashboard/PieChart'
import BarChart from './dashboard/BarChart'

const lineChartData = {
  newVisitis: {
    expectedData: [100, 120, 161, 134, 105, 160, 165],
    actualData: [120, 82, 91, 154, 162, 140, 145]
  },
  messages: {
    expectedData: [200, 192, 120, 144, 160, 130, 140],
    actualData: [180, 160, 151, 106, 145, 150, 130]
  },
  purchases: {
    expectedData: [80, 100, 121, 104, 105, 90, 100],
    actualData: [120, 90, 100, 138, 142, 130, 130]
  },
  shoppings: {
    expectedData: [130, 140, 141, 142, 145, 150, 160],
    actualData: [120, 82, 91, 154, 162, 140, 130]
  }
}

export default {
  name: 'Index',
  components: {
    PanelGroup,
    LineChart,
    RaddarChart,
    PieChart,
    BarChart
  },
  data() {
    return {
      lineChartData: lineChartData.newVisitis,
      value: new Date(),
      newDate: "1",
      date: new Date(new Date().getTime() + 8*3600*1000).toJSON().substr(0, 19).replace('T', ' ')
    }
  },
  methods: {
    handleSetLineChartData(type) {
      this.lineChartData = lineChartData[type]
    }
  },
  // mounted() {
  //   let _this = this;
  //   this.timer = setInterval(() => {
  //     _this.date = new Date(new Date().getTime() + 8*3600*1000).toJSON().substr(0, 19).replace('T', ' ')
  //   }, 1000)
  // },
  // beforeDestroy() {
  //   if (this.timer) {
  //     clearInterval(this.timer);
  //   }
  // }
}


</script>

<style lang="scss" scoped>
  .new-date{
    width: 1000px;
    height: 20%;
    // background:#f1f1f1;
    padding:16px 16px 0px, 0px;
    margin-bottom:32px;
  }
  .new-date-span {
    font-size: 100px;
    color: #41b915;
  }
  .budge {
    width: 8px;
    height: 8px;
    background: #ec760f;
    border-radius: 50%;
    margin: 0 auto;
    margin-top: 10px;
  }
.dashboard-editor-container {
  padding: 32px;
  background-color: rgb(240, 242, 245);
  position: relative;

  .chart-wrapper {
    background: #fff;
    padding: 16px 16px 0;
    margin-bottom: 32px;
  }
}

@media (max-width:1024px) {
  .chart-wrapper {
    padding: 8px;
  }
}
</style>
