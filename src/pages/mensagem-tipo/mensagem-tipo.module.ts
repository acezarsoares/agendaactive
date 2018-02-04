import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { MensagemTipoPage } from './mensagem-tipo';

@NgModule({
  declarations: [
    MensagemTipoPage,
  ],
  imports: [
    IonicPageModule.forChild(MensagemTipoPage),
  ],
})
export class MensagemTipoPageModule {}
