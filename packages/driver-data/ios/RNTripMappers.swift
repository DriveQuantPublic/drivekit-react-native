//
//  RNTripMappers.swift
//  DriverData
//
//  Created by Amine Gahbiche on 24/11/2022.
//

import Foundation
import DriveKitCoreModule
import DriveKitDriverDataModule
import DriveKitDBTripAccessModule

func mapTrip(trip: Trip) -> NSDictionary {
    return trip.toDict() as NSDictionary
}

func mapTripSyncStatus(status: TripSyncStatus) -> String {
    switch status {
    case .noError:
        return "NO_ERROR"
    case .cacheDataOnly:
        return "CACHE_DATA_ONLY"
    case .failedToSyncTripsCacheOnly:
        return "FAILED_TO_SYNC_TRIPS_CACHE_ONLY"
    case .syncAlreadyInProgress:
        return "SYNC_ALREADY_IN_PROGRESS"
    case .failedToSyncSafetyEvents:
        return "FAILED_TO_SYNC_TRIPS"
    default:
        return "FAILED_TO_SYNC_TRIPS"
    }
}
func mapTransportModeFromString(_ inputString: String) -> TransportationMode {
    if inputString == "CAR" {
        return .car
    } else if inputString == "MOTO" {
        return .moto
    } else if inputString == "TRUCK" {
        return .truck
    } else if inputString == "BUS" {
        return .bus
    } else if inputString == "TRAIN" {
        return .train
    } else if inputString == "BOAT" {
        return .boat
    } else if inputString == "BIKE" {
        return .bike
    } else if inputString == "FLIGHT" {
        return .flight
    } else if inputString == "SKIING" {
        return .skiing
    } else if inputString == "ON_FOOT" {
        return .onFoot
    } else if inputString == "IDLE" {
        return .idle
    } else if inputString == "OTHER" {
        return .other
    }
    return .unknown
}

