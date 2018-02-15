import { Component, NgModule } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

import { OcorrenciaProvider } from './../../providers/ocorrencia/ocorrencia';

@IonicPage()
@Component({
  selector: 'page-ocorrencia',
  templateUrl: 'ocorrencia.html',
})
export class OcorrenciaPage {
  public ocorrencia: any;

  constructor(public navCtrl: NavController, 
              public navParams: NavParams,
              private ocorrenciaProvider: OcorrenciaProvider) {
                this.listarOcorrencia();
  }

  listarOcorrencia(){
    this.ocorrenciaProvider.getOcorrencia()
      .then(data => {
      this.ocorrencia = data;
    });
  }
  

  ionViewDidLoad() {
  }

}
