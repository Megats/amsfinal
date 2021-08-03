<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Login</title>
    <link
      href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css"
    />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    />

    <style>
      body {
        font-family: "Karla", sans-serif;
        min-height: 100vh;
      }

     
      .login-card {
        border: 0;
        border-radius: 27.5px;
        box-shadow: 0 10px 30px 0 rgba(172, 168, 168, 0.43);
        overflow: hidden;
        padding:50px;
        display: flex;
        justify-content: center;
        text-align: center;
        align-items: center;
        position: relative;
      }
      .login-card h1
      {
          margin-top: 10px;
          margin-bottom: 30px;
          font-weight: 600;
      }
      
      .login-card .card-body {
        padding: 75px 60px 60px;
      }
      @media (max-width: 422px) {
        .login-card .card-body {
          padding: 35px 24px;
        }
      }
      
      @media (max-width: 767px) {
        .login-card-footer-text {
          margin-bottom: 24px;
        }
      }
    
      .a {
        color: #e7484f;
      }
      .b {
        color: #f68b1d;
      }
      .c {
        color: #fced00;
      }
      .d {
        color: #009e4f;
      }
      .e {
        color: #00aac3;
      }
      .f {
        color: #732982;
      }

    
      .text-center {
        text-align: center;
      }

      .rainbow {
        background-color: #343a40;
        border-radius: 4px;
        color: #fff;
        cursor: pointer;
        padding: 8px 16px;
      }

      .rainbow-1:hover {
        background-image: linear-gradient(
          90deg,
          #00c0ff 0%,
          #ffcf00 49%,
          #fc4f4f 80%,
          #00c0ff 100%
        );
        animation: slidebg 5s linear infinite;
      }

      .rainbow-2:hover {
        background-image: linear-gradient(
          to right,
          red,
          orange,
          yellow,
          green,
          blue,
          indigo,
          violet,
          red
        );
        animation: slidebg 2s linear infinite;
      }

      .rainbow-3:hover {
        background-image: linear-gradient(
          to right,
          red,
          orange,
          yellow,
          green,
          blue,
          indigo,
          red
        );
        animation: slidebg 2s linear infinite;
      }

      .rainbow-4:hover {
        background-image: linear-gradient(
          to right,
          #e7484f,
          #f68b1d,
          #fced00,
          #009e4f,
          #00aac3,
          #732982
        );
        animation: slidebg 2s linear infinite;
      }

      .rainbow-5:hover {
        background-image: linear-gradient(
          to right,
          #e7484f,
          #e7484f 16.65%,
          #f68b1d 16.65%,
          #f68b1d 33.3%,
          #fced00 33.3%,
          #fced00 49.95%,
          #009e4f 49.95%,
          #009e4f 66.6%,
          #00aac3 66.6%,
          #00aac3 83.25%,
          #732982 83.25%,
          #732982 100%,
          #e7484f 100%
        );
        animation: slidebg 2s linear infinite;
      }

      @keyframes slidebg {
        to {
          background-position: 20vw;
        }
      }

      .follow {
        margin-top: 40px;
      }

      .follow a {
        color: black;
        padding: 8px 16px;
        text-decoration: none;
      }
      
a:hover{

	color:white;
}

      a
      {
          padding:30px;
          margin-right: 20px;
          font-size: 20px;
          color:white;
          text-decoration: none;
      }
      a:not([href]) {
    color: white !important;
    text-decoration: none;
}
@media (min-width: 1200px)
{
    .container, .container-lg, .container-md, .container-sm, .container-xl {
    max-width: 720px !important;
}  
}

.particle {
  position: absolute;
  border-radius: 50%;
}

@-webkit-keyframes particle-animation-1 {
  100% {
    transform: translate3d(90vw, 70vh, 51px);
  }
}

@keyframes particle-animation-1 {
  100% {
    transform: translate3d(90vw, 70vh, 51px);
  }
}
.particle:nth-child(1) {
  -webkit-animation: particle-animation-1 60s infinite;
          animation: particle-animation-1 60s infinite;
  opacity: 0.91;
  height: 10px;
  width: 10px;
  -webkit-animation-delay: -0.2s;
          animation-delay: -0.2s;
  transform: translate3d(52vw, 48vh, 83px);
  background: #26c4d9;
}

