import { Component, NgModule } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

import { MensagemTipoProvider } from '../../providers/mensagem-tipo/mensagem-tipo';

import { MensagemPage } from '../../pages/mensagem/mensagem';

@IonicPage()
@Component({
  selector: 'page-mensagem-tipo',
  templateUrl: 'mensagem-tipo.html',
})
export class MensagemTipoPage {
  public mensagemtipo: any;

  constructor(public navCtrl: NavController, 
              public navParams: NavParams,
              private mensagemTipoProvider: MensagemTipoProvider) {   
                this.listarMensagemTipo();      
  }

  listarMensagemTipo(){
    this.mensagemTipoProvider.getMensagemTipo()
      .then(data => {
      this.mensagemtipo = data;
    });
  }

  mensagemDetalhe(mensagemtipo){  
    this.navCtrl.push(MensagemPage, {mensagemtipo});
  }

  ionViewDidLoad() {    
  }  

}

