import { Injectable } from '@angular/core';
import {FormItem, HeaderItem, default as template_items} from './form-item';
import {Observable, of} from 'rxjs';
import {HttpClient} from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class FormItemService {

  formTemplate: FormItem[] = [];
  baseURL = 'http://127.0.0.1:8000';


  constructor(private http: HttpClient) {
    this.fetchNewHeader();

  }

  postFormItems(formItems) {
    this.http.post(this.baseURL + '/api/', formItems)
      .subscribe(
        res => {
          console.log(res);
        },
        err => {
          console.log(err);
        }
      )


  }

  fetchNewHeader() {
    this.http.get(this.baseURL + '/api/')
      .subscribe(data => {
        const uuid = data['uuid'];
        const qr_url = this.baseURL + data['qr'];
        const header = this.makeHeaderTemplate(uuid, qr_url);
        this.formTemplate.push(header);
      });
  }

  getFormItems(): Observable<FormItem[]> {
    return of(template_items);
  }

  getNewTemplate(): Observable<FormItem[]> {
    return of(this.formTemplate);
  }

  makeHeaderTemplate(uuid, qr_url): HeaderItem {
    const header = new HeaderItem();
    header.itemType = 'header';
    header.displayName = 'Header';
    header.title = 'New Patient Form';
    header.formUUID = uuid;
    header.qrcodeURL = qr_url;
    return header;
  }
}