extension Trip {
    fileprivate func toDict() -> [String: Any] {
        return [
            "arrivalAddress": arrivalAddress as Any,
            "arrivalCity": arrivalCity as Any,
            "departureAddress": departureAddress as Any,
            "departureCity": departureCity as Any,
            "endDate": ((endDate != nil) ? DateUtils.convertDateToString(date: endDate!) : nil) as Any,
            "itinId": itinId as Any,
            "metadata": metadata as Any,
            "safetyEventsSynced": safetyEventsSynced as Any,
            "startDate": ((startDate != nil) ? DateUtils.convertDateToString(date: startDate!) : nil) as Any,
            "transportationMode": transportationMode as Any,
            "unscored": unscored as Any,
            "vehicleId": vehicleId as Any,
            "advancedEnergyEstimation": advancedEnergyEstimation?.allObjects.map{($0 as? DBAdvancedEnergyEstimation)?.toDict()} as Any,
            "brakeWear": brakeWear?.toDict() as Any,
            "calls": calls?.allObjects.map{($0 as? Call)?.toDict()} as Any,
            "declaredTransportationMode": declaredTransportationMode?.toDict() as Any,
            "driverDistraction": driverDistraction?.toDict() as Any,
            "ecoDriving": ecoDriving?.toDict() as Any,
            "ecoDrivingContexts": ecoDrivingContexts?.allObjects.map{($0 as? EcoDrivingContext)?.toDict()} as Any,
            "energyEstimation": energyEstimation?.toDict() as Any,
            "evaluation": evaluation?.toDict() as Any,
            "fuelEstimation": fuelEstimation?.toDict() as Any,
            "fuelEstimationContexts": fuelEstimationContexts?.allObjects.map{($0 as? FuelEstimationContext)?.toDict()} as Any,
            "logbook": logbook?.toDict() as Any,
            "maneuver": maneuver?.toDict() as Any,
            "pollutants": pollutants?.toDict() as Any,
            "safety": safety?.toDict() as Any,
            "safetyContexts": safetyContexts?.allObjects.map{($0 as? SafetyContext)?.toDict()} as Any,
            "safetyEvents": safetyEvents?.allObjects.map{($0 as? SafetyEvents)?.toDict()} as Any,
            "speedingStatistics": speedingStatistics?.toDict() as Any,
            "speedLimitContexts": speedLimitContexts?.allObjects.map{($0 as? DBSpeedLimitContext)?.toDict()} as Any,
            "tireWear": tireWear?.toDict() as Any,
            "tripAdvices": tripAdvices?.allObjects.map{($0 as? TripAdvice)?.toDict()} as Any,
            "tripStatistics": tripStatistics?.toDict() as Any
        ]
    }
}
extension DBAdvancedEnergyEstimation {
    fileprivate func toDict() -> [String: Any] {
        return [
            "energy": energy as Any,
            "energyOpti": energyOpti as Any,
            "energyConsumption": energyConsumption as Any,
            "energyOptiConsumption": energyOptiConsumption as Any,
            "duration": duration as Any,
            "distance": distance as Any,
            "contextId": contextId as Any
        ]
    }
}
extension BrakeWear {
    fileprivate func toDict() -> [String: Any] {
        return [
            "frontBrakeAutonomy": frontBrakeAutonomy as Any,
            "frontBrakeDistance": frontBrakeDistance as Any,
            "frontBrakePadWear": frontBrakePadWear as Any,
            "frontBrakeWearRate": frontBrakeWearRate as Any,
            "frontBrakeTotalWear": frontBrakeTotalWear as Any,
            "rearBrakeAutonomy": rearBrakeAutonomy as Any,
            "rearBrakeDistance": rearBrakeDistance as Any,
            "rearBrakePadWear": rearBrakePadWear as Any,
            "rearBrakeWearRate": rearBrakeWearRate as Any,
            "rearBrakeTotalWear": rearBrakeTotalWear as Any
        ]
    }
}
extension Call {
    fileprivate func toDict() -> [String: Any] {
        return [
            "audioName": audioName as Any,
            "audioInput": audioInput as Any,
            "audioOutput": audioOutput as Any,
            "audioSystemValue": audioSystemValue as Any,
            "bluetoothClass": bluetoothClass as Any,
            "distance": distance as Any,
            "distancePercent": distancePercent as Any,
            "duration": duration as Any,
            "end": end as Any,
            "id": id as Any,
            "isForbidden": isForbidden as Any,
            "start": start as Any,
            "typeValue": typeValue as Any
        ]
    }
}
extension DeclaredTransportationMode {
    fileprivate func toDict() -> [String: Any] {
        return [
            "comment": comment as Any,
            "passenger": passenger as Any,
            "transportationMode": transportationMode as Any
        ]
    }
}
extension DriverDistraction {
    fileprivate func toDict() -> [String: Any] {
        return [
            "distancePercentUnlock": distancePercentUnlock as Any,
            "distanceUnlock": distanceUnlock as Any,
            "durationPercentUnlock": durationPercentUnlock as Any,
            "durationUnlock": durationUnlock as Any,
            "nbUnlock": nbUnlock as Any,
            "score": score as Any,
            "scoreCallNumber": scoreCallNumber as Any,
            "scoreUnlockNumber": scoreUnlockNumber as Any
        ]
    }
}
extension EcoDriving {
    fileprivate func toDict() -> [String: Any] {
        return [
            "energyClass": energyClass as Any,
            "score": score as Any,
            "scoreAccel": scoreAccel as Any,
            "scoreDecel": scoreDecel as Any,
            "scoreMain": scoreMain as Any,
            "stdDevAccel": stdDevAccel as Any,
            "stdDevDecel": stdDevDecel as Any,
            "stdDevMain": stdDevMain as Any
        ]
    }
}
extension EcoDrivingContext {
    fileprivate func toDict() -> [String: Any] {
        return [
            "contextId": contextId as Any,
            "distance": distance as Any,
            "duration": duration as Any,
            "efficiencyScore": efficiencyScore as Any,
            "scoreAccel": scoreAccel as Any,
            "scoreDecel": scoreDecel as Any,
            "scoreMain": scoreMain as Any
        ]
    }
}
extension DBEnergyEstimation {
    fileprivate func toDict() -> [String: Any] {
        return [
            "energy": energy as Any,
            "energyOpti": energyOpti as Any,
            "energyConsumption": energyConsumption as Any,
            "energyOptiConsumption": energyOptiConsumption as Any
        ]
    }
}
extension Evaluation {
    fileprivate func toDict() -> [String: Any] {
        return [
            "comment": comment as Any,
            "evaluation": evaluation as Any
        ]
    }
}
extension FuelEstimation {
    fileprivate func toDict() -> [String: Any] {
        return [
            "co2Mass": co2Mass as Any,
            "co2Emission": co2Emission as Any,
            "coldFuelVolume": coldFuelVolume as Any,
            "engineTempStatus": engineTempStatus as Any,
            "fuelConsumption": fuelConsumption as Any,
            "fuelVolume": fuelVolume as Any,
            "faultingState": faultingState as Any,
            "idleCo2Emission": idleCo2Emission as Any,
            "idleCo2Mass": idleCo2Mass as Any,
            "idleFuelConsumption": idleFuelConsumption as Any,
            "idleFuelPercentage": idleFuelPercentage as Any,
            "idleFuelVolume": idleFuelVolume as Any
        ]
    }
}
extension FuelEstimationContext {
    fileprivate func toDict() -> [String: Any] {
        return [
            "co2Mass": co2Mass as Any,
            "co2Emission": co2Emission as Any,
            "contextId": contextId as Any,
            "distance": distance as Any,
            "fuelConsumption": fuelConsumption as Any,
            "fuelVolume": fuelVolume as Any,
            "faultingState": faultingState as Any,
            "duration": duration as Any
        ]
    }
}
extension Logbook {
    fileprivate func toDict() -> [String: Any] {
        return [
            "status": status as Any,
            "updateDate": ((updateDate != nil) ? DateUtils.convertDateToString(date: updateDate!) : nil) as Any
        ]
    }
}
extension Maneuver {
    fileprivate func toDict() -> [String: Any] {
        return [
            "nbTurns": nbTurns as Any,
            "nbHillStarts": nbHillStarts as Any,
            "nbBayParkings": nbBayParkings as Any,
            "nbRoundAbouts": nbRoundAbouts as Any,
            "nbAngledParkings": nbAngledParkings as Any,
            "nbEmergencyStops": nbEmergencyStops as Any,
            "nbParallelParkings": nbParallelParkings as Any,
            "nbCurveReverseDrivings": nbCurveReverseDrivings as Any,
            "nbStraightReverseDrivings": nbStraightReverseDrivings as Any
        ]
    }
}
extension Pollutants {
    fileprivate func toDict() -> [String: Any] {
        return [
            "co": co as Any,
            "hc": hc as Any,
            "nox": nox as Any,
            "soot": soot as Any
        ]
    }
}
extension Safety {
    fileprivate func toDict() -> [String: Any] {
        return [
            "nbAdh": nbAdh as Any,
            "nbAccel": nbAccel as Any,
            "nbDecel": nbDecel as Any,
            "nbAdhCrit": nbAdhCrit as Any,
            "nbAccelCrit": nbAccelCrit as Any,
            "nbDecelCrit": nbDecelCrit as Any,
            "safetyScore": safetyScore as Any
        ]
    }
}
extension SafetyContext {
    fileprivate func toDict() -> [String: Any] {
        return [
            "contextId": contextId as Any,
            "distance": distance as Any,
            "duration": duration as Any,
            "nbAdh": nbAdh as Any,
            "nbAccel": nbAccel as Any,
            "nbDecel": nbDecel as Any,
            "nbAdhCrit": nbAdhCrit as Any,
            "nbAccelCrit": nbAccelCrit as Any,
            "nbDecelCrit": nbDecelCrit as Any,
            "safetyScore": safetyScore as Any
        ]
    }
}
extension SafetyEvents {
    fileprivate func toDict() -> [String: Any] {
        return [
            "distance": distance as Any,
            "elevation": elevation as Any,
            "heading": heading as Any,
            "latitude": latitude as Any,
            "level": level as Any,
            "longitude": longitude as Any,
            "time": time as Any,
            "type": type as Any,
            "value": value as Any,
            "velocity": velocity as Any
        ]
    }
}
extension DBSpeedingStatistics {
    fileprivate func toDict() -> [String: Any] {
        return [
            "distance": distance as Any,
            "duration": duration as Any,
            "score": score as Any,
            "speedingDistance": speedingDistance as Any,
            "speedingDuration": speedingDuration as Any
        ]
    }
}
extension DBSpeedLimitContext {
    fileprivate func toDict() -> [String: Any] {
        return [
            "distance": distance as Any,
            "duration": duration as Any,
            "score": score as Any,
            "speedLimit": speedLimit as Any,
            "speedingDistance": speedingDistance as Any,
            "speedingDuration": speedingDuration as Any
        ]
    }
}
extension TireWear {
    fileprivate func toDict() -> [String: Any] {
        return [
            "frontTireWear": frontTireWear as Any,
            "frontTireAutonomy": frontTireAutonomy as Any,
            "frontTireDistance": frontTireDistance as Any,
            "frontTireWearRate": frontTireWearRate as Any,
            "frontTireTotalWear": frontTireTotalWear as Any,
            "rearTireWear": rearTireWear as Any,
            "rearTireAutonomy": rearTireAutonomy as Any,
            "rearTireDistance": rearTireDistance as Any,
            "rearTireWearRate": rearTireWearRate as Any,
            "rearTireTotalWear": rearTireTotalWear as Any
        ]
    }
}
extension TripAdvice {
    fileprivate func toDict() -> [String: Any] {
        return [
            "comment": comment as Any,
            "evaluation": evaluation as Any,
            "feedback": feedback as Any,
            "id": id as Any,
            "message": message as Any,
            "messageId": messageId as Any,
            "theme": theme as Any,
            "title": title as Any
        ]
    }
}
extension TripStatistics {
    fileprivate func toDict() -> [String: Any] {
        return [
            "day": day as Any,
            "distance": distance as Any,
            "drivingDuration": drivingDuration as Any,
            "drivingPercentage": drivingPercentage as Any,
            "duration": duration as Any,
            "idlingDuration": idlingDuration as Any,
            "idlingPercentage": idlingPercentage as Any,
            "meteo": meteo as Any,
            "speedMean": speedMean as Any,
            "subdispNb": subdispNb as Any,
            "weekDay": weekDay as Any
        ]
    }
}

extension DriveKitDBTripAccessModule.Route {
    func toDict() -> [String: Any] {
        return [
            "callIndex": callIndex as Any,
            "callTime": callTime as Any,
            "itinId": itinId as Any,
            "latitude": latitude as Any,
            "longitude": longitude as Any,
            "screenLockedIndex": screenLockedIndex as Any,
            "screenLockedTime": screenLockedTime as Any,
            "screenStatus": screenStatus as Any,
            "speedingIndex": speedingIndex as Any,
            "speedingTime":speedingTime as Any
        ]
    }
}
