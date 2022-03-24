//
//  StoryboardInitializable.swift
//  Architecture10
//
//  Created by Elina Semenko on 23.03.2022.
//

import UIKit

public protocol StoryboardInitializable: UIViewController {
    // MARK: - Fields
    static var storyboardIdentifier: String { get }
}

public extension StoryboardInitializable {
    // MARK: - Accessible methods
    
    static var storyboardIdentifier: String { String(describing: Self.self) }
    
    static func initFromSelfNamedStoryboard() -> Self {
        let storyboard = UIStoryboard(name: storyboardIdentifier, bundle: Bundle(for: Self.self))
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
    
    static func initFromFlow() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: Self.self))
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
}

