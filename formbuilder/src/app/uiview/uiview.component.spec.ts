import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { UiviewComponent } from './uiview.component';

describe('UiviewComponent', () => {
  let component: UiviewComponent;
  let fixture: ComponentFixture<UiviewComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ UiviewComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UiviewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
