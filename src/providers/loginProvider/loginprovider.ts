import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';


import { AlertController } from 'ionic-angular';

@Injectable()
export class LoginProvider {

  constructor(public alertCtrl: AlertController) {
              // nada
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
