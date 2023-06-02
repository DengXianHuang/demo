<template>
  <el-row :gutter="40" class="panel-group">
    <el-col :xs="12" :sm="12" :lg="6" class="card-panel-col">
      <div class="card-panel" @click="handleSetLineChartData('newVisitis')">
        <div class="card-panel-icon-wrapper icon-people">
          <svg-icon icon-class="peoples" class-name="card-panel-icon" />
        </div>
        <div class="card-panel-description">
          <div class="card-panel-text">
            在线用户
          </div>
          <count-to :start-val="0" :end-val="onlineNum" :duration="2600" class="card-panel-num" />
        </div>
      </div>
    </el-col>
    <el-col :xs="12" :sm="12" :lg="6" class="card-panel-col">
      <div class="new-date" @click="handleSetLineChartData('messages')">
        <span class="new-date-span">{{date}}</span>
      </div>
    </el-col>
  </el-row>
</template>

<script>
import CountTo from 'vue-count-to'
import { countOnline } from '@/api/monitor/countTo'

export default {
  components: {
    CountTo
  },
  data() {
    return {
      onlineNum: 1,
      date: new Date(new Date().getTime() + 8*3600*1000).toJSON().substr(0, 19).replace('T', ' ')
    }
  },
  created() {
    this.getOnlineNum()
  },
  methods: {
    handleSetLineChartData(type) {
      this.$emit('handleSetLineChartData', type)
    },
    getOnlineNum(){
      countOnline().then(res => {
        this.onlineNum = res.data
      })
    },
  },
  mounted() {
    let _this = this;
    this.timer = setInterval(() => {
      _this.date = new Date(new Date().getTime() + 8*3600*1000).toJSON().substr(0, 19).replace('T', ' ')
    }, 1000)
  },
  beforeDestroy() {
    if (this.timer) {
      clearInterval(this.timer);
    }
  }
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
    color: #06d2ff;
  }
.panel-group {
  margin-top: 18px;

  .card-panel-col {
    margin-bottom: 32px;
  }

  .card-panel {
    height: 108px;
    cursor: pointer;
    font-size: 12px;
    position: relative;
    overflow: hidden;
    color: #666;
    background: #fff;
    box-shadow: 4px 4px 40px rgba(0, 0, 0, .05);
    border-color: rgba(0, 0, 0, .05);

    &:hover {
      .card-panel-icon-wrapper {
        color: #fff;
      }

      .icon-people {
        background: #40c9c6;
      }

      .icon-message {
        background: #36a3f7;
      }

      .icon-money {
        background: #f4516c;
      }

      .icon-shopping {
        background: #34bfa3
      }
    }

    .icon-people {
      color: #40c9c6;
    }

    .icon-message {
      color: #36a3f7;
    }

    .icon-money {
      color: #f4516c;
    }

    .icon-shopping {
      color: #34bfa3
    }

    .card-panel-icon-wrapper {
      float: left;
      margin: 14px 0 0 14px;
      padding: 16px;
      transition: all 0.38s ease-out;
      border-radius: 6px;
    }

    .card-panel-icon {
      float: left;
      font-size: 48px;
    }

    .card-panel-description {
      float: right;
      font-weight: bold;
      margin: 26px;
      margin-left: 0px;

      .card-panel-text {
        line-height: 18px;
        color: rgba(0, 0, 0, 0.45);
        font-size: 16px;
        margin-bottom: 12px;
      }

      .card-panel-num {
        font-size: 20px;
      }
    }
  }
}

@media (max-width:550px) {
  .card-panel-description {
    display: none;
  }

  .card-panel-icon-wrapper {
    float: none !important;
    width: 100%;
    height: 100%;
    margin: 0 !important;

    .svg-icon {
      display: block;
      margin: 14px auto !important;
      float: none !important;
    }
  }
}
</style>
