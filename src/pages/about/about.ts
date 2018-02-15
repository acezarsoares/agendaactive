import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';

import { OcorrenciaPage } from './../ocorrencia/ocorrencia';

@Component({
  selector: 'page-about',
  templateUrl: 'about.html'
})
export class AboutPage {

  constructor(public navCtrl: NavController) {

  }

  public ocorrencia(){
    this.navCtrl.push(OcorrenciaPage);
  }

}
