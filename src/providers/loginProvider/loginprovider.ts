import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AlertController } from 'ionic-angular';

/*
  Generated class for the LoginProvider provider.

  See https://angular.io/guide/dependency-injection for more info on providers
  and Angular DI.
*/
@Injectable()
export class LoginProvider {

  constructor(public http: HttpClient,
              public alertCtrl: AlertController) {
    console.log('Hello LoginProvider Provider');
  }

   public  showAlert(Titulo, Mensagem) {
      let alertOK = this.alertCtrl.create({
        title: Titulo,
        subTitle: Mensagem,
        buttons: ['OK']
      });
      alertOK.present();
    }
  
}
