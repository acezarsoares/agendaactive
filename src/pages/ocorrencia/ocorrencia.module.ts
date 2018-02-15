import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { OcorrenciaPage } from './ocorrencia';

@NgModule({
  declarations: [
    OcorrenciaPage,
  ],
  imports: [
    IonicPageModule.forChild(OcorrenciaPage),
  ],
})
export class OcorrenciaPageModule {}
