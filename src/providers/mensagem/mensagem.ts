import { Injectable } from '@angular/core';
import{ Http, Response } from '@angular/http';
import 'rxjs/add/operator/map';

@Injectable()
export class MensagemProvider {

  private API_URL:string = 'http://10.10.10.131/API/api.dll/datasnap/rest/TServerMethods/'; 
  private data:any;

  constructor(public http: Http) {  
  }

  getMensagem(idmobiletipomensagem){
    //if (this.data) {    
    //  return Promise.resolve(this.data);
    //}
  
    return new Promise(resolve => {      
      this.http.get(this.API_URL + 'Mensagem/112141/' + idmobiletipomensagem)
        .map(res => res.json())
        .subscribe(data => {
          this.data = data;
          resolve(this.data);
        });
    });
  }

}
