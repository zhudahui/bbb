// 基于准备好的dom，初始化echarts实例
var chart1 = echarts.init(document.getElementById('chart1'));

// 指定图表的配置项和数据
var chart1option = {
    title: {
        text: '近7年各学校贷款数量统计'
    },
    tooltip : {
        trigger: 'axis',
        axisPointer: {
            type: 'cross',
            label: {
                backgroundColor: '#6a7985'
            }
        }
    },
    legend: {
        data:['北京大学','清华大学','南开大学','天津大学','中国人民大学']
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'category',
            boundaryGap : false,
            data : ['2011年','2012年','2013年','2014年','2015年','2016年','2017年']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'北京大学',
            type:'line',
            stack: '总量',
            areaStyle: {normal: {}},
            data:[20394, 10293, 10987, 16783, 19234, 15876, 10653]
        },
        {
            name:'清华大学',
            type:'line',
            stack: '总量',
            areaStyle: {normal: {}},
            data:[22001, 18212, 19123, 23421, 29043, 33021, 31011]
        },
        {
            name:'南开大学',
            type:'line',
            stack: '总量',
            areaStyle: {normal: {}},
            data:[15012, 23223, 20154, 15465, 19021, 33032, 41033]
        },
        {
            name:'天津大学',
            type:'line',
            stack: '总量',
            areaStyle: {normal: {}},
            data:[32044, 33211, 30112, 33432, 39041, 33011, 32022]
        },
        {
            name:'中国人民大学',
            type:'line',
            stack: '总量',
            label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },
            areaStyle: {normal: {}},
            data:[8201, 9323, 9014, 9345, 12901, 13302, 13207]
        }
    ]
};

// 使用刚指定的配置项和数据显示图表。
chart1.setOption(chart1option);

// 基于准备好的dom，初始化echarts实例
var chart2 = echarts.init(document.getElementById('chart2'));

// 指定图表的配置项和数据
var chart2option = {
    title: {
        text: '近7年贷款男女占比'
    },
    tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        }
    },
    legend: {
        data:['男', '女']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'value'
        }
    ],
    yAxis : [
        {
            type : 'category',
            axisTick : {show: false},
            data : ['2011年','2012年','2013年','2014年','2015年','2016年','2017年']
        }
    ],
    series : [
        {
            name:'男',
            type:'bar',
            label: {
                normal: {
                    show: true,
                    position: 'inside'
                }
            },
            data:[78, 86, 80, 73, 90, 82, 57]
        },
        {
            name:'女',
            type:'bar',
            label: {
                normal: {
                    show: true
                }
            },
            data:[-22, -14, -20, -27, -10, -18, -43]
        }
    ]
};

// 使用刚指定的配置项和数据显示图表。
chart2.setOption(chart2option);