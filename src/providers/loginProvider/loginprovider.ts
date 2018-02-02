//import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AlertController } from 'ionic-angular';
import { Http ,HttpModule} from '@angular/http';

@Injectable()
export class LoginProvider {

  constructor(public alertCtrl: AlertController) {
              // nada
  }


  public ValidaLogin(user){
    if(user.operador == 'admin' || user.senha=='123'){
      return true
     } else {
      return false
     }
  }

  showAlert(Titulo, Mensagem) {
    let alert = this.alertCtrl.create({
      title: Titulo,
      subTitle: Mensagem,
      buttons: ['OK']
    });
    alert.present();
  }
}