@-webkit-keyframes particle-animation-2 {
  100% {
    transform: translate3d(50vw, 74vh, 13px);
  }
}

@keyframes particle-animation-2 {
  100% {
    transform: translate3d(50vw, 74vh, 13px);
  }
}
.particle:nth-child(2) {
  -webkit-animation: particle-animation-2 60s infinite;
          animation: particle-animation-2 60s infinite;
  opacity: 0.87;
  height: 7px;
  width: 7px;
  -webkit-animation-delay: -0.4s;
          animation-delay: -0.4s;
  transform: translate3d(80vw, 56vh, 4px);
  background: #26d9a9;
}

@-webkit-keyframes particle-animation-3 {
  100% {
    transform: translate3d(89vw, 45vh, 46px);
  }
}

@keyframes particle-animation-3 {
  100% {
    transform: translate3d(89vw, 45vh, 46px);
  }
}
.particle:nth-child(3) {
  -webkit-animation: particle-animation-3 60s infinite;
          animation: particle-animation-3 60s infinite;
  opacity: 0.4;
  height: 10px;
  width: 10px;
  -webkit-animation-delay: -0.6s;
          animation-delay: -0.6s;
  transform: translate3d(46vw, 11vh, 8px);
  background: #8e26d9;
}

@-webkit-keyframes particle-animation-4 {
  100% {
    transform: translate3d(10vw, 48vh, 61px);
  }
}

@keyframes particle-animation-4 {
  100% {
    transform: translate3d(10vw, 48vh, 61px);
  }
}
.particle:nth-child(4) {
  -webkit-animation: particle-animation-4 60s infinite;
          animation: particle-animation-4 60s infinite;
  opacity: 0.96;
  height: 8px;
  width: 8px;
  -webkit-animation-delay: -0.8s;
          animation-delay: -0.8s;
  transform: translate3d(29vw, 75vh, 94px);
  background: #2674d9;
}

@-webkit-keyframes particle-animation-5 {
  100% {
    transform: translate3d(8vw, 58vh, 83px);
  }
}

@keyframes particle-animation-5 {
  100% {
    transform: translate3d(8vw, 58vh, 83px);
  }
}
.particle:nth-child(5) {
  -webkit-animation: particle-animation-5 60s infinite;
          animation: particle-animation-5 60s infinite;
  opacity: 0.11;
  height: 8px;
  width: 8px;
  -webkit-animation-delay: -1s;
          animation-delay: -1s;
  transform: translate3d(25vw, 26vh, 45px);
  background: #d95326;
}

@-webkit-keyframes particle-animation-6 {
  100% {
    transform: translate3d(88vw, 41vh, 6px);
  }
}

@keyframes particle-animation-6 {
  100% {
    transform: translate3d(88vw, 41vh, 6px);
  }
}
.particle:nth-child(6) {
  -webkit-animation: particle-animation-6 60s infinite;
          animation: particle-animation-6 60s infinite;
  opacity: 0.3;
  height: 8px;
  width: 8px;
  -webkit-animation-delay: -1.2s;
          animation-delay: -1.2s;
  transform: translate3d(8vw, 23vh, 91px);
  background: #d97426;
}

@-webkit-keyframes particle-animation-7 {
  100% {
    transform: translate3d(27vw, 32vh, 54px);
  }
}

@keyframes particle-animation-7 {
  100% {
    transform: translate3d(27vw, 32vh, 54px);
  }
}
.particle:nth-child(7) {
  -webkit-animation: particle-animation-7 60s infinite;
          animation: particle-animation-7 60s infinite;
  opacity: 0.94;
  height: 9px;
  width: 9px;
  -webkit-animation-delay: -1.4s;
          animation-delay: -1.4s;
  transform: translate3d(14vw, 8vh, 24px);
  background: #2656d9;
}

@-webkit-keyframes particle-animation-8 {
  100% {
    transform: translate3d(72vw, 17vh, 44px);
  }
}

