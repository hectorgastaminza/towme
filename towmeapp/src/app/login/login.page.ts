import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnInit {

  public inUser:string;
  public inPassword:string;

  constructor(private http: HttpClient) { }

  ngOnInit() {
  }

  onClick(){
    //alert(this.inUser + " " + this.inPassword);
    this.http.get('http://localhost:3000/api/driver/2').subscribe((response) => {
      alert(response.toString());
      console.log(response.toString());
    });
  }

}
