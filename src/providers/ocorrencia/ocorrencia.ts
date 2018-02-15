import { Injectable } from '@angular/core';
import{ Http, Response } from '@angular/http';
import 'rxjs/add/operator/map';

import { UtilProvider } from '../util/util';

@Injectable()
export class OcorrenciaProvider {

  constructor(public http: Http,
              private utilProvider: UtilProvider) {
  }


  getOcorrencia(){  
    return new Promise(resolve => {      
      this.http.get(this.utilProvider.Servidor() + 'Ocorrencia/12141')
        .map(res => res.json())
        .subscribe(data => {
          resolve(data);                
        });
    });
  }

}
