// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: ["2인 소파", "4인용 소파", "높이 조절 책상", "수납형 침대", "유리문 책장"],
    datasets: [{
      data: [32.56, 14.34, 11.84, 11.27, 7.76],
      backgroundColor: ['#523329', '#F2CEC2', '#F09678', '#705F5A', '#BD765E'],
    }],
  },
});
