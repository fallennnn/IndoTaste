@extends('layouts.main')

@section('container')

<div
      class="container max-w-lg px-4 py-32 mx-auto text-left bg-center bg-no-repeat bg-cover md:max-w-none md:text-center"
      style="background-image: url('https://cdn.pixabay.com/photo/2016/11/18/14/39/beans-1834984_960_720.jpg')">
      <h1
        class="font-mono text-3xl font-extrabold text-transparent bg-clip-text bg-gradient-to-r from-green-400 to-blue-500 md:text-center sm:leading-none lg:text-5xl">
        <span class="inline md:block">IndoTaste Restaurant</span>
      </h1>
      <div class="mx-auto mt-2 text-black-700 md:text-center lg:text-lg">
        "Untuk Pura-Pura Kuat, Juga butuh Tenaga."
      </div>
      <div class="flex flex-col items-center mt-12 text-center">
        <span class="relative inline-flex w-full md:w-auto">
          <a href="/food" type="button"
            class="inline-flex items-center justify-center px-6 py-2 text-base font-bold leading-6 text-white bg-green-600 rounded-full lg:w-full md:w-auto hover:bg-green-500 focus:outline-none">
            Cek Menu Kami
          </a>
      </div>
    </div>
    <!-- End Main Hero Content -->
    <!-- <section class="mt-8 bg-white">
      <div class="mt-4 text-center">
        <h3 class="text-2xl font-bold">Menu Kami</h3>
        <h2 class="text-3xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-green-400 to-blue-500">
          SPESIAL HARI INI</h2>
      </div>
      <div class="container w-full px-5 py-6 mx-auto">
        
      </div>
    </section> -->
    <section class="pt-4 pb-12 bg-gray-50">
      <div class="my-8 text-center">
        <h2 class="text-3xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-green-400 to-blue-500">
          Galeri Makanan</h2>
      </div>
      <div class="container grid gap-4 mx-auto lg:grid-cols-3">
        <div class="w-full rounded">
          <img src="foodimage/1681172122.jpeg" alt="image" class="object-cover w-full h-80">
        </div>
        <div class="w-full rounded">
          <img src="foodimage/1681172326.jpg" alt="image"  class="object-cover w-full h-80">
        </div>
        <div class="w-full rounded">
          <img src="foodimage/1681172387.jpg" alt="image"  class="object-cover w-full h-80">
        </div>
        <div class="w-full rounded">
          <img src="foodimage/1681172529.jpg" alt="image"  class="object-cover w-full h-80">
        </div>
        <div class="w-full rounded">
          <img src="foodimage/1681172674.jpg" alt="image"  class="object-cover w-full h-80">
        </div>
        <div class="w-full rounded">
          <img src="foodimage/1681172502.jpg" alt="image"  class="object-cover w-full h-80">
        </div>
      </div>
    </section>
@endsection

