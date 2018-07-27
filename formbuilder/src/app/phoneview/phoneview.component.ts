import {Component, Input, OnInit} from '@angular/core';
import {PhoneItem} from '../form-item';

@Component({
  selector: 'app-phoneview',
  templateUrl: './phoneview.component.html',
  styleUrls: ['./phoneview.component.css']
})
export class PhoneviewComponent implements OnInit {
  @Input() formItem: PhoneItem;
  constructor() { }

  ngOnInit() {

  }

}
