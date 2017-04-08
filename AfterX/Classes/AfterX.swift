//
//  AfterX.swift
//  Pods
//
//  Created by Marcel Borsten on 07-04-17.
//
//

import Foundation

public struct AfterX {

    private static let defaultsPrefix = "after_x_"
    private static let trackedTasksKey = "__after_x_tracked_tasks"
    private static let defaults = UserDefaults.standard

    /// Executes the given block only the first time, after that
    /// the block is ignored.
    ///
    /// - Parameters:
    ///   - task: The task identifier
    ///   - block: The block to be executed once
    public static func doOnce(task: String, block: ()->()) {
        `do`(task: task, after: 1, block: block)
    }

    /// Executes the given block, but only after this function
    /// has been called x amount of times.
    ///
    /// - Parameters:
    ///   - task: The task identifier
    ///   - after: Amount of times the function has to have been called
    /// with the same identifier before the block gets executed
    ///   - once: If `true`, the block gets only executed the first time
    /// this function is called and the conditions are met, if `false`, the
    /// block gets executed every time.
    ///   - block: The block to be executed
    public static func `do`(task: String, after: Int, once: Bool, block: () -> ()) {
        let executeCount = incrementCount(task)
        if (once && executeCount == after) ||
            !once && executeCount >= after {
            block()
        }
    }

    /// Executes the given block once after it has been called
    /// with the same identifier for x amount of times.
    ///
    /// - Parameters:
    ///   - task: The task identifier
    ///   - after: Amount of times the function has to have been called
    /// with the same identifier before the block gets executed
    ///   - block: The block to be executed
    public static func `do`(task: String, after: Int, block: () -> ()) {
        let executeCount = incrementCount(task)
        if executeCount == after {
            block()
        }
    }


    /// Gives the current count for the given task. If
    /// the task identifier is not known, this returns 0.
    ///
    /// - Parameter task: The task identifier
    /// - Returns: The count
    public static func count(forTask task: String) -> Int {
        let key = defaultsKey(task)
        return defaults.integer(forKey: key)
    }

    public static func resetCount(forTask task: String) {
        var tasks = trackedTasks()
        if let index = tasks.index(of: task) {
            tasks.remove(at: index)
            defaults.set(tasks, forKey: trackedTasksKey)
        }
    }

    public static func resetAll() {

        for thisTask in trackedTasks() {
            defaults.removeObject(forKey: thisTask)
        }

        defaults.set([String](), forKey: trackedTasksKey)
    }

    private static func incrementCount(_ task: String) -> Int {

        trackTask(task)

        let key = defaultsKey(task)
        let count = defaults.integer(forKey: key) + 1
        defaults.set(count, forKey: key)
        return count
    }

    private static func defaultsKey(_ task: String) -> String {
        return "\(defaultsPrefix)-\(task)"
    }

    private static func trackTask(_ task: String) {
        var tasks = trackedTasks()
        let taskKey = defaultsKey(task)
        if !tasks.contains(taskKey) {
            tasks.append(taskKey)
            defaults.set(tasks, forKey: trackedTasksKey)
        }
    }

    private static func trackedTasks() -> [String] {
        return defaults.stringArray(forKey: trackedTasksKey) ?? [String]()
    }
}
