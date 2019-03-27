import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnInit {

  public inUser:string;
  public inPassword:string;

  constructor() { }

  ngOnInit() {
  }

  onClick(){
    alert(this.inUser + " " + this.inPassword);
  }

}
