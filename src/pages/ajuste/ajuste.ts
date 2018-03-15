import { Component } from '@angular/core';
import { NavController, App } from 'ionic-angular';
import { LoginPage } from '../login/login';




@Component({
  selector: 'page-ajuste',
  templateUrl: 'ajuste.html'
})
export class AjustePage {

  constructor(public navCtrl: NavController,
              private app: App) {

  }
  
  logoutApp(){
    console.log("Saiu");
    // todo - Remove API token       
    this.app.getRootNav().setRoot(LoginPage);
  }
}
