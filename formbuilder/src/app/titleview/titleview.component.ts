import {Component, Input, OnInit} from '@angular/core';
import {TitleItem} from '../form-item';

@Component({
  selector: 'app-titleview',
  templateUrl: './titleview.component.html',
  styleUrls: ['./titleview.component.css']
})
export class TitleviewComponent implements OnInit {
  @Input() formItem: TitleItem;
  constructor() { }

  ngOnInit() {
  }

}
