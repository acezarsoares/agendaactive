import { Injectable } from '@angular/core';
import{ Http, Response } from '@angular/http';
import 'rxjs/add/operator/map';

import { UtilProvider } from '../util/util';

@Injectable()
export class HomeProvider {

  constructor(public http: Http, 
              private utilProvider: UtilProvider) {
  }

  getTimeLine(){  
    return new Promise(resolve => {      
      this.http.get(this.utilProvider.Servidor() + 'TimeLine/112141')
        .map(res => res.json())
        .subscribe(data => {
          resolve(data);                
        });
    });
  }  

}
