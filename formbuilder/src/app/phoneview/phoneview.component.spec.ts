import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PhoneviewComponent } from './phoneview.component';

describe('PhoneviewComponent', () => {
  let component: PhoneviewComponent;
  let fixture: ComponentFixture<PhoneviewComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PhoneviewComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PhoneviewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
