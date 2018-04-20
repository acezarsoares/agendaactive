import { Component } from '@angular/core';
import { IonicPage, NavParams } from 'ionic-angular';

import { NavController, ActionSheetController, ToastController, Platform, LoadingController, Loading } from 'ionic-angular';
 
import { File } from '@ionic-native/file';
import { FilePath } from '@ionic-native/file-path';
import { Camera, CameraOptions} from '@ionic-native/camera';
import { HTTP } from '@ionic-native/http';
import 'rxjs/add/operator/map';


declare var cordova: any;

@IonicPage()
@Component({
  selector: 'page-upload',
  templateUrl: 'upload.html',
})
export class UploadPage {

  [x: string]: any;
  lastImage: string = null;
  loading: Loading;
  currentPhoto:any;
  imagebase64:any;
  cjson:any;
  constructor(public navCtrl: NavController, 
    public navParams: NavParams,
    private camera: Camera, 
     private file: File, 
     private filePath: FilePath, 
     public actionSheetCtrl: ActionSheetController, 
     public toastCtrl: ToastController, 
     public platform: Platform, 
     public loadingCtrl: LoadingController,
     private http: HTTP) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad UploadPage');
  }


  public limparImage(){
    this.currentPhoto = '';
  }

 // Create a new name for the image
private createFileName() {
  var d = new Date(),
  n = d.getTime(),
  newFileName =  n + ".jpg";
  return newFileName;
}
 
// Copy the image to a local folder
private copyFileToLocalDir(namePath, currentName, newFileName) {
  this.file.copyFile(namePath, currentName, cordova.file.dataDirectory, newFileName).then(success => {
    this.lastImage = newFileName;
  }, error => {
    this.presentToast('Erro ao copiar o arquivo');
  });
}
 
private presentToast(text) {
  let toast = this.toastCtrl.create({
    message: text,
    duration: 3000,
    position: 'top'
  });
  toast.present();
}
 
// Always get the accurate path to your apps folder
public pathForImage(img) {
  if (img === null) {
    return '';
  } else {
    return cordova.file.dataDirectory + img;
  }
}

  public takePicture(sourceType) {
  
    const options: CameraOptions = {
      quality: 100,
      destinationType: this.camera.DestinationType.DATA_URL,
      encodingType: this.camera.EncodingType.PNG,
      mediaType:this.camera.MediaType.PICTURE,
      sourceType: sourceType != "picture" ? this.camera.PictureSourceType.CAMERA : this.camera.PictureSourceType.SAVEDPHOTOALBUM,
      correctOrientation: true
    };

    this.camera.getPicture(options).then((imageData) => {

      this.currentPhoto = 'data:image/png;base64,' + imageData;

    }, (err) => {
      // Handle error
    });

  }


  public presentActionSheet() {
    let actionSheet = this.actionSheetCtrl.create({
      title: 'Selecione Fonte de Fotos',
      buttons: [
        {
          text: 'Biblioteca de Fotos',
          handler: () => {
            this.takePicture('picture');
          }
        },
        {
          text: 'Usar a Camera',
          handler: () => {
            this.takePicture(this.camera.PictureSourceType.CAMERA);
          }
        },
        {
          text: 'Cancelar',
          role: 'cancel'
        }
      ]
    });
    actionSheet.present();
  }



  public EnviarFoto(){

    this.loading = this.loadingCtrl.create({
      content: 'Enviando...',
    });
    this.loading.present();
    
    let header = { "Content-Type": "application/json"} ;    
    let arqimg = "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";  
    let url = 'http://18.216.118.169/api.activesoft.com.br/api.dll/V1/rest/TAgendaEscolar_V1/SendFile';
    let cjson = {"Arquivo":arqimg};
    
    this.http.post( url,cjson,header )
    .then(data => {

      this.loading.dismissAll()
      console.log(data.status);
      console.log(data.data); // data received by server
      console.log(data.headers);
      this.presentToast('Salvo com sucesso');

    })
    .catch(error => {

      this.loading.dismissAll()
      console.log(error.status);
      console.log(error.error); // error message as string
      console.log(error.headers);
      this.presentToast('Erro ao salvar o arquivo  Error: ' + error.status);

    });

  this.loading.dismissAll()  
  }


  public uploadImage() {

    this.loading = this.loadingCtrl.create({
      content: 'Convertendo...',
    });
    this.loading.present();

    
    this.convertToBase64(this.currentPhoto, 'image/png').then(
      data => {
        this.imagebase64 =  data.toString();
        this.loading.dismissAll()
        this.presentToast('Image succesful uploaded.');
      }
    );
  }


  convertToBase64(url, outputFormat) {

        
    return new Promise((resolve, reject) => {

      let img = new Image();
      img.crossOrigin = 'Anonymous';
      img.onload = function () {
        let canvas = <HTMLCanvasElement>document.createElement('CANVAS'),
          ctx = canvas.getContext('2d'),
          dataURL;
        canvas.height = img.height;
        canvas.width = img.width;
        ctx.drawImage(img, 0, 0);
        dataURL = canvas.toDataURL(outputFormat);
        canvas = null;
        resolve(dataURL);
      };
      img.src = url;
    });
  }


}


