import { NgModule, Optional, SkipSelf } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouteReuseStrategy, RouterModule } from '@angular/router';
import { HttpModule, Http, XHRBackend, ConnectionBackend, RequestOptions } from '@angular/http';
// import { TranslateModule } from '@ngx-translate/core';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

import { ShellComponent } from './shell/shell.component';
import { HeaderComponent } from './shell/header/header.component';
// import { RouteReusableStrategy } from './route-reusable-strategy';
import { AuthenticationService } from './authentication/authentication.service';
import { AuthenticationGuard } from './authentication/authentication.guard';
// import { I18nService } from './i18n.service';
// import { HttpService } from './http/http.service';
import { HttpCacheService } from './http/http-cache.service';
import { HttpService } from './http/http.service';
import { RouteReusableStrategy } from './route-reusable-strategy';
import { AuthcredentialstoreService } from './authentication/authcredentialstore.service';

export function createHttpService(backend: ConnectionBackend,
  defaultOptions: RequestOptions,
  httpCacheService: HttpCacheService,
  authStore: AuthcredentialstoreService) {
  return new HttpService(backend, defaultOptions, httpCacheService, authStore);
}

@NgModule({
  imports: [
    CommonModule,
    HttpModule,
    // TranslateModule,
    NgbModule,
    RouterModule
  ],
  declarations: [
    HeaderComponent,
    ShellComponent
  ],
  providers: [
    AuthenticationService,
    AuthenticationGuard,
    AuthcredentialstoreService,
    // I18nService,
    HttpCacheService,
    {
      provide: Http,
      deps: [XHRBackend, RequestOptions, HttpCacheService, AuthcredentialstoreService],
      useFactory: createHttpService
    },
    // {
    //   provide: RouteReuseStrategy,
    //   useClass: RouteReusableStrategy
    // }
  ]
})
export class CoreModule {

  constructor(@Optional() @SkipSelf() parentModule: CoreModule) {
    // Import guard
    if (parentModule) {
      throw new Error(`${parentModule} has already been loaded. Import Core module in the AppModule only.`);
    }
  }

}
