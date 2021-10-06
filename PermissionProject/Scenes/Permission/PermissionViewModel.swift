//
//  PermissionViewModel.swift
//  PermissionProject
//
//  Created by Tahir Esirgen on 27.09.2021.
//

import Foundation

class PermissionViewModel {
    
    private let manager: PermissionManagerProtocol
    private var permissionViewDismissActionBlock: VoidCompletionBlock?
    
    init(manager: PermissionManagerProtocol) {
        self.manager = manager
    }
    
    func listenManagerActions(with completion: @escaping VoidCompletionBlock) {
        permissionViewDismissActionBlock = completion
    }
    
    func getPermissionMainViewData() -> PermissionMainViewData {
        return manager.getPermissionMainViewData(with: negativeListenerHandler, with: positiveListenerHandler)
        
//        return manager.getPermissionMainViewData {
//            print("negative pressed")
//        } with: {
//            print("positive pressed")
//        }

    }
    
    lazy var negativeListenerHandler: VoidCompletionBlock = { [weak self] in
        print("negative pressed")
        self?.permissionViewDismissActionBlock?()
    }
    
    lazy var positiveListenerHandler: VoidCompletionBlock = { [weak self] in
        print("positive pressed")
    }
    
}
