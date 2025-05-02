//
//  MarketDataModel.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 02.05.2025.
//
import Foundation


//url = https://api.coingecko.com/api/v3/global
//JSON DATA
/*
 {
   "data": {
     "active_cryptocurrencies": 16967,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 1270,
     "total_market_cap": {
       "btc": 32179478.65273457,
       "eth": 1699693189.7040381,
       "ltc": 35248625838.11841,
       "bch": 8169337024.239826,
       "bnb": 5234561253.315199,
       "eos": 4230724024299.59,
       "xrp": 1408533879861.1692,
       "xlm": 11289364341390.4,
       "link": 211912796567.61887,
       "dot": 743480606601.5094,
       "yfi": 553892297.8383527,
       "usd": 3143484052846.7075,
       "aed": 11546174100308.6,
       "ars": 3686651031780924,
       "aud": 4864673598110.498,
       "bdt": 383195182363304.9,
       "bhd": 1184917452816.2495,
       "bmd": 3143484052846.7075,
       "brl": 17718247863870.47,
       "cad": 4330614518436.1616,
       "chf": 2591717727502.6836,
       "clp": 2965720029658226.5,
       "cny": 22931716165516.734,
       "czk": 68932047227051.664,
       "dkk": 20651747181987.016,
       "eur": 2767328464114.965,
       "gbp": 2359794617567.7065,
       "gel": 8628863725064.214,
       "hkd": 24362472932169.91,
       "huf": 1119376791081420,
       "idr": 51697850958641120,
       "ils": 11276768086527.479,
       "inr": 265667075261564.22,
       "jpy": 453251735566645,
       "krw": 4386218557923290.5,
       "kwd": 963804784539.012,
       "lkr": 944097163931393,
       "mmk": 6595029542872389,
       "mxn": 61738023654425.28,
       "myr": 13422676905655.44,
       "ngn": 5041048201347623,
       "nok": 32535855248428.79,
       "nzd": 5266530312458.314,
       "php": 174761992774528.66,
       "pkr": 886145878615032.4,
       "pln": 11842365741704.027,
       "rub": 260123377673198.28,
       "sar": 11788426698841.23,
       "sek": 30180188025422.48,
       "sgd": 4067526907601.2593,
       "thb": 103814346716275.72,
       "try": 121240957847143.31,
       "twd": 96701434462664.95,
       "uah": 130800123103711.31,
       "vef": 314757058211.54083,
       "vnd": 81746302794278620,
       "zar": 57813399531866.445,
       "xdr": 2263868058211.036,
       "xag": 97611309634.79332,
       "xau": 963792210.6028006,
       "bits": 32179478652734.57,
       "sats": 3217947865273457
     },
     "total_volume": {
       "btc": 838198.0617937347,
       "eth": 44272921.65384003,
       "ltc": 918141967.9679205,
       "bch": 212791590.9935267,
       "bnb": 136347737.1469637,
       "eos": 110200190482.28911,
       "xrp": 36688921558.09096,
       "xlm": 294060802288.1255,
       "link": 5519818927.743063,
       "dot": 19365882529.040226,
       "yfi": 14427562.842169665,
       "usd": 81880202871.20833,
       "aed": 300750079156.09174,
       "ars": 96028396938806.42,
       "aud": 126713052911.71544,
       "bdt": 9981313327409.184,
       "bhd": 30864251191.084755,
       "bmd": 81880202871.20833,
       "brl": 461517763483.5658,
       "cad": 112802097725.11441,
       "chf": 67508016501.83375,
       "clp": 77249877398841.5,
       "cny": 597316079945.4647,
       "czk": 1795514122671.4353,
       "dkk": 537928368802.9773,
       "eur": 72082254035.2338,
       "gbp": 61466977014.19886,
       "gel": 224761156881.4669,
       "hkd": 634583854282.2952,
       "huf": 29157074507843.35,
       "idr": 1346604739625014.8,
       "ils": 293732700129.4206,
       "inr": 6919988666371.081,
       "jpy": 11806118127532.92,
       "krw": 114250449285715.39,
       "kwd": 25104797721.12396,
       "lkr": 24591461579972.13,
       "mmk": 171784665623794.97,
       "mxn": 1608127102510.3284,
       "myr": 349628466260.05945,
       "ngn": 131307187334413.23,
       "nok": 847480815408.3325,
       "nzd": 137180454286.36493,
       "php": 4552129796744.624,
       "pkr": 23081969908126.742,
       "pln": 308465159391.42847,
       "rub": 6775588670837.155,
       "sar": 307060176990.3614,
       "sek": 786121347100.5038,
       "sgd": 105949297906.21431,
       "thb": 2704114169872.3726,
       "try": 3158035497534.5615,
       "twd": 2518839904585.952,
       "uah": 3407028772934.951,
       "vef": 8198664713.49409,
       "vnd": 2129294675665772.2,
       "zar": 1505900078626.6396,
       "xdr": 58968320743.381065,
       "xag": 2542539965.546617,
       "xau": 25104470.200312473,
       "bits": 838198061793.7346,
       "sats": 83819806179373.47
     },
     "market_cap_percentage": {
       "btc": 61.71342679074884,
       "eth": 7.103252676570902,
       "usdt": 4.738565593407007,
       "xrp": 4.153602105586008,
       "bnb": 2.783698904177876,
       "sol": 2.490877479647661,
       "usdc": 1.9529502866440722,
       "doge": 0.8637994171416953,
       "ada": 0.8170974251610224,
       "trx": 0.7435052001201501
     },
     "market_cap_change_percentage_24h_usd": -1.1122869378739864,
     "updated_at": 1746198698
   }
 }
 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}


struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
       case totalMarketCap = "total_market_cap"
       case totalVolume = "total_volume"
       case marketCapPercentage = "market_cap_percentage"
       case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
   }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: {(key, value) -> Bool in
            return key == "usd"
        }) {
            return "$\(item.value.formattedWithAbbreviations())"
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: {(key, value) -> Bool in
            return key == "usd"
        }) {
            return "$\(item.value.formattedWithAbbreviations())"
        }
        return ""
    }
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: {$0.key == "btc"}) {
            return item.value.asPercentageString()
        }
        return ""
    }
}



