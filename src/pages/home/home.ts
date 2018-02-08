import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  items = [
    {
      title: 'Ocorrência - Aluno: Anderson Soares',
      content: 'O aluno brigou em sala de aula e bateu no coleginha de mão fechada em sua cara.',
      icon: 'person',
      time: {subtitle: '08/02/2018', title: '08:00'}
    },
    {
      title: 'Comunicado - Carnaval da escola',
      content: 'Carnaval começa na sexta, nem quinta, nem quarta sexta-feira!!!.',
      icon: 'calendar',
      time: {subtitle: 'January', title: '29'}
    },
    {
      title: 'Diário de classe',
      content: 'Conteúdo e tarefas da disciplina de matemática disponíveis.',
      icon: 'book',
      time: {title: 'Matématica'}
    }
  ]
  constructor(public navCtrl: NavController) {

  }
}
