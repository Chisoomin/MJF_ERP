// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: ["Dec 1", "Dec 5", "Dec 7", "Dec 8", "Dec 13", "Dec 14", "Dec 17", "Dec 19", "Dec 20"],
    datasets: [{
      label: "sales amount",
      lineTension: 0.3,
      backgroundColor: "rgba(82,51,41,0.2)",
      borderColor: "rgba(82,51,41,1)",
      pointRadius: 5,
      pointBackgroundColor: "rgba(82,51,41,1)",
      pointBorderColor: "rgba(255,255,255,0.8)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(184,153,124,1)",
      pointHitRadius: 50,
      pointBorderWidth: 2,
      data: [0, 10890000, 41987000, 10422500, 1672000, 3300000, 4235000, 14190000, 3630000],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 50000000,
          maxTicksLimit: 5
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
