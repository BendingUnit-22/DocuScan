import { TestBed, inject } from '@angular/core/testing';

import { FormItemService } from './form-item.service';

describe('FormItemService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [FormItemService]
    });
  });

  it('should be created', inject([FormItemService], (service: FormItemService) => {
    expect(service).toBeTruthy();
  }));
});
