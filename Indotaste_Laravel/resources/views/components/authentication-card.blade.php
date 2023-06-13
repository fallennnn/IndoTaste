@extends('layouts.test')

@section('container')
<div class="form-structor">
    <div class="loglogo">
        <img src="images/logo/test.png" alt="">
    </div>

    <div class="login">
        {{ $slot }}
    </div>
</div>
@endsection