@keyframes particle-animation-8 {
  100% {
    transform: translate3d(72vw, 17vh, 44px);
  }
}
.particle:nth-child(8) {
  -webkit-animation: particle-animation-8 60s infinite;
          animation: particle-animation-8 60s infinite;
  opacity: 0.48;
  height: 9px;
  width: 9px;
  -webkit-animation-delay: -1.6s;
          animation-delay: -1.6s;
  transform: translate3d(33vw, 26vh, 35px);
  background: #269dd9;
}

@-webkit-keyframes particle-animation-9 {
  100% {
    transform: translate3d(49vw, 51vh, 11px);
  }
}

@keyframes particle-animation-9 {
  100% {
    transform: translate3d(49vw, 51vh, 11px);
  }
}
.particle:nth-child(9) {
  -webkit-animation: particle-animation-9 60s infinite;
          animation: particle-animation-9 60s infinite;
  opacity: 0.44;
  height: 7px;
  width: 7px;
  -webkit-animation-delay: -1.8s;
          animation-delay: -1.8s;
  transform: translate3d(22vw, 36vh, 84px);
  background: #2682d9;
}

@-webkit-keyframes particle-animation-10 {
  100% {
    transform: translate3d(11vw, 82vh, 19px);
  }
}

@keyframes particle-animation-10 {
  100% {
    transform: translate3d(11vw, 82vh, 19px);
  }
}
.particle:nth-child(10) {
  -webkit-animation: particle-animation-10 60s infinite;
          animation: particle-animation-10 60s infinite;
  opacity: 0.81;
  height: 6px;
  width: 6px;
  -webkit-animation-delay: -2s;
          animation-delay: -2s;
  transform: translate3d(27vw, 14vh, 12px);
  background: #26d974;
}

@-webkit-keyframes particle-animation-11 {
  100% {
    transform: translate3d(84vw, 20vh, 54px);
  }
}

@keyframes particle-animation-11 {
  100% {
    transform: translate3d(84vw, 20vh, 54px);
  }
}
.particle:nth-child(11) {
  -webkit-animation: particle-animation-11 60s infinite;
          animation: particle-animation-11 60s infinite;
  opacity: 0.67;
  height: 8px;
  width: 8px;
  -webkit-animation-delay: -2.2s;
          animation-delay: -2.2s;
  transform: translate3d(86vw, 34vh, 97px);
  background: #bb26d9;
}

@-webkit-keyframes particle-animation-12 {
  100% {
    transform: translate3d(75vw, 37vh, 84px);
  }
}

@keyframes particle-animation-12 {
  100% {
    transform: translate3d(75vw, 37vh, 84px);
  }
}
.particle:nth-child(12) {
  -webkit-animation: particle-animation-12 60s infinite;
          animation: particle-animation-12 60s infinite;
  opacity: 0.28;
  height: 10px;
  width: 10px;
  -webkit-animation-delay: -2.4s;
          animation-delay: -2.4s;
  transform: translate3d(80vw, 9vh, 89px);
  background: #8826d9;
}

@-webkit-keyframes particle-animation-13 {
  100% {
    transform: translate3d(65vw, 28vh, 73px);
  }
}

@keyframes particle-animation-13 {
  100% {
    transform: translate3d(65vw, 28vh, 73px);
  }
}
.particle:nth-child(13) {
  -webkit-animation: particle-animation-13 60s infinite;
          animation: particle-animation-13 60s infinite;
  opacity: 0.92;
  height: 7px;
  width: 7px;
  -webkit-animation-delay: -2.6s;
          animation-delay: -2.6s;
  transform: translate3d(46vw, 87vh, 78px);
  background: #d92674;
}

@-webkit-keyframes particle-animation-14 {
  100% {
    transform: translate3d(54vw, 11vh, 35px);
  }
}

@keyframes particle-animation-14 {
  100% {
    transform: translate3d(54vw, 11vh, 35px);
  }
}
.particle:nth-child(14) {
  -webkit-animation: particle-animation-14 60s infinite;
          animation: particle-animation-14 60s infinite;
  opacity: 0.81;
  height: 10px;
  width: 10px;
  -webkit-animation-delay: -2.8s;
          animation-delay: -2.8s;
  transform: translate3d(53vw, 68vh, 46px);
  background: #d926a0;
}

