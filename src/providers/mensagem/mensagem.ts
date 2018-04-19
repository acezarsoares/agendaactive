import { Injectable } from '@angular/core';
import{ Http, Response } from '@angular/http';
import 'rxjs/add/operator/map';

import { UtilProvider } from '../util/util';

@Injectable()
export class MensagemProvider {

  constructor(public http: Http,
              private utilProvider: UtilProvider) {  
  }

  public getMensagem(idmobiletipomensagem){

    return new Promise(resolve => {   

      this.http.get(this.utilProvider.Servidor() + 'Mensagem/112141/'+  idmobiletipomensagem)
        .map(res => res.json())
        .subscribe(data => {      
          resolve(data);
        });
    });
  }


  insertMensagem(mensagemModel){

    return new Promise((resolve, reject) => {     
      this.http.post(this.utilProvider.Servidor() + 'Mensagem', JSON.stringify(mensagemModel) )
        .subscribe((res: any) => {
          resolve(res.json());
        },
        (err) => {
          reject(err.json());
        });
    });
  }

  
}
