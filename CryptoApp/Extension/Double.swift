//
//  Double.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 21.04.2025.
//
import Foundation

extension Double {
    ///Converts a double into a Currency with 2 decimal places
    /// ```
    /// Convert 1234.56 = $1,234.56
    /// ```
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current // <- default value
        formatter.currencyCode = "usd" // <- change currency
        formatter.currencySymbol = "$" // <- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    
    ///Converts a double into a Currency as a string with  2 decimal places
    /// ```
    /// Convert 1234.56 = "$1,234.56"
    /// ```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    
    ///Converts a double into a Currency with 2-6 decimal places
    /// ```
    /// Convert 1234.56 = $1,234.56
    /// Convert 12.3456 = $12.3456
    /// Convert 0.123456 = $0.123456
    /// ```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current // <- default value
        formatter.currencyCode = "usd" // <- change currency
        formatter.currencySymbol = "$" // <- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    
    ///Converts a double into a Currency as a string with  2-6 decimal places
    /// ```
    /// Convert 1234.56 = "$1,234.56"
    /// Convert 12.3456 = "$12.3456"
    /// Convert 0.123456 = "$0.123456"
    /// ```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    
    ///Converts a double into a String representation
    /// ```
    /// Convert 1.23456 to "1.23"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    ///Converts a double into a String representation with percent symbol
    /// ```
    /// Convert 1.23456 to "1.23"
    /// ```
    func asPercentageString() -> String {
        return asNumberString() + "%"
    }
}
