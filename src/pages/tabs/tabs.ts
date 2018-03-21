import { Component } from '@angular/core';

import { HomePage } from '../home/home';
import { MensagemTipoPage } from '../mensagem-tipo/mensagem-tipo';
import { AjustePage } from '../ajuste/ajuste';
import { ServicoPage } from '../servico/servico';
import { UploadPage } from '../upload/upload';

@Component({
  templateUrl: 'tabs.html'
})
export class TabsPage {

  tab1Root = HomePage;
  tab2Root = MensagemTipoPage;
  tab3Root = ServicoPage;
  tab4Root = AjustePage;
  tab5Root = UploadPage;

  constructor() {

  }
}
