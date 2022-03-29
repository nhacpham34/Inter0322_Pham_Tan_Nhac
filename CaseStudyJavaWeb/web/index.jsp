<%--
  Created by IntelliJ IDEA.
  User: nhacp
  Date: 3/29/2022
  Time: 7:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
        integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
          integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
          crossorigin="anonymous">

  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
          integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
          crossorigin="anonymous">

  </script>
  <link rel="stylesheet" href="./src/style.css">
  <title>Furama</title>
  <style>
    .nav_item {
      color: white;
      font-size: 20px;
      height: 30px;
    }
  </style>
</head>
<body>
<div class="app">
  <header>
    <div class="header ">
      <div class="header_top">
        <img class="logo_img" src="./image/logo-mona.png">
        <h1 class="resort_name">Furama Resort</h1>
        <h4 class="name"></h4>
      </div>
    </div>
    <nav class=" navbar navbar-expand-lg navbar-light bg-light">
      <!--            Danh sách sản phẩm -->
      <div class="  container-fluid ">
        <div class="collapse navbar-collapse row" id="navbarSupportedContent">
          <ul class="nav_padding navbar-nav col-8 me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Employee</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Customer</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Service</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contract</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Action
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">Booking</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
              </ul>
            </li>
          </ul>
          <form class="d-flex col-4">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
          </form>
        </div>
      </div>

    </nav>
  </header>
  <div class="container-fluid" style=" background-image: linear-gradient( 210deg,#da94ff, #84c1ff );">
    <div id="" class="row ">
      <div class="col-sm-3 body_bg">
        <ul class="nav flex-column">
          <li class="nav-item nav_item">
            <a class="nav-link nav_item active" href="#">Nhân viên</a>
          </li>
          <li class="nav-item nav_item">
            <a class="nav-link nav_item" href="#">Khách hàng</a>
          </li>
          <li class="nav-item nav_item">
            <a class="nav-link nav_item" href="#">Sản phẩm</a>
          </li>
        </ul>
      </div>
      <div class="col-9 pt-1 display-none">
        <div class="row py-2 d-flex justify-content-between">
          <div class="card col-4" style="width: 18rem;">
            <img src="https://du-lich.chudu24.com/f/m/2105/21/vinpearl-condotel-riverfront-da-nang.jpg?w=250&h=200" class="card-img-top" alt="...">
            <div class="card-body">
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            </div>
          </div>
          <div class="card col-4" style="width: 18rem;">
            <img src="https://du-lich.chudu24.com/f/m/2105/21/vinpearl-condotel-riverfront-da-nang.jpg?w=250&h=200" class="card-img-top" alt="...">
            <div class="card-body">
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            </div>
          </div>
          <div class="card col-4" style="width: 18rem;">
            <img src="https://du-lich.chudu24.com/f/m/2105/21/vinpearl-condotel-riverfront-da-nang.jpg?w=250&h=200" class="card-img-top" alt="...">
            <div class="card-body">
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            </div>
          </div>
        </div>
        <div class="row py-2 d-flex justify-content-between">
          <div class="card col-4" style="width: 18rem;">
            <img src="https://du-lich.chudu24.com/f/m/2105/21/vinpearl-condotel-riverfront-da-nang.jpg?w=250&h=200" class="card-img-top" alt="...">
            <div class="card-body">
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            </div>
          </div>
          <div class="card col-4" style="width: 18rem;">
            <img src="https://du-lich.chudu24.com/f/m/2105/21/vinpearl-condotel-riverfront-da-nang.jpg?w=250&h=200" class="card-img-top" alt="...">
            <div class="card-body">
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            </div>
          </div>
          <div class="card col-4" style="width: 18rem;">
            <img src="https://du-lich.chudu24.com/f/m/2105/21/vinpearl-condotel-riverfront-da-nang.jpg?w=250&h=200" class="card-img-top" alt="...">
            <div class="card-body">
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            </div>
          </div>
        </div>
        <div class="pb-1"></div>
      </div>
      <div class="col-9 pt-1 ">
        <!--  Form thêm khách hàng              -->
        <form class="form_input display-none">
          <h2 class="text-center">Thêm mới khách hàng</h2>
          <div class="form-group form_input row ">
            <label for="inputName" class="col-sm-2 col-form-label">Họ Tên:</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" id="inputName" placeholder="Nhập họ tên khách hàng">
            </div>
            <label for="labelSex" class="col-sm-2 col-form-label">Giới tính:</label>
            <div class="col-sm-4">
              <select class="form-control" id="labelSex">
                <option>--Danh sách lựa chọn--</option>
                <option>Nam</option>
                <option>Nữ</option>
                <option>Khác</option>
              </select>
            </div>
          </div>
          <div class="form-group form_input row">
            <label for="inputIdCard" class="col-sm-2 col-form-label">CMND/CCCD:</label>
            <div class="col-sm-4">
              <input type="password" class="form-control" id="inputIdCard" placeholder="Nhập CMND..">
            </div>
            <label for="inputEmail" class="col-sm-2 col-form-label">Email:</label>
            <div class="col-sm-4">
              <input type="email" class="form-control" id="inputEmail" placeholder="Nhập Email...">
            </div>
          </div>
          <div class="form-group form_input row">
            <label for="inputDate" class="col-sm-2 col-form-label">Ngày sinh:</label>
            <div class="col-sm-4">
              <input type="date" class="form-control" id="inputDate" placeholder="Nhập ngày sinh...">
            </div>
            <label for="inputSdt" class="col-sm-2 col-form-label">Số điện thoại:</label>
            <div class="col-sm-4">
              <input type="tel" class="form-control" id="inputSdt" placeholder="Nhập số điện thoại...">
            </div>
          </div>
          <div class="form-group form_input row">

            <label for="inputCustomerType" class="col-sm-2 col-form-label">Loại khách:</label>
            <div class="col-sm-3">
              <select class="form-control" id="inputCustomerType">
                <option>--Danh sách lựa chọn--</option>
                <option>Diamond</option>
                <option>Platinium</option>
                <option>Gold</option>
                <option>Silver</option>
                <option>Member</option>
              </select>
            </div>
            <label for="inputAddress" class="col-sm-2 col-form-label">Địa chỉ:</label>
            <div class="col-sm-5">
              <input type="text" class="form-control" id="inputAddress" placeholder="Nhập Địa chỉ...">
            </div>

          </div>
          <button type="submit" class="btn btn-primary">Add Employee</button>
        </form>
        <!--        Form thêm nhân viên        -->
        <form class="form_input display-block">
          <h2 class="text-center">Thêm mới nhân viên</h2>
          <div class="form-group form_input row ">
            <label for="inputNameEpl" class="col-sm-2 col-form-label">Họ Tên:</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" id="inputNameEpl" placeholder="Nhập họ tên nhân viên">
            </div>
            <label for="labelSexEpl" class="col-sm-2 col-form-label">Giới tính:</label>
            <div class="col-sm-4">
              <select class="form-control" id="labelSexEpl">
                <option>--Danh sách lựa chọn--</option>
                <option>Nam</option>
                <option>Nữ</option>
                <option>Khác</option>
              </select>
            </div>
          </div>
          <div class="form-group form_input row">
            <label for="inputIdCardEpl" class="col-sm-2 col-form-label">CMND/CCCD:</label>
            <div class="col-sm-4">
              <input type="password" class="form-control" id="inputIdCardEpl" placeholder="Nhập CMND..">
            </div>
            <label for="inputEmailEpl" class="col-sm-2 col-form-label">Email:</label>
            <div class="col-sm-4">
              <input type="email" class="form-control" id="inputEmailEpl" placeholder="Nhập Email...">
            </div>
          </div>
          <div class="form-group form_input row">
            <label for="inputDateEpl" class="col-sm-2 col-form-label">Ngày sinh:</label>
            <div class="col-sm-4">
              <input type="date" class="form-control" id="inputDateEpl" placeholder="Nhập ngày sinh...">
            </div>
            <label for="inputSdtEpl" class="col-sm-2 col-form-label">Số điện thoại:</label>
            <div class="col-sm-4">
              <input type="tel" class="form-control" id="inputSdtEpl" placeholder="Nhập số điện thoại...">
            </div>
          </div>
          <div class="form-group form_input row">

            <label for="inputEdu" class="col-sm-2 col-form-label">Trình độ:</label>
            <div class="col-sm-4">
              <select class="form-control" id="inputEdu">
                <option>--Danh sách lựa chọn--</option>
                <option>Cao đẳng</option>
                <option>Đại học</option>
                <option>Sau đại học</option>

              </select>
            </div>
            <label for="inputDivision" class="col-sm-2 col-form-label">Bộ phận:</label>
            <div class="col-sm-4">
              <select class="form-control" id="inputDivision">
                <option>--Danh sách lựa chọn--</option>
                <option>Sale-Marketing</option>
                <option>Hành chính</option>
                <option>Phục vụ</option>
                <option>Quản lý</option>


              </select>
            </div>

          </div>
          <div class="form-group form_input row">

            <label for="inputPosition" class="col-sm-2 col-form-label">Vị trí:</label>
            <div class="col-sm-3">
              <select class="form-control" id="inputPosition">
                <option>--Danh sách lựa chọn--</option>
                <option>Quản Lý</option>
                <option>Nhân viên</option>
              </select>
            </div>
            <label for="inputAddressEpl" class="col-sm-2 col-form-label">Địa chỉ:</label>
            <div class="col-sm-5">
              <input type="text" class="form-control" id="inputAddressEpl" placeholder="Nhập Địa chỉ...">
            </div>

          </div>

          <button type="submit" class="btn btn-primary">Add Employee</button>
        </form>

      </div>
    </div>
  </div>
  <footer class="footer">
    <div class="container-fluid">
      <div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <div class="row border-top pt-3">
            <div class="col-12 text-center">
              <p>
                &copy; 2022 Copyright. Made With
                <i class="fas fa-heart text-danger"></i>
                by
                <span class="text-success">PTN</span>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>
</div>
</body>

</html>
