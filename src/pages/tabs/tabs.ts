import { Component } from '@angular/core';

import { HomePage } from '../home/home';
import { MensagemTipoPage } from '../mensagem-tipo/mensagem-tipo';
import { ContactPage } from '../contact/contact';

@Component({
  templateUrl: 'tabs.html'
})
export class TabsPage {

  tab1Root = HomePage;
  tab2Root = MensagemTipoPage;
  tab3Root = ContactPage;
  tab4Root = ContactPage;

  constructor() {

  }
}
