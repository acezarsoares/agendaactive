import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';

import { OcorrenciaPage } from './../ocorrencia/ocorrencia';

@Component({
  selector: 'page-servico',
  templateUrl: 'servico.html'
})
export class ServicoPage {
  
  constructor(public navCtrl: NavController) {

  }

  public ocorrencia(){
    this.navCtrl.push(OcorrenciaPage);
  }

}
