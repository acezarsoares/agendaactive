import { Component, NgModule } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

import { MensagemProvider } from '../../providers/mensagem/mensagem';


@IonicPage()
@Component({
  selector: 'page-mensagem',
  templateUrl: 'mensagem.html',
})

export class MensagemPage {
  
  private idmobiletipomensagem: number;
  private nomemobiletipomensagem: string;    
  public mensagem: any;
  public message: string;
  
  constructor(public navCtrl: NavController, 
              public navParams: NavParams,
              private mensagemProvider: MensagemProvider){                                
                this.idmobiletipomensagem   = this.navParams.get("id");
                this.nomemobiletipomensagem = this.navParams.get("tipo");                
                this.listarMensagem();
  }

  listarMensagem(){
    this.mensagemProvider.getMensagem(this.idmobiletipomensagem)
      .then(data => {
        this.mensagem = data;
      });          
  }

  enviarMessage(){
    console.log('Mensagem enviada: >> ' + this.message);
    this.message = '';
  }

  ionViewDidLoad() {
  }

}
