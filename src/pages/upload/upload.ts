import { Component } from '@angular/core';
import { IonicPage, NavParams } from 'ionic-angular';

import { NavController, ActionSheetController, ToastController, Platform, LoadingController, Loading } from 'ionic-angular';
 
import { File } from '@ionic-native/file';
import { Transfer, TransferObject } from '@ionic-native/transfer';
import { FilePath } from '@ionic-native/file-path';
import { Camera, CameraOptions} from '@ionic-native/camera';
import { FileTransfer, FileUploadOptions, FileTransferObject } from '@ionic-native/file-transfer';
import{ Http, Response } from '@angular/http';
import 'rxjs/add/operator/map';

const urlt = 'http://18.216.118.169/api.activesoft.com.br/api.dll/V1/rest/TAgendaEscolar_V1/SendFile';

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
    private transfer: Transfer,
     private file: File, 
     private filePath: FilePath, 
     public actionSheetCtrl: ActionSheetController, 
     public toastCtrl: ToastController, 
     public platform: Platform, 
     public loadingCtrl: LoadingController) {
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



  EnviarFoto(base64){
    this.cjson = JSON.stringify(base64)
    return new Promise((resolve, reject) => {     
      this.http.post(urlt, this.cjson)
        .subscribe((res: any) => {
          resolve(res.json());
        },
        (err) => {
          reject(err.json());
        });
    });
  }


  public uploadImage() {
    
    this.loading = this.loadingCtrl.create({
      content: 'Uploading...',
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

  public Enviar(){
    this.EnviarFoto(this.imagebase64);
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


