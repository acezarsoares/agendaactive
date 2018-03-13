import { Http } from '@angular/http';
import { Injectable } from '@angular/core';
import { ToastController } from 'ionic-angular';
import { LoadingController } from 'ionic-angular';

@Injectable()
export class UtilProvider {

  constructor(public http: Http,
              private toastCtrl: ToastController,
              private loadingCtrl: LoadingController){
  }

  public Servidor(){
    //return 'http://10.10.10.131/API/api.dll/V1/rest/TAgendaEscolar_V1/';
    //return 'http://localhost/API/api.dll/V1/rest/TAgendaEscolar_V1/'
    return 'http://18.216.118.169/api.activesoft.com.br/api.dll/v1/rest/TAgendaEscolar_V1/'
  }

  public mensagemToast(message, duration, position){
    let toast = this.toastCtrl.create({
      message: message,
      duration: duration,
      position: position
    });  

    toast.onDidDismiss(() => {
      console.log('Dismissed toast');
   
  });
  
  toast.present();
  }


  public Loading(msg) {
    let loader = this.loadingCtrl.create({
      content: msg,
      duration: 2000
    });
    loader.present();
    return loader
  }

}
