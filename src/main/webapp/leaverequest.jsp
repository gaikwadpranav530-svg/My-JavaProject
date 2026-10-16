<!DOCTYPE html>
<html>
<head>

<title>Leave Request</title>

<style>


body{
    margin:0;
    padding:0;
    font-family: Arial, sans-serif;

    background: url("OIP.jpg") no-repeat center center/cover;

    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}


body::before{
    content:"";
    position:absolute;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.4);
}


.box{
    position:relative;
    width:370px;
    padding:30px;

    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(12px);

    border-radius:15px;
    box-shadow:0 8px 25px rgba(0,0,0,0.4);

    color:white;
    z-index:1;
}

h2{
    text-align:center;
    margin-bottom:20px;
}


input,select,textarea{
    width:100%;
    padding:10px;
    margin-top:10px;

    border:none;
    border-radius:6px;
    outline:none;

    background: rgba(255,255,255,0.85);
}


button{
    width:100%;
    padding:10px;
    margin-top:15px;

    background:linear-gradient(45deg,#00c6ff,#0072ff);
    color:white;

    border:none;
    border-radius:6px;
    cursor:pointer;
    font-size:16px;

    transition:0.3s;
}

button:hover{
    transform:scale(1.05);
    background:linear-gradient(45deg,#0056b3,#003f7f);
}

</style>

<script>

function calculateDays()
{
let from=document.getElementById("fromDate").value;
let to=document.getElementById("toDate").value;

if(from!="" && to!="")
{
let d1=new Date(from);
let d2=new Date(to);

let diff=d2-d1;
let days=(diff/(1000*60*60*24))+1;

if(days>0)
{
document.getElementById("leaveDays").value=days;
}
}
}

function validateForm()
{
let f=document.forms["leaveForm"];

if(f.Email.value=="" || f.Leave_type.value=="" || f.FromDate.value=="" || f.ToDate.value=="" ||
   f.LeaveDays.value=="" || f.ApplicantName.value=="" || f.Department.value=="" ||
   f.Reason.value=="" || f.Contact.value=="" || f.Mobile.value=="")
{
alert("All fields are required");
return false;
}

return true;
}

</script>

</head>

<body>

<div class="box">

<h2>Leave Application</h2>

<form name="leaveForm" action="leaverequest" method="post" onsubmit="return validateForm()">

Email
<input type="email" name="Email" required>

Leave Type
<select name="Leave_type" required>
<option value="">Select Leave</option>
<option>Sick Leave</option>
<option>Casual Leave</option>
<option>Medical Leave</option>
<option>Emergency Leave</option>
</select>

From Date
<input type="date" id="fromDate" name="FromDate" onchange="calculateDays()" required>

To Date
<input type="date" id="toDate" name="ToDate" onchange="calculateDays()" required>

Leave Days
<input type="number" id="leaveDays" name="LeaveDays" readonly>

Applicant Name
<input type="text" name="ApplicantName" required>

Department
<select name="Department" required>
<option value="">Select Department</option>
<option>BCA</option>
<option>BCS</option>
<option>BBA</option>
<option>BCOM</option>
</select>

Reason
<textarea name="Reason" required></textarea>

Contact
<input type="text" name="Contact" required>

Mobile
<input type="text" name="Mobile" required>

<button type="submit">Submit Request</button>

</form>

</div>

</body>
</html>