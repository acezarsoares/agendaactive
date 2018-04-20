import { NgModule, ErrorHandler } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { IonicApp, IonicModule, IonicErrorHandler } from 'ionic-angular';
import { MyApp } from './app.component';

import { ServicoPage } from '../pages/servico/servico';
import { AjustePage } from '../pages/ajuste/ajuste';
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

import { Splash } from '../pages/splash/splash';
import { UploadPageModule } from '../pages/upload/upload.module';

import { Transfer } from '@ionic-native/transfer';
import { FilePath } from '@ionic-native/file-path';

import { FileTransfer, FileUploadOptions, FileTransferObject } from '@ionic-native/file-transfer';
import { File } from '@ionic-native/file';
import { Camera } from '@ionic-native/camera';

import { HTTP } from '@ionic-native/http';

@NgModule({
  declarations: [
    MyApp,
    ServicoPage,
    AjustePage,
    HomePage,
    TabsPage,
    LoginPage,
    MensagemTipoPage,
    MensagemPage,
    OcorrenciaPage,

    TimelineComponent,
    TimelineItemComponent,
    TimelineTimeComponent,
    
    Splash
  ],
  imports: [
    BrowserModule,
    UploadPageModule,
    IonicModule.forRoot(MyApp),
    HttpModule
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    ServicoPage,
    AjustePage,
    HomePage,
    TabsPage,
    LoginPage,
    MensagemTipoPage,
    MensagemPage,
    OcorrenciaPage,

    Splash
  ],
  providers: [
    File,
    Transfer,
    Camera,
    FilePath,
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler},
    LoginProvider,
    MensagemTipoProvider,
    MensagemProvider,
    UtilProvider,
    HomeProvider,
    OcorrenciaProvider,
    FileTransfer,
    FileTransferObject,
    File,
    Camera,
    HTTP
  ]
})
export class AppModule {}
