//
//  Config.swift
//  Jaiminho
//
//  Created by Jaison Vieira on 30/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

public enum Environment {
    case develop, production
}

public class Configuration {
    public static var environment: Environment = .production
}
