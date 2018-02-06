import { Injectable } from '@angular/core';
import{ Http, Response } from '@angular/http';
import 'rxjs/add/operator/map';

@Injectable()
export class MensagemProvider {

  private data:any;

  constructor(public http: Http) {  
  }

  public Servidor(){
    return 'http://10.10.10.131/API/api.dll/datasnap/rest/TServerMethods/';
  }

  public getMensagem(idmobiletipomensagem){
    //if (this.data) {    
    //  return Promise.resolve(this.data);
    //}
  
    return new Promise(resolve => {   

      this.http.get(this.Servidor() + 'Mensagem/112141/' + idmobiletipomensagem)
        .map(res => res.json())
        .subscribe(data => {
          this.data = data;
          resolve(this.data);
        });
    });
  }

}
