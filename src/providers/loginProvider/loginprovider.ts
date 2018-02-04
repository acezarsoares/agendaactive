import { Injectable } from '@angular/core';
import{ Http, Response } from '@angular/http';

import 'rxjs/add/operator/map';


@Injectable()
export class LoginProvider {

  private API_URL:string = 'http://localhost/API/api.dll/datasnap/rest/TServerMethods/'; 

  constructor(public http: Http) {             
  }

  ValidaLogin(user){
    
  }

}
