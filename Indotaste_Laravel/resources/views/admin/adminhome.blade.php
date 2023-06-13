<x-app-layout>
<!DOCTYPE html>
<html lang="en">
    <head>
        @include('admin.admincss')
    </head>
    <body>
            <!-- partial:partials/_sidebar.html -->
            <div class="container-scroller">

            @include("admin.navbar")
            <div style="text-align: center;">
                <h2>Welcome To Page Admin</h2>
                <img src="https://cdn-icons-png.flaticon.com/512/9767/9767242.png" alt="">
            </div>
            

        @include('admin.script')
    </body>
</html>


</x-app-layout>