@-webkit-keyframes particle-animation-15 {
  100% {
    transform: translate3d(1vw, 16vh, 88px);
  }
}

@keyframes particle-animation-15 {
  100% {
    transform: translate3d(1vw, 16vh, 88px);
  }
}
.particle:nth-child(15) {
  -webkit-animation: particle-animation-15 60s infinite;
          animation: particle-animation-15 60s infinite;
  opacity: 0.29;
  height: 10px;
  width: 10px;
  -webkit-animation-delay: -3s;
          animation-delay: -3s;
  transform: translate3d(23vw, 3vh, 71px);
  background: #26a9d9;
}

@-webkit-keyframes particle-animation-16 {
  100% {
    transform: translate3d(59vw, 68vh, 87px);
  }
}

@keyframes particle-animation-16 {
  100% {
    transform: translate3d(59vw, 68vh, 87px);
  }
}
.particle:nth-child(16) {
  -webkit-animation: particle-animation-16 60s infinite;
          animation: particle-animation-16 60s infinite;
  opacity: 0.18;
  height: 7px;
  width: 7px;
  -webkit-animation-delay: -3.2s;
          animation-delay: -3.2s;
  transform: translate3d(15vw, 2vh, 65px);
  background: #d9265c;
}

@-webkit-keyframes particle-animation-17 {
  100% {
    transform: translate3d(47vw, 39vh, 55px);
  }
}

@keyframes particle-animation-17 {
  100% {
    transform: translate3d(47vw, 39vh, 55px);
  }
}
.particle:nth-child(17) {
  -webkit-animation: particle-animation-17 60s infinite;
          animation: particle-animation-17 60s infinite;
  opacity: 0.58;
  height: 10px;
  width: 10px;
  -webkit-animation-delay: -3.4s;
          animation-delay: -3.4s;
  transform: translate3d(84vw, 5vh, 30px);
  background: #26d6d9;
}

@-webkit-keyframes particle-animation-18 {
  100% {
    transform: translate3d(3vw, 4vh, 64px);
  }
}

@keyframes particle-animation-18 {
  100% {
    transform: translate3d(3vw, 4vh, 64px);
  }
}
.particle:nth-child(18) {
  -webkit-animation: particle-animation-18 60s infinite;
          animation: particle-animation-18 60s infinite;
  opacity: 0.3;
  height: 10px;
  width: 10px;
  -webkit-animation-delay: -3.6s;
          animation-delay: -3.6s;
  transform: translate3d(47vw, 2vh, 55px);
  background: #5926d9;
}

@-webkit-keyframes particle-animation-19 {
  100% {
    transform: translate3d(6vw, 40vh, 33px);
  }
}

@keyframes particle-animation-19 {
  100% {
    transform: translate3d(6vw, 40vh, 33px);
  }
}
.particle:nth-child(19) {
  -webkit-animation: particle-animation-19 60s infinite;
          animation: particle-animation-19 60s infinite;
  opacity: 0.07;
  height: 7px;
  width: 7px;
  -webkit-animation-delay: -3.8s;
          animation-delay: -3.8s;
  transform: translate3d(23vw, 58vh, 90px);
  background: #d926a3;
}

@-webkit-keyframes particle-animation-20 {
  100% {
    transform: translate3d(50vw, 35vh, 35px);
  }
}

@keyframes particle-animation-20 {
  100% {
    transform: translate3d(50vw, 35vh, 35px);
  }
}
.particle:nth-child(20) {
  -webkit-animation: particle-animation-20 60s infinite;
          animation: particle-animation-20 60s infinite;
  opacity: 1;
  height: 10px;
  width: 10px;
  -webkit-animation-delay: -4s;
          animation-delay: -4s;
  transform: translate3d(25vw, 63vh, 81px);
  background: #32d926;
}

@-webkit-keyframes particle-animation-21 {
  100% {
    transform: translate3d(32vw, 60vh, 20px);
  }
}

