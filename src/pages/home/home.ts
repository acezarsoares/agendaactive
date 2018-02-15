import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';

import { HomeProvider } from '../../providers/home/home';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  public timeline: any;

  constructor(public navCtrl: NavController,
              private homeProvider: HomeProvider) {
                this.listarTimeLine();   
  }

  listarTimeLine(){
    this.homeProvider.getTimeLine()
      .then(data => {
      this.timeline = data;
      console.log(data);
    });
  }

}
