import { Component } from '@angular/core';
import { NavController, App } from 'ionic-angular';
import { LoginPage } from '../login/login';




@Component({
  selector: 'page-contact',
  templateUrl: 'contact.html'
})
export class ContactPage {

  constructor(public navCtrl: NavController,
              private app: App) {

  }
  
  logoutApp(){
    console.log("Saiu");
    // todo - Remove API token       
    this.app.getRootNav().setRoot(LoginPage);
  }
}
