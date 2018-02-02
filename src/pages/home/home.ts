import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { LoginPage } from '../login/login';
//import { LoginProvider } from '../../providers/loginprovider/loginprovider';
import { HttpClient,HttpParams, HttpHeaders, HttpObserve } from '@angular/common/http';
import 'rxjs/add/operator/map';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {

  constructor(
    public navCtrl: NavController,
    //public servico:LoginProvider,
    private http: HttpClient,
    private Header:HttpHeaders
  ) {
      this.LoadAlunosAll();

  }

  public LogOut(){
   
  }

  LoadAlunosAll(){
 
    this.http.get('http://10.10.10.34:8000/api/alunos/', { responseType: 'text' })
    .subscribe(data => {
      console.log(data);
    })


  }

}
