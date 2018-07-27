import {Component, Input, OnInit} from '@angular/core';
import {FormItem, HeaderItem} from '../form-item';

@Component({
  selector: 'app-headerview',
  templateUrl: './headerview.component.html',
  styleUrls: ['./headerview.component.css']
})
export class HeaderviewComponent implements OnInit {
  @Input() formItem: HeaderItem;
  constructor() { }
  ngOnInit() {

  }

}
