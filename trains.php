<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<link rel="stylesheets"href ="assets/inc/style.css">
<?php
  session_start();
  include('assets/inc/config.php');
  include('assets/inc/header.php');
?>
<body class="bg-dark">
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trains</title>
  </head>
 
<title>Trains</title>
<br><br><br></br>
<div class="card-body bg-light">
                <!--Start Table-->
                  <table class="table table-striped table-bordered table-hover table-fw-widget" id="table1">
                    <thead class="thead-dark">
                      <tr>
                        <th>Train Number</th>
                        <th>Train</th>
                        <th>Route</th>
                        <th>Destination</th>
                        <th>AC Fare</th>
                        <th>General_Fare</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php

                        $ret="SELECT * FROM trainlist ORDER BY RAND() LIMIT 10 "; //sql code to get to ten trains randomly
                        $stmt= $mysqli->prepare($ret) ;
                        $stmt->execute() ;//ok
                        $res=$stmt->get_result();
                        $cnt=1;
                        while($row=$res->fetch_object())
                      {
                      ?>
                          <tr class="odd gradeX even gradeC odd gradeA ">
                            <td><?php echo $row->TrainNumber;?></td>
                            <td><?php echo $row->TrainName;?></td>
                            <td><?php echo $row->Source;?></td>
                            <td><?php echo $row->Destination;?></td>
                            <td><?php echo $row->AC_Fare;?></td>
                            <td><?php echo $row->General_Fare;?></td>
                           
                          </tr>

                      <?php $cnt=$cnt+1; }?>
                    </tbody>
                  </table>
                  <!--eND Table-->
                </div>
                </body>

                </html>  