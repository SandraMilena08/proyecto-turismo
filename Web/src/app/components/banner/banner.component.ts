import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-banner',
  templateUrl: './banner.component.html',
  styleUrls: ['./banner.component.css']
})
export class BannerComponent implements OnInit {

  // Variables
  @Input() tipo?: string; // check | warning | close
  @Input() descripcion?: string;

  // Constructor
  constructor() { }

  ngOnInit(): void {
  }

}