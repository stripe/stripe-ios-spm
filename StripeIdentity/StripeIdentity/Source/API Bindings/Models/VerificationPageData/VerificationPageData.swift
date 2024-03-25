//
// VerificationPageData.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
@_spi(STP) import StripeCore

extension StripeAPI {

    /// VerificationPageData contains the state of a verification, including what information needs to be collected to complete the verification flow.

    struct VerificationPageData: Decodable, Equatable {
        typealias Status = VerificationPage.Status

        /// Unique identifier for the object.
        let id: String
        let requirements: VerificationPageDataRequirements
        /// Status of the associated VerificationSession.
        let status: Status
        /// If true, the associated VerificationSession has been submitted for processing.
        let submitted: Bool

        /// If true, the associated VerificationSession has been closed and can no longer be modified.
        /// After submitting, closed might be false if needs to fallback from phone verification to document verification.
        let closed: Bool
    }

}

extension StripeAPI.VerificationPageData {
    /// When submitted but is not closed and there is still missing requirements, need to fallback.
    func needsFallback() -> Bool {
        return submitted && !closed && !requirements.missing.isEmpty
    }

    func submittedAndClosed() -> Bool {
        return submitted && closed
    }
}
