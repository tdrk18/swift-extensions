//
//  DispatchQueue+Extension.swift
//  extensions
//
//  Created by shota.todoroki on 2019-05-07.
//  Copyright © 2019 shota_todoroki. All rights reserved.
//

import Foundation

extension DispatchQueue {
    func debounce(delay: DispatchTimeInterval, action: @escaping (() -> Void)) -> () -> Void {
        var currentWorkItem: DispatchWorkItem?
        return { [weak self] in
            currentWorkItem?.cancel()
            currentWorkItem = DispatchWorkItem { action() }
            guard let currentWorkItem = currentWorkItem else { return }
            self?.asyncAfter(deadline: .now() + delay, execute: currentWorkItem)
        }
    }

    func throttle(delay: TimeInterval, action: @escaping (() -> Void)) -> () -> Void {
        var currentWorkItem: DispatchWorkItem?
        var lastFire: TimeInterval = 0
        return { [weak self] in
            guard currentWorkItem == nil else { return }
            currentWorkItem = DispatchWorkItem {
                action()
                lastFire = Date().timeIntervalSinceReferenceDate
                currentWorkItem = nil
            }
            self?.hasPassed(from: delay, since: lastFire) ?? false
                ? self?.async(execute: currentWorkItem!)
                : self?.asyncAfter(deadline: .now() + delay, execute: currentWorkItem!)
        }
    }

    private func hasPassed(from: TimeInterval, since: TimeInterval) -> Bool {
        return Date().timeIntervalSinceReferenceDate - from > since
    }
}
