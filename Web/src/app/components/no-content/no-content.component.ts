// Módulos
import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-no-content',
  templateUrl: './no-content.component.html',
  styleUrls: ['./no-content.component.css']
})
export class NoContentComponent implements OnInit {

  // Variables
  @Input() titulo?: string; 

  // Constructor
  constructor() { }

  ngOnInit(): void {
  }

  // Métodos

}
