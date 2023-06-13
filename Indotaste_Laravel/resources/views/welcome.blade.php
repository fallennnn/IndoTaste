@extends('layouts.test')

@section('container')
<div class="form-structor">
	<div class="login">
		<h2 class="form-title" id="login"></span>Welcome to IndoTaste</h2>
        <br>
		<h2 class="form-title" id="login"></span>Already registered?</h2>
        <div class="text-center fs-4" >
            <a href="{{ route('login') }}">Login</a>
        </div>
        <br>
        <h2 class="form-title" id="login"></span>Not registered yet?</h2>
        <div class="text-center fs-4">
            <a href="{{ route('register') }}">Register</a>
        </div>

    </div>
</div>


@endsection