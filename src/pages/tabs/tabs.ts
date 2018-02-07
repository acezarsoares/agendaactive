import { Component } from '@angular/core';

import { HomePage } from '../home/home';
import { MensagemTipoPage } from '../mensagem-tipo/mensagem-tipo';
import { ContactPage } from '../contact/contact';
import { AboutPage } from '../about/about';

@Component({
  templateUrl: 'tabs.html'
})
export class TabsPage {

  tab1Root = HomePage;
  tab2Root = MensagemTipoPage;
  tab3Root = AboutPage;
  tab4Root = ContactPage;

  constructor() {

  }
}
