import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { MensagemPage } from './mensagem';

@NgModule({
  declarations: [
    MensagemPage,
  ],
  imports: [
    IonicPageModule.forChild(MensagemPage),
  ],
})
export class MensagemPageModule {}
