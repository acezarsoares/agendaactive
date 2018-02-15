import { NgModule, ErrorHandler } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { IonicApp, IonicModule, IonicErrorHandler } from 'ionic-angular';
import { MyApp } from './app.component';

import { AboutPage } from '../pages/about/about';
import { ContactPage } from '../pages/contact/contact';
import { HomePage } from '../pages/home/home';
import { TabsPage } from '../pages/tabs/tabs';
import { LoginPage } from '../pages/login/login';
import { MensagemTipoPage } from '../pages/mensagem-tipo/mensagem-tipo';
import { MensagemPage } from '../pages/mensagem/mensagem';
import { OcorrenciaPage } from '../pages/ocorrencia/ocorrencia';
 
import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';

import { LoginProvider } from '../providers/loginProvider/loginprovider';
import { MensagemTipoProvider } from '../providers/mensagem-tipo/mensagem-tipo';
import { MensagemProvider } from '../providers/mensagem/mensagem';

import { HttpModule } from '@angular/http';
import { UtilProvider } from '../providers/util/util';

import { TimelineComponent, TimelineItemComponent, TimelineTimeComponent } from '../components/timeline/timeline';
import { HomeProvider } from '../providers/home/home';
import { OcorrenciaProvider } from '../providers/ocorrencia/ocorrencia';


@NgModule({
  declarations: [
    MyApp,
    AboutPage,
    ContactPage,
    HomePage,
    TabsPage,
    LoginPage,
    MensagemTipoPage,
    MensagemPage,
    OcorrenciaPage,

    TimelineComponent,
    TimelineItemComponent,
    TimelineTimeComponent    
  ],
  imports: [
    BrowserModule,
    IonicModule.forRoot(MyApp),
    HttpModule
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    AboutPage,
    ContactPage,
    HomePage,
    TabsPage,
    LoginPage,
    MensagemTipoPage,
    MensagemPage,
    OcorrenciaPage
  ],
  providers: [
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler},
    LoginProvider,
    MensagemTipoProvider,
    MensagemProvider,
    UtilProvider,
    HomeProvider,
    OcorrenciaProvider
  ]
})
export class AppModule {}
