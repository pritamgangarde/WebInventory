package com.freemind.property.editors;

import java.beans.PropertyEditorSupport;

import com.freemind.model.Unit;
import com.freemind.model.Vat;
import com.freemind.services.VatService;

public class VatPropertyEditor extends PropertyEditorSupport {
	VatService vatService;

	public VatPropertyEditor(VatService vatService) {
		super();
		this.vatService = vatService;
	}
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		Vat vatModel = null;
        try {
            Integer id = Integer.parseInt(text);
            vatModel = vatService.getVatById(id);
            
        } catch (NumberFormatException ex) {
            System.out.println("godown id is null");
        }
        setValue(vatModel);
	}

}
