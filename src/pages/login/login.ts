import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

import { LoginProvider } from './../../providers/loginProvider/loginprovider';
import { TabsPage } from '../../pages/tabs/tabs';
import { UtilProvider } from '../../providers/util/util';

import { not } from '@angular/compiler/src/output/output_ast';

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
              private loginProvider:LoginProvider,
              private utilProvider: UtilProvider) {          
    this.user = new Usuario();
  }

  ionViewDidLoad() {
  }


  efetuarLogin(){
    this.utilProvider.Loading('Aguarde...');
    this.loginProvider.ValidaLogin(this.user)
      .then(data => {
        console.log(data);
      if ( data != "" ){
        this.navCtrl.push(TabsPage)
      }
      else{
        this.utilProvider.mensagemToast('Erro de login.', 3000, 'bottom');
      }
    }).catch(this.utilProvider.mensagemToast('Erro de acesso',3000,'midle'));
  }

}
