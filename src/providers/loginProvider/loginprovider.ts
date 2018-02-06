import { Injectable } from '@angular/core';
import{ Http, Response } from '@angular/http';
import 'rxjs/add/operator/map';

import { UtilProvider } from '../util/util';
import { Connection } from '@angular/http/src/interfaces';


@Injectable()
export class LoginProvider {

  constructor(public http: Http,
              private utilProvider: UtilProvider) {   
                console.log(this.utilProvider.Servidor());
  }

  ValidaLogin(user){
 
    return new Promise(resolve => {      
      this.http.get( this.utilProvider.Servidor() + 'Acesso/'+user.operador+'/'+user.senha)
        .map(res => res.json())
        .subscribe(data => {
          resolve(data);
          if ( data == [] ){
            return ""; 
          }
          else{
            return data;
          }          
        });
    }).catch(this.utilProvider.mensagemToast('Error de acesso, verifique sua conexão ou suporte da APP',3000,'middle'));    
  }

}
