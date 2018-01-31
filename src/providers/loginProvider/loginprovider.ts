//import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AlertController } from 'ionic-angular';

@Injectable()
export class LoginProvider {

  constructor(public alertCtrl: AlertController) {
    console.log('Hello LoginProvider Provider');
  }

  public showAlert(Titulo, Mensagem) {
    let alertOK = this.alertCtrl.create({
      title: Titulo,
      subTitle: Mensagem,
      buttons: ['OK']
    });
    alertOK.present();
  }

}
