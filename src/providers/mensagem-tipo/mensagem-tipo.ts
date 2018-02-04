import { Injectable } from '@angular/core';
import{ Http, Response } from '@angular/http';
import 'rxjs/add/operator/map';

@Injectable()
export class MensagemTipoProvider {

  private API_URL:string = 'http://localhost/API/api.dll/datasnap/rest/TServerMethods/'; 
  private data:any;

  constructor(public http: Http) {
  }


  getMensagemTipo(){
    if (this.data) {    
      return Promise.resolve(this.data);
    }
  
    return new Promise(resolve => {      
      this.http.get(this.API_URL + 'MensagemTipo/112141')
        .map(res => res.json())
        .subscribe(data => {
          this.data = data;
          resolve(this.data);
        });
    });
  }

}
