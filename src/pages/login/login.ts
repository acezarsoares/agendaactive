import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

import { LoginProvider } from './../../providers/loginProvider/loginprovider';

export class Usuario{
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
              private LoginProvider:LoginProvider) {          
    this.user = new Usuario();
  }

  ionViewDidLoad() {
  }


  login(){
    this.LoginProvider.showAlert('Login', 'Acesso ao sistema garantido');
  }
}
