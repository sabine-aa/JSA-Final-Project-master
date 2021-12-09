<?php
include_once 'header.php';

session_start();

$username = $_SESSION['username'];
$U_id = $_SESSION['U_id'];
echo ("<script>console.log('PHP: " . $username . "');</script>");

include_once 'db.php';
include_once 'api.php';


$gains = getGain($conn,$U_id);
$costs= getCost($conn,$U_id);
$result = $gains - $costs;
if ($result>0)
{
    $profits = $result;
}
else if ($result<=0){
 $loss= $result;
}


echo ("<script>console.log('profit: " . $profits . "');</script>");
echo ("<script>console.log('loss: " . $loss . "');</script>");

?>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
              google.charts.load('current', {'packages':['corechart', 'bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {

        var chartDiv = document.getElementById('chart_div');

        var data = google.visualization.arrayToDataTable([
          ['', ''],
          ['Sales', 800],
          ['Costs', 200,],
  
        ]);

        var materialOptions = {
          width: 900,
          legend: {position: 'none'},


          chart: {
            title: 'Cost VS Sales',

          },
        
          axes: {
            y: {
              //distance: {label: 'parsecs'}, // Left y-axis.
            }
          }
        };

        

        function drawMaterialChart() {
          var materialChart = new google.charts.Bar(chartDiv);
          materialChart.draw(data, google.charts.Bar.convertOptions(materialOptions));
          button.innerText = 'Change to Classic';
          button.onclick = drawClassicChart;
        }

    

        drawMaterialChart();
    };
</script>
<body>
    <!--Div that will hold the pie chart-->
<br><br>
    <div id="chart_div" style="width: 800px; height: 500px;"></div>
     </body>

