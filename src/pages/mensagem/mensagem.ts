import { LoginPage } from './../login/login';
import { Component, NgModule } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

import { MensagemProvider } from '../../providers/mensagem/mensagem';
import { UtilProvider } from '../../providers/util/util';


@IonicPage()
@Component({
  selector: 'page-mensagem',
  templateUrl: 'mensagem.html',
})

export class MensagemPage {
  mensagemModel: Mensagem;  
  public mensagem: any = [];
  
  constructor(public navCtrl: NavController, 
              public navParams: NavParams,
              private mensagemProvider: MensagemProvider,
              private utilProvider: UtilProvider){
                this.mensagemModel = new Mensagem();

                this.mensagemModel.idMobileTipoMensagem   = this.navParams.get("mensagemtipo").idMobileTipoMensagem;
                this.mensagemModel.nomeMobileTipoMensagem = this.navParams.get("mensagemtipo").nomeMobileTipoMensagem;                                
                this.listarMensagem();                
  }

  listarMensagem(){
    this.mensagemProvider.getMensagem(this.mensagemModel.idMobileTipoMensagem)
      .then(data => {
        this.mensagem = data;
      });          
  }

  enviarMensagem(){
    this.inserirMensagem()
    .then(res =>{
      console.log(res);
      this.mensagemModel.mensagem = "";
      this.utilProvider.mensagemToast('Mensagem enviada com sucesso', 3000, 'Top');      
      this.mensagem.push(res);
    })
    .catch((error) => {
      this.utilProvider.mensagemToast('Erro ao enviar a mensagem. Erro: ' + error.error, 3000, 'Top');      
    })
  }

  private inserirMensagem(){
    return this.mensagemProvider.insertMensagem(this.mensagemModel);
  }

  ionViewDidLoad() {
  }

  doRefresh(refresher) {
    this.listarMensagem();
    setTimeout(() => {
      refresher.complete();
    }, 1000);
  }

}

export class Mensagem{
  idMobileMensagem:number;
  idMobileTipoMensagem: number;
  nomeMobileTipoMensagem: string;
  idPessoaRelacionada: number = 112141;
  tipoPessoaRelacionada: string = "R";
  idAutor: number = 112141;
  nomeAutor: string = "DAFINY DE PAULA GOMES";
  tipoAutor: string = "R";
  mensagem: string = "";
  dataHora: any;
  dataHoraString: string;
}