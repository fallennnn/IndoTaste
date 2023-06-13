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

            <div style="position : relative; top:60px; right: -0px;">
                <div class="row">
                    <table bgcolor="black">
                        <tr align="center">
                            <th style="padding :30px;">Name</th>
                            <th style="padding :30px;">Email</th>
                            <th style="padding :30px;">Action</th>
                        </tr>
    
                        @foreach($data as $data)
                        <tr>
                            <td style="padding :40px;">{{$data->name}}</td>
                            <td style="padding :40px;">{{$data->email}}</td>
    
                            @if($data->usertype=="0")
                            <td style="padding :40px;" align="center"><a href="{{url('/deleteuser', $data->id)}}">delete</a></td>
                            @else
                            <td style="padding :40px;" align="center"><a href="">Not allowed</a></td>
    
                            @endif
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
