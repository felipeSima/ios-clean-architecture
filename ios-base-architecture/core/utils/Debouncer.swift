//
//  Debouncer.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/26/20.
//

import Foundation

public class Debouncer {
    
    private let timeInterval: TimeInterval
    private var timer: Timer?
    
    typealias Handler = () -> Void
    var handler: (() -> Void)?
    
    init(timeInterval: TimeInterval) {
        self.timeInterval = timeInterval
    }
    
    public func cancelTimer() {
        timer?.invalidate()
    }
    
    public func renewInterval() {
        //Invalidating timer case new input is computed
        timer?.invalidate()
        //Scheduling timer to the passed timeInterval
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false, block: { [weak self] (timer) in
            self?.timeIntervalDidFinish(for: timer)
        })
    }
    
    @objc private func timeIntervalDidFinish(for timer: Timer) {
        //Checking if the timer wasn´t invalidated by new input
        guard timer.isValid else {return}
        //Handle the function if the timer is valid
        handler?()
        //removing the reference of the last passed function
        handler = nil
    }
    
}

