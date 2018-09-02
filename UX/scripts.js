function checkLogin(){
	var token = window.localStorage.getItem('token');
	if(!token){
		window.location='login.html';
	} else {
		console.log('user loggedin');
	}
}

function logout(){
		window.localStorage.setItem('token', null);
}
