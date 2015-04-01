//
//  InputTableViewCell.swift
//  SwiftTodoApp
//
//  Created by Anita Santoso on 1/04/2015.
//  Copyright (c) 2015 AS. All rights reserved.
//

import UIKit

class InputTableViewCell : UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet var inputField: UITextField!
    var onReturnHandler:((String?)->Void)!
    
    func onReturnHandler(handler: (String?) -> Void) {
        self.onReturnHandler = handler;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if((self.onReturnHandler) != nil) {
            self.onReturnHandler(textField.text);
        }
        inputField.text = nil;
        return true;
    }
}
