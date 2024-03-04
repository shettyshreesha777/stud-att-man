<?php

ob_start();
session_start();

if($_SESSION['name']!='oasis')
{
  header('location: login.php');
}
?>

<?php
    include('connect.php');
    try{
      
    if(isset($_POST['att'])){

      $course = $_POST['subject'];

      foreach ($_POST['st_status'] as $i => $st_status) {
        
        $stat_id = $_POST['stat_id'][$i];
        $dp = date('Y-m-d', strtotime($_POST['attdate']));
        $course = $_POST['subject'];
        
        $stat = mysqli_query($conn,"insert into attendance(stat_id,course,st_status,stat_date) values('$stat_id','$course','$st_status','$dp')");
        
        $att_msg = "Attendance Recorded.";

      }

    }
  }
  catch(Exception $e){
    $error_msg = $e->$getMessage();
  }
 ?>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Online Attendance Management System 1.0</title>
<meta charset="UTF-8">

  <link rel="stylesheet" type="text/css" href="/am/css/main.css">
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
   
  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
   
  <link rel="stylesheet" href="styles.css" >
   
  <!-- Latest compiled and minified JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style type="text/css">
  .status{
    font-size: 10px;
  }

</style>

</head>
<body>

<header>

  <h1>Online Attendance Management System 1.0</h1>
  <div class="navbar">
  <a href="index.php">Home</a>
  <a href="students.php">Students</a>
  <a href="teachers.php">Faculties</a>
  <a href="attendance.php">Attendance</a>
  <a href="report.php">Report</a>
  <a href="../logout.php">Logout</a>

</div>

</header>

<center>

<div class="row">

  <div class="content"> 

    <center><p><?php if(isset($att_msg)) echo $att_msg; if(isset($error_msg)) echo $error_msg; ?></p></center> 
    
    <form action="" method="post" class="form-horizontal col-md-6 col-md-offset-3">

     <div class="form-group">

                <label>Select Batch</label>
                
                <select name="whichbatch" id="input1">
                      <option name="eight" value="24">24</option>
                      <option name="seven" value="25">25</option>
                </select>
                <label >Select Branch</label>

              <select name="whichbranch" id="selectbranch">
                <option name="branch" value="CSE">CSE</option>
                <option name="branch" value="EC">EC</option>
              </select>
              </div>
               
     <input type="submit" class="btn btn-primary col-md-2 col-md-offset-5" value="Show!" name="batch" />

    </form>

    <div class="content"></div>
    <form action="" method="post">

      <div class="form-group">
      <label>Attendance of</label>
    <input type="date" name="attdate" value="<?php echo date('Y-m-d'); ?>" /> 
    <br>

    <label >Select Branch</label>

<select name="bf2" id="sb2" onclick="updateSubjects()">
  <option name="branch2" value="CSE">CSE</option>
  <option name="branch2" value="EC">EC</option>
</select>

    <label for="subject">Select Subject:</label>
    <select id="subject" name="subject">
    <!-- Options will be dynamically populated based on branch selection -->
  </select>            

      </div>

    <table class="table table-stripped">
      <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Name</th>
          <th scope="col">Department</th>
          <th scope="col">Batch</th>
          <th scope="col">Semester</th>
          <th scope="col">Email</th>
          <th scope="col">Status</th>
        </tr>
      </thead>
   <?php

    if(isset($_POST['batch'])){

     $i=0;
     $radio = 0;
     $batch = $_POST['whichbatch'];
     $branch=$_POST['whichbranch'];
     $all_query = mysqli_query($conn,"select * from students where st_batch='$batch' AND st_dept='$branch' order by st_id asc");

     while ($data = mysqli_fetch_array($all_query)) {
       $i++;
     ?>
  <body>
     <tr>
       <td><?php echo $data['st_id']; ?> <input type="hidden" name="stat_id[]" value="<?php echo $data['st_id']; ?>"> </td>
       <td><?php echo $data['st_name']; ?></td>
       <td><?php echo $data['st_dept']; ?></td>
       <td><?php echo $data['st_batch']; ?></td>
       <td><?php echo $data['st_sem']; ?></td>
       <td><?php echo $data['st_email']; ?></td>
       <td>
         <label>Present</label>
         <input type="radio" name="st_status[<?php echo $radio; ?>]" value="Present" checked>
         <label>Absent </label>
         <input type="radio" name="st_status[<?php echo $radio; ?>]" value="Absent">
       </td>
     </tr>
  </body>

     <?php

        $radio++;
      } 
}
      ?>
    </table>

    <center><br>
    <input type="submit" class="btn btn-primary col-md-2 col-md-offset-10" value="Save!" name="att" />
  </center>

</form>
  </div>

</div>

</center>
<script>
function updateSubjects() {
  var branch = document.getElementById("sb2").value;
  var subjectSelect = document.getElementById("subject");
  subjectSelect.innerHTML = ""; // Clear existing options
  
  // Populate subjects based on selected branch
  if (branch === "CSE") {
    var subjects = ["Computer Network", "Database Management"];
  } else if (branch === "EC") {
    var subjects = ["Analog Electronics", "Digital Signal Processing"];
  } 
  
  // Add options to the select element
  for (var i = 0; i < subjects.length; i++) {
    var option = document.createElement("option");
    option.text = subjects[i];
    option.value = subjects[i].toLowerCase().replace(/\s+/g, "_"); // Convert subject name to lowercase and replace spaces with underscores
    subjectSelect.appendChild(option);
  }
}
  
// Call updateSubjects function initially to populate subjects based on the default branch selection
updateSubjects();
</script>
</body>
</html>
