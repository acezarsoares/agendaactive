import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { Splash } from './splash';

@NgModule({
  declarations: [
    Splash,
  ],
  imports: [
    IonicPageModule.forChild(Splash),
  ],
})
export class SplashModule {}
