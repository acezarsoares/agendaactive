import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

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
    public navParams: NavParams) {
    this.user = new Usuario();
  }

  ionViewDidLoad() {
  }

  login(){
    // vai no provider verificar a autenticação
  }
}
