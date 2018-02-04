import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

import { LoginProvider } from './../../providers/loginProvider/loginprovider';
import { TabsPage } from '../../pages/tabs/tabs';

export class Usuario{
  escola:string;
  operador: String;
  senha: String;
}

@IonicPage()
@Component({
  selector: 'page-login',
  templateUrl: 'login.html',
})
export class LoginPage {
  user: Usuario;
  constructor(
              public navCtrl: NavController,
              public navParams: NavParams,
              private loginProvider:LoginProvider) {          
    this.user = new Usuario();
  }

  ionViewDidLoad() {
  }


  login(){
    this.navCtrl.push(TabsPage)
  }

}
