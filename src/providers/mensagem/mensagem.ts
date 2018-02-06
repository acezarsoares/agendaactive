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
    //if (this.data) {    
    //  return Promise.resolve(this.data);
    //}
    return new Promise(resolve => {   

      this.http.get(this.utilProvider.Servidor() + 'Mensagem/112141/'+  idmobiletipomensagem)
        .map(res => res.json())
        .subscribe(data => {      
          return resolve(data);
        });
    });
  }

}
