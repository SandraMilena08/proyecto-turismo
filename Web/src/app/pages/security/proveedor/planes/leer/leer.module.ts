import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LeerRoutingModule } from './leer-routing.module';
import { LeerComponent } from './leer.component';


@NgModule({
  declarations: [
    LeerComponent
  ],
  imports: [
    CommonModule,
    LeerRoutingModule
  ]
})
export class LeerModule { }