@keyframes particle-animation-21 {
  100% {
    transform: translate3d(32vw, 60vh, 20px);
  }
}
.particle:nth-child(21) {
  -webkit-animation: particle-animation-21 60s infinite;
          animation: particle-animation-21 60s infinite;
  opacity: 0.54;
  height: 7px;
  width: 7px;
  -webkit-animation-delay: -4.2s;
          animation-delay: -4.2s;
  transform: translate3d(47vw, 10vh, 75px);
  background: #7d26d9;
}

@-webkit-keyframes particle-animation-22 {
  100% {
    transform: translate3d(10vw, 21vh, 66px);
  }
}

@keyframes particle-animation-22 {
  100% {
    transform: translate3d(10vw, 21vh, 66px);
  }
}
.particle:nth-child(22) {
  -webkit-animation: particle-animation-22 60s infinite;
          animation: particle-animation-22 60s infinite;
  opacity: 0.65;
  height: 10px;
  width: 10px;
  -webkit-animation-delay: -4.4s;
          animation-delay: -4.4s;
  transform: translate3d(7vw, 81vh, 49px);
  background: #26d938;
}

@-webkit-keyframes particle-animation-23 {
  100% {
    transform: translate3d(33vw, 77vh, 96px);
  }
}

@keyframes particle-animation-23 {
  100% {
    transform: translate3d(33vw, 77vh, 96px);
  }
}
.particle:nth-child(23) {
  -webkit-animation: particle-animation-23 60s infinite;
          animation: particle-animation-23 60s infinite;
  opacity: 0.15;
  height: 9px;
  width: 9px;
  -webkit-animation-delay: -4.6s;
          animation-delay: -4.6s;
  transform: translate3d(58vw, 28vh, 22px);
  background: #267dd9;
}

@-webkit-keyframes particle-animation-24 {
  100% {
    transform: translate3d(51vw, 37vh, 7px);
  }
}

@keyframes particle-animation-24 {
  100% {
    transform: translate3d(51vw, 37vh, 7px);
  }
}
.particle:nth-child(24) {
  -webkit-animation: particle-animation-24 60s infinite;
          animation: particle-animation-24 60s infinite;
  opacity: 0.67;
  height: 10px;
  width: 10px;
  -webkit-animation-delay: -4.8s;
          animation-delay: -4.8s;
  transform: translate3d(8vw, 34vh, 32px);
  background: #d9265c;
}

@-webkit-keyframes particle-animation-25 {
  100% {
    transform: translate3d(33vw, 43vh, 35px);
  }
}

@keyframes particle-animation-25 {
  100% {
    transform: translate3d(33vw, 43vh, 35px);
  }
}
.particle:nth-child(25) {
  -webkit-animation: particle-animation-25 60s infinite;
          animation: particle-animation-25 60s infinite;
  opacity: 0.54;
  height: 8px;
  width: 8px;
  -webkit-animation-delay: -5s;
          animation-delay: -5s;
  transform: translate3d(68vw, 1vh, 83px);
  background: #d9265f;
}

@-webkit-keyframes particle-animation-26 {
  100% {
    transform: translate3d(31vw, 13vh, 69px);
  }
}

@keyframes particle-animation-26 {
  100% {
    transform: translate3d(31vw, 13vh, 69px);
  }
}
.particle:nth-child(26) {
  -webkit-animation: particle-animation-26 60s infinite;
          animation: particle-animation-26 60s infinite;
  opacity: 0.51;
  height: 10px;
  width: 10px;
  -webkit-animation-delay: -5.2s;
          animation-delay: -5.2s;
  transform: translate3d(6vw, 38vh, 49px);
  background: #d9267a;
}

@-webkit-keyframes particle-animation-27 {
  100% {
    transform: translate3d(37vw, 11vh, 35px);
  }
}

@keyframes particle-animation-27 {
  100% {
    transform: translate3d(37vw, 11vh, 35px);
  }
}
.particle:nth-child(27) {
  -webkit-animation: particle-animation-27 60s infinite;
          animation: particle-animation-27 60s infinite;
  opacity: 0.12;
  height: 7px;
  width: 7px;
  -webkit-animation-delay: -5.4s;
          animation-delay: -5.4s;
  transform: translate3d(33vw, 23vh, 63px);
  background: #d97726;
}

