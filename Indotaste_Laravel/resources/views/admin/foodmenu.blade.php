<x-app-layout>
<!DOCTYPE html>
<html lang="en">
    <head>
        @include('admin.admincss')
    </head>
    <body>
            <!-- partial:partials/_sidebar.html -->
        <div class="container-scroller ">

            @include("admin.navbar")
            <div class="col">

                <div class="row mt-5" >
    
                    <form action="{{url('uploadfood')}}" method="post" enctype="multipart/form-data">
                    
                        @csrf
                        <h2 class="mt-4">Masukkan Menu</h2>
                        <table class="table-dark">
                            <tbody>
                                <tr>
                                    <th >
                                        <label>
                                            Title
                                        </label>
                                    </th>
                                    <th style="padding: 30px;">
                                        <input style="color:blue" type="text" name="title" placeholder=" Write a title " required>
                                    </th>
                                </tr>
                                <tr>
                                    <th>
                                        <label>
                                            Price
                                        </label>
                                    </th>
                                    <th style="padding: 30px;">
                                        <input style="color:blue" type="num" name="price" placeholder=" price " required>
                                    </th>
                                </tr>
                                <tr>
                                    <th>
                                        <label>
                                            Image
                                        </label>
                                    </th>
                                    <th style="padding: 30px;">
                                        <input type="file" name="image" required>
                                    </th>
                                </tr>
                                <tr>
                                    <th>
                                        <label>
                                            Description
                                        </label>
                                    </th>
                                    <th style="padding: 30px;">
                                        <input style="color:blue" type="text" name="description" placeholder=" Description " required>
                                    </th>
                                </tr>
                                <tr>
                                    <th></th>
                                    <th class="d-flex justify-content-center">
                                        <button type="input" class="btn btn-primary" value="Save">Save</button>
                                        <!-- <input style="background-color:white; color:black" type="submit" value="Save"> -->
                                    </th>
                                </tr>
                            </tbody>
                        </table>
                    </form>

                    <h2 class="mt-4">Daftar Menu</h2>

                    <div class="row mt-5">
                        <table bgcolor="black">
                            <tr>
                                <th style="padding: 30px;">Food Name</th>
                                <th style="padding: 30px;">Price</th>
                                <th style="padding: 30px;">Description</th>
                                <th style="padding: 30px;">Image</th>
                                <th style="padding: 30px;">Action</th>
                                <th style="padding: 30px;">Action2</th>
                            </tr>
        
        
                            @foreach($data as $data)
                            <tr align="center">
                                <td>{{$data->title}}</td>
                                <td>{{$data->price}}</td>
                                <td>{{$data->description}}</td>
                                <td><img height="200"width="200" src="/foodimage/{{$data->image}}"></td>
                                <td><a href="{{url('/deletemenu', $data->id)}}">Delete</a></td>
                                <td><a href="{{url('/updateview', $data->id)}}">Update</a></td>
                            </tr>
                            @endforeach
                        </table>
    
                    </div>
    
                </div>
            </div>

        @include('admin.script');
    </body>
</html>


</x-app-layout>
