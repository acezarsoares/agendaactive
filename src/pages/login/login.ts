import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

import { LoginProvider } from './../../providers/loginProvider/loginprovider';
import { TabsPage } from '../../pages/tabs/tabs';
import { UtilProvider } from '../../providers/util/util';

import { not } from '@angular/compiler/src/output/output_ast';

export class Usuario{
  escola:string='';
  operador: String='';
  senha: String='';
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
    //console.log( JSON.stringify({id: 'teste', nome: 'anderson'}) );
    this.loginProvider.ValidaLogin(this.user)
      .then(data => {
      if ( data != "" ){
        this.utilProvider.Loading('Aguarde...');
        this.navCtrl.push(TabsPage)
      }
      else{
        this.utilProvider.mensagemToast('Erro de login.', 3000, 'bottom');
      }
    })
    .catch( err => {
      this.utilProvider.mensagemToast('Erro de acesso',3000,'midle')
    });
  }


  ValidaBtnLogin(){
   if(this.user.escola == '' || this.user.operador == '' || this.user.senha == ''){
     return true
   } else {
     return false
   }
  }

  EsqueceuLogin(){
    this.utilProvider.mensagemToast('Senha enviada com sucesso.',3000,'midle')
  }

}