@-webkit-keyframes particle-animation-28 {
  100% {
    transform: translate3d(63vw, 23vh, 70px);
  }
}

@keyframes particle-animation-28 {
  100% {
    transform: translate3d(63vw, 23vh, 70px);
  }
}
.particle:nth-child(28) {
  -webkit-animation: particle-animation-28 60s infinite;
          animation: particle-animation-28 60s infinite;
  opacity: 0.23;
  height: 9px;
  width: 9px;
  -webkit-animation-delay: -5.6s;
          animation-delay: -5.6s;
  transform: translate3d(15vw, 3vh, 73px);
  background: #d026d9;
}

@-webkit-keyframes particle-animation-29 {
  100% {
    transform: translate3d(22vw, 56vh, 98px);
  }
}

@keyframes particle-animation-29 {
  100% {
    transform: translate3d(22vw, 56vh, 98px);
  }
}
.particle:nth-child(29) {
  -webkit-animation: particle-animation-29 60s infinite;
          animation: particle-animation-29 60s infinite;
  opacity: 0.92;
  height: 9px;
  width: 9px;
  -webkit-animation-delay: -5.8s;
          animation-delay: -5.8s;
  transform: translate3d(54vw, 38vh, 73px);
  background: #d92674;
}

@-webkit-keyframes particle-animation-30 {
  100% {
    transform: translate3d(81vw, 37vh, 93px);
  }
}

@keyframes particle-animation-30 {
  100% {
    transform: translate3d(81vw, 37vh, 93px);
  }
}
.particle:nth-child(30) {
  -webkit-animation: particle-animation-30 60s infinite;
          animation: particle-animation-30 60s infinite;
  opacity: 0.32;
  height: 6px;
  width: 6px;
  -webkit-animation-delay: -6s;
          animation-delay: -6s;
  transform: translate3d(33vw, 41vh, 44px);
  background: #26d9c4;
}

h1{
  font-family: 'Teko', sans-serif;
  text-transform: uppercase;
  font-size: 3rem;
  text-align: center;
  display: -webkit-flex;
  display: flex;
  -webkit-align-items: center;
  align-items: center;
  -webkit-justify-content: center;
  justify-content: center;
  margin: 0;
  background: white;
  position: relative;
  background: white;
  color: #000;
}

h1:before{
  content: attr(data-text);
  position: absolute;
  background: linear-gradient(#f70000, #f89200, #f8f501, #038f00,#0168f8, #a200f7);
  -webkit-background-clip: text;
  color: transparent;
  background-size: 100% 90%;
  line-height: 1.2;
  clip-path: ellipse(120px 120px at -2.54% -9.25%);
  animation: swing 5s infinite;
  animation-direction: alternate;
}

@keyframes swing{
  0%{
     -webkit-clip-path: ellipse(120px 120px at -2.54% -9.25%)
    clip-path: ellipse(120px 120px at -2.54% -9.25%)
  }
  50%{
    -webkit-clip-path: ellipse(120px 120px at 49.66% 64.36%);
    clip-path: ellipse(120px 120px at 49.66% 64.36%);

  }
  100%{
     -webkit-clip-path: ellipse(120px 120px at 102.62% -1.61%;);
    clip-path: ellipse(120px 120px at 102.62% -1.61%);
  }
}

      /*# sourceMappingURL=login.css.map */
    </style>
  </head>
  <body>
  <div id="particle-container">
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
    </div>
  
    <main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
      <div class="container">
        <div class="card login-card">

          <img src="picture/company_logo-removebg-preview.png" width="100px" >
          <h1 data-text="Agent Management System">
            Agent Management System</h1>
          <div class="row">
          <a href="login.jsp" class="rainbow rainbow-5" style="text-decoration: none;">Agent</a>
          <a href="LoginSupplier.jsp" class="rainbow rainbow-3" style="text-decoration: none;">Supplier</a>
        </div>
      </div>
    </main>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  </body>
</html>