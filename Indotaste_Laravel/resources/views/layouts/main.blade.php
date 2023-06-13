<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <title>IndoTaste</title>
        <!-- Logo -->
        <link
            rel="shortcut icon"
            href="images/favicon/favicon.ico"
            type="image/x-icon"
        />
        <link
            rel="icon"
            href="images/favicon/favicon.ico"
            type="image/x-icon"
        />
        <!-- end logo -->
        <link rel="stylesheet" href="css/stylemain.css" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp"
            crossorigin="anonymous"
        />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link
            rel="stylesheet"
            type="text/css"
            href="assets/css/bootstrap.min.css"
        />

        <link
            rel="stylesheet"
            type="text/css"
            href="assets/css/font-awesome.css"
        />

        <link rel="stylesheet" href="assets/css/indotaste.css" />

        <link rel="stylesheet" href="assets/css/owl-carousel.css" />

        <link rel="stylesheet" href="assets/css/lightbox.css" />
    </head>
    <body>
        @csrf
        <!-- navbar baru -->
        <div class="bg-white shadow-md" x-data="{ isOpen: false }">
            <nav
                class="px-6 py-8 mx-auto md:flex md:justify-between md:items-center"
                style="background-color: #f7c694;"
            >
                <div class="flex items-center justify-between">
                    <a class="navbar-brand" href="/redirects">
                        <img
                            src="images/logo/test.png"
                            alt="logoindotaste"
                            width="187.5"
                            height="50"
                        />
                    </a>
                    <!-- Mobile menu button -->
                    <div @click="isOpen = !isOpen" class="flex md:hidden">
                        <button
                            type="button"
                            class="text-gray-800 hover:text-gray-400 focus:outline-none focus:text-gray-400"
                            aria-label="toggle menu"
                        >
                            <svg
                                viewBox="0 0 24 24"
                                class="w-6 h-6 fill-current"
                            >
                                <path
                                    fill-rule="evenodd"
                                    d="M4 5h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2z"
                                ></path>
                            </svg>
                        </button>
                    </div>
                </div>

                <!-- Mobile Menu open: "block", Menu closed: "hidden" -->
                <div
                    :class="isOpen ? 'flex' : 'hidden'"
                    class="flex-col mt-8 space-y-4 md:flex md:space-y-0 md:flex-row md:items-center md:space-x-10 md:mt-0"
                >
                    <a href="/redirects">Home</a>
                    <a href="/food">Our Menu</a>
                    <a href="#">Poin</a>
                    @auth
                    <a href="{{url('/showcart',Auth::user()->id)}}"><i class="bi bi-cart-fill"></i><span class="badge badge-danger">{{$count}}</span></a>
                    @endauth

                    <li class="nav-item">@if (Route::has('login')) @auth</li>

                    <li>
                        <x-app-layout> </x-app-layout>
                    </li>
                    @else
                    <li>
                        <a
                            href="{{ route('login') }}"
                            class="font-semibold text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white focus:outline focus:outline-2 focus:rounded-sm focus:outline-red-500"
                            >Log in</a
                        >
                    </li>

                    @if (Route::has('register'))
                    <li>
                        <a
                            href="{{ route('register') }}"
                            class="ml-4 font-semibold text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white focus:outline focus:outline-2 focus:rounded-sm focus:outline-red-500"
                            >Register</a
                        >
                    </li>
                    @endif @endauth @endif
                </div>
            </nav>
        </div>

        @yield('container')

        <footer
            class="text-center text-white mt-3"
            style="background-color: #F7C694;"
            >
      <div class="container p-4 pb-0">
        <section class="">
          <div class="row">
            <div class="col-md-6 col-lg-3 col-xl-3 mx-auto mt-3">
              <a class="navbar-brand" href="#">
                <img src="images/logo/test.png" alt="" width="187.5" height="50">
              </a>
              <p>
              Ayo rawat lingkungan kita dan bersama jadikan dunia lebih baik
              </p>
            </div>

            <hr class="w-100 clearfix d-md-none" />

            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3" >
              <h6 class="text-uppercase mb-4 font-weight-bold">Konten</h6>
              <p>
                <a class="text-reset text-decoration-none" href="/redirects">Home</a>
              </p>
              <p>
                <a class="text-reset text-decoration-none" href="/food">Our Menu</a>
              </p>
              <p>
                <a class="text-reset text-decoration-none">Poin</a>
              </p>
              <p>
                <a class="text-reset text-decoration-none" href="{{url('/showcart',Auth::user()->id)}}">Keranjang</a>
              </p>
            </div>

            <hr class="w-100 clearfix d-md-none" />

            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
              <h6 class="text-uppercase mb-4 font-weight-bold">Media Sosial</h6>
              <p>
                <a class="text-reset text-decoration-none">Tiktok @indotaste</a>
              </p>
              <p>
                <a class="text-reset text-decoration-none">Twitter @indotaste</a>
              </p>
              <p>
                <a class="text-reset text-decoration-none">Facebook @indotaste</a>
              </p>
              <p>
                <a class="text-reset text-decoration-none">Instagram @indotaste</a>
              </p>
            </div>
          </div>
        </section>

        <hr class="my-3">
        
      </div>
      <section class="p-3 pt-0" style="background-color: #ED774A">
          <div class="row d-flex justify-content-center">
            <div class="col-md-5 col-lg-8 text-center">
              <div class="">
                @copyright indotaste.com
              </div>
            </div>
          </div>
        </section>
    </footer>        
    
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
