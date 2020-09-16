//
//  ViewController.swift
//  healthkit-test
//
//  Created by Bailey Search on 16/09/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import UIKit
import HealthKit

class ViewController: UIViewController {
    
    let healthStore = HKHealthStore();
    
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewdidload");
        
        // Access Step Count
        let healthKitTypes: Set = [ HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!,
                                    HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!]// Check for Authorization
        healthStore.requestAuthorization(toShare: nil, read: healthKitTypes) { (bool, error) in
            if (bool) {
                //                _ = self.getTodaysSteps { (double) in
                //                    print(double)
                //
                //                    DispatchQueue.main.async {
                //                        self.testLabel.text = String(double)å
                //                    }
                //                }
                self.getTodaysSteps()
            }
        }
        
    }
    
    func getTodaysSteps() {
        //        let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        //
        //        let now = Date()
        //        let startOfDay = Calendar.current.startOfDay(for: now)
        //        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        //
        //        let query = HKStatisticsQuery(quantityType: stepsQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, _ in
        //            guard let result = result, let sum = result.sumQuantity() else {
        //                completion(0.0)
        //                return
        //            }
        //            completion(sum.doubleValue(for: HKUnit.count()))
        //        }
        
        //        let startDate = Date().addingTimeInterval(-3600 * 24 * 1)
        //        let startDate = Calendar.current.startOfDay(for: Date());
        //        let endDate = Date()
        //
        //        let predicate = HKQuery.predicateForSamples(
        //          withStart: startDate,
        //          end: endDate,
        //          options: [.strictStartDate, .strictEndDate]
        //        )
        //
        //        // interval is 1 day
        //        var interval = DateComponents()
        //        interval.day = 1
        //
        //        // start from midnight
        //        let calendar = Calendar.current
        //        let anchorDate = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: Date())
        //
        //        let query = HKStatisticsCollectionQuery(
        //          quantityType: HKSampleType.quantityType(forIdentifier: .stepCount)!,
        //          quantitySamplePredicate: predicate,
        //          options: .cumulativeSum,
        //          anchorDate: anchorDate!,
        //          intervalComponents: interval
        //        )
        //
        //        query.initialResultsHandler = { query, results, error in
        //          guard let results = results else {
        //            return
        //          }
        //
        //          results.enumerateStatistics(
        //            from: startDate,
        //            to: endDate,
        //            with: { (result, stop) in
        //                let totalStepForADay = result.sumQuantity()?.doubleValue(for: HKUnit.count()) ?? 0
        //                print(result)
        //                print("Totalstepforday: \(totalStepForADay)")
        //            }
        //          )
        //        }
        //
        //
        //        healthStore.execute(query)
        
        let calendar = NSCalendar.current
        let interval = NSDateComponents()
        interval.day = 1
        
        var anchorComponents = calendar.dateComponents([.day, .month, .year], from: NSDate() as Date)
        anchorComponents.hour = 0
        let anchorDate = calendar.date(from: anchorComponents)
        
        // Define 1-day intervals starting from 0:00
        let stepsQuery = HKStatisticsCollectionQuery(quantityType: HKSampleType.quantityType(forIdentifier: .distanceWalkingRunning)!, quantitySamplePredicate: nil, options: .cumulativeSum, anchorDate: anchorDate!, intervalComponents: interval as DateComponents)
        
        // Set the results handler
        stepsQuery.initialResultsHandler = {query, results, error in
            let endDate = NSDate()
            let startDate = Date(timeIntervalSince1970: 0)
            //            let startDate = calendar.date(byAdding: .day, value: -7, to: endDate as Date, wrappingComponents: false)
            if let myResults = results{
                var totalSteps: Double = 0;
                var totalDays: Int = 1;
                myResults.enumerateStatistics(from: startDate, to: endDate as Date) { statistics, stop in
                    if let quantity = statistics.sumQuantity(){
                        print(statistics)
                        //                        let date = statistics.startDate
                        let date = statistics.endDate
                        //                        let steps = quantity.doubleValue(for: HKUnit.count())
                        let steps = quantity.doubleValue(for: HKUnit.meter())
                        print("\(totalDays) \(date): steps = \(steps)")
                        totalSteps += steps
                        totalDays += 1
                        //NOTE: If you are going to update the UI do it in the main thread
                    }
                } //end block
                
                DispatchQueue.main.async {
                    //update UI components
                    self.testLabel.text = "Total: \(totalSteps.rounded())"
                }
            } //end if let
        }
        healthStore.execute(stepsQuery)
    }
}
