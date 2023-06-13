@extends('layouts.main')

@section('container')

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShowCart</title>
</head>
<body>
    <div class="container text-center" style="margin-top:100px; min-height:62vh;">
        <table align="center" bgcolor="#F7C694">
            <tr>
                <th style="padding : 30px;">Food Name</th>
                <th style="padding : 30px;">Price</th>
                <th style="padding : 30px;">Quantity</th>
                <th style="padding : 30px;">Action</th>
            </tr>
            <h1 style="font-size: 0;">
            {{$count2=0}};
            </h1>
            @foreach($data as $data)
            <tr>
                <td>{{$data->title}}</td>
                <td>{{$data->price}}K</td>
                <td>{{$data->quantity}}</td>
            </tr>
            <h1 style="font-size: 0;">
                {{$count2=$count2+($data->price*$data->quantity)}};
            </h1>
            @endforeach
            <!-- <h1>{{$count}}</h1> -->

            @foreach($data2 as $data2)
            <tr style="position:relative; top: -60px;right: -360px;">
                <td><a href="{{url('/remove',$data2->id)}}" class="btn btn-danger">Remove</a></td>

            </tr>

            @endforeach
        </table>
        <button class="btn btn-primary mt-3" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">Bayar Sekarang</button>


        <!-- Ini Modal -->
        <div class="container-fluid d-flex justify-content-end">
        
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Pilih Metode Pembayaran</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form>
                  <div class="mb-4">
                    <label for="message-text" class="col-form-label">
                        <input type="radio" id="shopeepay" name="bayar" value="shopeepay">
                        <label for="shopeepay">ShopeePay</label><br><br>
                        <input type="radio" id="Gopay" name="bayar" value="Gopay">
                        <label for="gopay">Gopay</label><br><br>
                        <input type="radio" id="Tunai" name="bayar" value="Tunai">
                        <label for="tunai">Tunai</label><br><br>
                        <label for="tunai">Total Biaya =Rp.{{$count2}}.000</label>
                        <a href=""></a>
                    </label>
                  </div>
                  <div class="mb-3">
                    <label for="message-text" class="col-form-label">

                    </label>
                  </div>
                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="color:black;">Close</button>
                <button type="button" class="btn btn-primary" style="color:black;">Bayar</button>
              </div>
            </div>
          </div>
        </div>
    </div> 
        <!-- Akhir Modal -->
    </div>
</body>
</html>

@endsection