//
//  BaseViewController.swift
//  citychat
//
//  Created by Levente Vig on 2019. 07. 10..
//  Copyright © 2019. CodeYard. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        log.verbose("\(self.classForCoder)")
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        log.verbose("\(self.classForCoder)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        log.verbose("\(self.classForCoder)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        log.verbose("\(self.classForCoder)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        log.verbose("\(self.classForCoder)")
    }
    
    // MARK: - Initialization -
    
    private func setup() {
        view.backgroundColor = .white
    }
}
