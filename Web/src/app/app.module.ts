// Módulos
import { NgModule } from '@angular/core';
import { ChartsModule } from 'ng2-charts';
import { JwtModule } from '@auth0/angular-jwt';
import { NgxSpinnerModule } from 'ngx-spinner';
import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

// Componentes
import { AppComponent } from './app.component';

export function tokenGetter() {
  return localStorage.getItem('bD5QwHWPV4XeSS3cPVPw');
}

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [    
    BrowserModule,    
    ChartsModule,
    HttpClientModule,
    AppRoutingModule,    
    NgxSpinnerModule,
    BrowserAnimationsModule,
    JwtModule.forRoot({
      config: {
        tokenGetter: tokenGetter,
        allowedDomains: ['localhost:5001']
      }
    })
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
